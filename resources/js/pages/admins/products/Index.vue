<template>
    <ListCategory />
    <CreateCategory />
</template>

<script>
import ListCategory from "./ListProduct.vue";
import CreateCategory from "./Create.vue";
import {mapActions, mapGetters, mapMutations} from "vuex";
export default {
    name: "Index",
    components: {
        ListCategory,
        CreateCategory
    },
    created() {
        this.fetchProducts()
        this.fetchCategories()
        this.fetchShops()
    },
    methods: {
        ...mapActions('category', ['fetchCategories']),
        ...mapActions('shop', ['fetchShops']),
        ...mapActions('product', ['fetchProducts'])
    }
}
</script>

<style scoped>

</style>
