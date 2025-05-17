<template>
    <div class="commonDetails">
        <p class="title">{{title}}</p>
        <div class="container">
            <p class="container-title">{{ detailsData?.title }}</p>
            <p class="container-time">
                <span>发布时间</span>
                <span class="container-time-date">{{ detailsData?.addtime }}</span>
            </p>
            <a-divider />
            
            <div v-html="decodeURIComponent(detailsData?.content)"></div>
        </div>
    </div>
</template>
<script setup>
import { POST } from '@/utils/axios';
import { newsPath } from '@/utils/const/reqUrlPath';
const title = ref('');
const detailsData = reactive({});
// 获取公告数据
const GetAnnouncementDetails = async() => {
    const { code, data} = await POST(`/${newsPath}/info`,{id: history.state?.id});
    if(code != '0') return;
    Object.assign(detailsData, data);
}
onMounted(() => {
    GetAnnouncementDetails();
})
</script>
<style lang="scss" scoped>
.commonDetails{
    width: 60%;
    height: 700px;
    margin: 20px 0;
    padding: 20px;
    border-radius: 8px;
    background: #fff;
    .title{
      
    }   
    .container{
        width: 100%;
        margin: 20px 0;
        border-radius: 19px;
        display: flex;
        flex-direction: column;
        align-items: center;
        &-title{
            font-size: 18px;
            font-weight: 700;
        }
        &-time{
            margin-top: 20px;
            font-size: 12px;
            color: #999;
            &-date{
                margin-left: 12px;
             
            }
        }
    }
}
</style>