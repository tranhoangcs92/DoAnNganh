<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class WinBidding extends Model
{
    use HasFactory, HasApiTokens, Notifiable;

    protected $fillable = [
        'delivery_status',
        'id_bid',
        'id_payment',
        'id_user',
        'id_transport_admin'
    ];
}
