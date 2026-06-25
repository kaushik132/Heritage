<?php
// app/Providers/ViewServiceProvider.php

namespace App\Providers;

use App\Models\Cart;
use App\Models\Wishlist;
use App\Models\ProductCategory;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\View;
use Illuminate\Support\ServiceProvider;

class ViewServiceProvider extends ServiceProvider
{
    public function boot(): void
    {
        View::composer('*', function ($view) {
            if (Auth::check()) {
                $cartCount     = Cart::where('user_id', Auth::id())->count();
                $wishlistCount = Wishlist::where('user_id', Auth::id())->count();
            } else {
                $cartCount     = 0;
                $wishlistCount = 0;
            }
              // Categories — sab pages pe available
            $headerCategories = ProductCategory::orderBy('name')->get();

            $view->with(compact('cartCount', 'wishlistCount','headerCategories'));
        });
    }
}
