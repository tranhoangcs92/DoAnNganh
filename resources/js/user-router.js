import {createRouter,createWebHistory} from "vue-router/dist/vue-router"
import UserRouters from './router/user'


const routes = UserRouters


const router = createRouter({
    history:createWebHistory(),
    routes
})
router.beforeEach((to, from, next) => {
    if (to.matched.some(record => record.meta.user)) {
        if (localStorage.getItem('customer_token') ===   null) {
            router.push('/user/login')
        }
    }
    next()
})
export default router
