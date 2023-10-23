<template>
    <div>
        <ListCustomer />
    </div>
    <div>
        <CreateCustomer />
    </div>
</template>

<script>
import ListCustomer from "./ListCustomer.vue";
import CreateCustomer from "./Create.vue";
import {mapGetters, mapMutations} from "vuex";
export default {
    name: "Index",
    data() {
        return {
            city: null,
            value: null
        }
    },
    components: {
        ListCustomer,
        CreateCustomer
    },
    computed: {
        ...mapGetters({
            show_dialog : 'customer/show_dialog'
        })
    },
    methods: {
        ...mapMutations('customer', ['CHANGE_STATUS_DIALOG']),
        handleClose() {
            this.CHANGE_STATUS_DIALOG(false)
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
