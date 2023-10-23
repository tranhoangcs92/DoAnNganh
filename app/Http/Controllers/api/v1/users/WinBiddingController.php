<?php

namespace App\Http\Controllers\api\v1\users;

use App\Http\Controllers\Controller;
use App\Models\WinBidding;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class WinBiddingController extends Controller
{
    public function index()
    {
        $id_user = Auth::user()->id;
        $list_product = WinBidding::query()->where('id_user', $id_user)->get();
        return response()->json($list_product);
    }

    public function store(Request $request)
    {
        $test = WinBidding::where('id_bid', $request->id)->first();
        if($test === null){
            $win = WinBidding::create([
                'id_bid' => $request->id,
                'id_payment'=> 1,
                'id_user' => $request->id_user,
                'id_transport_admin' => 1,
                'delivery_status' => 'Dang xu ly'
            ]);
            return response()->json($win);
        }
        else{
            return response()->json('sai');
        }

    }


    public function show(WinBidding $winBidding)
    {
        //
    }

}
