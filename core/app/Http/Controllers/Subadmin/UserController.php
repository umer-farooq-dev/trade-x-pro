<?php

namespace App\Http\Controllers\Subadmin;

use App\Http\Controllers\Controller;
use App\Models\Deposit;
use App\Models\PracticeLog;
use App\Models\TradeLog;
use App\Models\Transaction;
use App\Models\User;
use App\Models\Withdrawal;
use Illuminate\Http\Request;

class UserController extends Controller
{
    public function index()
    {
        $pageTitle = 'All Users';
        $users = User::searchable(['username', 'email'])->orderBy('id', 'desc')->paginate(getPaginate());
        return view('subadmin.users.list', compact('pageTitle', 'users'));
    }

    public function detail($id)
    {
        $user = User::findOrFail($id);
        $pageTitle = 'User Detail - ' . $user->username;

        $widget['total_deposit'] = Deposit::where('user_id', $user->id)->where('status', Status::PAYMENT_SUCCESS)->sum('amount');
        $widget['total_withdrawals'] = Withdrawal::where('user_id', $user->id)->where('status', Status::PAYMENT_SUCCESS)->sum('amount');
        $widget['total_transaction'] = Transaction::where('user_id', $user->id)->count();
        $widget['total_practice_trade'] = PracticeLog::where('user_id', $user->id)->where('status', '!=', Status::TRADE_PENDING)->count();
        $widget['total_trade'] = TradeLog::where('user_id', $user->id)->where('status', '!=', Status::TRADE_PENDING)->count();

        return view('subadmin.users.detail', compact('pageTitle', 'user', 'widget'));
    }

    public function updateStatus(Request $request, $id)
    {
        $user = User::findOrFail($id);
        $request->validate([
            'reason' => 'required_if:status,0|string|max:255'
        ]);

        if ($user->status == Status::USER_ACTIVE) {
            $user->status = Status::USER_BAN;
            $user->ban_reason = $request->reason;
            $notify[] = ['success', 'User banned successfully'];
        } else {
            $user->status = Status::USER_ACTIVE;
            $user->ban_reason = null;
            $notify[] = ['success', 'User unbanned successfully'];
        }
        $user->save();

        return back()->withNotify($notify);
    }
}
