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
        Schema::create('win_biddings', function (Blueprint $table) {
            $table->id();
            $table->enum('delivery_status',['Dang Xu ly','Dang Giao Hang','Thanh Cong'])->default('Dang Xu ly');
            $table->unsignedBigInteger('id_bid');
            $table->unsignedBigInteger('id_payment');
            $table->unsignedBigInteger('id_transport_admin');
            $table->integer('id_user')->nullable();
            $table->timestamps();

            $table->foreign('id_bid')->references('id')->on('bids');
            $table->foreign('id_payment')->references('id')->on('payments');
            $table->foreign('id_transport_admin')->references('id')->on('transport_admins');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('win_biddings');
    }
};
