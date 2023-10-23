<template>
    <Dialog :visible="show_dialog" :modal="true" @update:visible="handleClose" class="md:col-6"   >
        <div class="grid p-fluid">
            <!--            Fisrt name-->
            <div class="col-12 md:col-12">
                <div class="p-inputgroup">
                <span class="p-inputgroup-addon">
                    <i class="pi pi-check-square"></i>
                </span>
                    <InputText placeholder="Loại sản phẩm" v-model="category.name"  />
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
    computed: {
        ...mapGetters({
            show_dialog: 'category/show_dialog',
            category: 'category/category',
            is_edit: 'category/is_edit'
        })
    },
    methods: {
        ...mapMutations('category', ['CHANGE_STATUS_DIALOG','CHANGE_STATUS_IS_EDIT']),
        ...mapActions('category', ['createCategory','updateCategory','fetchCategories']),
        handleClose() {
            this.CHANGE_STATUS_DIALOG(false)
        },
        async onSumbit() {
            let res = ''
            if(this.is_edit) {
                res = await this.updateCategory(this.category)
                this.CHANGE_STATUS_IS_EDIT(false)
            }
            else {
                res = await this.createCategory(this.category)
            }
            if(res.status === 200){
                this.$toast.add({severity:'success', summary: 'Success Message', detail: res.data, life: 3000});
                this.fetchCategories()
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
