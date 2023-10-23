<template>
    <ListAuction />
    <CreateAuction />
</template>

<script>
import ListAuction from "./ListAuction.vue";
import CreateAuction from "./Create.vue";
import {mapActions, mapGetters} from "vuex";
export default {
    name: "Index",
    components: {
        ListAuction,
        CreateAuction
    },
    created() {
      this.fetchProducts()
    },
    computed: {
        ...mapGetters({

        })
    },
    methods: {
        ...mapActions('product',['fetchProducts'])
    }
}
</script>

<style scoped>

</style>
