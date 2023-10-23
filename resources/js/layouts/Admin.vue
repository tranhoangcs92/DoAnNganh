<template>
    <div :class="containerClass" @click="onWrapperClick">
        <AppTopbar @menu-toggle="onMenuToggle" />
        <div class="layout-sidebar" @click="onSidebarClick">
            <LeftMenu :model="menu" @menuitem-click="onMenuItemClick" />
        </div>
        <div class="layout-main-container">
            <div class="layout-main">
                <router-view />
            </div>
        </div>
    </div>
    <Toast position="top-center" />
    <ConfirmDialog></ConfirmDialog>
</template>

<script>
import AppTopbar from "./admins/AppTopbar.vue";
import LeftMenu from "./admins/LeftMenu.vue";
export default {
    components: {
      AppTopbar, LeftMenu
    },
    name: "AdminLayout",

        emits: ['change-theme'],
        data() {
            return {
                layoutMode: 'static',
                staticMenuInactive: false,
                overlayMenuActive: false,
                mobileMenuActive: false,
                menu : [
                    {
                        label: 'Trang chủ',
                        items: [{
                            label: 'Dashboard', icon: 'pi pi-fw pi-home', to: '/admin/dashboard'
                        }]
                    },
                    {
                        label: 'Khách hàng', icon: 'pi pi-fw pi-sitemap',
                        items: [
                            {label: 'Danh sách khách hàng', icon: 'pi pi-fw pi-id-card', to: '/admin/customers'},
                            // {label: "Float Label", icon: "pi pi-fw pi-bookmark", to: "/floatlabel"},
                            // {label: "Invalid State", icon: "pi pi-fw pi-exclamation-circle", to: "/invalidstate"},
                            // {label: 'Button', icon: 'pi pi-fw pi-mobile', to: '/button'},
                            // {label: 'Table', icon: 'pi pi-fw pi-table', to: '/table'},
                            // {label: 'List', icon: 'pi pi-fw pi-list', to: '/list'},
                            // {label: 'Tree', icon: 'pi pi-fw pi-share-alt', to: '/tree'},
                            // {label: 'Panel', icon: 'pi pi-fw pi-tablet', to: '/panel'},
                            // {label: 'Overlay', icon: 'pi pi-fw pi-clone', to: '/overlay'},
                            // {label: "Media", icon: "pi pi-fw pi-image", to: "/media"},
                            // {label: 'Menu', icon: 'pi pi-fw pi-bars', to: '/menu'},
                            // {label: 'Message', icon: 'pi pi-fw pi-comment', to: '/messages'},
                            // {label: 'File', icon: 'pi pi-fw pi-file', to: '/file'},
                            // {label: 'Chart', icon: 'pi pi-fw pi-chart-bar', to: '/chart'},
                            // {label: 'Misc', icon: 'pi pi-fw pi-circle-off', to: '/misc'},
                        ]
                    },
                    {
                        label: 'Sản phẩm',
                        items: [
                            {label: 'Danh sách loại sản phẩm', icon: 'pi pi-fw pi-check-square', to: '/admin/categories'},
                            {label: 'Danh sách sản phẩm', icon: 'pi pi-fw pi-box', to: '/admin/products', badge: "NEWs"}
                        ]
                    },
                    {
                        label: 'Phiên đấu giá',
                        items: [
                            {label: 'Danh sách phiên', icon: 'pi pi-calendar-times', to: '/admin/auctions'},
                        ]
                    },
                    // {
                    //     label: 'Pages', icon: 'pi pi-fw pi-clone',
                    //     items: [
                    //         {label: 'Crud', icon: 'pi pi-fw pi-user-edit', to: '/crud'},
                    //         {label: 'Timeline', icon: 'pi pi-fw pi-calendar', to: '/timeline'},
                    //         {label: 'Landing', icon: 'pi pi-fw pi-globe', to: '/landing'},
                    //         {label: 'Login', icon: 'pi pi-fw pi-sign-in', to: '/login'},
                    //         {label: 'Error', icon: 'pi pi-fw pi-times-circle', to: '/error'},
                    //         {label: 'Not Found', icon: 'pi pi-fw pi-exclamation-circle', to: '/notfound'},
                    //         {label: 'Access Denied', icon: 'pi pi-fw pi-lock', to: '/access'},
                    //         {label: 'Empty', icon: 'pi pi-fw pi-circle-off', to: '/empty'},
                    //     ]
                    // },
                    // {
                    //     label: 'Menu Hierarchy', icon: 'pi pi-fw pi-search',
                    //     items: [
                    //         {
                    //             label: 'Submenu 1', icon: 'pi pi-fw pi-bookmark',
                    //             items: [
                    //                 {
                    //                     label: 'Submenu 1.1', icon: 'pi pi-fw pi-bookmark',
                    //                     items: [
                    //                         {label: 'Submenu 1.1.1', icon: 'pi pi-fw pi-bookmark'},
                    //                         {label: 'Submenu 1.1.2', icon: 'pi pi-fw pi-bookmark'},
                    //                         {label: 'Submenu 1.1.3', icon: 'pi pi-fw pi-bookmark'},
                    //                     ]
                    //                 },
                    //                 {
                    //                     label: 'Submenu 1.2', icon: 'pi pi-fw pi-bookmark',
                    //                     items: [
                    //                         {label: 'Submenu 1.2.1', icon: 'pi pi-fw pi-bookmark'},
                    //                         {label: 'Submenu 1.2.2', icon: 'pi pi-fw pi-bookmark'}
                    //                     ]
                    //                 },
                    //             ]
                    //         },
                    //         {
                    //             label: 'Submenu 2', icon: 'pi pi-fw pi-bookmark',
                    //             items: [
                    //                 {
                    //                     label: 'Submenu 2.1', icon: 'pi pi-fw pi-bookmark',
                    //                     items: [
                    //                         {label: 'Submenu 2.1.1', icon: 'pi pi-fw pi-bookmark'},
                    //                         {label: 'Submenu 2.1.2', icon: 'pi pi-fw pi-bookmark'},
                    //                         {label: 'Submenu 2.1.3', icon: 'pi pi-fw pi-bookmark'},
                    //                     ]
                    //                 },
                    //                 {
                    //                     label: 'Submenu 2.2', icon: 'pi pi-fw pi-bookmark',
                    //                     items: [
                    //                         {label: 'Submenu 2.2.1', icon: 'pi pi-fw pi-bookmark'},
                    //                         {label: 'Submenu 2.2.2', icon: 'pi pi-fw pi-bookmark'}
                    //                     ]
                    //                 }
                    //             ]
                    //         }
                    //     ]
                    // },
                    // {
                    //     label: 'Get Started',
                    //     items: [
                    //         {label: 'Documentation', icon: 'pi pi-fw pi-question', command: () => {window.location = "#/documentation"}},
                    //         {label: 'View Source', icon: 'pi pi-fw pi-search', command: () => {window.location = "https://github.com/primefaces/sakai-vue"}}
                    //     ]
                    // }
                ]
            }
        },
        watch: {
            $route() {
                this.menuActive = false;
                // this.$toast.removeAllGroups();
            }
        },
        methods: {
            onWrapperClick() {
                if (!this.menuClick) {
                    this.overlayMenuActive = false;
                    this.mobileMenuActive = false;
                }

                this.menuClick = false;
            },
            onMenuToggle() {
                this.menuClick = true;

                if (this.isDesktop()) {
                    if (this.layoutMode === 'overlay') {
                        if(this.mobileMenuActive === true) {
                            this.overlayMenuActive = true;
                        }

                        this.overlayMenuActive = !this.overlayMenuActive;
                        this.mobileMenuActive = false;
                    }
                    else if (this.layoutMode === 'static') {
                        this.staticMenuInactive = !this.staticMenuInactive;
                    }
                }
                else {
                    this.mobileMenuActive = !this.mobileMenuActive;
                }

                event.preventDefault();
            },
            onSidebarClick() {
                this.menuClick = true;
            },
            onMenuItemClick(event) {
                if (event.item && !event.item.items) {
                    this.overlayMenuActive = false;
                    this.mobileMenuActive = false;
                }
            },
            onLayoutChange(layoutMode) {
                this.layoutMode = layoutMode;
            },
            addClass(element, className) {
                if (element.classList)
                    element.classList.add(className);
                else
                    element.className += ' ' + className;
            },
            removeClass(element, className) {
                if (element.classList)
                    element.classList.remove(className);
                else
                    element.className = element.className.replace(new RegExp('(^|\\b)' + className.split(' ').join('|') + '(\\b|$)', 'gi'), ' ');
            },
            isDesktop() {
                return window.innerWidth >= 992;
            },
            isSidebarVisible() {
                if (this.isDesktop()) {
                    if (this.layoutMode === 'static')
                        return !this.staticMenuInactive;
                    else if (this.layoutMode === 'overlay')
                        return this.overlayMenuActive;
                }

                return true;
            }
        },
        computed: {
            containerClass() {
                return ['layout-wrapper', {
                    'layout-overlay': this.layoutMode === 'overlay',
                    'layout-static': this.layoutMode === 'static',
                    'layout-static-sidebar-inactive': this.staticMenuInactive && this.layoutMode === 'static',
                    'layout-overlay-sidebar-active': this.overlayMenuActive && this.layoutMode === 'overlay',
                    'layout-mobile-sidebar-active': this.mobileMenuActive,
                    'p-input-filled': this.$primevue.config.inputStyle === 'filled',
                    'p-ripple-disabled': this.$primevue.config.ripple === false
                }];
            },
            logo() {
                // return (this.$appState.darkTheme) ? "images/logo-white.svg" : "images/logo.svg";
                return "images/logo.svg";
            }
        },
        beforeUpdate() {
            if (this.mobileMenuActive)
                this.addClass(document.body, 'body-overflow-hidden');
            else
                this.removeClass(document.body, 'body-overflow-hidden');
        },

}
</script>

<style scoped>

</style>
