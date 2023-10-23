<template>
    <Dialog :visible="show_dialog" :modal="true" @update:visible="handleClose" class="md:col-8"   >
        <div class="grid p-fluid">

            <div class="field col-12 md:col-4">
<!--                {{auction}}-->
                <label for="time24" >Thời gian bắt đầu</label>
                <input type="datetime-local" v-model="auction.time_start_auction" >
            </div>
            <!--            Last name-->
            <div class="field col-12 md:col-4">
                <label for="time24" >Thời gian kết thúc</label>
<!--                <Calendar timeZone="America/Los_Angeles" inputId="time24" v-model="auction.time_end_auction" :showTime="true"  />-->
                <input type="datetime-local" v-model="auction.time_end_auction" >
            </div>
            <div class="field col-12 md:col-4">
                <label for="time24" >Chọn sản phẩm</label>
                <MultiSelect v-model="auction.product" :options="products" optionLabel="name" placeholder="Select Countries" :filter="true" class="multiselect-custom">
                    <template #value="slotProps">
                        <div class="country-item country-item-value" v-for="option of slotProps.value" :key="option.code">
                            <img :src="`/images/products/${option.image}`" class="mr-2" width="12" />
                            <div>{{option.name}}</div>
                        </div>
                        <template v-if="!slotProps.value || slotProps.value.length === 0">
                            Chọn sản phẩm
                        </template>
                    </template>
                    <template #option="slotProps">
                        <div class="country-item">
                            <img :src="`/images/products/${slotProps.option.image}`" class="mr-2" width="18"  style="float:left"/>
                            <div >{{slotProps.option.name}}</div>
                        </div>
                    </template>
                </MultiSelect>
            </div>
            <div class=" col-12 md:col-12">
                <DataTable :value="auction.product" responsiveLayout="scroll">
                    <Column field="id" header="ID"></Column>
                    <Column field="name" header="Tên sản phẩm" style="width:20%">
                    </Column>
                    <Column header="Giờ mở phiên" style="width:20%">
                        <template #body="slotProps" >
<!--                            <Calendar inputId="time24" v-model="slotProps.data.time_start" :showTime="true" />-->
                            <input type="datetime-local" v-model="slotProps.data.time_start" >
                        </template>
                    </Column>
                    <Column header="Giờ đóng phiên" style="width:20%">
                        <template #body="slotProps">
<!--                            <Calendar inputId="time24" v-model="slotProps.data.time_end" :showTime="true" />-->
                            <input type="datetime-local" v-model="slotProps.data.time_end" >
                        </template>
                    </Column>
                    <Column field="price" header="Giá sàn">
                        <template #body="slotProps">
                            <span> {{slotProps.data.price}} đ </span>
                        </template>
                    </Column>
                    <Column field="" header="Hình Ảnh">
                        <template #body="slotProps">
                            <img :src="`/images/products/${slotProps.data.image}`" :alt="slotProps.data.image" style="max-width:50px" />
                        </template>
                    </Column>
                    <Column field="quantity" header="Hành động">
                        <template #body="slotProps">
                            <Button class="p-button-rounded p-button-danger m-3 " icon="pi pi-times" @click="delete_product_auction(slotProps.data.id)"/>
                        </template>
                    </Column>
                </DataTable>
            </div>
            <div class=" col-12 md:col-3"></div>
            <div class=" col-12 md:col-6">
              <Button @click="onSubmit()" class="justify-content-center" >Xác nhận</Button>
            </div>
            <div class=" col-12 md:col-3"></div>
        </div>
    </Dialog>
</template>

<script>
import {mapActions, mapGetters, mapMutations} from "vuex";
import auction from "../../../store-admins/modules/auction";

export default {
    name: "Create",
    computed: {
        ...mapGetters({
            show_dialog: 'auction/show_dialog',
            products: 'product/products',
            auction: 'auction/auction'
        })
    },
    methods: {
        ...mapMutations('auction',['CHANGE_STATUS_DIALOG_AUCTION','SET_AUCTION']),
        ...mapActions('auction',['createAuction','fetchAuctions']),
        handleClose() {
            console.log(this.products)
            this.CHANGE_STATUS_DIALOG_AUCTION(false)

        },
        async onSubmit() {
            const res = await this.createAuction(this.auction)
            console.log(res)
            if(res.status === 201) {
                this.$toast.add({severity:'success', summary: 'Success Message', detail: res.data, life: 3000});
                this.fetchAuctions()
                this.CHANGE_STATUS_DIALOG_AUCTION(false)
                this.SET_AUCTION({})

            }
            else if(res.response.status === 500) {
                this.$toast.add({severity:'error', summary: 'Lỗi', detail: res.response.data, life: 3000});
            }

        },
    }
}
</script>

<style lang="scss" scoped>
.product-image {
    max-width: 20px;
}
.p-multiselect {
    width: 18rem;
}
.multiselect-custom{
    display: flex;
}
::v-deep(.multiselect-custom) {
    .p-multiselect-label:not(.p-placeholder) {
        display: flex;
        padding-top: .25rem;
        padding-bottom: .25rem;
    }
    .country-item-value {
        padding: .25rem .5rem;
        border-radius: 3px;
        display: inline-flex;
        margin-right: .5rem;
        background-color: var(--primary-color);
        color: var(--primary-color-text);

        img.flag {
            width: 17px;
        }
    }

}

@media screen and (max-width: 640px) {
    .p-multiselect {
        width: 100%;
    }
}
</style>
