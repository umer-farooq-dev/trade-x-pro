<?php

use App\Http\Controllers\User\MobileUserInterfaceController;

Route::group(['prefix' => 'mobile', 'middleware' => 'auth'], function ()
{
    Route::name('mobile-user.')->controller(MobileUserInterfaceController::class)->group(function ()
    {
        Route::get('dashboard', 'index')->name('dashboard'); // Redirected
        Route::get('chart/{name?}', 'chart')->name('chart'); // Redirected
        Route::get('cryptos', 'cryptos')->name('crypto'); // New Route
        Route::get('trade/logs', 'tradeLogs')->name('trade-logs'); // Redirected

        Route::get('withdraw', 'withdraw')->name('withdraw'); // Redirected
        Route::get('withdraw/preview', 'withdrawPreview')->name('withdraw.preview'); // Redirected
        Route::get('withdraw/history', 'withdrawHistory')->name('withdraw.history'); // Redirected

        Route::get('transactions', 'transactions')->name('transactions'); // Redirected

        Route::get('profile-setting', 'profile')->name('profile.setting'); // Redirected
        Route::get('change-password', 'changePassword')->name('change.password'); // Redirected
        Route::get('twofactor', 'twofactor')->name('twofactor'); // Redirected

        Route::get('collection-information', 'collectionInformation')->name('collection-information'); // New Route
        Route::get('trust', 'trust')->name('trust'); // New Route
        Route::get('assets', 'assets')->name('assets'); // New Route

        Route::get('publication', 'publication')->name('publication'); // New Route
        Route::get('referral/log', 'referral')->name('referral'); // Redirected
        Route::get('commissions/history', 'referralComission')->name('referral.commissions'); // Redirected
        Route::get('chat', 'chat')->name('chat'); // New Route

        Route::group(['prefix' => 'deposit', 'as' => 'deposit.'], function ()
        {
            Route::any('history', 'depositHistory')->name('history');
            Route::any('/', 'deposit')->name('index');
            Route::get('confirm', 'depositConfirm')->name('confirm');
            Route::get('manual', 'manualDepositConfirm')->name('manual.confirm');
        });

        Route::group(['prefix' => 'trade', 'as' => 'trade.'], function ()
        {
            Route::get('wining/log', 'winingTradeLog')->name('wining.log');
            Route::get('losing/log', 'losingTradeLog')->name('losing.log');
            Route::get('draw/log', 'drawTradeLog')->name('draw.log');
        });
    });
});
Route::get('/ws-proxy/kline/{symbol}/{interval}', function ($symbol, $interval)
{
    return response()->json([
        'ws' => "wss://stream.binance.com:9443/ws/{$symbol}@kline_{$interval}"
    ]);
});
Route::get('/ws-proxy/ticker/{symbol}', action: function ($symbol)
{
    return response()->json([
        'ws' => "wss://stream.binance.com:9443/ws/{$symbol}@ticker"
    ]);
});
