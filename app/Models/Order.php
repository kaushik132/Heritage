<?php
// app/Models/Order.php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str;

class Order extends Model
{
    protected $fillable = [
        'user_id', 'order_number', 'status', 'payment_method', 'payment_status',
        'subtotal', 'tax', 'discount', 'total', 'coupon_code',
        'first_name', 'last_name', 'email', 'phone',
        'street_address', 'city', 'state', 'zip_code', 'country', 'notes',
    ];

    public function items()
    {
        return $this->hasMany(OrderItem::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public static function generateOrderNumber(): string
    {
        return 'ORD-' . strtoupper(Str::random(8));
    }

    public function getStatusLabelAttribute(): string
    {
        return match($this->status) {
            'pending'    => 'Pending',
            'accepted'   => 'Accepted',
            'processing' => 'Processing',
            'shipped'    => 'Shipped',
            'delivered'  => 'Delivered',
            'cancelled'  => 'Cancelled',
            default      => 'Unknown',
        };
    }
}
