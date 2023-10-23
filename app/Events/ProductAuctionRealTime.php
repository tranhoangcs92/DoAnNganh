<?php

namespace App\Events;

use Illuminate\Broadcasting\Channel;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Broadcasting\PresenceChannel;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\DB;

class ProductAuctionRealTime implements ShouldBroadcast
{
    use Dispatchable, InteractsWithSockets, SerializesModels;

    public $message;
    public $list = [];
    public function __construct($message)
    {
        $this->message = $message;
        $this->index();

    }
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

        $this->list = $product_auctions;
        return $this->list;
    }
    public function broadcastOn()
    {
        return ['product-auction-realtime'];
    }
    public function broadcastAs()
    {
        return 'event-product-auction';
    }
}
