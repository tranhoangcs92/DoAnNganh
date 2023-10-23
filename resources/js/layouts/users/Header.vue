<template>
    <header>
        <div class="block-logo">
            <img alt="Logo" :src="logoImage()" />
            <router-link :to="{name: UserHome}" class="logo">OUBid</router-link>
        </div>
        <div class="group">
            <ul class="navigation">
                <li><router-link to="/user/home">Trang chủ</router-link></li>
                <li><router-link to="/user/bids">Đấu giá</router-link></li>
                <li><router-link to="/user/cart">Giỏ hàng</router-link></li>
                <li><router-link to="">Đơn hàng</router-link></li>
                <li><router-link to="">Liên hệ</router-link></li>
            </ul>
        </div>
        <div class="function">
            <div>
                <span class="pi pi-bars menuToggle"></span>
            </div>
            <div>
                <router-link to="/user/cart" > <span class="pi pi-cart-plus cursor-pointer m-4 size" style="color:black" ></span> </router-link>
                <span class="pi pi-bell cursor-pointer m-4 size" ></span>
                <span class="pi pi-sign-out cursor-pointer m-4 size" @click="logout()"></span>
            </div>
        </div>
    </header>
</template>
<script >
export default {
    methods: {
        logout() {
            localStorage.removeItem('customer_token')
            setTimeout(3000)
            if (localStorage.getItem('customer_token') === null ){
                this.$router.push('/user/login')
            }
        },
        logoImage() {
            return '/images/logo-dark.svg';
        }
    }
}
</script>
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans:wght@400;600&display=swap');
*{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}
header{
    position: fixed;
    z-index: 1000;
    top: 0;
    width: 100%;
    height: 80px;
    background: #ffffff;
    padding: 20px 40px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    box-shadow: 0 15px 15px rgba(0,0,0,0.07);
    font-family: 'Noto Sans', sans-serif;
    font-size: 15px;
}
.block-logo{
    display:flex;
    align-items:center;
}
.logo{
    color: #333;
    text-decoration: none;
    font-size: 1.5em;
    font-weight: 700;
    text-transform: uppercase;
    letter-spacing: 0.1em;
    align-items: center;
    justify-content:center;
}
.group{
    display: flex;
    align-items: center;
}
header ul {
    position: relative;
    display: flex;
    gap: 100px;
}
header ul li{
    list-style: none;
}
header ul li a{
    position: relative;
    text-decoration: none;
    font-weight:500;
    color: #333;
    text-transform: uppercase;
    /*letter-spacing: 0.2em;*/
}
header ul li a::before{
    content: ' ';
    position: absolute;
    bottom: -2px;
    width: 100%;
    height: 2px;
    background: #333;
    transform: scaleX(0);
    transition: transform  0.5s ease-in-out;
    transform-origin: right;
}
header ul li  a:hover::before{
    transform: scaleX(1);
    transform-origin: left;
}
.menuToggle{
    position: relative;
    display: none;
}
@media (max-width: 800px) {
    .menuToggle{
        margin-top: -15px;
        position: absolute;
        display: block;
        font-size: 2em;
        cursor: pointer;
        transform: translateX(-10px);
        z-index:10
    }
    header .navigation{
        position: absolute;
        opacity: 0;
        visibility: hidden;
        left: 100%
    }
}
.size{
    font-size: 20px;
}
</style>
