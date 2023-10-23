<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class IsShop
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    public function handle(Request $request, Closure $next)
    {
        if($request->user()->admin_type === 1){
            return response()->json($request);
        }
        else {
            return response()->json('Không thuộc quyền Shop',401);
        }

    }
}
