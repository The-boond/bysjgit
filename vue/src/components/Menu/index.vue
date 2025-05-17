<template>
  <div class="Menu">
    <div class="containerTop">
      <!-- 登录注册入口（新增登录状态判断） -->
      <div class="left" v-if="!useState.$state.name">
        <p class="left-name" @click="CommonClick('账号登陆')">账号登陆</p>
        <a-divider type="vertical" />
        <p class="left-name" @click="CommonClick('注册')">注册</p>
      </div>

      <div class="right">
        <a-avatar size="small" :src="useState.$state.avatarurl" />
        <p class="right-name">
          {{ useState.$state.name ? useState.$state.name : "请登陆" }}
        </p>
        <a-divider type="vertical" />
        <p
                class="right-name"
                v-if="useState.$state.name"
                @click="CommonClick('登出')"
        >
          登出
        </p>
        <a-divider type="vertical" v-if="useState.$state.name" />
        <p class="right-name" @click="CommonClick('我的资料')">我的资料</p>
      </div>
    </div>

    <div class="containerBottom">
      <p class="containerBottom-title">{{ title }}</p>
      <div class="containerBottom-menu">
        <p class="containerBottom-menu-name" @click="CommonClick('首页')">
          首页
        </p>
        <p class="containerBottom-menu-name" @click="CommonClick('考勤打卡')">
          考勤打卡
        </p>
        <p class="containerBottom-menu-name" @click="CommonClick('发布资料')">
          发布资料
        </p>
        <p class="containerBottom-menu-name" @click="CommonClick('工作计划')">
          工作计划
        </p>
        <p class="containerBottom-menu-name" @click="CommonClick('报销')">
          报销
        </p>
        <p class="containerBottom-menu-name" @click="CommonClick('请假')">
          请假
        </p>
        <p class="containerBottom-menu-name" @click="CommonClick('资料')">
          资料
        </p>
        <p class="containerBottom-menu-name" @click="CommonClick('办公用品')">
          办公用品
        </p>
        <p class="containerBottom-menu-name" @click="CommonClick('记录')">
          记录
        </p>
        <p class="containerBottom-menu-name" @click="CommonClick('联系管理')">
          联系管理
        </p>
        <p class="containerBottom-menu-name" @click="CommonClick('公告')">
          公告
        </p>
        <p class="containerBottom-menu-name" @click="CommonClick('关于我们')">
          关于我们
        </p>
      </div>
    </div>
  </div>
</template>

<script setup>
  import { useStore } from "@/store";
  import { useRouter } from "vue-router";
  import { message } from "ant-design-vue";

  const router = useRouter();
  const useState = useStore();
  const title = import.meta.env.VITE_WEB_TITLE;

  // 统一处理菜单点击事件
  const CommonClick = (name) => {
    switch (name) {
      case "首页":
        router.push("/index");
        break;
      case "账号登陆":
        router.push("/login");
        break;
      case "注册":
        router.push("/register");
        break;
      case "公告":
        router.push("/announcement");
        break;
      case "我的资料":
        DisLogin();
        router.push("/myProfile");
        break;
      case "关于我们":
        router.push("/abouts");
        break;
      case "登出":
        if (!useState.$state.username) return;
        useState.LoginOut().then((res) => {
          if (res) {
            message.success("已登出");
            router.push("/index");
          }
        });
        break;
      case "联系管理":
        DisLogin();
        router.push("/customerService");
        break;
      case "发布资料":
        router.push("/informationssCreate");
        break;
      case "工作计划":
        router.push("/workplanCreate");
        break;
      case "报销":
        router.push("/claimsCreate");
        break;
      case "请假":
        router.push("/leavessCreate");
        break;
      case "薪资":
        router.push("/SalariessClassify");
        break;
      case "考勤打卡":
        router.push("/kaoQIn");
        break;
      case "办公用品":
        router.push("/OfficesuppliesClassify");
        break;
      case "资料":
        router.push("/InformationssClassify");
        break;
      case "记录":
        router.push("/Rests");
        break;
    }
  };

  // 登录状态验证
  const DisLogin = async () => {
    if (!(await useState.IsLogin())) {
      router.push("/login");
    }
  };
</script>

<style lang="scss" scoped>
  /* 保持原有样式不变 */
  .Menu {
    width: 100%;
    display: flex;
    flex-direction: column;
    align-items: center;
    background: #f5f4f1;
    z-index: 999;

    .containerTop {
      width: 60%;
      height: 32px;
      display: flex;
      align-items: center;
      justify-content: space-between;

      .left {
        height: 100%;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 12px;
        color: #666;
        cursor: pointer;

        &-name {
          line-height: 50px;
          margin: 0 5px;
        }
      }

      .right {
        display: flex;
        align-items: center;
        font-size: 12px;
        color: #666;
        cursor: pointer;

        &-name {
          line-height: 50px;
          margin: 0 5px;
        }
      }
    }

    .containerBottom {
      width: 100%;
      height: 100px;
      padding: 0 5%;
      box-sizing: border-box;
      display: flex;
      align-items: center;
      justify-content: space-between;
      background: url("@/assets/indexImg/menuBack.jpg") no-repeat;
      background-position: center bottom;
      background-size: cover;

      &-title {
        color: rgb(0, 160, 233);
        font-weight: bold;
        font-size: 32px;
        letter-spacing: 4px;
      }

      &-menu {
        display: flex;

        &-name {
          margin-right: 15px;
          font-size: 16px;
          cursor: pointer;
          color: #fff;
        }
      }
    }
  }

  /* 保持原有分隔线样式 */
  .ant-divider-vertical {
    height: 1em;
    margin: 0 8px;
    vertical-align: middle;
  }
</style>