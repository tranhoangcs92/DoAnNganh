<template>
    <component :is="layout" >
        <router-view></router-view>
    </component>
</template>

<script>
const default_layout = 'blank'
export default {
    name: "UserApp",
    computed: {
        layout(){
            return (this.$route.meta.layout || default_layout) + '-layout'
        }
    }
}
</script>

<style scoped>

</style>
