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
        Schema::table('product_auctions', function (Blueprint $table) {
            $table->timestamp('time_start')->nullable();
            $table->timestamp('time_end')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('product_auctions', function (Blueprint $table) {
            $table->dropColumn('time_start');
            $table->dropColumn('time_end');
        });
    }
};
