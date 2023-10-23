import pusher from "./pusher";

function channel(chan, event) {
    var channel = pusher.subscribe(chan);
    channel.bind(event, function(data) {

    })
}

