<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class TransportSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('transports')->insert([
           'name' => 'shopee',
            'transport_type' => 'GHN',
            'is_active' => 1
        ]);
        DB::table('transports')->insert([
            'name' => 'shopee',
            'transport_type' => 'GHTK',
            'is_active' => 1
        ]);
        DB::table('transports')->insert([
            'name' => 'shopee',
            'transport_type' => 'Ninja',
            'is_active' => 1
        ]);
    }
}
