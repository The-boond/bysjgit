<template>
    <div class="aboutsTemTwo">
        <div class="top"> 
            <p class="title">{{aboutsDetails?.title}}</p>
            <p class="titleEnglish">Abouts us</p>
        </div>
        <div class="container">
            <a-divider />
            <div class="container-content" v-html="decodeURIComponent(aboutsDetails?.content)"></div>
        </div>
    </div>
</template>
<script setup>
import { POST } from '@/utils/axios';
const aboutsDetails = reactive({});
// 获取公告数据
const GetAboutsInfo = async() => {
    const { code, data } = await POST('/aboutus/list',{});
    if(code != '0') return;
    Object.assign(aboutsDetails, data[0]);
}
onMounted(() => {
    GetAboutsInfo();
})
</script>
<style lang="scss" scoped>
.aboutsTemTwo{
    width: 100%;
    height: 20%;
    padding: 20px 5%;
    box-sizing: border-box;
    background: url('@/assets/indexImg/aboutsBack.jpg') no-repeat;
    background-size: cover;
    color: #fff !important;
    .top{
        display: flex;
        align-items: flex-end;
        .title{
            font-size: 50px;
            font-weight: bold;
            letter-spacing: 15px;
        }   
        .titleEnglish{
            font-size: 25px;
            font-weight: 500;
            margin-left: 20px;
        }
    }
    
    .container{
        width: 50%;
        display: flex;
        flex-direction: column;
        align-items: flex-start;
        &-time{
            margin-top: 20px;
            font-size: 12px;
            &-date{
                margin-left: 10px;
            }
        }
        &-content{
            line-height: 30px;
        }
    }
}
</style>