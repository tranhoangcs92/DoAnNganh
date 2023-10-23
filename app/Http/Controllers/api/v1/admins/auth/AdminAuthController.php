<?php

namespace App\Http\Controllers\api\v1\admins\auth;

use App\Http\Controllers\Controller;
use App\Http\Requests\AdminRequest;
use App\Models\admin;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class AdminAuthController extends Controller
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
            $admin = admin::where('email', $request->email)->first();
            if ( !$admin  || !Hash::check($request->password, $admin->password)) {
                throw new \Exception('Error');
            }
            $tokenResult = $admin->createToken('authToken', ['server:update'])->plainTextToken;
            return response()->json([
                'request' => $request->email,
                'admin' => $admin,
                'status_code' => 200,
                'access_token' => $tokenResult,
                'token_type' => 'Bearer',
            ]);
        } catch (\Exception $error) {
            return response()->json([
                'email' => $request->email,
                'status_code' => 302,
                'message' => 'Bad request',
                'error' => $error->getMessage(),
            ]);
        }
    }
    public function logout(Request $request){
            $request->user()->tokens()->delete();
            $accessToken = $request->bearerToken();
            return response()->json( $request);
    }

}
