<template>
    <div class="ChangePassword">
        <p class="title">修改密码</p>
        <a-divider />
        <a-form ref="formRef" :model="formData" :rules="formRules" v-bind="layout" @finish="UpdatePassWord">
            <a-form-item label="新密码" name="password">
                <a-input v-model:value="formData.password" allowClear placeholder="请输入密码" />
            </a-form-item>
            <a-form-item label="确认新密码" name="newPassword">
                <a-input v-model:value="formData.newPassword" allowClear placeholder="请再次输入密码" />
            </a-form-item>
            <a-form-item :wrapper-col="{ offset: 4, span: 10 }">
                <a-button type="primary" html-type="submit">修改密码</a-button>
            </a-form-item>
        </a-form>
    </div>
</template>

<script setup>
import { useStore } from '@/store';
import { POST } from '@/utils/axios';
import { message } from 'ant-design-vue';
const useState = useStore();
// form
let formRef = ref(null);
const formData = reactive({});
const formRules = {
    password: [
        {
            required: true,
            message: '请输入密码!',
            trigger: 'blur',
        }
    ],
    newPassword: [
        {
            required: true,
            message: '请再次输入密码!',
            trigger: 'blur',
        }
    ],
};
const layout = {
    labelCol: { style: { width: '100px' } },
    wrapperCol: { span: 6 },
};
// 修改密码
const UpdatePassWord = async (value) => {
    if (value.password !== value.newPassword) {
        return message.error('两次密码不一致!');
    }
    let { userid } = useState.$state;
    let resultRes = await POST(`/${useState.GetReqUrl()}/update`, {
        id: userid,
        password: value.password
    });
    let { code } = resultRes;
    if (code != 0) return message.error('修改失败');
    formData.password = ''
    formData.newPassword = ''
    message.success('修改成功');
}
</script>

<style lang="scss" scoped>
.ChangePassword {
    .title {
        font-size: 20px;
        font-weight: 800;
    }
}
</style>