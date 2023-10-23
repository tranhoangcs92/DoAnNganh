<template>
    <div class="surface-200 flex align-items-center justify-content-center min-h-screen min-w-screen overflow-hidden" style="">
        <div class="grid justify-content-center p-2 lg:p-0" style="min-width:80%">
            <div class="col-12 xl:col-6" style="border-radius:56px; padding:0.3rem; background: linear-gradient(180deg, var(--primary-color), rgba(33, 150, 243, 0) 30%);">
                <div class="h-full w-full m-0 py-7 px-4" style="border-radius:53px; background: linear-gradient(180deg, var(--surface-50) 38.9%, var(--surface-0));">
                    <div class="text-center mb-5">
                        <img src="../../../images/logo-bid.png" alt="Image" height="50" class="mb-3">
                        <div class="text-900 text-3xl font-medium mb-3">Đăng nhập</div>
                    </div>
                    <div class="w-full md:w-10 mx-auto">
                        <label for="email" class="block text-900 text-100 font-medium">Email</label>
                        <InputText id="email" v-model="editCustomer.email" type="text" class="w-full mb-3" placeholder="Email" style="padding:1rem;"  />

                        <label for="password" class="block text-900 font-medium text-xl mb-2">Mật khẩu</label>
                        <Password id="password" :feedback="false" v-model="editCustomer.password" placeholder="Mật khẩu" :toggleMask="true" class="w-full mb-3" inputClass="w-full" inputStyle="padding:1rem" ></Password>

                        <div class="flex align-items-center justify-content-between mb-5">
<!--                            <a class="font-medium no-underline ml-2 text-right cursor-pointer" style="color: var(&#45;&#45;primary-color)">Quên mật khẩu ?</a>-->
                            <router-link to="/user/register" class="font-medium no-underline ml-2 text-right cursor-pointer">Chưa có tài khoản ?</router-link>
                        </div>
                        <Button label="Đăng nhập" class="w-full p-3 text-xl" @click="handleSubmit()"></button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import {mapActions} from "vuex";

export default {
    name: "AdminLayout",
    data() {
        return {
            editCustomer: {
                email: '',
                password: ''

            }
        }
    },
    created() {
        this.checkRedirectPage()
    },
    methods: {
        ...mapActions('login', ['loginCustomer']),
        checkRedirectPage(){
            let token = localStorage.getItem('customer_token')
            token === null || token === '' ? this.$router.push(`/user/login`) : this.$router.push(`/user/home`)
        },
        async handleSubmit() {
            const res = await this.loginCustomer(Object.assign({},  this.editCustomer))
            if (res.data.status_code === 200){
                localStorage.setItem('customer_token', res.data.access_token)
                this.$router.push('/user/home')
            }
            else {
                // this.$toast.add({severity:'error', summary: 'Unauthorized', detail:'Lỗi đăng nhập', life: 3000});
            }
        }

    }
}
</script>

<style scoped>
.pi-eye {
    transform:scale(1.6);
    margin-right: 1rem;
}

.pi-eye-slash {
    transform:scale(1.6);
    margin-right: 1rem;
}
</style>
