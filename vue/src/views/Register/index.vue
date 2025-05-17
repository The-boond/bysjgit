<template>
    <div class="Login">
        <section class="contact" id="contact">
            <div class="image">
                <img src="@/assets/image/left.webp" alt="">
            </div>
            <form action="">
                <h3>注 册</h3>
                <a-form :model="registerForm" :rules="registerRules" @finish="RegisterFinish">
                    <a-form-item name="username">
                        <a-input class="box" :bordered="false" v-model:value="registerForm.username"
                            placeholder="请输入账号"></a-input>
                    </a-form-item>
                    <a-form-item name="password">
                        <a-input-password class="box" :bordered="false" v-model:value="registerForm.password" type="password"
                            placeholder="请输入密码"></a-input-password>
                    </a-form-item>
                    <a-form-item name="configPassword">
                        <a-input-password class="box" :bordered="false" v-model:value="registerForm.configPassword" type="password"
                            placeholder="请再次输入密码"></a-input-password>
                    </a-form-item>
                    <a-form-item name="name">
                        <a-input class="box" :bordered="false" v-model:value="registerForm.name"
                            placeholder="请输入昵称"></a-input>
                    </a-form-item>
                    <a-form-item name="email">
                        <a-input class="box" :bordered="false" v-model:value="registerForm.email"
                            placeholder="请输入邮箱"></a-input>
                    </a-form-item>
                    <a-form-item name="phone">
                        <a-input class="box" :bordered="false" v-model:value="registerForm.phone"
                            placeholder="请输入手机号"></a-input>
                    </a-form-item>
                    <a-form-item>
                        <a-button class="registerBtn" html-type="submit">注册</a-button>
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
const useState = useStore();
const router = useRouter();
const route = useRoute();
const imgError = ref(import.meta.env.VITE_IMG_ERROR);
const registerForm = reactive({});
const registerRules = {
    username: [{
        required: true,
        message: '请输入账号!',
        trigger: 'blur',
    }],
    password: [
        {
            required: true,
            message: '请输入密码!',
            trigger: 'blur',
        }
    ],
    configPassword: [
        {
            required: true,
            trigger: 'blur',
            validator: (rule, value,) => {
                if (value == registerForm['password']) return Promise.resolve('');
                else return Promise.reject('密码不一致，请重新输入。');
            }
        }
    ],
    name: [
        {
            required: true,
            message: '请输入姓名!',
            trigger: 'blur',
        }
    ],
    email: [
        {
            required: true,
            trigger: 'blur',
            validator: verify.isEmailNotNull
        }
    ],
    phone: [
        {
            required: true,
            trigger: 'blur',
            validator: verify.isPhoneNotNull
        }
    ]
}
// 提交注册
const RegisterFinish = async () => {
    let resultFlag = await useState.Register(registerForm);
    if (resultFlag == true) {
        message.success({ content: '注册成功！' });
        router.replace('/index');
    } else {
        message.error({ content: `${resultFlag}!` });
    };
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
        .registerBtn {
            width: 100%;
            height: 50px;
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