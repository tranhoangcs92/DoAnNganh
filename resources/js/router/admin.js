import AdminLogin from '../pages/admins/Login.vue'
import AdminDashboard from '../pages/admins/dashboards/Index.vue'
import AdminCustomers from '../pages/admins/customers/Index.vue'
import AdminProducts from '../pages/admins/products/Index.vue'
import AdminCategories from '../pages/admins/categories/Index.vue'
import AdminAuctions from '../pages/admins/Auctions/Index.vue'

const routes = [
    {
        path: '/admin/login',
        name: 'AdminLogin',
        component: AdminLogin,
        meta: {
            layout: 'blank',
            admin: false
        }
    },
    {
        path: '/admin/dashboard',
        name: 'AdminDashboard',
        component: AdminDashboard,
        meta: {
            layout: 'admin',
            admin: true
        }
    },
    {
        path: '/admin/customers',
        name: 'AdminCustomers',
        component: AdminCustomers,
        meta: {
            layout: 'admin',
            admin: true
        }
    },
    {
        path: '/admin/products',
        name: 'AdminProducts',
        component: AdminProducts,
        meta: {
            layout: 'admin',
            admin: true
        }
    },
    {
        path: '/admin/categories',
        name: 'AdminCategories',
        component: AdminCategories,
        meta: {
            layout: 'admin',
            admin: true
        }
    },
    {
        path: '/admin/auctions',
        name: 'AdminAuctions',
        component: AdminAuctions,
        meta: {
            layout: 'admin',
            admin: true
        }
    }

]

export default routes;
