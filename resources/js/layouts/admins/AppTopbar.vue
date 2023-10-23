<template>
    <div class="layout-topbar">
        <router-link to="/admin/dashboard" class="layout-topbar-logo">
            <img alt="Logo" :src="topbarImage()" />
            <span>Bidding</span>
        </router-link>
        <button class="p-link layout-menu-button layout-topbar-button" @click="onMenuToggle">
            <i class="pi pi-bars"></i>
        </button>
        <button class="p-link layout-topbar-menu-button layout-topbar-button" @click="changeStatusThreeDot()">
            <i class="pi pi-ellipsis-v"></i>
        </button>
        <ul v-if="isMobile()" class="layout-topbar-menu lg:flex origin-top" :class="{ hidden: isHidden }">
           <SubAdminTopbar />
        </ul>
        <ul v-else class="layout-topbar-menu lg:flex origin-top">
            <SubAdminTopbar />
        </ul>
    </div>
</template>

<script>
import SubAdminTopbar from "./_AdminTopbar.vue";
export default {
    data() {
        return {
            isHidden: true
        }
    },
    components: {
        SubAdminTopbar,
    },
    methods: {
        onMenuToggle(event) {
            this.$emit('menu-toggle', event);
        },
        onTopbarMenuToggle(event) {
            this.$emit('topbar-menu-toggle', event);
        },
        topbarImage() {
            return '../images/logo-dark.svg';
        },
        changeStatusThreeDot() {
            this.isHidden = !this.isHidden
        },
        isMobile() {
            if(/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)) {
                return true
            } else {
                return false
            }
        }
    },

}
</script>
<style>

</style>
