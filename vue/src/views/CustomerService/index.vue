<template>
    <section class="OnlineService">
        <div class="wrapper">
            <div class="container">
                <div class="left">
                    <!-- <div class="top">
                        <a-input class="ant-input" v-model:value="searchVal" type="text" placeholder="搜索好友" @pressEnter="GetUserList()" allow-clear/>
                    </div> -->
                    <ul class="people">
                        <template v-for="(i,idx) in userList" :key="idx">
                            <li class="person" :class="i.activeFlag ? 'active' : ''" data-chat="person1" @click="UserClick(i)">
                                <img :src="i.avatarurl" alt="" />
                                <p class="person-content">
                                    <span class="name">{{ i.name }}</span>
                                    <span class="preview">
                                        <!-- <component  v-if="i.url != undefined" :is="GetFileExtension(i.url)" /> -->
                                        {{ i.message }} 
                                    </span>
                                </p>
                                <span class="time">{{ i.updateTime }} </span>
                            </li>  
                        </template>
                    </ul>
                </div>
                <div class="right">
                    <div class="top"><span>To: <span class="name">{{ toName }}</span></span></div>
                    <div class="chat active-chat" ref="onlineServiceRef">
                        <template v-for="(i,idx) in useState.$state.messagesObj['user' + tarUserId]" :key="idx">
                            <div class="conversation-start">
                                <span>{{ i.updateTime }}</span>
                            </div>
                            <div class="bubble you" v-if="i.fromId != useState.$state.userid">
                                <p v-if="i.contentType == '0'">{{ i.content }}</p>
                                <a-image
                                    v-else-if="i.contentType == '1'"
                                    :width="200"
                                    :src="i.content"
                                />
                                <div class="file-chunk"  v-else-if="i.contentType == '2'">
                                    <component :is="GetFileExtension(i.url)" />
                                    <a :href="i.url">{{ i.content }}</a>
                                </div>
                            </div>
                            <div class="bubble me" v-else>
                                <p v-if="i.contentType == '0'">{{ i.content }}</p>
                                <a-image
                                    v-else-if="i.contentType == '1'"
                                    :width="200"
                                    :src="i.content"
                                />
                                <div class="file-chunk"  v-else-if="i.contentType == '2'">
                                    <component :is="GetFileExtension(i.url)" />
                                    <a :href="i.url">{{ i.content }}</a>
                                </div>
                            </div>
                        </template>
                    </div>
                    <div class="write">
                        <!-- <a-upload
                            name="file"
                            class="form-uploader"
                            :show-upload-list="false"
                            action="/api/file/upload" 
                            @change="PhotoUploadChange">
                            <PictureOutlined class="write-icon"/>
                        </a-upload>
                        <a-upload
                            name="file"
                            class="form-uploader"
                            :show-upload-list="false"
                            action="/api/file/upload" 
                            @change="FileUploadChange">
                            <PaperClipOutlined class="write-icon"/>
                        </a-upload> -->

                        <a-input v-model:value="contentVal" type="text" @pressEnter="SendMessage(0)" allow-clear/>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
