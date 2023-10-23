<?php

namespace App\Http\Controllers\api\v1\admins;

use App\Enums\AdminRole;
use App\Http\Controllers\api\v1\admins\auth\AdminAuthController;
use App\Http\Controllers\Controller;
use App\Models\User;
use App\Rules\MobileNo;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use function response;

class UserManagerController extends AdminAuthController
{
    public function index(){
        $users =  User::orderBy("created_at", "desc")->get();
        return response()->json($users);
    }
    public function store(Request $request) {
        if(Auth::user()->admin_type === AdminRole::Admin){
            $user = new User([
                'firstname' => $request->input('firstname'),
                'lastname' => $request->input('lastname'),
                'email'    => $request->input('email'),
                'sex' => $request->input('sex'),
                'birthday' => $request->date('birthday'),
                'address' => $request->input('address'),
//            'image' => '../',
                'phone' => $request->input('phone'),
                'password'=> Hash::make(123456),
                'created_by' => 'admin'
            ]);
            $user->save();
            return response()->json(Auth::user(),200);
        }
        else {
            return response()->json('Không phải quyền admin',401);
        }

    }
    public function update($id,Request $request){
        $user = User::find($id);
        $user->update($request->all());
        return response()->json('Sửa thông tin thành công');
    }
        public function destroy($id) {
        $user = User::find($id);
        $user->delete();
        return response()->json('Xoá thành công');
    }
//    public function show($id) {
//        $account = Account::find($id);
//        return response()->json($account);
//    }
//    public function update($id, Request $request) {
//        $account = Account::find($id);
//        $account->update($request->all());
//        return response()->json('account updated!');
//    }


}
