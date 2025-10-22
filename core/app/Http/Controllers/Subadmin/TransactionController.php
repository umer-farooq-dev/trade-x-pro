<?php

namespace App\Http\Controllers\Subadmin;

use App\Http\Controllers\Controller;
use App\Models\Transaction;
use App\Models\User;
use Illuminate\Http\Request;

class TransactionController extends Controller
{
    public function index(Request $request)
    {
        $pageTitle = 'Transaction History';
        $transactions = Transaction::searchable(['trx', 'user:username'])
            ->filter(['trx_type', 'remark'])
            ->dateFilter()
            ->orderBy('id', 'desc')
            ->with('user')
            ->paginate(getPaginate());

        $remarks = Transaction::distinct('remark')->orderBy('remark')->get('remark');

        return view('subadmin.transactions.index', compact('pageTitle', 'transactions', 'remarks'));
    }

    public function userTransactions($id)
    {
        $user = User::findOrFail($id);
        $pageTitle = 'Transaction History for ' . $user->username;
        $transactions = Transaction::where('user_id', $id)
            ->searchable(['trx'])
            ->filter(['trx_type', 'remark'])
            ->dateFilter()
            ->orderBy('id', 'desc')
            ->with('user')
            ->paginate(getPaginate());

        $remarks = Transaction::where('user_id', $id)->distinct('remark')->orderBy('remark')->get('remark');

        return view('subadmin.transactions.index', compact('pageTitle', 'transactions', 'remarks', 'user'));
    }

    public function details($id)
    {
        $transaction = Transaction::findOrFail($id);
        $pageTitle = 'Transaction Details - ' . $transaction->trx;
        return view('subadmin.transactions.details', compact('pageTitle', 'transaction'));
    }
}
