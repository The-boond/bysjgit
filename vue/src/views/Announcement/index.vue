<template>
    <div class="announcementTemOne">
        <a-space>
            <a-input v-model:value="title" placeholder="标题" />
            <a-button type="primary" class="mainOpera" @click="GetAnnouncementList">查询</a-button>
        </a-space>
        <div :gutter="[48,24]" class="container">
            <template v-for="(i,idx) in announcementList" :key="idx">
                <div  class="container-chunk" @click="DetailsClick(i)">
                    <img :src="i.picture" class="container-chunk-img"/>
                    <div class="container-chunk-message">
                        <p class="message-title">{{ i.title }}</p>
                        <p class="message-content">{{ i.introduction }}</p>
                    </div>
                </div>
            </template>
        </div>
    </div>
</template>
<script setup>
import { POST } from '@/utils/axios';
import { newsPath } from '@/utils/const/reqUrlPath';
const router = useRouter();
const title = ref('');
const announcementList = ref([]);

const DetailsClick = (tarVal) => {
    router.push({
        name: 'AnnouncementDetails',
        state: {
            id: tarVal.id,
            title: '公告信息',
        }
    })
}
// 获取公告数据
const GetAnnouncementList = async() => {
    const { code, data } = await POST(`/${newsPath}/list`,{title: title.value});
    if(code != '0') return;
    announcementList.value = data;
}
onMounted(() => {
    GetAnnouncementList();
})
</script>
<style lang="scss" scoped>
.announcementTemOne{
    width: 100%;
    height: 100%;
    margin-top: 20px;
    padding: 0 10%;
    box-sizing: border-box;
    .container{
        width: 100%;
        margin: 20px 0;
        display: flex;
        flex-wrap: wrap;
        &-chunk{
            width: calc(50% - 15px);
            background: #fff;
            box-shadow: 0px 10px 15px -3px rgba(0,0,0,0.3);
            border-radius: 8px;
            display: flex;
            padding: 20px;
            box-sizing: border-box;
            cursor: pointer;
            margin-bottom: 20px;
            &:hover{
                box-shadow: 0px 10px 15px -3px rgba(0,0,0,0.5);
            }
            &:nth-child(odd) {
                margin-right: 15px;
            }
            &:nth-child(even) {
                margin-left: 15px;
            }
            &-img{
                width: 150px;
                height: 150px;
                border-radius: 8px;
            }
            &-message{
                flex: 1;
                margin-left: 10px;
                overflow: hidden;         /* 隐藏溢出的部分 */
                .message-title{
                    width: 320px;
                    font-size: 18px;
                    font-weight: 600;
                    white-space: nowrap;      /* 防止文本换行 */
                    overflow: hidden;         /* 隐藏溢出的部分 */
                    text-overflow: ellipsis;
                }
                .message-content{
                    width: 100%;
                    font-size: 12px;
                    color: #999;
                    display: -webkit-box;
                    -webkit-box-orient: vertical;
                    overflow: hidden;
                    -webkit-line-clamp: 6; /* 显示的行数 */
                }
            }
        }
    }
}
</style>