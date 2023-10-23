<?php

namespace App\Http\Controllers\api\v1\admins;

use App\Enums\AdminRole;
use App\Enums\StatusRole;
use App\Events\ProductAuctionRealTime;
use App\Events\TimeCountDown;
use App\Http\Controllers\Controller;
use App\Models\admin;
use App\Models\Auction;
use App\Models\ProductAuction;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Date;
use Illuminate\Support\Facades\DB;

class AuctionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function index()
    {
        $auction = Auction::orderBy("created_at", "desc")->get(['id','time_start as time_start_auction','time_end as time_end_auction']);
        foreach ($auction as $au) {
            $value = $au['id'];
            $product = DB::table('product_auctions as pa')
                ->select('p.id as id','p.name as name','p.price as price','p.image as image','ct.name as category_name','pa.time_start as time_start_product', 'pa.time_end as time_end_product')
                ->join('products as p','pa.id_product','p.id')
                ->join('categories as ct','p.id_category','ct.id')
                ->join('auctions as a','pa.id_auction','a.id')
                ->where('pa.id_auction',$value)->get();
            $au['products'] = $product;
        }
        return response()->json($auction);
    }

    public function store(Request $request)
    {
        $list = [];
        if(Auth::user()->admin_type === AdminRole::Admin) {
            $time_start = Carbon::parse($request->time_start_auction)  ;
            $time_end = Carbon::parse($request->time_end_auction) ;
            $date_now = \Illuminate\Support\Carbon::now('Asia/Ho_Chi_Minh');
            if($request->product === null)
                return response()->json('Vui lòng chọn sản phẩm',500);
            try {
                if(Carbon::parse($time_end)->gt(Carbon::parse($time_start)) === true) {
                    $auction = new Auction([
                        'time_start' => $time_start,
                        'time_end' => $time_end,
                        'price_start' => 1000,
                        'id_admin' => 1 //admin
                    ]);
                    $auction->save();
                    $products = $request->product;
                    foreach ($products as $p) {
                        $time_start = Carbon::parse($p['time_start']) ;
                        $time_end = Carbon::parse($p['time_end']);
                        if($time_end->gt(Carbon::parse($request->time_end_auction)) === true || $time_start->lt(Carbon::parse($request->time_start_auction)) === true ){
                            return response()->json('Ngày phải nằm trong khoảng của phiên lớn', 500);
                        }
                        else{

                            $status = StatusRole::SAP_DIEN_RA;
                            if($date_now >= $time_start && $date_now <= $time_end)
                                $status = StatusRole::DANG_DIEN_RA;
                            elseif ($date_now > $time_end )
                                $status = StatusRole::HET_DIEN_RA;
                            $product_auction = new ProductAuction([
                                'id_product' => $p['id']  ,
                                'id_auction' => $auction->id,
                                'time_start' => $time_start,
                                'time_end' => $time_end,
                                'status' => $status
                            ]);
                            $list[] = $product_auction;

                            $product_auction->save();
                        }

                    }
                    event(new ProductAuctionRealTime($list));
                    return response()->json('Tạo phiên thành công', 201);
                }
                if($time_end->gt($time_start) === false) {
                    return response()->json('Thời gian kết thúc không thể nhỏ hơn thời gian bắt đầu',500);
                }
            }
            catch(\Illuminate\Database\QueryException $ex){
                return response()->json(['errors'=> $ex,'title'=>'lỗi truy vấn'],500);
            }
        }
        else {
            return response()->json('Không đủ thẩm quyền',401);
        }

    }

    public function test()
    {

    }



}
