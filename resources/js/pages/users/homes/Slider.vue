<template>
    <div class="grid grid-nogutter surface-section text-800 flex" >
        <div class="col-12 md:col-6 p-6 text-center md:text-left flex align-items-center ">
            <section>
                <span class="block text-6xl font-bold mb-1">OU Bidding</span>
                <div class="text-6xl text-primary font-bold mb-3">Đấu giá cho mọi nhà</div>
                    <p class="mt-0 mb-4 text-700 line-height-3">Trang đấu giá mọi sản phẩm uy tín nhất Việt Nam với giá ưu đãi nhất !</p>

                <Button label="Tìm hiểu thêm" type="button" class="mr-3 p-button-raised p-3"></Button>
                <Button label="Đấu giá ngay" type="button" class="p-button-outlined p-3"></Button>
            </section>
        </div>
        <div class="col-12 md:col-6 overflow-hidden">
            <img src="/images/galleria/galleria3.jpg" alt="Image" class="md:ml-auto block md:h-full" style="clip-path: polygon(8% 0, 100% 0%, 100% 100%, 0 100%)">
        </div>
    </div>
</template>

<script>
export default {
    name: "Slider",
    data() {
        return {
            responsiveOptions: [
                {
                    breakpoint: '1024px',
                    numVisible: 3,
                    numScroll: 3
                },
                {
                    breakpoint: '600px',
                    numVisible: 2,
                    numScroll: 2
                },
                {
                    breakpoint: '480px',
                    numVisible: 1,
                    numScroll: 1
                }
            ]
        }
    },

}
</script>

<style scoped>


</style>
