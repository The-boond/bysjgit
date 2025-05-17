import { defineStore } from "pinia";
import { POST } from "@/utils/axios";
import { userPath } from "@/utils/const/reqUrlPath";
import { socket } from "@/utils/socket";
import { message } from "ant-design-vue";
import { SmileOutlined } from "@ant-design/icons-vue";
import { notification } from "ant-design-vue";
import { h } from "vue";
export const useStore = defineStore(`user:${location.port}`, {
    state: () => ({
        role: "",
        name: "",
        userid: "",
        username: "",
        avatarurl: "",
        money: 0,
        isMember: false,
        onlineServiceIsShow: false, // 在线客服弹框是否显示
        scrollRef: "",
        messagesObj: {},
    }),
    getters: {},
    actions: {
        // 设置用户的信息
        SetUserInfo(state) {
            this.$patch(state);
            sessionStorage.token =
                state != undefined ? state.token : sessionStorage.token;
        },
        // 重置用户信息
        ResetUserInfo() {
            sessionStorage.clear();
            this.role = "";
            this.avatarurl = "";
            this.messagesObj = {};
            this.money = 0;
            this.isMember = false;
            this.name = '';
            this.userid = '';
            this.username = '';

        },
        // 是否登录
        async IsLogin() {
            const resultRes = await POST(`/auth/isLogin`, {});
            if (resultRes.code == 500) {
                this.ResetUserInfo();
                return false;
            }
            return true;
        },
        // 登出
        async LoginOut() {
            const resultRes = await POST(`/auth/logout`, {});
            if (resultRes.code == 500) {
                this.onlineServiceIsShow = false;
                return false;
            }
            this.ResetUserInfo();
            return true;
        },
        // 登录
        async Login(formVal) {
            const { code, msg, data, } = await POST(`/${userPath}/login`, formVal);
            if (code == 500) return msg;
            this.SetUserInfo(data);
            this.GetVIP(data);
            return true;
        },
        // 邮箱登录
        async EmailLogin(formVal) {
            let { formModel } = formVal;
            const resultRes = await POST(`/${userPath}/loginByEmail`, formModel);
            if (resultRes.code == 0) {
                this.SetUserInfo(resultRes.data);
                return true;
            } else return resultRes.msg;
        },
        // 头像登录
        async HeadPortraitLogin(formVal) {
            let { formModel } = formVal;
            let obj = {
                ...formModel,
                touxiang: formModel["headPortrait"][0].response.data.url,
            };
            let resultRes = await POST(`/${userPath}/loginByFaceCatch`, obj);
            if (resultRes.code == 0) {
                this.SetUserInfo(resultRes.data);
                return true;
            } else return resultRes.msg;
        },
        // 获取验证码
        async GetCodeImage() {
            let resultRes = await POST(`/captchaImage`);
            if (resultRes.code == 0) return resultRes.data;
            else message.error("获取验证码失败");
        },
        // 获取邮箱验证码
        async GetCodeEmail(username) {
            let resultRes = await POST(`/${userPath}/sendEmail`, { username });
            if (resultRes.code == 0) {
                message.success("发送成功");
                return resultRes.data;
            } else message.error("获取验证码失败");
        },
        // 注册
        async Register(formVal) {
            let obj = {
                ...formVal,
                role: 10,
            };
            let resultRes = await POST(`/${userPath}/register`, obj);
            if (resultRes.code == 0) return true;
            else return resultRes.msg;
        },
        async GetVIP({ userid }) {
            const { code, data } = await POST('/vip/isVip', {
                userid
            });
            if (code === 500) return;
            this.isMember = data;
        },
        // 设置在线客服弹框开启
        async SetOnlineServiceIsShow(flag, userid = 1) {
            let resFlag = await this.IsLogin();
            if (!resFlag) return;
            this.onlineServiceIsShow = flag;
        },
        // 获取历史聊天记录
        GetHistoryMessageList(type, count, toId, ref = undefined) {
            let date = new Date();
            this.scrollRef = ref;
            POST(`/message/load`, {
                type,
                count,
                toId,
                updateTime: date.toLocaleString().replace(/\//g, "-"),
            })
                .then((res) => {
                    if (res.code == 0) {
                        this.messagesObj["user" + toId] = res.data;
                    }
                })
                .then((res) => {
                    if (res) ref.value.scrollTop = ref.value.scrollHeight;
                });
        },
        // 设置在线
        OnlineSocket(userid) {
            socket.online(userid);
        },
        // 发送
        SendSocket(fromId, toId, avatarurl, name, contentType, content) {
            let date = new Date();
            let new_message = {
                fromId,
                toId,
                avatarurl,
                name,
                ws_type: 3,
                contentType,
                updateTime: date.toLocaleString().replace(/\//g, "-"),
                content,
            };
            // 更新消息
            this.messagesObj["user" + toId].push(new_message);
            socket.send(new_message, () => { });
        },
        // 处理接收聊天
        DisService(message) {
            const { data } = message;
            const dataObj = JSON.parse(data);
            const { fromId, name } = dataObj;
            new Promise((resolve) => {
                this.messagesObj["user" + fromId].push(dataObj);
                notification.open({
                    duration: null,
                    message: () => `你有一条来自用户${name == '管理员' ? '客服' : name}的消息`,
                    // description: () => `${dataObj.content}`,
                    icon: () => h(SmileOutlined, { style: "color: #108ee9" }),
                });
                resolve(true);
            }).then((res) => {
                // if (res) this.scrollRef.scrollTop = this.scrollRef.scrollHeight;
            });
        },
    },
    persist: {
        enabled: true,
        storage: sessionStorage,
        key: "front",
    },
});
