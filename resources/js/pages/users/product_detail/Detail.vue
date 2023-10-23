<template>
    <div style="margin-top: 40px">
        <div class = "main-wrapper">
            <div class = "container">
                <div class = "product-div">
                    <div class="product-info">
                        <div class = "product-div-left">
                            <div class = "img-container">
                                <img :src="`/images/products/${product_auction.image_product}`" class="product-image" />
                            </div>
                        </div>
                        <div class = "product-div-right">
                            <span class = "product-name">{{product_auction.name_product}}</span>
<!--                            <span class = "product-price" >Giá cao nhất: {{bids}}  đ</span>-->
                            <p class = "product-description">Giá khởi điểm: {{ product_auction.price}} đ</p>
                            <p class = "product-description">Sản phẩm {{product_auction.name_product}}</p>
                            <CountDown :date="new Date(product_auction.time_end_product)"  @onFinish="finish(product_auction.id_auction)" style="margin-top:30px;"/>
                            <div class = "btn-groups">
                                <InputNumber v-model="bid.price" currency="VND" placeholder="VND"></InputNumber>
                            </div>
                            <div class = "btn-groups">
                                <button class = "buy-now-btn" @click="onSubmit()"><i class = "fas fa-wallet" ></i>Đặt giá</button>
                            </div>
                        </div>

                    </div>
                    <div  class="flex product-table">
                        <BiddingTable class="table" />
                    </div>
                </div>
                <WinningBid />
            </div>
        </div>
    </div>

</template>

<script>
import CountDown from "../bids/CountDown.vue";
import BiddingTable from "./BiddingTable.vue";
import WinningBid from "./WinningBid.vue";
import {mapActions, mapGetters, mapMutations} from "vuex";
var pusher = new Pusher('20331727049a5850fa61', {
    cluster: 'ap1'
});

export default {
    name: "Detail",
    components: {
        CountDown,
        BiddingTable,
        WinningBid
    },

    computed: {
        ...mapGetters({
            product_auction: 'productAuction/product_auction',
            bid: 'bidModules/bid',
            bids: 'bidModules/bids',
        }),
    },
    created() {
        this.fetchProductDetail(this.$route.params.id)
        this.SET_BID({})
    },
    methods: {
        ...mapActions('productAuction', ['fetchProductDetail', 'fetchProductAuction']),
        ...mapActions('bidModules',['addBid','fetchBids','addWinner']),
        ...mapMutations('productAuction', ['SET_PRODUCT_AUCTION']),
        ...mapMutations('bidModules', ['SET_BID','SET_BIDS','SET_BID_ID_PRODUCT_AUCTION', 'SET_PRICE_START_AUCTION', 'SET_SHOW_DIALOG']),
        finish() {
            this.SET_SHOW_DIALOG(true)
            this.fetchProductAuction()
            this.addWinner(this.bids[0])
            console.log('finish');

        },
         async onSubmit() {
            this.SET_BID_ID_PRODUCT_AUCTION(this.$route.params.id)  // set id_product_auction vào request
             const res = await this.addBid(this.bid)
                 if (res.status === 200) {
                     this.$toast.add({severity:'success', summary: 'Thành công', detail: res.data.message, life: 3000});
                     console.log(this.$route.params.id)
                     this.fetchBids(this.$route.params.id)
                 }
            else {
                this.$toast.add({severity:'error', summary: 'Thất bại', detail: res.response.data.message, life: 3000});
            }
        },
    }
}
</script>

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,400;0,500;0,600;0,700;1,400;1,500;1,600&display=swap');

*{
    padding: 0;
    margin: 0;
    box-sizing: border-box;
}
span{
    font-family: 'Montserrat', sans-serif;
}
img{
    width: 100%;
    display: block;
}
.main-wrapper{

    min-height: 100vh;
    background-color: #f1f1f1;
    display: flex;
    align-items: center;
    justify-content: center;
}
.container{
    min-width: 1200px;
    padding: 0 1rem;
    margin: 0 auto;
}
.product-div{
    width:100%  ;
    padding: 150px 0;
    display: flex;
    flex-direction: column;
    background-color: #fff;
    border-radius: 3px;
    column-gap: 10px;
}
.product-info{
    display:flex;
    width: 100%;
}
.product-div-left{
    width: 60%;
}
.product-div-right{
    width: 40%;
}
.product-table{
    margin-top: 25px;
    width: 100%;
}
.table{
    width: 90%;
    margin: 0 auto;
}

.img-container img{
    width: 200px;
    margin: 0 auto;
}
.hover-container{
    display: flex;
    flex-wrap: wrap;
    align-items: center;
    justify-content: center;
    margin-top: 32px;
}
.hover-container div{
    border: 2px solid rgba(252, 160, 175, 0.7);
    padding: 1rem;
    border-radius: 3px;
    margin: 0 4px 8px 4px;
    display: flex;
    align-items: center;
    justify-content: center;
}
.active{
    border-color: rgb(255, 145, 163)!important;
}
.hover-container div:hover{
    border-color: rgb(255, 145, 163);
}
.hover-container div img{
    width: 50px;
    cursor: pointer;
}
.product-div-right span{
    display: block;
}
.product-name{
    font-size: 26px;
    margin-bottom: 22px;
    font-weight: 700;
    letter-spacing: 1px;
    opacity: 0.9;
}
.product-price{
    font-weight: 700;
    font-size: 24px;
    opacity: 0.9;
    font-weight: 500;
}
.product-rating{
    display: flex;
    align-items: center;
    margin-top: 12px;
}
.product-rating span{
    margin-right: 6px;
}
.product-description{
    font-family: 'Montserrat', sans-serif;
    line-height: 1.6;
    font-weight: 300;
    opacity: 0.9;
    margin-top: 22px;
}
.btn-groups{
    margin-top: 22px;
    font-family: 'Montserrat', sans-serif;
}
.btn-groups button{
    display: inline-block;
    font-size: 16px;

    text-transform: uppercase;
    padding: 15px 16px;
    color: #fff;
    cursor: pointer;
    transition: all 0.3s ease;
}
.btn-groups button .fas{
    margin-right: 8px;
}
.add-cart-btn{
    background-color: #FF9F00;
    border: 2px solid #FF9F00;
    margin-right: 8px;
}
.add-cart-btn:hover{
    background-color: #fff;
    color: #FF9F00;
}
.buy-now-btn{
    background-color: #000;
    border: 2px solid #000;
}
.buy-now-btn:hover{
    background-color: #fff;
    color: #000;
}

@media screen and (max-width: 992px){
    .product-div{
        grid-template-columns: 100%;
    }
    .product-div-right{
        text-align: center;
    }
    .product-rating{
        justify-content: center;
    }
    .product-description{
        font-family: 'Montserrat', sans-serif;
        max-width: 400px;
        margin-right: auto;
        margin-left: auto;
    }
}

@media screen and (max-width: 400px){
    .container{
        min-width: 400px;

    }
    .product-info{
        flex-direction: column;
    }
    .product-div-left{
        width: 100%;
    }
    .product-div-right{
        width: 100%;
    }

    .btn-groups{
        margin-top: 22px;
        font-family: 'Montserrat', sans-serif;
    }
    .btn-groups button{
        width: 90%;
    }

}
</style>
