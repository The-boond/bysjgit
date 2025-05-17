<template>
    <div class="onlineService">
        <div class="onlineService-userList">
            <template v-for="(i, idx) in userList" :key="idx">
                <div class="onlineService-userList-item" :class="{ 'onlineService-userList-active': i.activeFlag }"
                    @click="UserClick(i, idx)">
                    <img class="item-touxiang" :src="i.avatarurl" />
                    <p class="item-username">{{ i.name }}</p>
                </div>
            </template>
            <a-empty v-if="userList.length == 0" :image="simpleImage" description="暂无用户" />
        </div>
        <div class="onlineService-service" v-if="userTitle != ''">
            <div class="onlineService-service-title">
                <p class="titleName ellipsis">{{ userTitle }}</p>
            </div>
            <div class="onlineService-service-content" ref="onlineServiceRef">
                <template v-for="(i, idx) in useState.$state.messagesObj['user' + userId]" :key="idx">
                    <div class="message-left" v-if="i.fromId != useState.$state.userid">
                        <p class="message-left-date">{{ new Date(i.updateTime).toLocaleString() }}</p>
                        <div class="message-left-content">
                            <a-avatar :src="i.avatarurl" size="large"></a-avatar>
                            <div class="left-content-message">
                                <p class="content-name">{{ i.name }}</p>
                                <p class="content-message">{{ i.content }}</p>
                            </div>
                        </div>
                    </div>
                    <div class="message-right" v-else>
                        <p class="message-right-date">{{ new Date(i.updateTime).toLocaleString() }}</p>
                        <div class="message-right-content">
                            <div class="right-content-message">
                                <p class="content-message">{{ i.content }}</p>
                            </div>
                            <a-avatar :src="i.avatarurl" size="large"></a-avatar>
                        </div>
                    </div>
                </template>
            </div>
            <div class="onlineService-service-textinput">
                <div class="richtext">
                    <div class="emoji-chunk">
                        <SmileOutlined @click="EmojiClick" />
                        <EmojiPicker v-if="emojiShow" @select="OnSelectEmoji"></EmojiPicker>
                    </div>
                </div>
                <a-textarea class="onlineService-input" v-model:value="textareaVal" :autoSize="{
                    minRows: 2, maxRows: 2
                }" placeholder="按 Ctrl + Enter 发送" @keyup.ctrl.enter="SendMessage(0)" />
                <div class="onlineService-send">
                    <a-button type="primary" size="small" :loading="false" @click="SendMessage(0)">发送</a-button>
                </div>
            </div>
        </div>
    </div>
</template>
<script setup>
import EmojiPicker from 'vue3-emoji-picker'
import { useStore } from '@/store';
import { onMounted, reactive, watch, watchEffect } from 'vue';
import { POST } from '@/utils/axios';
import { message, Empty } from 'ant-design-vue';
const useState = useStore();
const simpleImage = Empty.PRESENTED_IMAGE_SIMPLE;
let textareaVal = ref(''); // 聊天输入框
let onlineServiceRef = ref(null);
let userTitle = ref('');
let userList = ref([]);
let tarUserObj = reactive({});
let userId = ref([]);
let emojiShow = ref(false);


