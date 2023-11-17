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
        Schema::create('partial_address', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('province_id')->unsigned();
            $table->bigInteger('regency_id')->unsigned();
            $table->bigInteger('district_id')->unsigned();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('partial_address');
    }
};
