<template>
    <Dialog header="Chiến thắng" :visible="show_dialog" @update:visible="handleClose" :breakpoints="{'960px': '75vw', '640px': '90vw'}" :style="{width: '20vw'}" :modal="true" >
        <FiresWorks />
        <p class="p-winning">{{bids[0]?.user?.fullname}}</p>
    </Dialog>
</template>

<script>
import FiresWorks from "./FiresWorks.vue";
import {mapGetters, mapMutations} from "vuex";

export default {
    name: "WinningBid",
    components: {
      FiresWorks
    },
    computed: {
        ...mapGetters({
            show_dialog: 'bidModules/show_dialog',
            bids: 'bidModules/bids'
        })
    },
    methods: {
        ...mapMutations('bidModules', ['SET_SHOW_DIALOG']),
        handleClose() {
            this.SET_SHOW_DIALOG(false)
        },
    }
}
</script>

<style lang="scss" scoped>
@import url('https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,400;0,500;0,600;0,700;1,400;1,500;1,600&display=swap');
$particles: 50;
$width: 500;
$height: 500;

p {
    font-family: 'Montserrat', sans-serif;
}
.p-winning {
    text-align: center;
    font-size: 25px;
}
// Create the explosion...
$box-shadow: ();
$box-shadow2: ();
@for $i from 0 through $particles {
    $box-shadow: $box-shadow,
    random($width)-$width / 2 + px
    random($height)-$height / 1.2 + px,
    hsl(random(360), 100, 50);
    $box-shadow2: $box-shadow2, 0 0 #fff
}
@mixin keyframes ($animationName) {
    @-webkit-keyframes #{$animationName} {
        @content;
    }

    @-moz-keyframes #{$animationName} {
        @content;
    }

    @-o-keyframes #{$animationName} {
        @content;
    }

    @-ms-keyframes #{$animationName} {
        @content;
    }

    @keyframes #{$animationName} {
        @content;
    }
}

@mixin animation-delay ($settings) {
    -moz-animation-delay: $settings;
    -webkit-animation-delay: $settings;
    -o-animation-delay: $settings;
    -ms-animation-delay: $settings;
    animation-delay: $settings;
}

@mixin animation-duration ($settings) {
    -moz-animation-duration: $settings;
    -webkit-animation-duration: $settings;
    -o-animation-duration: $settings;
    -ms-animation-duration: $settings;
    animation-duration: $settings;
}

@mixin animation ($settings) {
    -moz-animation: $settings;
    -webkit-animation: $settings;
    -o-animation: $settings;
    -ms-animation: $settings;
    animation: $settings;
}

@mixin transform ($settings) {
    transform: $settings;
    -moz-transform: $settings;
    -webkit-transform: $settings;
    -o-transform: $settings;
    -ms-transform: $settings;
}


.pyro > .before, .pyro > .after {
    position: absolute;
    width: 5px;
    height: 5px;
    border-radius: 50%;
    box-shadow: $box-shadow2;
    @include animation((1s bang ease-out infinite backwards, 1s gravity ease-in infinite backwards, 5s position linear infinite backwards));
}

.pyro > .after {
    @include animation-delay((1.25s, 1.25s, 1.25s));
    @include animation-duration((1.25s, 1.25s, 6.25s));
}

@include keyframes(bang) {
    to {
        box-shadow:$box-shadow;
    }
}

@include keyframes(gravity)  {
    to {
        @include transform(translateY(200px));
        opacity: 0;
    }
}

@include keyframes(position) {
    0%, 19.9% {
        margin-top: 10%;
        margin-left: 40%;
    }
    20%, 39.9% {
        margin-top: 40%;
        margin-left: 30%;
    }
    40%, 59.9% {
        margin-top: 20%;
        margin-left: 70%
    }
    60%, 79.9% {
        margin-top: 30%;
        margin-left: 20%;
    }
    80%, 99.9% {
        margin-top: 30%;
        margin-left: 80%;
    }
}

</style>
