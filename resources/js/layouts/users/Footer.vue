<template>
  <footer class="footer">
      <div class="container">
          <div class="row">
              <div class="footer-col">
                  <h4>Về chúng tôi</h4>
                  <ul>
                      <li><router-link to="">Công ty <br> <br>
                          <span class="">thương mại cổ phần Ho Chi Minh</span> <br> <br>
                          <span>Open university</span>
                      </router-link></li>
                  </ul>
              </div>
              <div class="footer-col">
                  <h4>Liên hệ hợp tác</h4>
                  <ul>
                      <li><router-link to="">Điện thoại: (+84) 817 765 357</router-link></li>
                      <li><router-link to="">Email: 1951012033hoang@ou.edu.vn</router-link></li>
                  </ul>
              </div>
              <div class="footer-col">
                  <h4>Trợ giúp</h4>
                  <ul>
                      <li><router-link to="">FAQ</router-link></li>
                      <li><router-link to="">Hướng dẫn sử dụng</router-link></li>
                      <li><router-link to="">Câu hỏi thường gặp</router-link></li>
                      <li><router-link to="">Phương thức vận chuyển</router-link></li>
                      <li><router-link to="">Phương thức thanh toán</router-link></li>
                  </ul>
              </div>
              <div class="footer-col">
                  <h4>Theo dõi</h4>
                  <div class="social-links">
                      <a href="#"> <span class="pi pi-facebook"></span> </a>
                      <a href="#"> <span class="pi pi-twitter"></span> </a>
                      <a href="#"> <span class="pi pi-instagram"></span> </a>
                  </div>
              </div>
          </div>
      </div>
  </footer>
</template>

<script>
export default {
    name: "Footer",
    methods: {

    }
}
</script>

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap');
body{
    line-height: 1.5;
    font-family: 'Poppins', sans-serif;
}
*{
    margin:0;
    padding:0;
    box-sizing: border-box;
}
.container{
    max-width: 1440px;
    margin:auto;
}
.row{
    display: flex;
    flex-wrap: wrap;
}
ul{
    list-style: none;
}
.footer{
    background-color: #24262b;
    padding: 50px 0;
    left: 0;
    bottom: 0;
    width: 100%;
    color: white;
    /*position: fixed;*/

}
.footer-col{
    width: 25%;
    padding: 0 15px;
}
.footer-col h4{
    font-size: 18px;
    color: #ffffff;
    /*text-transform: capitalize;*/
    margin-bottom: 35px;
    font-weight: 500;
    position: relative;
}
.footer-col h4::before{
    content: '';
    position: absolute;
    left:0;
    bottom: -10px;
    background-color: #e91e63;
    height: 2px;
    box-sizing: border-box;
    width: 50px;
}
.footer-col ul li:not(:last-child){
    margin-bottom: 10px;
}
.footer-col ul li a{
    font-size: 16px;
    /*text-transform: capitalize;*/
    text-decoration: none;
    font-weight: 300;
    color: #bbbbbb;
    display: block;
    transition: all 0.3s ease;
}
.footer-col ul li a:hover{
    color: #ffffff;
    padding-left: 8px;
}
.footer-col .social-links a{
    display: inline-block;
    height: 40px;
    width: 40px;
    background-color: rgba(255,255,255,0.2);
    margin:0 10px 10px 0;
    text-align: center;
    line-height: 40px;
    border-radius: 50%;
    color: #ffffff;
    transition: all 0.5s ease;
}
.footer-col .social-links a:hover{
    color: #24262b;
    background-color: #ffffff;
}

/*responsive*/
@media(max-width: 767px){
    .footer-col{
        width: 20%;
        margin-bottom: 30px;
    }
}
@media(max-width: 574px){
    .footer-col{
        width: 20%;
    }
}
</style>
