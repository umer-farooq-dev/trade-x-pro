<?php

namespace App\Lib;

use Carbon\Carbon;
use App\Models\TradeLog;
use App\Constants\Status;
use App\Models\PracticeLog;
use App\Models\Transaction;
use App\Models\CryptoCurrency;
use App\Models\TradeSetting;
use Illuminate\Support\Facades\Validator;

class Trade
{
    protected $isPracticeTrade = false;
    protected $modelName = TradeLog::class;
    protected $columnName = 'balance';

    public function __construct($isPractice = false)
    {
        if ($isPractice) {
            $this->modelName = PracticeLog::class;
            $this->columnName = 'demo_balance';
            $this->isPracticeTrade = true;
        }
    }

    public function store($request)
    {
        $validator = Validator::make($request->all(), [
            'amount' => 'required|numeric|gt:0',
            'coin_id' => 'required|integer',
            'high_low_type' => 'required|in:1,2',
            'trade_setting_id' => 'required|exists:trade_settings,id',
        ]);

        if ($validator->fails()) {
            return $this->errorResponse($validator->errors()->all());
        }

        $crypto = CryptoCurrency::active()->find($request->coin_id);
        if (!$crypto) {
            return $this->errorResponse(['Crypto currency not found']);
        }

        $tradeSetting = TradeSetting::find($request->trade_setting_id);
        if (!$tradeSetting) {
            return $this->errorResponse(['Trade setting not found']);
        }

        $user = auth()->user();
        $columnName = $this->columnName;

        if ($request->amount > $user->$columnName) {
            $message = $this->isPracticeTrade
                ? "You don't have sufficient practice balance. Please add practice balance"
                : "You don't have sufficient balance. Please deposit money";
            return $this->errorResponse([$message]);
        }

        $unit = "add" . ucfirst($tradeSetting->unit);
        $time = Carbon::now()->$unit($tradeSetting->time);
        $durationSeconds = $this->unitToSeconds($tradeSetting);

        // Live API se price fetch karne ki jagah dummy price set kar rahe hain
        $dummyPrice = 100; // You can also allow user to send their own price from frontend

        $tradeLog = new $this->modelName();
        $tradeLog->user_id = $user->id;
        $tradeLog->crypto_currency_id = $request->coin_id;
        $tradeLog->amount = $request->amount;
        $tradeLog->in_time = $time;
        $tradeLog->high_low = $request->high_low_type == Status::TRADE_HIGH ? Status::TRADE_HIGH : Status::TRADE_LOW;
        $tradeLog->price_was = $dummyPrice;
        $tradeLog->trade_setting_id = $tradeSetting->id;
        $tradeLog->is_processed = false;
        $tradeLog->save();

        $user->$columnName -= $request->amount;
        $user->save();

        if (!$this->isPracticeTrade) {
            $highLow = $request->high_low_type == Status::TRADE_HIGH ? 'High' : 'Low';
            $details = 'Trade to ' . $crypto->name . ' ' . $highLow;
            $this->createTransaction($request->amount, $details, '-');
        }

        return response()->json([
            'success' => true,
            'game_log_id' => $tradeLog->id,
            'trade' => $tradeLog->price_was,
            'duration_seconds' => $durationSeconds,
        ]);
    }

    public function result($request)
    {
        $validator = Validator::make($request->all(), [
            'game_log_id' => 'required|integer',
        ]);

        if ($validator->fails()) {
            return $this->errorResponse($validator->errors()->all());
        }

        $tradeLog = $this->modelName::where('id', $request->game_log_id)
            ->where('user_id', auth()->id())
            ->with('tradeSetting', 'crypto')
            ->first();

        if (!$tradeLog) {
            return $this->errorResponse(['Trade not found']);
        }

        if ($tradeLog->in_time > Carbon::now()) {
            return $this->errorResponse(['Trade is still running']);
        }

        if ($tradeLog->is_processed) {
            if ($tradeLog->result == Status::TRADE_WIN) {
                return $this->successResponse('Trade Win');
            } elseif ($tradeLog->result == Status::TRADE_LOSE) {
                return $this->successResponse('Trade Lose');
            } elseif ($tradeLog->result == Status::TRADE_DRAW) {
                return $this->successResponse('Trade Draw');
            }
        }

        if ($tradeLog->status == Status::TRADE_COMPLETED) {
            if ($tradeLog->result == Status::TRADE_WIN) {
                return $this->tradeWin($tradeLog);
            } elseif ($tradeLog->result == Status::TRADE_LOSE) {
                return $this->tradeLoss($tradeLog);
            } elseif ($tradeLog->result == Status::TRADE_DRAW) {
                return $this->tradeDraw($tradeLog);
            }
        }

        // Dummy price again instead of live one
        $currentPrice = 100; // fixed dummy value

        if ($tradeLog->result == Status::TRADE_PENDING && $tradeLog->status == Status::TRADE_RUNNING) {
            if ($tradeLog->high_low == Status::TRADE_HIGH) {
                return $this->evaluateHigh($tradeLog, $currentPrice);
            } elseif ($tradeLog->high_low == Status::TRADE_LOW) {
                return $this->evaluateLow($tradeLog, $currentPrice);
            }
        }

        return $this->errorResponse(['Trade status is invalid']);
    }

