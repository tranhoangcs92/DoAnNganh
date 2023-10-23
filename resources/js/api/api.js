import axios from "axios";
import {ADMIN_TOKEN, CUSTOMER_TOKEN, SHOP_TOKEN} from "./constant";
import router from "../admin-router";

export const ApiCaller = (requestType = false) => {
    let token = '';
    if (requestType === 'admin'){
        token = localStorage.getItem(ADMIN_TOKEN)
    }
    else if(requestType === 'customer'){
        token = localStorage.getItem(CUSTOMER_TOKEN)
    }
    else if(requestType === 'shop'){
        token = localStorage.getItem(SHOP_TOKEN)
    }
    const  headers = {
        'Authorization': `Bearer ${token}`
    }
    const instance = axios.create({
        headers: Object.assign(headers),
        timeout: 500000
    })
    instance.interceptors.response.use((response) => {
        return response
    }, (error => {
        if (error.response) {
            if (error.response.status === 401) {
                localStorage.removeItem(ADMIN_TOKEN)
                localStorage.removeItem(CUSTOMER_TOKEN)
                localStorage.removeItem(SHOP_TOKEN)
                router.push('/admin/login')
            }
        }
        return error
    }))
    return instance
}
