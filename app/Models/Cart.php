<?php


namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Cart extends Model
{
    protected $fillable = ['user_id', 'product_id', 'color', 'quantity'];

    public function product()
    {
        return $this->belongsTo(Product::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    // Total price helper
    public function getTotalAttribute(): float
    {
        return $this->product ? $this->product->price * $this->quantity : 0;
    }
}
