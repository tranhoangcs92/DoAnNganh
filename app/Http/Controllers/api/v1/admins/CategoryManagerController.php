<?php

namespace App\Http\Controllers\api\v1\admins;

use App\Enums\AdminRole;
use App\Http\Controllers\Controller;
use App\Models\Category;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class CategoryManagerController extends Controller
{
    public function index(){
        $category = Category::orderBy("created_at", "desc")->get();
        return response()->json($category);
    }
    public function store(Request $request) {
        if(Auth::user()->admin_type === AdminRole::Admin){
            $validator = Validator::make($request->all(),[
                'name' => 'required'
            ]);
            if($validator->fails()) {
                return response()->json(['error'=>$validator->errors()]);
            }
            $category = new Category([
                'name'=> $request->input('name')
            ]);
            $category->save();
            return response()->json('tạo loại sản phẩm thành công', 200);
        }
        else {
            return response()->json(['error'=>'Không đúng quyền'],401);
        }
    }
    public function update($id, Request $request) {
        if(Auth::user()->admin_type === AdminRole::Admin) {
            $category = Category::find($id);
            $validator = Validator::make($request->all(), [
                'name' => 'required'
            ]);
            if ($validator->fails()) {
                return response()->json(['error' => $validator->errors()], 401);
            }
            $category->update($request->all());
            return response()->json('Chỉnh sửa loại sản phẩm thành công', 200);
        }
        else {
            return response()->json(['error'=>'Không đúng quyền'],401);
        }
    }
    public function destroy($id) {
        if(Auth::user()->admin_type === AdminRole::Admin) {
            $category = Category::find($id);
            $category->delete();
            return response()->json('Xoá loại sản phẩm thành công', 200);
        }
        else {
            return response()->json(['error'=>'Không đúng quyền'],401);
        }
    }
}
