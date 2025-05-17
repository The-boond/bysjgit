
          import { defineStore } from "pinia";
          import { POST } from "@/utils/axios";
          import { useradminPath } from "@/utils/const/reqUrlPath";
          import roleNameRoutes from "@/utils/const/routerConst";
          import router from "@/router";
          import { socket } from "@/utils/socket";
          import { SmileOutlined } from "@ant-design/icons-vue";
          import { notification } from "ant-design-vue";
          import { h } from "vue";
          let rootModules = import.meta.glob("../../views/**/index.vue");
          export const useStore = defineStore('router', {
            state: () => ({
                userUrl: {
                  0:useradminPath
                },
                messagesObj: {}
            }),
          getters: {
              gettersRouter() {
                  return roleNameRoutes;
              },
          },
          actions: {
            // 获取ReqUrl
            GetReqUrl() {
                return this.userUrl[this.$state.role];
            },
            // 配置路由
            async ConfigRouter(infoData = undefined) {
                let { userUrl, role } = this.$state;
                if (this.$state.role == undefined) return;
                let resultArr = this.gettersRouter[this.GetReqUrl()].map((i) => {
                    return {
                        path: i.path,
                        name: i.name,
                        meta: i.meta,
                        icon: i.icon,
                        component: rootModules[`../../views/${i.name}/index.vue`],
                    };
                });
    
                this.routes = [].concat(resultArr);
                return this.disRoutesData(resultArr);
            },
            async disRoutesData(arr) {
                let promiseArr = [];
                arr.forEach((i) => {
                    let newPro = new Promise((resolve) => {
                        router.addRoute("Home", i);
                        resolve(true);
                        setTimeout(() => {
                            resolve(router.hasRoute(i.name));
                        }, 0);
                    });
                    promiseArr.push(newPro);
                });
                let result = await Promise.all(promiseArr);
                let flag = result.some((i) => i == false);
                return !flag;
            },
            // 设置用户的信息
            SetUserInfo(state) {
                this.$patch(state);
                sessionStorage.token =
                    state != undefined ? state.token : sessionStorage.token;
            },
            // 重置用户信息
            ResetUserInfo() {
                sessionStorage.clear();
            },
            // 登录
            async Login(formVal) {
                let { formModel } = formVal;
                const resultRes = await POST(`/${this.$state.userUrl[formModel.role]}/login`,formModel);
                if (resultRes.code == 0) {
                  this.ConfigRouter(resultRes.data);
                  this.SetUserInfo(resultRes.data);
                  return true;
                } else {
                  return resultRes.msg;
                }
            },
            // 注册
            async Register(formVal) {
              let { formModel } = formVal;
              let resultRes = await POST(`/${this.$state.userUrl[formModel.role]}/register`,formModel);
              if (resultRes.code == 0) {
                this.SetUserInfo(resultRes.data);
                return true;
              } else {
                return resultRes.msg;
              }
            },
            // 是否登录
            async IsLogin() {
              const resultRes = await POST('/auth/isAdminLogin', {});
              if (resultRes.code == 500) {
                return false;
              }
              if (resultRes.data == "当前会话是否登录：false") {
                return false;
              }
              this.SetUserInfo();
              return true;
            },
            // 登出
            async LoginOut() {
              sessionStorage.removeItem('behind');
              const resultRes = await POST('/auth/logout', {});
              if (resultRes.code == 500) return false;
              this.ResetUserInfo();
              return true;
            },
          // 获取历史聊天记录
          GetHistoryMessageList(type, count, toId, ref = undefined) {
            this.scrollRef = ref;
            let date = new Date();
            POST('/message/load', {
              type,
              count,
              toId,
              updateTime: date.toLocaleString().split("/").join("-"),
            })
              .then((res) => {
                if (res.code == 0) {
                  this.messagesObj["user" + toId] = res.data;
                  return true;
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
              updateTime: date.toLocaleString().split("/").join("-"),
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
            if (dataObj.fromId === this.$state.userid) return;
            new Promise((resolve) => {
              this.messagesObj["user" + dataObj.fromId].push(dataObj);
              notification.open({
                message: () => `你有一条来自用户${ dataObj.name } 的消息`,
                description: () => `${ dataObj.content } `,
                icon: () => h(SmileOutlined, { style: "color: #108ee9" }),
              });
              resolve(true);
            }).then((res) => {
              if (res) this.scrollRef.scrollTop = this.scrollRef.scrollHeight;
            });
          },
        },
        persist: {
          enabled: true,
          key: "behind",
          storage: sessionStorage,
        },
      });