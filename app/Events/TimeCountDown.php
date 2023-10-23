<?php

namespace App\Events;

use App\Enums\StatusRole;
use App\Models\ProductAuction;
use Carbon\Carbon;
use Illuminate\Broadcasting\Channel;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Broadcasting\PresenceChannel;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;
use App\Http\Controllers\api\v1\users\ProductAuctionController;

class TimeCountDown implements ShouldBroadcast
{
    use Dispatchable, InteractsWithSockets, SerializesModels;

    /**
     * Create a new event instance.
     *
     * @return void
     */
    public $message;
    public function __construct($message)
    {
        $this->message = ProductAuction::all();
        $this->updateStatusProductAuction();
    }
    public function updateStatusProductAuction() {

        $date_now = Carbon::now();
        foreach ( $this->message as $p ) {
            $time_end = Carbon::parse($p->time_end);
            $time_start = Carbon::parse($p->time_start);
            if($date_now > $time_end)
                ProductAuction::where('id',$p->id)->update(array('status' => StatusRole::HET_DIEN_RA));
            else if($time_start < $date_now && $date_now < $time_end)
                ProductAuction::where('id',$p->id)->update(array('status' => StatusRole::DANG_DIEN_RA));
        }
    }
    /**
     * Get the channels the event should broadcast on.
     *
     * @return \Illuminate\Broadcasting\Channel|array
     */
    public function broadcastOn()
    {
        return ['my-channel'];
    }
    public function broadcastAs()
    {
        return 'my-event';
    }
}
