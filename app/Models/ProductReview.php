<?php
// app/Models/ProductReview.php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ProductReview extends Model
{
    protected $fillable = [
        'product_id', 'user_id', 'reviewer_name', 'title',
        'body', 'rating', 'helpful_count', 'verified_purchase', 'is_approved',
    ];

    protected $casts = [
        'verified_purchase' => 'boolean',
        'is_approved'       => 'boolean',
    ];

    public function product()
    {
        return $this->belongsTo(Product::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function getTimeAgoAttribute(): string
    {
        return $this->created_at->diffForHumans();
    }
}
