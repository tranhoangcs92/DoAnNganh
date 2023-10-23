<template>
    <div class="countdown">
        <div v-if="days" class="countdown__block">
            <div class="countdown__digit">{{ days }}</div>
        </div>
        <div class="countdown__block">
            <div class="countdown__digit">{{ hours }}</div>
        </div>
        <div class="countdown__block">
            <div class="countdown__digit">{{ minutes }}</div>
        </div>
        <div class="countdown__block">
            <div class="countdown__digit">{{ seconds }}</div>
        </div>
    </div>
</template>
<script>

export default {
    props: {
        date: null
    },
    data () {
        return {
            now: Math.trunc((new Date()).getTime() / 1000),
            event: this.date,
            finish: false
        }
    },
    created() {
        const _self = this
        window.setInterval(() => {
            this.now = Math.trunc((new Date()).getTime() / 1000)
            if (!this.finish && this.calculatedDate - this.now <= 0) {
                _self.finish = true
                _self.$emit('onFinish')
            }
        }, 1000)
    },
    watch: {
      date(newValue) {
          this.event = newValue
      }
    },
    computed: {

        secondCount () {
            return this.calculatedDate - this.now
        },
        calculatedDate () {
            return Math.trunc(Date.parse(this.event) / 1000)
        },
        seconds () {
            if (this.secondCount < 0) return 0
            return this.secondCount % 60
        },
        minutes () {
            if (this.secondCount < 0) return 0
            return Math.trunc(this.secondCount / 60) % 60
        },
        hours () {
            if (this.secondCount < 0) return 0
            return Math.trunc(this.secondCount / 60 / 60) % 24
        },
        days () {
            if (this.secondCount < 0) return 0
            return Math.trunc(this.secondCount / 60 / 60 / 24)
        }
    },
}
</script>
<style lang="scss">
.countdown{
    display: flex;
    justify-content: center;
    &__block {
        text-align: center;
        padding: 0px 15px;
        position: relative;
        &:first-child{
            padding-left: 0;
            .countdown__digit{
                &:before{
                    display: none;
                }
            }
        }
        &:last-child{
            padding-right: 0;
        }
    }
    &__text {
        text-transform: uppercase;
        margin-bottom: 5px;
    }
    &__digit {
        font-size: 120%;
        font-weight: bold;
        line-height: 1;
        font-family: 'Montserrat', sans-serif;
        margin-bottom: 5px;
        &:before{
            content: ":";
            position: absolute;
            left: -5px;
        }
    }
}
</style>
