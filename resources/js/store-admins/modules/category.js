import {ApiCaller} from "../../api/api";
import {URLS} from "../../api/url";

export default {
    namespaced: true,
    getters: {
        categories: state => state.categories,
        show_dialog: state => state.show_dialog,
        is_edit: state => state.is_edit,
        category: state => state.category
    },
    state: {
        categories: [],
        category: {},
        show_dialog: false,
        is_edit: false
    },
    mutations: {
        SET_CATEGORIES(state, payload) {
            state.categories = payload
        },
        SET_CATEGORY(state, payload) {
            state.category = payload
        },
        CHANGE_STATUS_DIALOG(state, payload) {
            state.show_dialog = payload
        },
        CHANGE_STATUS_IS_EDIT(state, payload) {
            state.is_edit = payload
        }
    },
    actions: {
        async fetchCategories({commit}){
            const res = await ApiCaller('admin').get(URLS.ADMIN_CATEGORIES_SHOW())
            if(res.status === 200){
                commit('SET_CATEGORIES',res.data)
            }
        },
        createCategory({}, payload) {
            return ApiCaller('admin').post(URLS.ADMIN_CATEGORIES_CREATE(),payload)
        },
        updateCategory({}, payload) {
            return ApiCaller('admin').post(URLS.ADMIN_CATEGORIES_UPDATE(payload.id),payload)
        },
        destroyCategory({}, payload) {
            return ApiCaller('admin').delete(URLS.ADMIN_CATEGORIES_DELETE(payload))
        }

    }

}
