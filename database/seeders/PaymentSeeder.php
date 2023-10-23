<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class PaymentSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('payments')->insert(['name' => 'Tiền mặt']);
        DB::table('payments')->insert(['name' => 'Thẻ ngân hàng']);
        DB::table('payments')->insert(['name' => 'VISA']);
    }
}
