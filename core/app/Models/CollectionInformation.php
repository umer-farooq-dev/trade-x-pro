<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class CollectionInformation extends Model
{
    protected $fillable = ['user_id', 'data'];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    protected $casts = [
        'data' => 'array',
    ];
}
