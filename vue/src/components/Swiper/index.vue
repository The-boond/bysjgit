<template>
    <div class="Swiper">
        <a-carousel arrows>
            <template #prevArrow>
                <div class="custom-slick-arrow leftClick">
                    <LeftOutlined />
                </div>
            </template>
            <template #nextArrow>
                <div class="custom-slick-arrow rightClick" >
                    <RightOutlined />
                </div>
            </template>
            <template v-for="(i, idx) in imgList" :key="idx">
                <img class="item" :src="i?.url">
            </template>
        </a-carousel>
    </div>

</template>
<script setup>
import { LeftCircleOutlined } from '@ant-design/icons-vue';
import { POST } from '@/utils/axios';
import { configPath } from '@/utils/const/reqUrlPath';
const imgList = ref();
const GetSwiperList = async () => {
    const { code, data} = await POST(`/${configPath}/list`);
    if (code != '0') return;
    imgList.value = data.map((i) => {
        return {
            url: i.value
        }
    });
}
onMounted(() => {
    GetSwiperList();
})
</script>
<style lang="scss" scoped>
.Swiper{
    width: 100%;
    height: 350px;
    .ant-carousel{
        height: 100%;
        :deep(.slick-slider), :deep(.slick-list){
            height: 100%;
            .slick-track{
                height: 100%;
            }   
            .item{
                width: 100%;
                height: 100%;
            }
            .leftClick{
                width: 35px;
                height: 35px;
                left: 10px;
                z-index: 10;
                border-radius: 8px;
                line-height: 35px;
            }
            .rightClick{
                width: 35px;
                height: 35px;
                right: 10px;
                z-index: 10;
                border-radius: 8px;
                text-align: right;
                line-height: 35px;
            }
        }
    }

    :deep(.slick-arrow.custom-slick-arrow) {
        font-size: 30px;
        color: #fff;
        background-color: rgba(31, 45, 61, .8);
        transition: ease all 0.3s;
        opacity: 0.3;
        z-index: 10;
    }
    :deep(.slick-arrow.custom-slick-arrow:before) {
        display: none;
    }
    :deep(.slick-arrow.custom-slick-arrow:hover) {
        color: #fff;
        opacity: 0.5;
    }
}


</style>