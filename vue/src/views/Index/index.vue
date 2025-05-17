
        <template>
            <div class="index">
                
                <div class="announcement">
                    <div class="title">公告</div>
                    <div class="content">
                        <a-row :gutter="[16,16]">
                            <template v-for="(i, idx) in announcementList" :key="idx">
                                <a-col :span="12" @click="GoAnnouncementDetails(i)">
                                    <p class="content-title">{{ i?.title }}</p>
                                    <span class="content-addtime">{{ i?.addtime }}</span>
                                    <p class="content-introduction">{{ i?.introduction }}</p>
                                    <span class="cell"></span>
                                </a-col>
                            </template>
                        </a-row>
                    </div>
                </div>
                <div class="abouts">
                    <Abouts></Abouts>
                </div>
                <div class="footer"></div>
            </div>
        </template>
        <script setup>
        import { POST } from '@/utils/axios';
        import { newsPath } from '@/utils/const/reqUrlPath';
        import { useStore } from '@/store';
        import Abouts from '../Abouts/index.vue';
        const useState = useStore();
        const router = useRouter();
        const imgError = ref(import.meta.env.VITE_IMG_ERROR);
        const classifyList = ref([]);
        const announcementList = ref([]);
        const GetClassify = async () => {
            const { code, data} = await POST('/petclassify/list', {});
            if (code != '0') return;
            classifyList.value = data;
        }
        
        // 获取公告数据
        const GetAnnouncementList = async() => {
            const { code, data } = await POST('/news/list',{});
            if(code != '0') return;
            announcementList.value = data;
        }
        const GoAnnouncementDetails = ({id}) => {
            router.push({
                name: 'AnnouncementDetails',
                state: {
                id
                },
            })
        }
        onMounted(() => {
            
            GetAnnouncementList();
        })
        // 前往登录
        const GoLogin = () => {
            router.push('/login');
        }
        </script>
        <style lang="scss" scoped>
        .index{
            width: 100%;
            display: flex;
            flex-direction: column;
            .classifyContent{
                width: 100%;
                display: flex;
                &-item{
                    width: 250px;
                    height: 250px;
                    position: relative;
                    box-shadow: 0 0 15px 0 rgba(0,0,0,.1);
                    >img{
                        width: 100%;
                        height: 100%;
                    }
                    &-back{
                        width: 100%;
                        height: 100%;
                        position: absolute;
                        left: 0;
                        top: 0;
                        border-radius: 15px; /* 可选：圆角 */  
                        display: flex;  
                        justify-content: center;  
                        align-items: center;  
                        color: #000; /* 文本颜色 */  
                        font-size: 18px;  
                        text-align: center;  
                        opacity: 0;
                        transition: background-color 0.3s ease;
                        &:hover{
                            background-color: rgba(255, 255, 255, 0.2); /* 半透明白色覆盖层 */  
                            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* 可选：阴影 */  
                            backdrop-filter: blur(10px); /* 模糊背景 */  
                            opacity: 1;
                            cursor: pointer;
                        }
                    }
                }
            }
            .dataContent{
                width: 100%;
                margin: 50px 0;
                padding: 0 9%;
                box-sizing: border-box;
                display: flex;
                flex-direction: column;
                align-items: center;
                .title{
                    &::before{
                        margin-right: 20px;
                        content: '一';
                    }
                    &::after{
                        margin-left: 20px;
                        content: '一';
                    }
            
                }
                .content{
                    display: flex;
                    flex-wrap: wrap;
                    &-item{
                        margin: 10px;
                    }
                }
            }
            .announcement{
                width: 100%;
                display: flex;
                flex-direction: column;
                align-items: center;
                .title{
                    word-break: break-word;
                    word-wrap: break-word;
                    font-family: 微软雅黑;
                    font-size: 30px;
                    color: rgb(51, 51, 51);
                }
                .content{
                    width: 60%;
                    margin: 60px 0 80px;
                    :deep(.ant-col){
                        padding: 5px;
                        box-sizing: border-box;
                        cursor: pointer;
                    }
                    &-title{
                        word-break: break-word;
                        word-wrap: break-word;
                        font-family: 微软雅黑;
                        font-size: 16px;
                        color: #333;
                    }
                    &-addtime{
                        margin-top: 15px;
                        font-family: 微软雅黑;
                        color: #999;
                        display: inline-block;
                        font-size: 14px;
                        line-height: 1.5;
                    }
                    &-introduction{
                        color: #666;
                        font-size: 14px;
                        line-height: 26px;
                        margin-top: 14px;
                        display: -webkit-box;  
                        -webkit-box-orient: vertical;  
                        -webkit-line-clamp: 2;  
                        overflow: hidden;  
                    }
                    .cell{
                        display: inline-block;
                        width: 100%;
                        height: 1px;
                        border-bottom: 1px solid #eee;
                    }
                }
            }
            .abouts{
                .aboutsTemTwo{
                    min-height: 400px;
                }
            }
        }
        </style>
        