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
        Schema::table('users', function (Blueprint $table) {
     $table->string('first_name')->after('id');
        $table->string('last_name')->after('first_name');
        $table->string('phone')->nullable()->after('email');
        $table->enum('account_type', ['retail', 'wholesale'])->default('retail')->after('phone');
        $table->string('business_name')->nullable()->after('account_type');
        $table->string('gst_number')->nullable()->after('business_name');

        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('users', function (Blueprint $table) {
             $table->dropColumn([
            'first_name', 'last_name', 'phone',
            'account_type', 'business_name', 'gst_number'
        ]);
        });
    }
};
