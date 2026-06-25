<?php
// app/Models/UserAddress.php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class UserAddress extends Model
{
    protected $fillable = [
        'user_id', 'first_name', 'last_name', 'phone', 'email',
        'street_address', 'city', 'state', 'zip_code', 'country', 'is_default',
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
