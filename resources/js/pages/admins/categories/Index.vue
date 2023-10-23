<template>
    <div>
        <ListCategory />
    </div>
    <div>
        <CreateCategory />
    </div>
</template>

<script>
import ListCategory from "./ListCategory.vue";
import CreateCategory from "./Create.vue";
import {mapGetters, mapMutations} from "vuex";
export default {
    name: "Index",
    components: {
        ListCategory,
        CreateCategory
    },
}
</script>

<style scoped>

</style>
