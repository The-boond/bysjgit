<template>
    <div class="ChangePassword">
        <section class="section">
            <a-form ref="passwordForm" :model="passwordFormState" name="basic" :label-col="{ span: 4 }"
                :wrapper-col="{ span: 8 }" autocomplete="off" @finish="EditPassword">
                <a-form-item label="新密码" name="password" :rules="[{ required: true, message: '请输入密码!' }]">
                    <a-input v-model:value="passwordFormState.password" />
                </a-form-item>
                <a-form-item label="确认新密码" name="newPassword" :rules="[{ required: true, message: '请输入密码!' }]">
                    <a-input v-model:value="passwordFormState.newPassword" />
                </a-form-item>
                <a-form-item :wrapper-col="{ offset: 6, span: 4 }">
                    <a-button class="mainOpera" type="primary" html-type="submit">修改</a-button>
                </a-form-item>
            </a-form>
        </section>
    </div>
</template>

<script setup>
import { ClearReactiveObj } from '@/utils/func';
import { POST } from '@/utils/axios';
import { message } from "ant-design-vue"
import { useStore } from '@/store';
import { userPath } from "@/utils/const/reqUrlPath.js"
let userStore = useStore();
let passwordForm = ref();
let passwordFormState = ref({
    password: '',
    newPassword: '',
});
// 获取用户信息
const EditPassword = async (value) => {
    if (value.password !== value.newPassword) {
        return message.error('两次密码不一致!');
    }
    const resultRes = await POST(`/${userPath}/update`, {
        id: userStore.$state.userid,
        password: value.password
    });
    const { code } = resultRes;
    if (code == 500) return message.error('修改失败');
    passwordForm.value.resetFields();
    message.success('修改成功');
}
</script>

<style lang="scss" scoped>
.ChangePassword {
    width: 100%;
    height: 100%;
    background: #fff;
    overflow-y: auto;

    .section {
        margin-top: 20px;

        :deep(.mainOpera) {
            margin-top: 20px;
            color: $mainOperaColor;
            background-color: $mainOperaBack;
            outline: none;

            &:hover {
                color: $mainOperaColor;
                background-color: $mainOperaBack;
                border: 1px solid #fff;
            }
        }
    }
}
</style>