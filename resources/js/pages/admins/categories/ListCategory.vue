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
        <DataTable :value="list_category" :paginator="true" :rows="10"
                   paginatorTemplate="CurrentPageReport FirstPageLink PrevPageLink PageLinks NextPageLink LastPageLink RowsPerPageDropdown"
                   :rowsPerPageOptions="[5,8,10]" responsiveLayout="scroll"
                   currentPageReportTemplate="Showing {first} to {last} of {totalRecords}">
            <Column field="id" header="id"></Column>
            <Column field="name" header="Loại sản phẩm"></Column>
<!--            <Column field="sex" header="Giới tính"></Column>-->
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

export default {
    name: "ListCategory",
    created() {
        this.fetchData()
    },
    computed: {
      ...mapGetters({
          list_category: 'category/categories',

      })
    },
    methods: {
        ...mapMutations('category',['CHANGE_STATUS_DIALOG','CHANGE_STATUS_IS_EDIT','SET_CATEGORY']),
        ...mapActions('category',['fetchCategories','destroyCategory']),
        fetchData() {
            this.fetchCategories()
        },
        show_dialog() {
            this.CHANGE_STATUS_DIALOG(true)
            this.SET_CATEGORY({})
        },
        showEditCustomer(data) {
            this.CHANGE_STATUS_DIALOG(true)
            this.CHANGE_STATUS_IS_EDIT(true)
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
        }
    }
}
</script>

<style scoped>

</style>
