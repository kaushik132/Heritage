<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('orders', function (Blueprint $table) {
            $table->id();
        $table->unsignedBigInteger('user_id')->nullable();
        $table->string('order_number')->unique();
        $table->enum('status', ['pending', 'accepted', 'processing', 'shipped', 'delivered', 'cancelled'])->default('pending');
        $table->enum('payment_method', ['cod', 'online'])->default('cod');
        $table->enum('payment_status', ['pending', 'paid', 'failed'])->default('pending');
        $table->decimal('subtotal', 10, 2)->default(0);
        $table->decimal('tax', 10, 2)->default(0);
        $table->decimal('discount', 10, 2)->default(0);
        $table->decimal('total', 10, 2)->default(0);
        $table->string('coupon_code')->nullable();

        // Shipping address
        $table->string('first_name');
        $table->string('last_name');
        $table->string('email');
        $table->string('phone');
        $table->string('street_address');
        $table->string('city');
        $table->string('state');
        $table->string('zip_code');
        $table->string('country')->default('India');

        $table->text('notes')->nullable();
        $table->timestamps();

        $table->foreign('user_id')->references('id')->on('users')->onDelete('set null');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('orders');
    }
};
