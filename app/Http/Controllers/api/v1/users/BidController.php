<?php

namespace App\Http\Controllers\api\v1\users;

use App\Events\Bidding;
use App\Http\Controllers\Controller;
use App\Models\Bid;
use App\Models\Product;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use function Psy\sh;

class BidController extends Controller
{
    public function index(Request $request)
    {
        $bids = Bid::where('id_product_auction',$request->id)->orderBy('price','desc')->get();
        foreach ($bids as $bid){
            $user=$bid->user;
            $bid['user'] = $user;
        }
        return response()->json($bids);
    }
    public function store(Request $request)
    {
        $top = Bid::where('id_product_auction', $request->id)->orderBy('price','desc')->first();
        $product = $this->getProduct($request->id);
        $product_time_end = Carbon::parse($product[0]->time_end);
        $time_now = Carbon::now();
        if($product_time_end->gt($time_now) === true ){
            if(($top === null && $request->price > $product[0]->price)  || $request->price > $top->price) {
                Bid::updateOrCreate(
                    ['id_user' => Auth::user()->id,
                        'id_product_auction'=> $request->id_product_auction ],
                    [
                        'id_user' => Auth::user()->id,
                        'id_product_auction' => (integer) $request->id,
                        'price' => (integer) $request->price
                    ]
                );
                event(new Bidding($this->show($request->id)));
                return response()->json(['message'=>'Đặt giá thành công','data'=>$this->show($request->id)],200);
            }
            else
                return response()->json(['message'=>'Giá phải cao hơn giá hiện tại','data'=>$this->show($request->id)],500);
        }
        else
            return  response()->json(['message'=>'Hết thời gian đấu giá', 'data'=>$this->show($request->id)], 500);

//        return response()->json($product[0]->time_start);
    }
    public function show($id) {
        $bids = Bid::where('id_product_auction',$id)->orderBy('price','desc')->get();
        foreach ($bids as $bid){
            $user=$bid->user;
            $bid['user'] = $user;
        }
        return $bids;
    }
    public function getProduct($id) {
        $product = DB::table('product_auctions as pa')
            ->select([
                'pa.id as id_product_auction',
                'p.price as price',
                'pa.time_start',
                'pa.time_end'
            ])
            ->join('products as p','pa.id_product','p.id')->where('pa.id',$id)->get();
        return $product;
    }

}