</template>
<script setup>  
import { POST } from '@/utils/axios';
import { useStore } from '@/store';
import { message } from 'ant-design-vue';
const useState = useStore();
const searchVal = ref('');
const userList = ref([]);
const toName = ref('');
const tarUserObj = reactive({});
const tarUserId = ref('');
const contentVal = ref('');
let onlineServiceRef = ref(null);
// 获取
const GetUserList = async () => {
    const defaultList = [{id: 1, avatarurl: 'https://www.antdv.com/assets/logo.1ef800a8.svg', name: '管理' }]
    // const {data: enterprisehrList} = await POST('/enterprisehr/list', {});
    // const {code, data} = await POST('/user/list', {});
    // if (code != "0") return;
    const userList = [].concat(defaultList, []);
    HandleUserList(userList, true);
}
// 点击用户
const UserClick = (i) => { 
    const {id, name} = i;
    toName.value = name;
    Object.assign(tarUserObj, i)
    userList.value = userList.value.map((res, idx) => {
        return {...res, activeFlag: i.id == res.id ? true : false};
    })
    tarUserId.value =  id;
    useState.GetHistoryMessageList(0, 50, id, onlineServiceRef);
    setTimeout(() => {
        onlineServiceRef.value.scrollTop = onlineServiceRef.value.scrollHeight;
    },0)
}
// 发送信息
const SendMessage = async (contentType) => {
    if (contentType == 0 && contentVal.value.trim().length <= 0) {
        message.error('发送信息不能为空');
        return;
    }
    const { id } = tarUserObj;
    let { userid, name, avatarurl } = useState.$state;
    useState.SendSocket(userid, id, avatarurl, name, contentType, contentVal.value.trim(),);
    contentVal.value = '';
    setTimeout(() => {
        onlineServiceRef.value.scrollTop = onlineServiceRef.value.scrollHeight;
    },0)
}
// 上传图片
const PhotoUploadChange = info => {
  if (info.file.status === 'uploading') {
    return;
  }
  if (info.file.status === 'done') {
    let { userid, name, avatarurl} = useState.$state;
    useState.SendSocket(userid, tarUserObj.fuserid, avatarurl, name, 1, info.file.response.data.url, 5);
    HandleUserList(userList.value, true);
  }
  if (info.file.status === 'error') {
    message.error('upload error');
  }
};
// 文件上传
const FileUploadChange = info => {
    if (info.file.status === 'uploading') {
    return;
  }
  if (info.file.status === 'done') {
    let { userid, name, avatarurl} = useState.$state;
    useState.SendSocket(userid, tarUserObj.fuserid, avatarurl, name, 2, '附件', 7, info.file.response.data.url, info.file.size,);
    HandleUserList(userList.value,true);
  }
  if (info.file.status === 'error') {
    message.error('upload error');
  }
}
const GetFileExtension = (fileName) => {
    let str = ''
    switch (fileName.split('.').pop()) {
        case 'docx': 
            str = 'FileWordOutlined';
            break;
        case 'xlsx': 
            str = 'FileExcelOutlined';
            break;
        case 'ppt': 
            str = 'FilePptOutlined';
            break;
        case 'pdf': 
            str = 'FilePdfOutlined';
            break;
        case 'txt': 
            str = 'FileTextOutlined';
            break;
        case 'zip': 
            str = 'FileZipOutlined';
            break;
        case 'jpg': 
            str = 'FileJpgOutlined';
            break;
        case 'mp4': 
            str = 'VideoCameraOutlined';
            break;
        case 'webp': 
        case 'png': 
        case 'jpeg': 
            str = 'FileImageOutlined';
            break;
        case 'gif': 
            str = 'FileGifOutlined';
            break;
        default: 
            break;
    }
    return str;
}
const GetMessageStr = (fileName) => {
    let str = ''
    switch (fileName.split('.').pop()) {
        case 'docx': 
        case 'xlsx': 
        case 'ppt': 
        case 'pdf': 
        case 'txt': 
        case 'zip': 
        case 'mp4': 
            str = '[文件]';
            break;
        case 'jpg': 
        case 'webp': 
        case 'png': 
        case 'jpeg': 
        case 'gif': 
            str = '[图片]';
            break;
        default: 
            str = fileName;
            break;
    }
    return str;
}
// arr 用户列表 flag 是否获取用户记录
const HandleUserList = (arr, flag) => {
    // 用户列表
    let newArr = arr.map(async (res,idx) => {
        const { id, name } = res;
        let resultLoad;
        if(flag && idx === 0) {
            // 默认第一个用户聊天记录
            // resultLoad = await useState.GetHistoryMessageList(0, 50,  res.fuserid, onlineServiceRef);
            // 默认为第一个聊天对象
            toName.value = name;
            // 默认第一个用户id
            tarUserId.value = id;
            // 默认第一个用户信息
            Object.assign(tarUserObj, res);
        }
        useState.$state.messagesObj['user' + id] = [];
        useState.GetHistoryMessageList(0, 50,  id);
        return {
            ...res, 
            activeFlag: id == tarUserId.value ? true : false, 
        };
    });
    Promise.all(newArr).then(res => {
        userList.value = res;
    })
}
onMounted(() => {
    GetUserList();
})
</script>

