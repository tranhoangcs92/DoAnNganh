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
        Schema::create('admins', function (Blueprint $table) {
            $table->id();
            $table->rememberToken()->nullable();
            $table->string('firstname',50)->nullable();
            $table->string('lastname',50)->nullable();
            $table->string('name')->nullable();
            $table->string('email')->unique();
            $table->string('password')->nullable();
            $table->string('phone')->unique()->nullable();
            $table->enum('sex',['Male','Female','LGBT'])->default('Male');
            $table->timestamp('birthday')->nullable();
            $table->text('address')->nullable();
            $table->string('image',255)->nullable();
            $table->integer('admin_type')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('admins');
    }
};
