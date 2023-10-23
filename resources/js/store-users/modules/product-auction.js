import {ApiCaller} from "../../api/api";
import {URLS} from "../../api/url";

var pusher = new Pusher('20331727049a5850fa61', {
    cluster: 'ap1'
});
var channel = pusher.subscribe('product-auction-realtime');
var list_product_auciton_channel = pusher.subscribe('list-product-auction-channel');

export default {
    namespaced: true,
    getters: {
        product_auctions: state => state.product_auctions,
        product_auction: state => state.product_auction,
    },
    state: {
        product_auctions: [],
        product_auction: {}
    },
    mutations: {
        SET_PRODUCT_AUCTIONS(state, payload) {
            state.product_auctions = payload
        },
        SET_PRODUCT_AUCTION(state, payload) {
            state.product_auction = payload
        },
        SPLICE_PRODUCT_AUCTION(state, payload) {
            state.product_auctions.map( (item,index)=>{
                payload===item.id && state.product_auctions.splice(index, 1)
            }) ;
            console.log(state.product_auctions)
        }
    },
    actions: {
        async fetchProductAuction({commit}) {
            const res = await ApiCaller('customer').get(URLS.CUSTOMER_PRODUCT_AUCTION())
            if(res.status === 200){
                commit('SET_PRODUCT_AUCTIONS', res.data)
                channel.bind('event-product-auction', function(data) {
                    commit('SET_PRODUCT_AUCTIONS', data.list)
                })
                list_product_auciton_channel.bind('list-product-auction-event', function(data) {
                    commit('SET_PRODUCT_AUCTIONS', data.message)
                })
            }
        },
        async fetchProductDetail({commit},id) {
            const res = await ApiCaller('customer').get(URLS.CUSTOMER_PRODUCT_DETAIL(id))
            if(res.status === 200){
                commit('SET_PRODUCT_AUCTION', res.data)
            }
        },
        updatedStatus({}, payload){
            return ApiCaller('customer').post(URLS.CUSTOMER_PRODUCT_AUCTION_EXPIRED(payload), payload)
        }
    }
}
