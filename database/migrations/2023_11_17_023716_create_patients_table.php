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
        Schema::create('patients', function (Blueprint $table) {
            $table->id();
            $table->string('name', 256);
            $table->string('phone', 25);
            $table->text('address');
            $table->enum('status', ['reaktif', 'sembuh', 'meninggal']);
            $table->date('in_date_at');
            $table->date('out_date_at');
            $table->bigInteger('hospital_id')->unsigned();
            $table->bigInteger('partial_address_id')->unsigned();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('patients');
    }
};
