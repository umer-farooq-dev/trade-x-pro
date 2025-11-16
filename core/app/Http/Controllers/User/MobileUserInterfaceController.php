<?php
namespace App\Http\Controllers\User;

use App\Models\Form;
use App\Models\User;
use App\Models\Deposit;
use App\Models\TradeLog;
use App\Constants\Status;
use App\Models\Commission;
use App\Models\Withdrawal;
use App\Models\Transaction;
use App\Models\TradeSetting;
use Illuminate\Http\Request;
use App\Models\CryptoCurrency;
use App\Models\WithdrawMethod;
use App\Models\GatewayCurrency;
use App\Lib\GoogleAuthenticator;
use App\Http\Controllers\Controller;
use App\Http\Controllers\SiteController;

class MobileUserInterfaceController extends Controller
{
    public function index()
    {
        // if (!str_contains(request()->header('user-agent'), 'Mobile')) {
        //     return (new SiteController())->index();
        // }
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
    public function winingTradeLog()
    {
        $tradeLogs = $this->tradeData('win');
        return view('mobile.user.trade-logs', compact('tradeLogs'));
    }
    public function losingTradeLog()
    {
        $tradeLogs = $this->tradeData('loss');
        return view('mobile.user.trade-logs', compact('tradeLogs'));
    }
    public function drawTradeLog()
    {
        $tradeLogs = $this->tradeData('draw');
        return view('mobile.user.trade-logs', compact('tradeLogs'));
    }

    public function withdraw()
    {
        $withdrawMethod = WithdrawMethod::where('status', Status::ENABLE)->get();
        return view('mobile.user.withdraw', compact('withdrawMethod'));
    }

    public function withdrawPreview()
    {
        $withdraw = Withdrawal::with('method', 'user')->where('trx', session()->get('wtrx'))
            ->where('status', Status::PAYMENT_INITIATE)->orderBy('id', 'desc')->firstOrFail();
        return view('mobile.user.withdraw-preview', compact('withdraw'));
    }

    public function withdrawHistory(Request $request)
    {
        $withdraws = Withdrawal::where('user_id', auth()->id())->where('status', '!=', Status::PAYMENT_INITIATE);
        if ($request->search)
        {
            $withdraws = $withdraws->where('trx', $request->search);
        }
        $withdraws = $withdraws->with('method')->orderBy('id', 'desc')->paginate(getPaginate());
        return view('mobile.user.withdraw-log', compact('withdraws'));
    }

    public function transactions()
    {
        $remarks = Transaction::whereNotNull('remark')->distinct('remark')->orderBy('remark')->get('remark');
        $transactions = Transaction::where('user_id', auth()->id())->searchable(['trx'])->filter(['trx_type', 'remark'])->orderBy('id', 'desc')->paginate(getPaginate());

        return view('mobile.user.transactions', compact('transactions', 'remarks'));
    }

    public function profile()
    {
        $user = auth()->user();
        return view('mobile.user.profile', compact('user'));
    }

    public function changePassword()
    {
        return view('mobile.user.change-password');
    }

    public function twofactor()
    {
        $general = gs();
        $ga = new GoogleAuthenticator();
        $user = auth()->user();
        $secret = $ga->createSecret();
        $qrCodeUrl = $ga->getQRCodeGoogleUrl($user->username . '@' . $general->site_name, $secret);
        return view('mobile.user.twofactor', compact('secret', 'qrCodeUrl'));
    }

    public function collectionInformation()
    {
        return view('mobile.user.collection-information');
    }

    public function trust()
    {
        return view('mobile.user.trust');
    }
    public function assets()
    {
        $user = auth()->user();
        $cryptos = CryptoCurrency::active()->get();
        return view('mobile.user.assets', compact('user', 'cryptos'));
    }
    public function publication()
    {
        return view('mobile.user.publication');
    }
    public function referral()
    {
        $user = auth()->user();
        $referrals = User::where('ref_by', $user->id)->latest('id')->paginate(getPaginate());
        return view('mobile.user.referral-log', compact('user', 'referrals'));
    }
    public function referralComission()
    {
        $user = auth()->user();
        $commissions = Commission::where('user_id', $user->id)->with('fromUser')->latest('id')->paginate(getPaginate());
        return view('mobile.user.referral-comission', compact('user', 'commissions'));
    }
    public function chat()
    {
        return view('mobile.user.chat');
    }

    public function depositHistory()
    {
        $deposits = auth()->user()->deposits()->searchable(['trx'])->orderBy('id', 'desc')->paginate(getPaginate());
        return view('mobile.user.deposit.history', compact('deposits'));
    }
    public function deposit()
    {
        $gatewayCurrency = GatewayCurrency::whereHas('method', function ($gate)
        {
            $gate->where('status', Status::ENABLE);
        })->with('method')->orderby('method_code')->get();
        return view('mobile.user.deposit.index', compact('gatewayCurrency'));
    }

    public function kycForm()
    {
        if (auth()->user()->kv == 2)
        {
            $notify[] = ['error', 'Your KYC is under review'];
            return to_route('mobile-user.dashboard')->withNotify($notify);
        }
        if (auth()->user()->kv == 1)
        {
            $notify[] = ['error', 'You are already KYC verified'];
            return to_route('mobile-user.dashboard')->withNotify($notify);
        }
        $form = Form::where('act', 'kyc')->first();
        return view('mobile.user.kyc.form', compact('form'));
    }

    public function kycData()
    {
        $user = auth()->user();
        return view('mobile.user.kyc.data', compact('user'));
    }
    public function manualDepositConfirm()
    {
        $track = session()->get('Track');
        $data = Deposit::with('gateway')->where('status', Status::PAYMENT_INITIATE)->where('trx', $track)->first();
        if (!$data)
        {
            return to_route(gatewayRedirectUrl());
        }
        if ($data->method_code > 999)
        {
            $pageTitle = 'Deposit Confirm';
            $method = $data->gatewayCurrency();
            $gateway = $method->method;
            return view('mobile.user.deposit.manual-confirm', compact('data', 'method', 'gateway'));
        }
        abort(404);
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
