<?php

namespace App\Http\Controllers\api\v1\admins;

use App\Enums\StatusRole;
use App\Http\Controllers\Controller;
use App\Models\ProductAuction;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use function response;

class ProductAuctionController extends Controller
{
    public function index()
    {
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
                'ct.name as name_category'
            ])
            ->join('products as p','pa.id_product','p.id')
            ->join('categories as ct','p.id_category','ct.id')
            ->join('auctions as a','pa.id_auction','a.id')
            ->get();
        return response()->json($product_auctions);
    }

    public function show($id)
    {
        $products_of_auction = DB::table('product_auctions as pa')
            ->select([
                'pa.id',
                'p.name as name_product',
                'p.image as image_product',
                'a.time_start',
                'a.time_end',
                'pa.id_auction as id_auction',
                'p.price',
                'ct.name as name_category'
            ])
            ->join('products as p','pa.id_product','p.id')
            ->join('categories as ct','p.id_category','ct.id')
            ->join('auctions as a','pa.id_auction','a.id')
            ->where('pa.id_auction',$id)->get();
        return response()->json($products_of_auction);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\ProductAuction  $productAuction
     * @return \Illuminate\Http\Response
     */
    public function destroy(ProductAuction $productAuction)
    {
        //
    }
}