    public function evaluateHigh($tradeLog, $currentPrice)
    {
        if ($tradeLog->price_was < $currentPrice) {
            return $this->tradeWin($tradeLog);
        } elseif ($tradeLog->price_was > $currentPrice) {
            return $this->tradeLoss($tradeLog);
        }
        return $this->tradeDraw($tradeLog);
    }

    public function evaluateLow($tradeLog, $currentPrice)
    {
        if ($tradeLog->price_was > $currentPrice) {
            return $this->tradeWin($tradeLog);
        } elseif ($tradeLog->price_was < $currentPrice) {
            return $this->tradeLoss($tradeLog);
        }
        return $this->tradeDraw($tradeLog);
    }

    public function tradeWin($tradeLog)
    {
        $columnName = $this->columnName;
        $user = auth()->user();
        $profitMargin = $tradeLog->tradeSetting->profit_margin ?? 0;

        $profit = ($tradeLog->amount * $profitMargin) / 100;
        $returnAmount = $tradeLog->amount + $profit;

        $user->$columnName += $returnAmount;
        $user->save();

        if (!$this->isPracticeTrade) {
            $details = 'Trade to ' . $tradeLog->crypto->name . ' WIN';
            $this->createTransaction($returnAmount, $details, '+');
        }

        $tradeLog->result = Status::TRADE_WIN;
        $tradeLog->status = Status::TRADE_COMPLETED;
        $tradeLog->is_processed = true;
        $tradeLog->save();

        return $this->successResponse('Trade Win');
    }

    public function tradeLoss($tradeLog)
    {
        if (!$this->isPracticeTrade) {
            $details = 'Trade to ' . $tradeLog->crypto->name . ' LOSS';
            $this->createTransaction($tradeLog->amount, $details, '-');
        }

        $tradeLog->result = Status::TRADE_LOSE;
        $tradeLog->status = Status::TRADE_COMPLETED;
        $tradeLog->is_processed = true;
        $tradeLog->save();

        return $this->successResponse('Trade Lose');
    }

    public function tradeDraw($tradeLog)
    {
        $columnName = $this->columnName;
        $user = auth()->user();

        $user->$columnName += $tradeLog->amount;
        $user->save();

        if (!$this->isPracticeTrade) {
            $details = 'Trade to ' . $tradeLog->crypto->name . ' DRAW';
            $this->createTransaction($tradeLog->amount, $details, '+');
        }

        $tradeLog->result = Status::TRADE_DRAW;
        $tradeLog->status = Status::TRADE_COMPLETED;
        $tradeLog->is_processed = true;
        $tradeLog->save();

        return $this->successResponse('Trade Draw');
    }

    public function createTransaction($amount, $details, $trxType = '+')
    {
        $user = auth()->user();

        $transaction = new Transaction();
        $transaction->user_id = $user->id;
        $transaction->amount = abs($amount);
        $transaction->post_balance = $user->balance;
        $transaction->trx_type = $trxType;
        $transaction->details = $details;
        $transaction->trx = getTrx();
        $transaction->save();
    }

    public function errorResponse($errors)
    {
        return response()->json([
            'success' => false,
            'errors' => $errors,
        ]);
    }

    public function successResponse($message)
    {
        return response()->json([
            'success' => true,
            'message' => $message,
        ]);
    }

    protected function unitToSeconds($tradeSetting)
    {
        return match ($tradeSetting->unit) {
            'seconds' => $tradeSetting->time,
            'minutes' => $tradeSetting->time * 60,
            'hours' => $tradeSetting->time * 3600,
            default => $tradeSetting->time,
        };
    }
}
