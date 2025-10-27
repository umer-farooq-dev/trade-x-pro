<?php

use App\Http\Controllers\User\MobileUserInterfaceController;

Route::group(['prefix' => 'mobile', 'middleware' => 'auth'], function ()
{
    Route::name('mobile-user.')->controller(MobileUserInterfaceController::class)->group(function ()
    {
        Route::get('dashboard', 'index')->name('dashboard');
        Route::get('chart/{name?}', 'chart')->name('chart');
        Route::get('cryptos', 'cryptos')->name('crypto');
        Route::get('trade-logs', 'tradeLogs')->name('trade-logs');

        Route::get('withdraw', 'withdraw')->name('withdraw');
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
