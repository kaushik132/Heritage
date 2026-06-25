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
        Schema::create('product_reviews', function (Blueprint $table) {
         $table->id();
        $table->unsignedBigInteger('product_id');
        $table->unsignedBigInteger('user_id')->nullable(); // ← unsignedBigInteger use karo
        $table->string('reviewer_name');
        $table->string('title');
        $table->text('body');
        $table->integer('rating');
        $table->integer('helpful_count')->default(0);
        $table->boolean('verified_purchase')->default(false);
        $table->boolean('is_approved')->default(true);
        $table->timestamps();

        // Foreign keys alag se
        $table->foreign('product_id')->references('id')->on('products')->onDelete('cascade');
        $table->foreign('user_id')->references('id')->on('users')->onDelete('set null');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('product_reviews');
    }
};
