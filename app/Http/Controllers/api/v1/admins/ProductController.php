<?php

namespace App\Http\Controllers\api\v1\admins;

use App\Enums\AdminRole;
use App\Http\Controllers\Controller;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class ProductController extends Controller
{

    public function index()
    {
        $products = DB::table('products as p')
            ->select(['p.id', 'p.name', 'p.image', 'a.name as name_shop', 'a.id as id_shop','c.name as name_cate','c.id as id_cate','p.price'])
            ->join('admins as a', 'p.id_admin', '=', 'a.id')
            ->join('categories as c', 'p.id_category', '=', 'c.id')
            ->get();

        return response()->json($products);
    }

    public function store(Request $request)
    {
        $name = '';
        if($request->hasfile('image')) {
            $image = $request->file('image');
            $journalName = str_replace(' ', '_', $request->file('image')->getClientOriginalName());
            $name = $request->input('id_admin') . '_' . $journalName;
            $destinationPath = public_path('images/products');
            $imagePath = $destinationPath . "/" . $name;
            $image->move($destinationPath, $imagePath);
        }
        if(Auth::user()->admin_type === AdminRole::Admin) {
            $product = new Product([
                'name'=> $request->input('name'),
                'price' => $request->input('price'),
                'id_admin' => $request->input('id_admin'),
                'id_category' => $request->input('id_category'),
                'created_at'=> Carbon::now('Asia/Ho_Chi_Minh'),
                'image' => $name
            ]);
            $product->save();
            return response()->json(array("success"=> 1, "messages"=>'Tạo sản phẩm thành công ', "status"=>200 ));
        }
        else {
            return response()->json('Không đủ thẩm quyền');
        }
    }

    public function show(Product $product)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function edit(Product $product)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Product $product)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function destroy(Product $product)
    {
        //
    }
}
