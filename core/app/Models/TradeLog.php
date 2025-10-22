<?php

namespace App\Models;

use App\Traits\Searchable;
use App\Traits\TradeModel;
use Illuminate\Database\Eloquent\Model;

class TradeLog extends Model
{
    use Searchable,TradeModel;
    protected $fillable = [
        'user_id',
        'crypto_id',
        'amount',
        'in_time',
        'high_low',
        'result',
        'status',
        'created_at',
        'updated_at',
        'is_processed',
    ];

    public function tradeSetting()
{
    return $this->belongsTo(TradeSetting::class, 'trade_setting_id');
}
}
