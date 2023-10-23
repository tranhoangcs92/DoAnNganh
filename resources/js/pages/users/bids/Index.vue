<template>
    <div class="wrapper">
        <ListProductAuction />
    </div>
</template>

<script>
import ListProductAuction from "./ListProductAuction.vue";
export default {
    name: "Index.vue",
    components: {
        ListProductAuction
    },
    data () {
    },
    methods : {
    }
}
</script>

<style scoped>
.wrapper{
    width: 90%;
    margin: 0 auto;
    /*background-color: #70a1ff;*/
}
</style>
