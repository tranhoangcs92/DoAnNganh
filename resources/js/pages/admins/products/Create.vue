<template>
    <Dialog :visible="show_dialog" :modal="true" @update:visible="handleClose" class="md:col-6"   >
<!--        <div>{{product}}</div>-->
        <div class="grid p-fluid">
            <!--            Fisrt name-->
            <div class="col-12 md:col-6">
                <div class="p-inputgroup">
                <span class="p-inputgroup-addon">
                    <i class="pi pi-box"></i>
                </span>
                    <InputText placeholder="Tên sản phẩm" v-model="product.name"  />
                </div>
            </div>
            <div class="col-12 md:col-6">
                <div class="p-inputgroup">
                <span class="p-inputgroup-addon">
                    <i class="pi pi-money-bill"></i>
                </span>
                    <InputNumber v-model="product.price" showButtons currency="VND" :step="1" :min="1000" />
                </div>
            </div>
            <div class="col-12 md:col-6">
                <div class="p-inputgroup">
                <span class="p-inputgroup-addon">
                    <i class="pi pi-check-square"></i>
                </span>
                    <Dropdown v-model="product.id_admin" optionValue="id" :options="shops" optionLabel="name" placeholder="Chọn cửa hàng" />
                </div>
            </div>
            <div class="col-12 md:col-6">
                <div class="p-inputgroup">
                <span class="p-inputgroup-addon">
                    <i class="pi pi-check-square"></i>
                </span>
                    <Dropdown v-model="product.id_category" optionValue="id" :options="categories" optionLabel="name" placeholder="Chọn loại sản phẩm" />
                </div>
            </div>
            <div class="col-12 md:col-6">
                <div class="upload-image" >
                    <div v-if="product.image === undefined || product.image === ''">
                        <div class="block-upload-img-underfined"><i class="pi pi-upload"></i></div>
                    </div>
                    <img v-else="" :src="product.image"  />
                    <label class="label-upload">
                        <input @change="myUploader" accept=".jpg,.jpeg,.gif,.png" type="file" />
                    </label>
                </div>
            </div>
            <div class="col-12 md:col-12">
                <Button label="Xác nhận" class="justify-content-center" @click="onSumbit()" />
            </div>
        </div>
    </Dialog>
<!--    <span>{{this.show_dialog1}}</span>-->
</template>

<script>
import {mapActions, mapGetters, mapMutations} from "vuex";
export default {
    name: "CreateCategory",
    data() {
        return {
            selectedCity: null,
        }
    },
    computed: {
        ...mapGetters({
            show_dialog: 'product/show_dialog',
            product: 'product/product',
            is_edit: 'product/is_edit',
            categories: 'category/categories',
            shops: 'shop/shops'
        })
    },
    methods: {
        ...mapMutations('product', ['CHANGE_STATUS_DIALOG_PRODUCT', 'CHANGE_STATUS_IS_EDIT_PRODUCT', 'SET_IMAGE_PRODUCT', 'SET_FILE_PRODUCT']),
        ...mapActions('product', ['createProduct', 'fetchProducts']),
        handleClose() {
            this.CHANGE_STATUS_DIALOG_PRODUCT(false)
        },
        async onSumbit() {
            const res = await this.createProduct(this.product)
            console.log(res)
            if(res.status === 200) {
                this.$toast.add({severity:'success', summary: 'Thành công', detail: res.data.messages, life: 3000});
                this.CHANGE_STATUS_DIALOG_PRODUCT(false);
                this.fetchProducts()
            }
        },
        myUploader(value) {
            let file = value.target.files[0]
            this.SET_IMAGE_PRODUCT(URL.createObjectURL(file))
            this.SET_FILE_PRODUCT(file)

        }
    }
}
</script>

<style scoped>
.ui-widget,
.ui-widget .ui-widget {
    font-size: 13.5px !important;
}
.upload-image {
    width: 300px;
    position: relative;
    max-width:200px;
}
.upload-image img{
    max-width:100%;
    object-fit: contain;
}
.label-upload{
    width: 100%;
    height: 100%;
    top: 0;
    right: 0;
    opacity: 0;
    position: absolute;
    cursor: pointer;
}
.label-upload>input{
    display: none;
}
.label-upload>image{
    width: 150px;
    height: 17px;
}
</style>