// 获取用户列表
const GetUserList = async () => {
    const { code, data } = await POST(`/user/list`, { role: 3 });
    if (code != 0) return message.error('获取用户列表失败')
    userList.value = data.map((res, idx) => {
        const { id } = res;
        useState.$state.messagesObj['user' + id] = [];
        useState.GetHistoryMessageList(0, 50, id, onlineServiceRef);
        return { ...res, activeFlag: idx == 0 ? true : false };
    });
    userTitle.value = data[0].name;
    userId.value = data[0].id;
    tarUserObj = data[0];
}
// 用户点击
const UserClick = (tarVal, tarIdx) => {
    userTitle.value = tarVal.name;
    tarUserObj = tarVal;
    userList.value = userList.value.map((res, idx) => {
        return { ...res, activeFlag: tarIdx == idx ? true : false };
    })
    userId.value = tarVal.id
    useState.GetHistoryMessageList(0, 50, tarVal.id, onlineServiceRef);
}
// 发送信息
const SendMessage = async (contentType) => {
    if (contentType == 0 && textareaVal.value.trim().length <= 0) {
        message.error('发送信息不能为空');
        return;
    }
    let { userid, username, name, avatarurl } = useState.$state;
    useState.SendSocket(userid, tarUserObj.id, avatarurl, name, contentType, textareaVal.value.trim(),);
    textareaVal.value = '';
    setTimeout(() => {
        onlineServiceRef.value.scrollTop = onlineServiceRef.value.scrollHeight;
    }, 0)
}
// 表情
const EmojiClick = () => {
    emojiShow.value = !emojiShow.value;
}
// 选中表情
const OnSelectEmoji = (emoji) => {
    textareaVal.value = `${textareaVal.value} ${emoji.i}`;
    emojiShow.value = false;
}
onMounted(() => {
    GetUserList();
})
</script>
<style lang="scss" scoped>
.onlineService {
    width: 100%;
    height: 100%;
    display: flex;

    &-userList {
        width: 300px;
        height: 100%;
        overflow-y: auto;
        background: #fff;
        display: flex;
        flex-direction: column;
        box-shadow: 0px 10px 15px -3px rgba(0, 0, 0, 0.3);

        &-item {
            display: flex;
            padding: 15px;
            cursor: pointer;

            &:hover {
                background: rgba(0, 0, 0, 0.2);
            }

            .item-touxiang {
                width: 50px;
                height: 50px;
                background: pink;
                border-radius: 8px;
            }

            .item-username {
                font-size: 12px;
                font-weight: 600;
                color: black;
                margin-left: 10px;
            }
        }

        &-active {
            background: rgba(0, 0, 0, 0.2);
        }
    }

    &-service {
        flex: 1;
        min-height: 800px;
        display: flex;
        flex-direction: column;
        margin-left: 30px;
        box-shadow: 0px 10px 15px -3px rgba(0, 0, 0, 0.3);
        background: #eee;

        &-title {
            width: 100%;
            height: 50px;
            font-size: 20px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            border-bottom: 0.5px solid #c7d2db;
            padding: 0 20px;
            box-sizing: border-box;
        }

        &-content {

            flex: 1;
            padding: 5px 0px 10px 8px;
            overflow-y: auto;
            display: flex;
            flex-direction: column;
            padding: 10px 20px 0;
            box-sizing: border-box;

            .message-left {
                width: 100%;
                margin: 10px 0;

                &-date {
                    text-align: center;
                    font-size: 12px;
                    color: black;
                }

                &-content {
                    width: 100%;
                    display: flex;
                    justify-content: flex-start;
                    margin-top: 10px;
                    box-sizing: border-box;

                    .ant-avatar {}

                    .left-content-message {
                        max-width: 90%;
                        margin-left: 10px;

                        .content-name {
                            font-size: 12px;
                            // color: #f5f5f5;
                        }

                        .content-message {
                            flex-shrink: 0;
                            padding: 5px 10px;
                            border-radius: 8px;
                            border-top-left-radius: 0;
                            background: #fff;
                            position: relative;
                            word-break: break-all;

                            &::before {
                                content: "";
                                position: absolute;
                                right: 100%;
                                border-top: 5px solid transparent;
                                border-right: 5px solid #fff;
                                border-bottom: 5px solid transparent;
                                transform: translateY(-50%);
                            }
                        }

                    }
                }
            }

            .message-right {
                width: 100%;
                margin: 10px 0;

                &-date {
                    text-align: center;
                    font-size: 12px;
                    color: black;
                }

                &-content {
                    display: flex;
                    align-items: center;
                    justify-content: flex-end;
                    margin-top: 10px;

                    .right-content-message {
                        max-width: 90%;
                        margin-right: 10px;

                        .content-message {
                            padding: 5px 10px;
                            border-radius: 8px;
                            background: rgba(144, 238, 144, .7);
                            position: relative;

                            &::before {
                                content: "";
                                position: absolute;
                                left: 100%;
                                top: 50%;
                                border-top: 5px solid transparent;
                                border-left: 5px solid rgba(144, 238, 144, .7);
                                border-bottom: 5px solid transparent;
                                transform: translateY(-50%);
                            }
                        }
                    }
                }
            }
        }

        &-textinput {
            display: flex;
            flex-direction: column;
            width: 100%;
            background-color: #eee;
            border-top: 0.5px solid #c7d2db;

            .richtext {
                display: flex;
                align-items: center;
                width: 100%;
                height: 25px;
                padding: 0 11px;
                cursor: pointer;

                .emoji-chunk {
                    position: relative;

                    .v3-emoji-picker {
                        position: absolute;
                        left: 0;
                        top: -320px;
                        z-index: 999;
                    }
                }
            }

            .onlineService-input {
                width: 100%;
                border: none;
                background-color: #eee;

                &:focus {
                    box-shadow: none !important;
                }
            }

            .onlineService-send {
                display: flex;
                justify-content: flex-end;
                margin: 10px 10px 10px 0;
            }
        }

        &-service {
            width: 45px;
            height: 45px;
            background: skyblue;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            border-radius: 50%;
            box-shadow: 0px 0px 50px 0px rgba(0, 0, 0, 0.1);
            margin: 20px 0 0;
            position: absolute;
            right: 36px;
            bottom: 50px;
            // top: 200px;
        }
    }
}
</style>