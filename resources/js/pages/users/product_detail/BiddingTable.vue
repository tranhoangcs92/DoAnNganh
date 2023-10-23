<template>
    <div class="card">
        <DataTable :value="list_bid" :scrollable="true" scrollHeight="400px" :loading="loading" stripedRows>
            <Column field="user.fullname" header="Tên" style="min-width:200px"></Column>
<!--            <Column field="user.email" header="Email" style="min-width:300px"></Column>-->
            <Column field="price" header="Giá" style="min-width:100px">
                <template #body="slotProps">
                    {{  formatCurrency(slotProps?.data?.price, 'đ') }}
                </template>
            </Column>
            <Column field="updated_at" header="Ngày" style="min-width:200px">
                <template #body="slotProps">
                    {{new Date( slotProps?.data?.updated_at).toLocaleDateString()}}
                </template>
            </Column>
            <Column field="user.updated_at" header="Giờ" style="min-width:200px">
                <template #body="slotProps">
                    {{new Date( slotProps?.data?.updated_at).toLocaleTimeString()}}
                </template>
            </Column>

        </DataTable>
    </div>
</template>

<script>
import {mapActions, mapGetters, mapMutations} from "vuex";
import {formatCurrency} from "../../../utils/format";
export default {
    name: "BiddingTable",
    computed: {
        ...mapGetters({
            list_bid: 'bidModules/bids'
        })
    },
    created() {
        this.fetchBids(this.$route.params.id)
    },
    methods: {
        ...mapActions('bidModules',['fetchBids']),
        ...mapMutations('bidModules',['SET_BIDS']),
        formatCurrency
    }
}
</script>

<style scoped>

</style>
