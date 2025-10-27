<?php
namespace App\Http\Controllers\User;

use App\Models\TradeLog;
use App\Constants\Status;
use App\Models\TradeSetting;
use App\Models\CryptoCurrency;
use App\Models\WithdrawMethod;
use App\Http\Controllers\Controller;

class MobileUserInterfaceController extends Controller
{
    public function index()
    {
        $cryptos = CryptoCurrency::active()->get();
        return view('mobile.user.dashboard', compact('cryptos'));
    }

    public function chart($name = 'Bitcoin')
    {
        $tradeSettings = TradeSetting::select('id', 'time', 'unit', 'profit_margin')->latest()->get();
        $currency = CryptoCurrency::active()->where('name', $name)->firstOrFail();
        $cryptos = CryptoCurrency::active()->get();
        return view('mobile.user.chart', compact('name', 'tradeSettings', 'currency', 'cryptos'));
    }

    public function cryptos()
    {
        $cryptos = CryptoCurrency::active()->get();
        return view('mobile.user.cryptos', compact('cryptos'));
    }

    public function tradeLogs()
    {
        $tradeLogs = $this->tradeData();
        return view('mobile.user.trade-logs', compact('tradeLogs'));
    }

    public function withdraw()
    {
        $withdrawMethod = WithdrawMethod::where('status', Status::ENABLE)->get();
        return view('mobile.user.withdraw', compact('withdrawMethod'));
    }

    protected function tradeData($scope = null)
    {
        if ($scope)
        {
            $tradeLogs = TradeLog::where('user_id', auth()->id())->$scope();
        }
        else
        {
            $tradeLogs = TradeLog::where('user_id', auth()->id());
        }
        return $tradeLogs->with("crypto")->latest('id')->paginate(getPaginate());
    }
}
