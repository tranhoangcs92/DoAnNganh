<template>
<div id="right"></div>
            <div class="surface-card p-4 shadow-2 border-round w-full lg:w-4 oks">
                <div class="text-center mb-5 " style="width: 100%">
                    <div class="text-900 text-3xl font-medium mb-3" style="padding-top:10px">Admin</div>
                </div>
                <div>
                    <label for="email1" class="block text-900 font-medium mb-2">Email</label>
                    <InputText id="email1" type="text" class="w-full mb-3" v-model="editAdmin.email" />

                    <label for="password1" class="block text-900 font-medium mb-2">Password</label>
                    <InputText id="password1" type="password" class="w-full mb-3" v-model="editAdmin.password"/>

                    <div class="flex align-items-center justify-content-between mb-6">
                    </div>
                    <Button label="Đăng nhập" class="w-full btn-login" @click="handleSubmit()"></Button>
                </div>
            </div>
</template>

<script>
import {mapActions, mapMutations} from "vuex";

export default {
    name: "Login",
    data(){
        return {
            editAdmin: {
                email: '',
                password: ''
            }
        }
    },
    created() {
        this.checkRedirectPage()
    },
    methods: {
        ...mapActions('login', ['loginAdmin']),
        ...mapMutations('login',['CHANGE_EDIT_ADMIN']),
        checkRedirectPage(){
            let token = localStorage.getItem('admin_token')
            token === null || token === '' ? this.$router.push(`/admin/login`) : this.$router.push(`/admin/dashboard`)
        },
        async handleSubmit() {
            const res = await this.loginAdmin(Object.assign({},  this.editAdmin))
            this.CHANGE_EDIT_ADMIN(this.editAdmin)
            if (res.data.status_code === 200){
                localStorage.setItem('admin_token', res.data.access_token)
                this.$router.push('/admin/dashboard')
            }
            else {
                this.$toast.add({severity:'error', summary: 'Unauthorized', detail:'Lỗi đăng nhập', life: 3000});
            }
        }
    }
}
</script>

<style scoped>
    .oks{
        position: absolute;
        left: 50%;
        top: 50%;
        transform: translate(-50%, -50%);
    }
    img {
        display: flex;
        max-width:230px;
        max-height:95px;
        justify-content: center;
        align-items: center;
        height: 100%;
        margin: 0 auto;
    }
    .btn-login{
        display: flex;
        height: 50px;
        margin:0 auto;
        border-radius: 40px;
        width: 40%;
    }
</style>
