<template>
    <div>
        <Header />
    </div>
    <div>
        <router-view />
    </div>
    <div>
        <Footer />
    </div>
    <Toast position="top-center" />
</template>

<script>
import Header from "./users/Header.vue";
import Footer from "./users/Footer.vue";
export default {
    name: "UserLayout",
    components: {
        Header, Footer
    }
}
</script>

<style scoped>
body{
    background: #1a202c;
}
</style>
