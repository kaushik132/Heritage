<?php

use Illuminate\Routing\Router;

Admin::routes();

Route::group([
    'prefix'        => config('admin.route.prefix'),
    'namespace'     => config('admin.route.namespace'),
    'middleware'    => config('admin.route.middleware'),
    'as'            => config('admin.route.prefix') . '.',
], function (Router $router) {

    $router->get('/', 'HomeController@index')->name('home');


    $router->resource('products', ProductController::class);
    $router->resource('product-categories', ProductCategoryController::class);
    $router->resource('product-images', ProductImageController::class);

    $router->resource('wishlists', WishlistController::class);
    $router->resource('product-reviews', ProductReviewController::class);
    $router->resource('carts', CartController::class);
    $router->resource('orders', OrderController::class);
    $router->resource('order-items', OrderItemController::class);
    $router->resource('users', UserController::class);
    $router->resource('user-addresses', UserAddressController::class);
    $router->resource('inquiries', InquiryController::class);

    $router->resource('home-banners', HomeBannerController::class);

});
