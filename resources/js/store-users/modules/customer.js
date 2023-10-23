import {ApiCaller} from "../../api/api";
import {URLS} from "../../api/url";

export default {
    namespaced: true,
    getters: {
        customer: state => state.customer
    },
    state: {
        customer: {}
    },
    mutations: {

    },
    actions: {
        addCustomer({},payload) {
            return ApiCaller('customer').post(URLS.CUSTOMER_REGISTER(),payload)
        }
    }
}
