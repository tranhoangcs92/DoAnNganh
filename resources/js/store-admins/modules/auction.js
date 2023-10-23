import {ApiCaller} from "../../api/api";
import {URLS} from "../../api/url";

export default {
    namespaced: true,
    getters: {
        auctions: state => state.auctions,
        show_dialog: state => state.show_dialog,
        auction: state => state.auction
    },
    state: {
        auctions: [],
        auction: {
        },
        show_dialog: false
    },
    mutations: {
        SET_AUCTIONS(state, payload) {
            state.auctions = payload
        },
        SET_AUCTION(state, payload) {
            console.log(payload);
            state.auction = payload
        },
        CHANGE_STATUS_DIALOG_AUCTION(state, payload) {
            state.show_dialog = payload
        }
    },
    actions: {
        async fetchAuctions({commit}) {
            const res = await ApiCaller('admin').get(URLS.ADMIN_AUCTIONS_SHOW())
            if(res.status === 200){
                commit('SET_AUCTIONS',res.data)
            }
        },
        createAuction({}, payload) {
            return ApiCaller('admin').post(URLS.ADMIN_AUCTIONS_CREATED(), Object.assign({}, payload))
        }
    }
}
