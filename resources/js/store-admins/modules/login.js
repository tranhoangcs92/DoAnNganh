import {ApiCaller} from "../../api/api";
import {URLS} from "../../api/url";

export default {
    namespaced: true,
    getters: {
        // edit_admin: state => state.edit_admin,
        edit_admin:  state => `${state.edit_admin} `
    },
    state: {
        edit_admin : {}
    },
    mutations: {
        CHANGE_EDIT_ADMIN(state, payload){
            state.edit_admin = payload
        },
    },
    actions: {
        loginAdmin({}, payload) {
            return ApiCaller().post(URLS.ADMIN_LOGIN(), payload)
        },
        logoutAdmin({}) {
            return ApiCaller().post(URLS.AMIN_LOGOUT())
        }
    },

}
