<template>
    <div class="card">
        <Toolbar class="mb-4">
            <template #start>
                <Button label="Tạo mới" icon="pi pi-plus" class=" mr-2" @click="show_dialog()"/>
            </template>
            <template #end>
        <span class="p-input-icon-left">
            <i class="pi pi-search" />
            <InputText  placeholder="Tìm kiếm..." />
        </span>
            </template>
        </Toolbar>
        <DataTable :value="list_product" :paginator="true" :rows="10"
                   paginatorTemplate="CurrentPageReport FirstPageLink PrevPageLink PageLinks NextPageLink LastPageLink RowsPerPageDropdown"
                   :rowsPerPageOptions="[5,8,10]" responsiveLayout="scroll"
                   currentPageReportTemplate="Showing {first} to {last} of {totalRecords}">
            <Column field="name" header="Sản phẩm"></Column>
            <Column field="name_shop" header="Cửa hàng"></Column>
            <Column field="name_cate" header="Phân loại"></Column>
            <Column field="price" header="Giá sàn">
                <template #body="slotProps">
                    {{ formatCurrency(slotProps.data.price,'đ')}}
                </template>
            </Column>
            <Column field="" header="Ảnh">
                <template #body="slotProps">
                    <img :src="`/images/products/${slotProps.data.image}`" :alt="slotProps.data.image" class="product-image" />
                </template>
            </Column>
            <Column header="Hành động">
                <template #body="slotProps">
                    <Button icon="pi pi-pencil" class="p-button-rounded mr-4 " @click="showEditCustomer(slotProps.data)" />
                    <Button icon="pi pi-trash" class="p-button-rounded p-button-danger mt-2"  @click="deleteCategory(slotProps.data.id)"/>
                </template>
            </Column>
            <template #paginatorstart>
                <Button type="button" icon="pi pi-refresh" class="p-button-text" />
            </template>
            <template #paginatorend>
                <Button type="button" icon="pi pi-cloud" class="p-button-text" />
            </template>
        </DataTable>
    </div>
</template>

<script>
import {mapActions, mapGetters, mapMutations} from "vuex";
import {formatCurrency} from "../../../utils/format";

export default {
    name: "ListCategory",
    computed: {
      ...mapGetters({
          list_category: 'category/categories',
          list_product: 'product/products'
      })
    },
    methods: {
        ...mapMutations('product',['CHANGE_STATUS_DIALOG_PRODUCT','CHANGE_STATUS_IS_EDIT_PRODUCT','SET_PRODUCT']),
        ...mapActions('category',['fetchCategories','destroyCategory']),
        show_dialog() {
            this.CHANGE_STATUS_DIALOG_PRODUCT(true)
            this.SET_PRODUCT({})
        },
        showEditCustomer(data) {
            this.CHANGE_STATUS_DIALOG_PRODUCT(true)
            this.CHANGE_STATUS_IS_EDIT_PRODUCT(true)
            this.SET_CATEGORY(data)
        },
        deleteCategory(value) {
            this.$confirm.require({
                message: 'Bạn có muốn xoá loại sản phẩm này không ?',
                header: 'Xác nhận',
                icon: 'pi pi-exclamation-triangle',
                accept: () => {
                    this.destroyCategory(value)
                    this.$toast.add({
                        severity: 'success',
                        summary: 'Success Message',
                        detail: 'Xoá thành công',
                        life: 3000
                    });
                    this.fetchCategories()
                }
            });
        },
        formatCurrency
    }
}
</script>

<style scoped>
.product-image{
    max-height: 50px;
    max-width: 70px;
}
</style>
