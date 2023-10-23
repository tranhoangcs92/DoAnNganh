<template>
    <div>
        <DataTable :value="auctions" v-model:expandedRows="expandedRows" dataKey="id"
                   @rowExpand="onRowExpand" @rowCollapse="onRowCollapse" responsiveLayout="scroll">
            <template #header>
                <div class="table-header-container">
                    <Button icon="pi pi-plus" label="Mở rộng" @click="expandAll" class="mr-2" />
                    <Button icon="pi pi-minus" label="Thu nhỏ" @click="collapseAll" />
                    <Button icon="pi pi-plus" class="p-button-raised p-button-rounded" label="Tạo phiên" style="float:right" @click="show_dialog()"/>
                </div>
            </template>
            <Column :expander="true" headerStyle="width: 3rem" />
            <Column field="id" header="ID" sortable></Column>
            <Column field="time_start_auction" header="Ngày mở" sortable>
            </Column>
            <Column field="time_end_auction" header="Ngày đóng" sortable>
            </Column>
            <Column field="status_auction" header="Trạng thái" sortable>
                <template #body="slotProps">
                    <span :class="'product-badge status-' + statusAuction(slotProps.data.time_start_auction,slotProps.data.time_end_auction)">{{changeName(statusAuction(slotProps.data.time_start_auction,slotProps.data.time_end_auction))}}</span>
                </template>
            </Column>
            <template #expansion="slotProps">
                <div class="orders-subtable">
                    <h5>Danh sách sản phẩm</h5>
                    <DataTable :value="slotProps.data.products" responsiveLayout="scroll">
                        <Column field="id" header="ID" sortable></Column>
                        <Column field="name" header="Tên sản phẩm" sortable></Column>
                        <Column field="time_start_product" header="Thời gian bắt đầu" sortable></Column>
                        <Column field="time_end_product" header="Thời gian kết thúc" sortable></Column>
                        <Column field="image" header="Hình ảnh" sortable>
                            <template #body="slotProps">
                                <img :src="`/images/products/${slotProps.data.image}`" :alt="slotProps.data.image" class="product-image" />
                            </template>
                        </Column>
                        <Column field="price" header="Giá sàn" sortable>
                            <template #body="slotProps">
                                <span> {{slotProps.data.price}} đ </span>
                            </template>
                        </Column>
                        <Column field="category_name" header="Loại sản phẩm" sortable>
                        </Column>
                        <Column headerStyle="width:4rem">
                            <template #body>
                                <Button class="p-button-rounded p-button-danger" icon="pi pi-times" />
                            </template>
                        </Column>
                    </DataTable>
                </div>
            </template>
        </DataTable>
    </div>
</template>

<script>
import {mapActions, mapGetters, mapMutations} from "vuex";

export default {
    name: "ListAuction",
    data() {
        return {
            expandedRows: []
        }
    },
    computed: {
        ...mapGetters({
            auctions: 'auction/auctions',
        })
    },
    created() {
        this.fetchAuctions()
    },
    methods: {
        ...mapMutations('auction',['CHANGE_STATUS_DIALOG_AUCTION']),
        ...mapActions('auction', ['fetchAuctions']),
        onRowExpand(event) {
            this.$toast.add({severity: 'info', summary: 'Mở chi tiết phiên thành công', detail: event.data.name, life: 3000});
        },
        onRowCollapse(event) {
            this.$toast.add({severity: 'success', summary: 'Thu nhỏ chi tiết phiên thành công', detail: event.data.name, life: 3000});
        },
        expandAll() {
            this.expandedRows = this.auctions.filter(p => p.id);
            this.$toast.add({severity: 'success', summary: 'Mở tất cả', life: 3000});
        },
        collapseAll() {
            this.expandedRows = null;
            this.$toast.add({severity: 'success', summary: 'Thu nhỏ tất cả', life: 3000});
        },
        show_dialog() {
            this.CHANGE_STATUS_DIALOG_AUCTION(true)
        },
        statusAuction: function(date1, date2) {
            var d1 = new Date(date1); //"now"
            var d2 = new Date(date2);  // some date
            let datenow = new Date()
            if(datenow >= d2 ) {
                return 'outofstock';
            }
            else if(datenow < d2 && datenow > d1) {
                return "lowstock"
            }
            else if((datenow < d2 && d1 > datenow)) {
                return "instock";
            }
        },
        changeName(value) {
            if(value === 'outofstock') {
                return 'hết thời gian'
            }
            else if(value === 'lowstock') {
                return 'đang diễn ra'
            }
            else {
                return 'sắp diễn ra'
            }
        },
    }
}
</script>

<style lang="scss" scoped>
.product-image {
    width: 50px;
    box-shadow: 0 3px 6px rgba(0, 0, 0, 0.16), 0 3px 6px rgba(0, 0, 0, 0.23)
}

.orders-subtable {
    padding: 1rem;
}
.product-badge.status-instock {
    background: #c8e6c9;
    color: #256029;
}
.product-badge.status-lowstock {
    background: #feedaf;
    color: #8a5340;
}
.product-badge.status-outofstock {
    background: #ffcdd2;
    color: #c63737;
}
.product-badge {
    border-radius: 2px;
    padding: 0.25em 0.5rem;
    text-transform: uppercase;
    font-weight: 700;
    font-size: 12px;
    letter-spacing: .3px;
}
</style>
