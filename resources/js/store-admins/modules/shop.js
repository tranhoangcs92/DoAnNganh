import {ApiCaller} from "../../api/api";
import {URLS} from "../../api/url";

export default {
    namespaced: true,
    getters: {
        shop: state => state.shop,
        shops: state => state.shops
    },
    state: {
        shops: [],
        shop: {}
    },
    mutations: {
        SET_SHOPS(state, payload) {
            state.shops = payload
        }
    },
    actions: {
        async fetchShops({commit}) {
            const res = await ApiCaller('admin').get(URLS.ADMIN_SHOPS_GET())
            if(res.status === 200){
                commit('SET_SHOPS',res.data)
            }
        },
    }
}
