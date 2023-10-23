<template>
    <li>
        <button class="p-link layout-topbar-button">
            <i class="pi pi-cog"></i>
            <span>Cài đặt</span>
        </button>
    </li>
    <li>
        <button class="p-link layout-topbar-button">
            <i class="pi pi-user"></i>
            <span>Cá nhân</span>
        </button>
    </li>
    <li>
        <button class="p-link layout-topbar-button" @click="logout()">
            <i class="pi pi-sign-out"></i>
            <span>Đăng xuất</span>
        </button>
    </li>
</template>

<script>
import {mapActions, mapGetters} from "vuex";

export default {
    name: "_AdminTopbar",
    data() {
        return {
            secrets: [],
            editAdmin: {
                email: 'admin@ou.edu.vn',
                password: 'password'
            }
        }
    },
    // ...mapGetters({
    //     edit_admin: "login/edit_admin"
    // }),
    ...mapActions('login',['logoutAdmin']),
    created() {
    },
    methods: {
        logout() {
            localStorage.removeItem('admin_token')
            setTimeout(3000)
            if (localStorage.getItem('admin_token') === null ){
                this.$router.push('/admin/login')
            }
        },
        // logout_2() {
        //     axios.post('/api/admin/logout',this.editAdmin).then(response => {
        //         this.$router.push("/login")
        //         localStorage.removeItem('admin_token')
        //         if (localStorage.getItem('admin_token') === null ){
        //             this.$router.push('/admin/dashboard')
        //         }
        //
        //     }).catch(error => {
        //         // location.reload();
        //     });
        // }
    }
}
</script>

<style scoped>

</style>
