<?php

namespace App\Http\Controllers\api\v1\users;

use App\Enums\StatusRole;
use App\Events\ListProductAuction;
use App\Events\TimeCountDown;
use App\Http\Controllers\Controller;
use App\Models\Bid;
use App\Models\ProductAuction;
use Illuminate\Support\Facades\DB;
use stdClass;

class ProductAuctionController extends Controller
{
    public function index() {
        $product_auctions =DB::table('product_auctions as pa')
            ->select([
                'pa.id',
                'pa.id_auction as id_auction',
                'p.id as id_product',
                'p.name as name_product',
                'p.image as image_product',
                'a.time_start as time_start_auction',
                'a.time_end as time_end_auction',
                'p.price',
                'pa.time_start as time_start_product',
                'pa.time_end as time_end_product',
                'pa.status',
                'ct.name as name_category',
            ])
            ->join('products as p','pa.id_product','p.id')
            ->join('categories as ct','p.id_category','ct.id')
            ->join('auctions as a','pa.id_auction','a.id')
            ->where('status', 1)
            ->get();
        foreach ($product_auctions as $pa) {
            $highest = DB::table('bids')->where('id_product_auction',$pa->id)->orderBy('price','desc')->first();
            if( is_null($highest) === true){
                $pa->highest = ['price' => $pa->price];
            }
            else
                $pa->highest = $highest;
        }
        event(new \App\Events\ProductAuction($product_auctions));
        event(new TimeCountDown($product_auctions));

        return response()->json( $product_auctions);
    }
    public function show($id) {
        $product_detail =DB::table('product_auctions as pa')
            ->select([
                'pa.id',
                'pa.id_auction as id_auction',
                'p.id as id_product',
                'p.name as name_product',
                'p.image as image_product',
                'a.time_start as time_start_auction',
                'a.time_end as time_end_auction',
                'p.price',
                'pa.time_start as time_start_product',
                'pa.time_end as time_end_product',
                'ct.name as name_category'
            ])
            ->join('products as p','pa.id_product','p.id')
            ->join('categories as ct','p.id_category','ct.id')
            ->join('auctions as a','pa.id_auction','a.id')
            ->where('pa.id',$id)->first();
            return response()->json($product_detail);
    }
    public function updateStatus($id) {
        $product = ProductAuction::where('id',$id)->update(array('status' => StatusRole::HET_DIEN_RA));
        return response()->json($product);
    }

}
