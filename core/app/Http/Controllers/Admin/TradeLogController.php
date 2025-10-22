<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\TradeLog;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;

class TradeLogController extends Controller
{
    public function index()
    {
        $pageTitle = "Trade Log";
        $tradeLogs = $this->tradeData();
        return view('admin.trade_log.index', compact('pageTitle', 'tradeLogs'));
    }

    public function win()
    {
        $pageTitle = "Win Trade Log";
        $tradeLogs = $this->tradeData('win');
        return view('admin.trade_log.index', compact('pageTitle', 'tradeLogs'));
    }

    public function loss()
    {
        $pageTitle = "Loss Trade Log";
        $tradeLogs = $this->tradeData('loss');
        return view('admin.trade_log.index', compact('pageTitle', 'tradeLogs'));
    }

    public function draw()
    {
        $pageTitle = "Draw Trade Log";
        $tradeLogs = $this->tradeData('draw');
        return view('admin.trade_log.index', compact('pageTitle', 'tradeLogs'));
    }

    protected function tradeData($scope = null)
    {
        $admin = Auth::guard('admin')->user();
        if (!$admin) {
            Log::error('No admin user found in TradeLogController@tradeData');
            return TradeLog::query()->paginate(getPaginate());
        }

        $isSubAdmin = $admin->isSubAdmin ?? 0;
        Log::info('TradeLogController@tradeData - Admin ID: ' . $admin->id . ', isSubAdmin: ' . $isSubAdmin);

        if ($scope) {
            $tradeList = TradeLog::$scope();
        } else {
            $tradeList = TradeLog::query();
        }

        if ($isSubAdmin == 1) {
            $referredUserIds = User::where('ref_by', $admin->id)
                ->pluck('id')
                ->toArray();

            Log::info('TradeLogController@tradeData - Sub-Admin ID: ' . $admin->id . ', Referred User IDs: ' . json_encode($referredUserIds));

            if (empty($referredUserIds)) {
                Log::info('TradeLogController@tradeData - No referred users found for sub-admin ID: ' . $admin->id);
                // Return an empty query to avoid showing all trade logs
                return $tradeList->where('user_id', 0)->paginate(getPaginate()); // No users, so no trade logs
            }

            // Filter trade logs to only include records for these users
            $tradeList->whereIn('user_id', $referredUserIds);
        }

        // Apply existing filters and relationships
        return $tradeList->filter(['user_id'])
            ->searchAble(['crypto:name,symbol', 'user:username'])
            ->dateFilter()
            ->orderBy('id', 'desc')
            ->with('user', 'crypto')
            ->paginate(getPaginate());
    }

    public function update(Request $request, $id)
    {
        Log::info('TradeLogController@update Request Data:', $request->all());

        $validated = $request->validate([
            'result' => 'required|in:1,2,3',
        ]);

        try {
            $tradeLog = TradeLog::findOrFail($id);

            $admin = Auth::guard('admin')->user();
            if (!$admin) {
                Log::error('No admin user found in TradeLogController@update');
                $notify[] = ['error', 'Unauthorized access'];
                return back()->withNotify($notify);
            }

            $isSubAdmin = $admin->isSubAdmin ?? 0;
            Log::info('TradeLogController@update - Admin ID: ' . $admin->id . ', isSubAdmin: ' . $isSubAdmin);

            if ($isSubAdmin == 1) {
                $referredUserIds = User::where('ref_by', $admin->id)
                    ->pluck('id')
                    ->toArray();

                Log::info('TradeLogController@update - Sub-Admin ID: ' . $admin->id . ', Referred User IDs: ' . json_encode($referredUserIds));

                if (!in_array($tradeLog->user_id, $referredUserIds)) {
                    Log::warning('TradeLogController@update - Sub-Admin ID: ' . $admin->id . ' attempted to update trade log for unauthorized user ID: ' . $tradeLog->user_id);
                    $notify[] = ['error', 'You are not authorized to update this trade log'];
                    return back()->withNotify($notify);
                }
            }

            $tradeLog->result = $validated['result'];
            $tradeLog->status = 1;
            $tradeLog->save();

            $notify[] = ['success', 'Trade result updated successfully'];
            return back()->withNotify($notify);
        } catch (\Exception $e) {
            Log::error('Error updating trade result: ' . $e->getMessage());
            $notify[] = ['error', 'Failed to update trade result'];
            return back()->withNotify($notify);
        }
    }
}
