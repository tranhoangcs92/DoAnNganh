<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::prefix('admin')->group(function () {
    Route::group(['middleware' => ['auth:sanctum', 'IsAdmin']], function() {
        Route::get('/user-manager',[\App\Http\Controllers\api\v1\admins\UserManagerController::class,'index'])->name('user-manager');
        Route::post('/logout',[\App\Http\Controllers\api\v1\admins\auth\AdminAuthController::class,'logout'])->name('admin-logout');
        Route::post('/user-created',[\App\Http\Controllers\api\v1\admins\UserManagerController::class,'store'])->name('admin-user-created');
        Route::post('/user-updated/{id}',[\App\Http\Controllers\api\v1\admins\UserManagerController::class,'update'])->name('admin-user-updated');
        Route::delete('/user-deleted/{id}',[\App\Http\Controllers\api\v1\admins\UserManagerController::class,'destroy'])->name('admin-user-deleted');
        Route::post('/category-created',[\App\Http\Controllers\api\v1\admins\CategoryManagerController::class,'store'])->name('admin-categories-created');
        Route::post('/category-updated/{id}',[\App\Http\Controllers\api\v1\admins\CategoryManagerController::class,'update'])->name('admin-categories-updated');
        Route::delete('/category-deleted/{id}',[\App\Http\Controllers\api\v1\admins\CategoryManagerController::class,'destroy'])->name('admin-categories-deleted');
        Route::get('/shops',[\App\Http\Controllers\api\v1\admins\ShopController::class,'index'])->name('admin-shops-manager');
        Route::get('/products',[\App\Http\Controllers\api\v1\admins\ProductController::class,'index'])->name('admin-products-manager');
        Route::post('/product-created',[\App\Http\Controllers\api\v1\admins\ProductController::class,'store'])->name('admin-product-created');
        Route::get('/auctions',[\App\Http\Controllers\api\v1\admins\AuctionController::class,'index'])->name('admin-auction-manager');
        Route::post('/auction-created',[\App\Http\Controllers\api\v1\admins\AuctionController::class,'store'])->name('admin-auction-created');
        Route::get('/product-auctions',[\App\Http\Controllers\api\v1\admins\ProductAuctionController::class,'index'])->name('admin-product-auction');
        Route::get('/product-auctions/{id}',[\App\Http\Controllers\api\v1\admins\ProductAuctionController::class,'show'])->name('admin-product-auction-show');
        Route::post('/product-auctions-created',[\App\Http\Controllers\api\v1\admins\ProductAuctionController::class,'store'])->name('admin-product-auction-created');

    });
    Route::group(['middleware' => ['auth:sanctum', 'IsBoth']], function() {
        Route::get('/category-manager',[\App\Http\Controllers\api\v1\admins\CategoryManagerController::class,'index'])->name('admin-categories-manager');
    });
    Route::post('/login',[\App\Http\Controllers\api\v1\admins\auth\AdminAuthController::class,'login'])->name('admin-login');
});

Route::prefix('customer')->group(function () {
    Route::post('/login',[\App\Http\Controllers\api\v1\users\auth\UserAuthController::class,'login'])->name('customer-login');
    Route::post('/register',[\App\Http\Controllers\api\v1\users\auth\UserAuthController::class,'register'])->name('customer-register');
    Route::group(['middleware' => ['auth:sanctum']], function() {
        Route::get('/product-auction-customer',[\App\Http\Controllers\api\v1\users\ProductAuctionController::class,'index'])->name('product-auction-customer');
        Route::post('/product-auction-customer-expired/{id}',[\App\Http\Controllers\api\v1\users\ProductAuctionController::class,'updateStatus'])->name('product-auction-customer-expired');
        Route::get('/product-detail/{id}',[\App\Http\Controllers\api\v1\users\ProductAuctionController::class,'show'])->name('product-detail-customer');
        Route::get('/product-detail/bids/{id}',[\App\Http\Controllers\api\v1\users\BidController::class,'index'])->name('product-detail-list-bid');
        Route::post('/product-detail/bids/{id}',[\App\Http\Controllers\api\v1\users\BidController::class,'store'])->name('product-detail-customer-bid');
        Route::post('/product-detail/win-bidding',[\App\Http\Controllers\api\v1\users\WinBiddingController::class,'store'])->name('product-detail-win-bidding');
        Route::get('/product-detail/cart',[\App\Http\Controllers\api\v1\users\WinBiddingController::class,'index'])->name('product-detail-cart');
    });
});

Route::prefix('shop')->group(function () {
    Route::post('/login',[\App\Http\Controllers\api\v1\admins\auth\AdminAuthController::class,'login'])->name('admin-login');
    Route::get('/user-manager',[\App\Http\Controllers\api\v1\admins\UserManagerController::class,'index'])->name('user-manager');
});


Route::get('/test',[\App\Http\Controllers\api\v1\admins\AuctionController::class,'test'])->name('test');
