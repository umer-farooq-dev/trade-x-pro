<?php

namespace App\Http\Controllers\User;

use Illuminate\Http\Request;
use App\Models\CryptoCurrency;
use App\Http\Controllers\Controller;
use App\Lib\Trade;
use App\Models\TradeLog;
use App\Models\TradeSetting;

class TradeController extends Controller
{
    public function history(Request $request)
    {
        $cryptoId = $request->crypto_currency_id;
        $page = $request->page ?? 1;
        $perPage = 10;

        $trades = TradeLog::where('crypto_currency_id', $cryptoId)
            ->orderBy('created_at', 'desc')
            ->skip(($page - 1) * $perPage)
            ->take($perPage)
            ->get()
            ->map(function ($trade) {
                return [
                    'time' => $trade->created_at->format('H:i:s'),
                    'direction' => $trade->high_low == 1 ? 'Buy' : 'Sell',
                    'price' => $trade->amount,
                ];
            });

        return response()->json($trades);
    }

    public function index()
    {
        $pageTitle = "Trade Now";
        $cryptos = CryptoCurrency::active()->get();
        return view($this->activeTemplate . 'user.trade.index', compact('pageTitle', 'cryptos'));
    }

    public function tradeNow($name)
    {
        $cryptos = CryptoCurrency::active()->get();
        $currency = CryptoCurrency::active()->where('name', $name)->firstOrFail();
        $tradeSettings = TradeSetting::select('id', 'time', 'unit', 'profit_margin')->latest()->get();
        $pageTitle = "Trade With " . $currency->name;
        return view($this->activeTemplate . 'user.trade.trade_with', compact('pageTitle', 'currency', 'tradeSettings', 'cryptos'));
    }

    public function store(Request $request)
    {
        $trade = new Trade();
        return $trade->store($request);
    }

    public function tradeResult(Request $request)
    {
        $trade = new Trade();
        return $trade->result($request);
    }

    public function tradeLog()
    {
        $pageTitle = "Trade Log";
        $tradeLogs = $this->tradeData();
        return view($this->activeTemplate . 'user.trade.log', compact('pageTitle', 'tradeLogs'));
    }

    public function winingTradeLog()
    {
        $pageTitle = "Wining Trade Log";
        $tradeLogs = $this->tradeData('win');
        return view($this->activeTemplate . 'user.trade.log', compact('pageTitle', 'tradeLogs'));
    }

    public function losingTradeLog()
    {
        $pageTitle = "Losing Trade Log";
        $tradeLogs = $this->tradeData('loss');
        return view($this->activeTemplate . 'user.trade.log', compact('pageTitle', 'tradeLogs'));
    }

    public function drawTradeLog()
    {
        $pageTitle = "Draw Trade Log";
        $tradeLogs = $this->tradeData('draw');
        return view($this->activeTemplate . 'user.trade.log', compact('pageTitle', 'tradeLogs'));
    }

    protected function tradeData($scope = null)
    {
        if ($scope) {
            $tradeLogs = TradeLog::where('user_id', auth()->id())->$scope();
        } else {
            $tradeLogs = TradeLog::where('user_id', auth()->id());
        }
        return $tradeLogs->with("crypto")->latest('id')->paginate(getPaginate());
    }
}
