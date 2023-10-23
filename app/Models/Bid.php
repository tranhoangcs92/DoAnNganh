<?php

namespace App\Models;

use App\Events\Bidding;
use App\Events\BidSaved;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class Bid extends Model
{
    use HasFactory, HasApiTokens, Notifiable;

    protected $table = 'bids';
    protected $primaryKey = 'id';

    protected $connection = "mysql";
    protected $fillable = [
        'price',
        'date',
        'id_user',
        'id_product_auction'
    ];
    public function user()
    {
        return $this->belongsTo(User::class,'id_user');
    }
    public function producAuction()
    {
        return $this->belongsTo(ProductAuction::class,'id_product_auction');
    }
    public function bidsAuctionProduct()
    {
        return $this->hasOneThrough(
            Product::class,
            ProductAuction::class,
            'id_product_auction', // Khóa ngoại của bảng trung gian user
            'id_product', // Khóa ngoại của bảng chúng ta muốn truy cập đến
            'id', // Khóa mà chúng ta muốn liên kết ở bảng supplier
            'id' // Khóa mà chúng ta muốn liên kết ở bảng user
        );
    }
}
