<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class Auction extends Model
{
    use HasFactory, HasApiTokens, Notifiable;

    protected $fillable = [
        'time_start',
        'time_end',
        'price_start',
        'id_admin',
        'created_at'
    ];
}
