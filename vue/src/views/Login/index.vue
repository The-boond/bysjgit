<template>
    <div class="Login">
        <section class="contact" id="contact">
            <div class="image">
                <img src="@/assets/image/left.webp" alt="">
            </div>
            <form action="">
                <h3>登 陆</h3>
                <a-form :model="loginForm" @finish="LoginFinish">
                    <a-form-item name="username">
                        <a-input class="box" :bordered="false" v-model:value="loginForm.username"
                            placeholder="请输入账号"></a-input>
                    </a-form-item>
                    <a-form-item name="password">
                        <a-input-password class="box" :bordered="false" v-model:value="loginForm.password" type="password"
                            placeholder="请输入密码"></a-input-password>
                    </a-form-item>
                    <a-form-item name="password">
                        <div class="verificationCode">
                            <a-input
                                class="box"
                                v-model:value="loginForm.captcha">
                            </a-input>
                                <div class="verificationCode-code" @click="GetVerificationCode">
                                <p class="verificationCode-code-content" v-if="codeBase64 == ''">点击获取验证码</p>
                                <img :src="codeBase64" v-else>
                            </div>
                        </div>
                    </a-form-item>

                    <a-form-item>
                        <a-button class="loginBtn" html-type="submit">登陆</a-button>

                        <a-button
                                class="loginBtn"
                                html-type="button"
                                @click="handleRegister"
                        >
                            注册
                        </a-button>
                    </a-form-item>
                </a-form>
            </form>
        </section>
    </div>
</template>

<script setup>
import verify from '@/utils/verify';
import { ClearReactiveObj } from '@/utils/func';
import { useStore } from '@/store';
import { POST } from '@/utils/axios';
import { message } from 'ant-design-vue';
import { useRouter } from 'vue-router';
const useState = useStore();
const router = useRouter();
const route = useRoute();
const imgError = ref(import.meta.env.VITE_IMG_ERROR);
const loginForm = reactive({});
const codeBase64 = ref('');
const verificationCodeData = reactive({});
// 获取账号登录验证码
const GetVerificationCode = async () => {
    let resultObj = await useState.GetCodeImage();
    Object.assign(verificationCodeData, resultObj);
    codeBase64.value = 'data:image/jpeg;base64,' + resultObj.img;
}
// 提交
const LoginFinish = async () => {
    const resultFlag = await useState.Login(Object.assign(loginForm,{
        key: verificationCodeData?.uuid
    }));
    if(resultFlag === true) {
        router.push('/index')
        message.success({ content: '登陆成功!'});
    } else {
        message.error({ content: resultFlag + '!' })
    }
}
const handleRegister = () => {
    router.push({
        path: '/register',
    })
}
</script>
<style lang="scss" scoped>
@mixin form-btn{
  width:100%;
  text-align: center;

  &:hover{
    background: #130f40;
  }
}
.Login {
    width: 100%;
    min-height: 50vh;
    background: #fff;
    // overflow-y: auto;
    .contact {
        display: flex;
        padding: 0;
        .image{
            width: 800px;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        :deep(.ant-form) {
            padding: 0;
        }
        form{
            flex: 1 1 1rem;
            padding:2rem 15%;


            h3{
                font-size: 3rem;
                padding-bottom: 1rem;
                color:#130f40;
            }

            .box{
                width: 100%;
                border-bottom: .2rem solid #130f40;
                border-width: .1rem;
                font-size: 1rem;
                text-transform: none;
                color:#130f40;
                padding: .5rem 0;
                margin: .5rem 0;
            }
        }

        .verificationCode{
                width: 100%;
                display: flex;
                &-code{
                    width: 200px;
                    height: 50px;
                    margin-left: 10px;
                    border: 1px solid #eee;
                    border-radius: 8px;
                    cursor: pointer;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    &-content{
                        font-size: 12px;
                        color: #999;
                    }
                    >img{
                        width: 100%;
                        height: 100%;

                    }
                }
        }
        .loginBtn {
            width: 100%;
            height: 45px;
            box-sizing: border-box;
            margin-top: 1rem;
            border-radius: 5rem;
            border: .2rem solid #130f40;
            cursor: pointer;
            background: none;
            color: #130f40;
            font-size: 1.2rem;
            overflow: hidden;
            z-index: 0;
            position: relative;

            &::before {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                height: 100%;
                width: 100%;
                background: #00b0ff;
                z-index: -1;
                transition: .2s linear;
                clip-path: circle(0% at 0% 5%);
            }

            &:hover::before {
                clip-path: circle(100%);
            }

            &:hover {
                color: #fff;
            }
        }
    }
}


</style>