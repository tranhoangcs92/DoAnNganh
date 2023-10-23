<template>
    <div class="form-demo " >
        <div class="flex justify-content-center">
            <div class="card">
                <h5 class="text-center">Đăng ký</h5>
                <div class="p-fluid">
<!--                    First name-->
                    <div class="field">
                        <div class="p-float-label">
                            <InputText id="firstname" v-model="customer.firstname" :class="{'p-invalid':v$.name.$invalid && submitted}" />
                            <label for="firstname" :class="{'p-error':v$.name.$invalid && submitted}">Họ</label>
                        </div>
                        <small v-if="(v$.name.$invalid && submitted) || v$.name.$pending.$response" class="p-error">{{v$.name.required.$message.replace('Value', 'Name')}}</small>
                    </div>
<!--                    Last name-->
                    <div class="field">
                        <div class="p-float-label">
                            <InputText id="lastname" v-model="customer.lastname" :class="{'p-invalid':v$.name.$invalid && submitted}" />
                            <label for="lastname" :class="{'p-error':v$.name.$invalid && submitted}">Tên</label>
                        </div>
                        <small v-if="(v$.name.$invalid && submitted) || v$.name.$pending.$response" class="p-error">{{v$.name.required.$message.replace('Value', 'Name')}}</small>
                    </div>
<!--                    Birthday-->
                    <div class="field">
                        <div class="p-float-label">
                            <Calendar id="date" :showIcon="true" v-model="customer.birthday" />
                            <label for="date">Năm sinh</label>
                        </div>
                    </div>
<!--                    Phone-->
                    <div class="field">
                        <div class="p-float-label">
                            <InputText id="phone" v-model="customer.phone" :class="{'p-invalid':v$.name.$invalid && submitted}" />
                            <label for="phone" :class="{'p-error':v$.name.$invalid && submitted}">Số điện thoại</label>
                        </div>
                        <small v-if="(v$.name.$invalid && submitted) || v$.name.$pending.$response" class="p-error">{{v$.name.required.$message.replace('Value', 'Name')}}</small>
                    </div>

                    <div class="field">
                        <div class="p-float-label">
                            <InputText id="address" v-model="customer.address" :class="{'p-invalid':v$.name.$invalid && submitted}" />
                            <label for="address" :class="{'p-error':v$.name.$invalid && submitted}">Địa chỉ</label>
                        </div>
                        <small v-if="(v$.name.$invalid && submitted) || v$.name.$pending.$response" class="p-error">{{v$.name.required.$message.replace('Value', 'Name')}}</small>
                    </div>
<!--                    Email-->
                    <div class="field">
                        <div class="p-float-label p-input-icon-right">
                            <i class="pi pi-envelope" />
                            <InputText id="email" v-model="customer.email" :class="{'p-invalid':v$.email.$invalid && submitted}" aria-describedby="email-error"/>
                            <label for="email" :class="{'p-error':v$.email.$invalid && submitted}">Email*</label>
                        </div>
                        <span v-if="v$.email.$error && submitted">
                            <span id="email-error" v-for="(error, index) of v$.email.$errors" :key="index">
                            <small class="p-error">{{error.$message}}</small>
                            </span>
                        </span>
                    </div>
                    <div class="field">
                        <div class="p-float-label">
                            <Password id="password" v-model="customer.password" :class="{'p-invalid':v$.password.$invalid && submitted}" toggleMask>
                                <template #header>
                                    <h6>Độ mạnh</h6>
                                </template>
                                <template #footer="sp">
                                    {{sp.level}}
                                    <Divider />
                                    <p class="mt-2">Đề nghị</p>
                                    <ul class="pl-2 ml-2 mt-0" style="line-height: 1.5">
                                        <li>Ít nhất có 1 kí tự thường</li>
                                        <li>Ít nhất có 1 kí tự hoa</li>
                                        <li>Ít nhất có 1 chữ số</li>
                                        <li>Mật khẩu phải độ dài ít nhất 8</li>
                                    </ul>
                                </template>
                            </Password>
                            <label for="password" :class="{'p-error':v$.password.$invalid && submitted}">Mật khẩu</label>
                        </div>
                        <small v-if="(v$.password.$invalid && submitted) || v$.password.$pending.$response" class="p-error">{{v$.password.required.$message.replace('Value', 'Password')}}</small>
                    </div>
                    <div class="field">
                        <router-link to="/user/login" class="font-medium no-underline ml-2 text-right cursor-pointer">Đã có tài khoản ?</router-link>
                        <Button type="submit" label="Tạo tài khoản" class="mt-2" @click="onSubmit()" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import { email, required } from "@vuelidate/validators";
import { useVuelidate } from "@vuelidate/core";
import {mapActions, mapGetters, mapMutations} from "vuex";

export default {
    setup: () => ({ v$: useVuelidate() }),
    data() {
        return {
            name: '',
            email: '',
            password: '',
            phone: '',
            date: null,
            country: null,
            accept: null,
            submitted: false,
            countries: null,
            showMessage: false
        }
    },
    countryService: null,
    validations() {
        return {
            name: {
                required
            },
            email: {
                required,
                email
            },
            password: {
                required
            },
            accept: {
                required
            }
        }
    },
    computed: {
        ...mapGetters({
            customer: 'register/customer'
        })
    },
    methods: {
        ...mapMutations('register',['CHANGE_CUSTOMER']),
        ...mapActions('register',['register']),
        handleSubmit(isFormValid) {
            this.submitted = true;

            if (!isFormValid) {
                return;
            }

            this.toggleDialog();
        },
        toggleDialog() {
            this.showMessage = !this.showMessage;

            if(!this.showMessage) {
                this.resetForm();
            }
        },
        resetForm() {
            this.name = '';
            this.email = '';
            this.password = '';
            this.date = null;
            this.accept = null;
            this.submitted = false;
        },
        async onSubmit() {
            const res = await this.register(this.customer)
            this.CHANGE_CUSTOMER(this.customer)
            if(res.status === 200) {
                this.$router.push('/user/login')
                this.CHANGE_CUSTOMER({})
            }
        }
    }
}
</script>

<style lang="scss" scoped>
.form-demo {
    .card {
        min-width: 450px;

        form {
            margin-top: 2rem;
        }

        .field {
            margin-bottom: 1.5rem;
        }
    }

    @media screen and (max-width: 960px) {
        .card {
            width: 80%;
        }
    }
}

</style>
