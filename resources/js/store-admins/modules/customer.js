import {ApiCaller} from "../../api/api";
import {URLS} from "../../api/url";

export default {
    namespaced: true,
    getters: {
        customer: state => state.customer,
        show_dialog: state => state.show_dialog,
        customers: state => state.customers,
        is_edit: state => state.is_edit
    },
    state: {
        customers: [],
        customer: {},
        show_dialog: false,
        is_edit: false
    },
    mutations: {
        CHANGE_STATUS_DIALOG(state, payload) {
            state.show_dialog = payload
        },
        SET_CUSTOMERS(state, payload) {
            state.customers = payload
        },
        SET_CUSTOMER(state, payload) {
            state.customer = payload
        },
        CHANGE_STATUS_IS_EDIT(state, payload) {
            state.is_edit = payload
        }
    },
    actions: {
        async fetchCustomers({commit}){
            const res = await ApiCaller('admin').get(URLS.ADMIN_CUSTOMERS())
            if(res.status === 200){
                commit('SET_CUSTOMERS', res.data)
            }
        },
        createdCustomer({}, payload){
            return ApiCaller('admin').post(URLS.ADMIN_CUSTOMERS_CREATE(), payload)
        },
        deletedCustomer({}, payload){
            return ApiCaller('admin').delete(URLS.ADMIN_CUSTOMERS_DELETE(payload) )
        },
        updatedCustomer({}, payload){
            return ApiCaller('admin').post(URLS.ADMIN_CUSTOMERS_UPDATE(payload.id), payload)
        }
    },
}
