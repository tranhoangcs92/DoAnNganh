<template>
    <div class="list-card grid p-fluid justify-content-center flex">
        <div v-for="p in product_auctions" class="card field col-12 md:col-4 ">
            <div class=" col-12 md:col-12">
                <div class="image8x">
                    <img :src="`/images/products/${p.image_product}`" class="product-image"/>
                </div>
            </div>
            <div class="field col-12 md:col-12 " style="text-align: center">
                <span>{{ formatLongString(p.name_product) }} </span>
            </div>
            <div class=" col-12 md:col-12 " style="text-align: center">
                <CountDown :date="new Date(p.time_end_product)" @onFinish="finish(p.id)"/>
            </div>
            <div class="field col-12 md:col-12 price-div">
                <p style="font-weight: bold; font-size: 18px">Giá: {{formatCurrency(p?.highest?.price, 'đ')}}</p>
            </div>
            <div class=" col-12 md:col-12  " style="text-align: center; ">
                <router-link :to="'/user/product/' + p.id">
                    <button class="button-28 border-gradient border-gradient-purple" role="button"><span
                        class="time-over">Đấu giá</span></button>
                </router-link>
            </div>
        </div>
    </div>
</template>

<script>
import {mapActions, mapGetters, mapMutations} from "vuex";
import {ComboboxLabel} from "@headlessui/vue";
import CountDown from "./CountDown.vue";
import {formatCurrency,formatLongString} from "../../../utils/format";

export default {
    name: "ListProductBids",
    components: {
        ComboboxLabel,
        CountDown
    },
    computed: {
        ...mapGetters({
            product_auctions: 'productAuction/product_auctions',
        }),
    },
    created() {
        this.fetchProductAuction()
    },
    methods: {
        ...mapMutations('productAuction', ['SET_PRODUCT_AUCTIONS', 'SPLICE_PRODUCT_AUCTION']),
        ...mapActions('productAuction', ['fetchProductAuction', 'updatedStatus']),
        finish(value) {
            this.updatedStatus(value).then(() => {
                this.SPLICE_PRODUCT_AUCTION(value)
            })
        },
        formatCurrency,
        formatLongString

    }
}
</script>

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,400;0,500;0,600;0,700;1,400;1,500;1,600&display=swap');

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

.list-card {
    margin-top: 100px;
}

div {
    font-family: 'Montserrat', sans-serif;
}

.price-div {
    top: 0;
    text-align: center;
}

.card {
    position: relative;
    width: 250px;
    height: 425px;
    background: #fff;
    border-radius: 20px;
    box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
    transition: 0.5s;
    margin: 30px 20px;
}

.card:hover {
    margin-top: -1px;
    transform: scaleX(1.02);
    transition: 0.5s;
    box-shadow: 0 40px 80px rgba(0.4, 0.4, 0.3, 0.35);
}

.border-gradient-purple {
    border-image-source: linear-gradient(90deg, #0162c8, #55e7fc);
}

.image8x {
    display: flex;
    justify-content: center;
    position: relative;
}

.image8x img {
    position: relative;
    top: 0;
    left: 0;
    width: 100%;
    object-fit: contain;
    max-width: 200px;
    height: 200px;
    background-size: cover;
}

.image8x span {
    position: absolute;
    display: flex;
    text-align: center;
}

.button-28 {
    width: 100%;
    padding: 10px 20px;
    background-color: transparent;
    border: 2px solid #636e72;
    color: #636e72;
    border-radius: 10px;
    box-sizing: border-box;
    cursor: pointer;
    margin-top: -20px;
    font-family: 'Montserrat', sans-serif;
    text-decoration: none;
    transition: all 200ms cubic-bezier(.23, 0.5, 0.32, 0.5);
    -webkit-user-select: none;
    touch-action: manipulation;
    justify-content: center;
}

.button-28:disabled {
    pointer-events: none;
}

.button-28:hover {
    color: #fff;
    background: linear-gradient(90deg, #2d3436, #636e72);
    opacity: 0.8;
    border: none;
    transition: 1.5s;
}

.button-28:active {
    box-shadow: none;
    transform: translateY(0);
}

</style>
