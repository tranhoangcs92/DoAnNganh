<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('transport_admins', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('id_transport');
            $table->unsignedBigInteger('id_admin');
            $table->timestamps();

            $table->foreign('id_transport')->references('id')->on('transports');
            $table->foreign('id_admin')->references('id')->on('admins');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('transport_admins');
    }
};
