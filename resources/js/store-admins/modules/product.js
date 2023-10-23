

import {ApiCaller} from "../../api/api";
import {URLS} from "../../api/url";

export default {
    namespaced: true,
    getters: {
        products: state => state.products,
        product: state => state.product,
        is_edit: state => state.is_edit,
        show_dialog: state => state.show_dialog
    },
    state: {
        products: [],
        product: {
            image : '',
            file: '',
        },
        is_edit: false,
        show_dialog: false
    },
    mutations: {
        SET_PRODUCTS(state, payload) {
            state.products = payload
        },
        SET_IMAGE_PRODUCT(state, payload) {
            state.product.image = payload
        },
        SET_FILE_PRODUCT(state, payload) {
            state.product.file = payload
        },
        SET_PRODUCT(state, payload) {
            state.product = payload
        },
        CHANGE_STATUS_IS_EDIT_PRODUCT(state, payload) {
            state.is_edit = payload
        },
        CHANGE_STATUS_DIALOG_PRODUCT(state, payload) {
            state.show_dialog = payload
        }
    },
    actions: {
        async fetchProducts({commit}) {
            const res = await ApiCaller('admin').get(URLS.ADMIN_PRODUCTS_GET())
            if(res.status === 200){
                commit('SET_PRODUCTS',res.data)
            }
        },
        createProduct({}, payload) {
            let formData = new FormData()
            if(typeof payload.file === "object"){
                formData.append("image", payload.file);
            }
            formData.append("name", payload.name);
            formData.append("price", payload.price);
            formData.append("id_category", payload.id_category);
            formData.append("id_admin", payload.id_admin);
            return ApiCaller('admin').post(URLS.ADMIN_PRODUCTS_CREATED(), formData)
        },

    }
}
