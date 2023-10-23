import {ApiCaller} from "../../api/api";
import {URLS} from "../../api/url";

export default {
    namespaced: true,
    getters: {
        edit_customer: state => state.edit_customer
    },
    state: {
       edit_customer: {}
    },
    mutations: {

    },
    actions: {
        loginCustomer({}, payload) {
            return ApiCaller().post(URLS.CUSTOMER_LOGIN(), payload)
        },
    },
}