<style lang="scss" scoped>
@mixin font-bold {
    font-family: 'Source Sans Pro', sans-serif;
    font-weight: 600;
}
@mixin font {
    font-family: 'Source Sans Pro', sans-serif;
    font-weight: 400;
}
@mixin placeholder {
    &::-webkit-input-placeholder {
        @content;
    }
    &:-moz-placeholder {
        @content;
    }
    &::-moz-placeholder {
        @content;
    }
    &:-ms-input-placeholder {
        @content;
    }
}
.OnlineService{
    width: 100%;
    height: 100%;
    padding: 20px 0;

}
.wrapper {
    position: relative;
    left: 50%;
    width: 1110px;
    height: 800px;    
    transform: translate(-50%, 0);
    background: #Fff;
}
.container {
    position: relative;
    top: 50%;
    left: 50%;
    width: 100%;
    height: 100%;
    background-color: #Fff;
    transform: translate(-50%, -50%);
    display: flex;
    .left {
        width: 37.6%;
        height: 100%;
        display: flex;
        flex-direction: column;
        box-sizing: border-box;
        border: 1px solid #e6e6e6;
        background-color: #fff;
        .top {
            position: relative;
            width: 100%;
            height: 96px;
            padding: 29px;
            &:after {
                position: absolute;
                bottom: 0;
                left: 50%;
                display: block;
                width: 80%;
                height: 1px;
                content: '';
                background-color: #e6e6e6;
                transform: translate(-50%, 0);
            }
            .ant-input {
                :deep(.ant-input){
                    background-color: #eceff1 !important;
                }
                width: 100%;
                height: 42px;
                padding: 0 15px;
                border: 1px solid #e6e6e6;
                background-color: #eceff1;
                border-radius: 21px;
                @include font();
                &:focus {
                    outline: none;
                }
            }
        }

        .people {
            width: calc(100%);
            height: 100%;
            list-style: none;
            padding: 0;
            margin: 0;
            display: flex;
            flex-direction: column;  
            overflow-y: auto;  
            overflow-x: hidden;
            box-sizing: border-box;        
            .person {
                position: relative;
                width: 100%;
                padding: 12px 10% 16px;
                cursor: pointer;
                box-sizing: border-box;
                background-color: #fff;
                display: flex;
                &:after {
                    position: absolute;
                    bottom: 0;
                    left: 50%;
                    display: block;
                    width: 80%;
                    height: 1px;
                    content: '';
                    background-color:#e6e6e6;
                    transform: translate(-50%, 0);
                }
                &-content{
                    display: flex;
                    flex-direction: column;
                    .name {
                        font-size: 16px;
                        line-height: 22px;
                        color: #1a1a1a;
                        @include font-bold;
                    }
                    .preview {
                        font-size: 12px;
                        display: flex;
                        align-items: center;
                        overflow: hidden !important;
                        width: 250px;
                        white-space: nowrap;
                        text-overflow: ellipsis;
                        color: #999;
                        margin-top: 5px;
                    }
                }
                img {
                    float: left;
                    width: 40px;
                    height: 40px;
                    margin-right: 12px;
                    border-radius: 50%;
					object-fit: cover;
                }

                .time {
                    font-size: 14px;
                    position: absolute;
                    top: 16px;
                    right: 10%;
                    padding: 0 0 5px 5px;
                    color: #999;
                    background-color: #fff;
                }

                &.active,&:hover {
                    margin-top: -1px;
                    margin-left: -1px;
                    padding-top: 13px;
                    border: 0;
                    background-color: #00b0ff;
                    width: calc(100% + 2px);
                    padding-left: calc(10% + 1px);
                    span {
                        color: #fff;
                        background: transparent;
                    }
                    &:after {
                        display: none;
                    }
                }
            }
        }
    }
    .right {
        width: 62.4%;
        height: 100%;
        display: flex;
        flex-direction: column;
        .top {
            width: 100%;
            height: 50px;
            padding: 15px 29px;
            box-sizing: border-box;
            background-color: #eceff1;
            span {
                font-size: 15px;
                color: #999;
                .name {
                    color: #1a1a1a;
                    @include font-bold;
                }
            }
        }
        .chat {
            flex: 1;
            display: flex;
            flex-direction: column;
            overflow-y: scroll;
            padding: 0 35px;
            border-width: 1px 1px 1px 0;
            border-style: solid;
            border-color: #e6e6e6;
            &.active-chat {
                .bubble {
                    transition-timing-function: cubic-bezier(.4,-.04, 1, 1);
                    @for $i from 1 through 999 {
                        &:nth-of-type(#{$i}) {
                            animation-duration: .05s * $i;
                        }
                    }
                }
            }
            .bubble {
                font-size: 16px;
                position: relative;
                display: inline-block;
                clear: both;
                margin-bottom: 8px;
                padding: 13px 14px;
                vertical-align: top;
                border-radius: 5px;
                &:before {
                    position: absolute;
                    top: 19px;
                    display: block;
                    width: 8px;
                    height: 6px;
                    content: '\00a0';
                    transform: rotate(29deg) skew(-35deg);
                }
                &.you {
                    float: left;
                    color: #fff;
                    background-color: #00b0ff;
                    align-self: flex-start;
                    animation-name: slideFromLeft;
                    &:before {
                        left: -3px;
                        background-color: #00b0ff;
                    }
                }
                &.me {
                    float: right;
                    color: #1a1a1a;
                    background-color: #eceff1;
                    align-self: flex-end;
                    animation-name: slideFromRight;
                    &:before {
                        right: -3px;
                        background-color: #eceff1;
                    }
                }
                .file-chunk{
                    display: flex;
                    align-items: center;
                    >a{
                        margin-left: 10px
                    }
                }
            }
            .conversation-start {
                position: relative;
                width: 100%;
                margin-bottom: 27px;
                text-align: center;
                span {
                    font-size: 14px;
                    display: inline-block;
                    color: #999;
                    &:before,&:after {
                        position: absolute;
                        top: 10px;
                        display: inline-block;
                        width: 30%;
                        height: 1px;
                        content: '';
                        background-color: #e6e6e6;
                    }
                    &:before {
                        left: 0;
                    }
                    &:after {
                        right: 0;
                    }
                }
            }
        }
        .write {
            width: calc(100%);
            height: 60px;
            display: flex;
            align-items: center;
            padding: 0 10px;
            box-sizing: border-box;
            border: 1px solid #e6e6e6;
            background-color: #eceff1;
            :deep(.ant-upload){
                display: flex;
                align-items: center;
                justify-content: center;
            }
            &-icon{
                font-size: 18px;
                margin-right: 10px;
                cursor: pointer;
            }
            input {
                font-size: 16px;
                float: left;
                width: 100%;
                height: 40px;
                padding: 0 10px;
                color: #1a1a1a;
                border: 0;
                outline: none;
                background-color: #fff;
                @include font;
            }
            .write-link {
                &.attach {
                    &:before {
                        display: inline-block;
                        float: left;
                        width: 20px;
                        height: 42px;
                        content: '';
                        background-image: url('https://s3-us-west-2.amazonaws.com/s.cdpn.io/382994/attachment.png');
                        background-repeat: no-repeat;
                        background-position: center;
                    }
                }
                &.smiley {
                    &:before {
                        display: inline-block;
                        float: left;
                        width: 20px;
                        height: 42px;
                        content: '';
                        background-image: url('https://s3-us-west-2.amazonaws.com/s.cdpn.io/382994/smiley.png');
                        background-repeat: no-repeat;
                        background-position: center;
                    }
                }
                &.send {
                    &:before {
                        display: inline-block;
                        float: left;
                        width: 20px;
                        height: 42px;
                        margin-left: 11px;
                        content: '';
                        background-image: url('https://s3-us-west-2.amazonaws.com/s.cdpn.io/382994/send.png');
                        background-repeat: no-repeat;
                        background-position: center;
                    }
                }
            }
        }

    }
}
@keyframes slideFromLeft {
    0% {
        margin-left: -200px;
        opacity: 0;
    }
    100% {
        margin-left: 0;
        opacity: 1;
    }
}
@-webkit-keyframes slideFromLeft {
    0% {
        margin-left: -200px;
        opacity: 0;
    }
    100% {
        margin-left: 0;
        opacity: 1;
    }
}
@keyframes slideFromRight {
    0% {
        margin-right: -200px;
        opacity: 0;
    }
    100% {
        margin-right: 0;
        opacity: 1;
    }
}
@-webkit-keyframes slideFromRight {
    0% {
        margin-right: -200px;
        opacity: 0;
    }
    100% {
        margin-right: 0;
        opacity: 1;
    }
}
</style>