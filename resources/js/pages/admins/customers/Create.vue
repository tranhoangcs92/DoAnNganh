<template>
    <Dialog :visible="show_dialog" :modal="true" @update:visible="handleClose" class="md:col-6"   >
        <div class="grid p-fluid">
            <!--            Fisrt name-->
            <div class="col-12 md:col-6">
                <div class="p-inputgroup">
                <span class="p-inputgroup-addon">
                    <i class="pi pi-user"></i>
                </span>
                    <InputText placeholder="Họ" v-model="customer.firstname" />
                </div>
            </div>
            <!--            Last name-->
            <div class="col-12 md:col-6">
                <div class="p-inputgroup">
                    <span class="p-inputgroup-addon">
                        <i class="pi pi-user" ></i>
                    </span>
                    <InputText placeholder="Tên" />
                </div>
            </div>
            <!--            Birthday-->
            <div class="col-12 md:col-1 flex align-items-center justify-content-center ui-widget">
                <span>Ngày sinh</span>
            </div>
            <div class="col-12 md:col-5">
                <div class="p-inputgroup">
                    <Calendar v-model="customer.birthday" :showButtonBar="true" />
                    <i class="pi pi-calendar p-button p-component p-button-icon-only p-datepicker-trigger"> </i>
                </div>
            </div>
            <!--            Sex-->
            <div class="col-12 md:col-2 flex align-items-center justify-content-start ui-widget">
                <RadioButton name="sex" value="Male" v-model="customer.sex" class="mr-2" />
                <label>Nam</label>
            </div>
            <div class="col-12 md:col-2 flex align-items-center justify-content-start ui-widget">
                <RadioButton name="sex" value="Female" v-model="customer.sex" class="mr-2"/>
                <label>Nữ</label>
            </div>
            <div class="col-12 md:col-2 flex align-items-center justify-content-start ui-widget">
                <RadioButton name="sex" value="LGBT" v-model="customer.sex" class="mr-2"/>
                <label>Khác</label>
            </div>
            <!--            Email-->
            <div class="col-12 md:col-6">
                <div class="p-inputgroup">
                    <span class="p-inputgroup-addon">
                        <i class="pi pi-envelope"></i>
                    </span>
                    <InputText placeholder="Email" v-model="customer.email" />
                </div>
            </div>
            <div class="col-12 md:col-6">
            </div>
            <!--            Phone-->
            <div class="col-12 md:col-6">
                <div class="p-inputgroup">
                    <span class="p-inputgroup-addon">
                        <i class="pi pi-phone"></i>
                    </span>
                    <InputText placeholder="Số điện thoại" v-model="customer.phone" />
                </div>
            </div>
            <!--            Address-->
            <div class="col-12 md:col-12">
                <div class="p-inputgroup">
                    <span class="p-inputgroup-addon">
                        <i class="pi pi-building"></i>
                    </span>
                    <InputText placeholder="Địa chỉ" v-model="customer.address" />
                </div>
            </div>
            <div class="col-12 md:col-12">
                <Button label="Xác nhận" class="justify-content-center" @click="onSubmitCustomer()" />
            </div>
        </div>

    </Dialog>
</template>

<script>
import {mapActions, mapGetters, mapMutations} from "vuex";
export default {
    name: "CreateCustomer",
    computed: {
        ...mapGetters({
            show_dialog : 'customer/show_dialog',
            customer : 'customer/customer',
            is_edit: 'customer/is_edit'
        })
    },
    methods: {
        ...mapMutations('customer', ['CHANGE_STATUS_DIALOG', 'SET_CUSTOMERS', 'CHANGE_STATUS_IS_EDIT']),
        ...mapActions('customer', ['createdCustomer', 'fetchCustomers', 'updatedCustomer']),
        handleClose() {
            this.CHANGE_STATUS_DIALOG(false)
        },
        async onSubmitCustomer(){

            let res = ''
            if(this.is_edit) {
                res = await  this.updatedCustomer(this.customer)
            }
            else {
                res = await this.createdCustomer(this.customer)
            }
            if(res.status === 200){
                this.$toast.add({severity:'success', summary: 'Success Message', detail: res.data, life: 3000});
                this.fetchCustomers()
                this.CHANGE_STATUS_DIALOG(false)
            }
            else {
                this.$toast.add({severity:'error', summary: 'Success Message', detail: res.message, life: 3000});
            }
        }
    }

}
</script>

<style scoped>
.ui-widget,
.ui-widget .ui-widget {
    font-size: 13.5px !important;
}
</style>
