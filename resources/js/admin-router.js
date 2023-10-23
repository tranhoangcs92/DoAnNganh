import {createRouter,createWebHistory} from "vue-router/dist/vue-router"


import AdminRouter from "./router/admin";


// const App = createApp(AdminApp).use(accountRouter).mount('#adminApp');

const routes = AdminRouter;

const router = createRouter({
    history:createWebHistory(),
    routes
})
router.beforeEach((to, from, next) => {
    if (to.matched.some(record => record.meta.admin)) {
        if (localStorage.getItem('admin_token') === null) {
            router.push('/admin/login')
        }
    }
    next()
})
export default router;
