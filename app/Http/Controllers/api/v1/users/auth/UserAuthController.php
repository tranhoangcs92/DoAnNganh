<?php

namespace App\Http\Controllers\api\v1\users\auth;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Rules\MobileNo;
use App\Rules\ViettelNo;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Date;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class UserAuthController extends Controller
{
    public function login( Request $request ){
        try {
            $request->validate([
                'email' => 'required',
                'password' => 'required'
            ],
                [
                    'email.required' => 'Bạn phải nhập email vào',
                    'password.required' => 'Bạn phải nhập password vào',
                ]);
            $credentials = request(['email', 'password']);
            $admin = user::where('email', $request->email)->first();
            if (!Hash::check($request->password, $admin->password, [])) {
                throw new \Exception('Error');
            }
            $tokenResult = $admin->createToken('authToken', ['server:update'])->plainTextToken;
            return response()->json([
                'admin' => $admin,
                'status_code' => 200,
                'access_token' => $tokenResult,
                'token_type' => 'Bearer',
            ]);
        } catch (\Exception $error) {
            return response()->json([
                'status_code' => 500,
                'message' => 'Error in Login',
                'error' => $error->getMessage(),
            ]);
        }
    }
    public function register(Request $request){
        $validator = Validator::make($request->all(), [
            'firstname' => 'required',
            'lastname' => 'required',
            'email' => 'required|email',
            'phone' =>  ['required', new MobileNo,'numeric','digits:10'],
//            'phone' =>  ['required','regex:/[0][3][2-9]{7}/','regex:/[0][7][6-9]{7}/','numeric','digits:10'],
            'password' => [
                'regex:/[a-z]/',
                'regex:/[A-Z]/',
                'regex:/[0-9]/',
                'min:8'
                ],
        ]);
        if ($validator->fails()) {
            return response()->json(['error'=>$validator->errors()], 401);
        }
        $name = '';
        if ($request->hasFile('image')) {
            $image = $request->file('image');
            $name = date('YmdHi').$request->file('image')->getClientOriginalName();
            $destinationPath = public_path('/images/avatar');
            $imagePath = $destinationPath . "/" . $name;
            $image->move($destinationPath, $imagePath);
        }
        $date = Carbon::parse($request->input('birthday'));
        $postArray = [
            'firstname'  => $request->firstname,
            'lastname'  => $request->lastname,
            'email'     => $request->email,
            'phone'     => $request->phone,
            'birthday'  => $date,
            'address'  => $request->address,
            'password'  => Hash::make($request->password),
            'remember_token' => $request->token,
            'created_at'=> Carbon::now('Asia/Ho_Chi_Minh'),
            'updated_at'=>Carbon::now('Asia/Ho_Chi_Minh'),
            'image'=> $name
        ];


        $user = User::create($postArray);
        return Response()->json(array("success"=> 1,"data"=>$postArray,"status"=>200 ));

    }

}
