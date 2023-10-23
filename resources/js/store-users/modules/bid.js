import {ApiCaller} from "../../api/api";
import {URLS} from "../../api/url";
import router from "../../user-router";

var pusher = new Pusher('20331727049a5850fa61', {
    cluster: 'ap1'
});
var channel = pusher.subscribe('bidding-channel');
export default {
    namespaced: true,
    getters: {
        bids: state => state.bids,
        bid: state => state.bid,
        show_dialog: state => state.show_dialog,
        winner: state => state.winner
    },
    state: {
        bids: [],
        bid: {
            id_product_auction: '',
        },
        show_dialog: false,
    },
    mutations: {
        SET_BIDS(state, payload) {
            state.bids = payload
        },
        SET_BID(state, payload) {
            state.bid = payload
        },
        SET_BID_ID_PRODUCT_AUCTION(state, payload) {
            state.bid.id_product_auction = payload
        },
        SET_SHOW_DIALOG(state, payload) {
            state.show_dialog = payload
        },
    },
    actions: {
        async fetchBids({commit, dispatch}, id) {
            const res = await ApiCaller('customer').get(URLS.CUSTOMER_PRODUCT_LIST_BIDDING(id))
            if(res.status === 200){
                commit('SET_BIDS', res.data)
                Pusher.logToConsole = true;
                channel.bind('bidding-event', function(data) {
                    dispatch('productAuction/fetchProductAuction', '', {root: true})
                    if(parseInt(data.message[0]?.id_product_auction) === parseInt(router.currentRoute._value.params.id)) {
                        commit('SET_BIDS', data.message)
                    }
                    else {
                        channel.unbind()
                    }
                })
            }
        },
        addBid({}, payload) {
            return ApiCaller('customer').post(URLS.CUSTOMER_PRODUCT_DETAIL_BIDDING(payload.id_product_auction), payload)
        },
        addWinner({}, payload) {
            return ApiCaller('customer').post(URLS.CUSTOMER_PRODUCT_WINNER(), payload)
        }
    }
}
