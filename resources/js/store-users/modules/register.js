import {ApiCaller} from "../../api/api.js";
import {URLS} from "../../api/url.js";

export default {
    namespaced: true,
    getters: {
        customer: state => state.customer
    },
    state: {
        customer: {}
    },
    mutations: {
        CHANGE_CUSTOMER(state, payload) {
            state.customer = payload
        }
    },
    actions: {
        register({}, payload) {
            return ApiCaller('customer').post(URLS.CUSTOMER_REGISTER(),payload)
        }
    }
}
