<template>
  <div class="container">
    <div class="login__container">
      <div class="top__content">
        <!-- <p>Don't you have account?</p>
        <button>Sign Up</button> -->
        <h1>WELCOME</h1>
      </div>
      <div class="bottom__content">
        <form action="#">
          <div class="form__group">
            <a-input class="password" v-model:value="userInfo.formModel.username" placeholder="请输入账号">
              <template #prefix>
                <UserOutlined />
              </template>
            </a-input>
          </div>
          <div class="form__group">
            <a-input class="password" v-model:value="userInfo.formModel.password" type="password" placeholder="请输入密码">
              <template #prefix>
                <LockOutlined />
              </template>
            </a-input>
          </div>
          <a-button type="primary" @click="OnSubmit">登 录</a-button>
          <!-- <p><a href="#">Forgot your password?</a></p> -->
        </form>
      </div>
    </div>
  </div>
</template>
<script setup>
import { POST } from '@/utils/axios';
import { useRouter } from "vue-router";
import { useStore } from "@/store";
import { message } from "ant-design-vue";
let useState = useStore();
const router = useRouter();
let title = import.meta.env.VITE_WEB_TITLE;
const userInfo = reactive({
  formModel: {
    username: "",
    password: "",
    captcha: "",
    role: "0",
  },
});
const toggleFlag = ref(false);
// 重置按钮
const ResetBtn = (flag = undefined) => {
  toggleFlag.value = flag ? false : true;
}
// 发送邮箱
const SendEmail = async () => {
  if (userInfo.formModel.username == '') return message.error({ content: `账号不能为空!` });
  const resultRes = await POST(
    `/admin/sendEmail`,
    {
      username: userInfo.formModel.username
    }
  );
  if (resultRes.code == 0) {
    message.success({ content: `发送成功，请到邮箱查看!` });
  } else {
    message.error({ content: `${resultRes.msg}!` });
  }
}
// 重置密码
const ResetSubmit = async () => {
  let data = {
    username: userInfo.formModel.username,
    captcha: userInfo.formModel.captcha,
  }
  let resultRes = await POST(`/admin/resetPass`, data);
  if (resultRes.code == 500) return message.error(resultRes.msg);
  message.success(resultRes.data, 10);
}
const OnSubmit = async () => {
  let resultFlag = await useState.Login(userInfo);
  if (resultFlag === true) {
    router.push("/");
    message.success({ content: "登陆成功!" });
  } else {
    message.error({ content: `${resultFlag}!` });
  }
};

</script>
<style lang="scss" scoped>
@import url("https://fonts.googleapis.com/css2?family=Comic+Neue:wght@400;700&display=swap");


body {
  font-family: "Comic Neue", cursive;
}

.container {
  min-height: 100vh;
  background-image: linear-gradient(rgba(255, 255, 255, 0.25),
      rgba(255, 255, 255, 0.25)),
    url("./img/bg.jpg");
  background-position: center center;
  background-size: cover;
  background-repeat: no-repeat;
  display: flex;
  align-items: center;
  justify-content: center;
}

.login__container {
  min-height: 600px;
  width: 100%;
  max-width: 450px;
  background-image: url("./img/header.png");
  background-position: center center;
  background-size: cover;
  background-repeat: no-repeat;
  display: grid;
  grid-template-rows: 1fr 1fr;
  box-shadow: 10px 10px 30px rgba(0, 0, 0, 0.5);
  border-radius: 10px;
}

.top__content {
  padding: 2rem;
  display: grid;
  place-content: end;
  justify-content: center;
  gap: 2rem;
  text-align: center;
}

.top__content p {
  font-size: 1.2rem;
  color: #ffffff;
}

.top__content button {
  padding: 0.5rem 2rem;
  max-width: fit-content;
  margin: auto;
  outline: none;
  border: none;
  font-size: 1rem;
  font-weight: 700;
  font-family: "Comic Neue", cursive;
  border-radius: 2rem;
  color: #1268a3;
  background-color: #ffffff;
  cursor: pointer;
}

.top__content h1 {
  font-size: 2.5rem;
  font-weight: 700;
  color: #ffffff;
}

.bottom__content {
  padding: 2rem;
  display: grid;
  place-content: center;
}

.bottom__content form {
  width: 100%;
  max-width: 300px;
  display: grid;
  gap: 1rem;
  text-align: center;
}

.form__group {
  display: flex;
  align-items: center;
  background: linear-gradient(to bottom, #5eb6dc, #1268a3);
  border-radius: 2rem;
}

.form__group span {
  color: #ffffff;
  padding: 0 10px;
}

.form__group .password {
  border-radius: 2rem;
  padding: 0.5rem 1rem;
  outline: none;
  border: none;
  font-family: "Comic Neue", cursive;
  color: #ffffff;
  background-color: transparent;
}

:deep(.ant-input) {
  color: #ffffff !important;
  background-color: transparent;
}

.bottom__content input::placeholder {
  color: #ffffff;
}

.bottom__content :deep(.ant-btn) {
  width: 100px;
  margin: auto;
  outline: none;
  border: none;
  font-size: 1rem;
  font-family: "Comic Neue", cursive;
  border-radius: 2rem;
  color: #ffffff;
  background: linear-gradient(to bottom, #5eb6dc, #1268a3);
  cursor: pointer;
  transition: 0.3s;
}

.bottom__content :deep(.ant-btn):hover {
  box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.5);
}

.bottom__content p a {
  text-decoration: none;
  color: #5eb6dc;
}

.bottom__content p a:hover {
  color: #1268a3;
}
</style>
