<template>
    <div class="UserList" ref="contentRef">
        <a-form class="formSearch" ref="formSearchRef" layout="inline" :model="formSearch" @finish="FinishSearch">
            <a-form-item class="formSearch-item" label="姓名" name="name">
                <a-input v-model:value="formSearch.name" placeholder="请输入姓名" />
            </a-form-item>
            <a-form-item class="formSearch-item">
                <a-space>
                    <a-button type="primary" shape="default" html-type="submit">搜索</a-button>
                    <a-button shape="default" @click="ResetSearch()">重置</a-button>
                </a-space>
            </a-form-item>
            <a-form-item class="formSearch-item">
                <a-space>
                    <a-button type="primary" shape="default" @click="CreateAndUpdateVisible(1)">新增用户</a-button>
                </a-space>
            </a-form-item>
        </a-form>
        <a-table class="table" :dataSource="dataSource" :columns="columns" :pagination="pagination" @change="TableChange">
            <template #bodyCell="{ column, record }">
                <template v-if="column.dataIndex === 'avatarurl'">
                    <a-avatar>
                        <template #icon>
                            <img v-if="record.avatarurl != undefined" :src="record.avatarurl" />
                            <UserOutlined v-else/>
                        </template>
                    </a-avatar>
                </template>
                <template v-if="column.dataIndex === 'opera'">
                    <a-space>
                        <a-button type="link" @click="CreateAndUpdateVisible(0, record)">修改</a-button>
                        <a-button type="link" @click="ResetPassword(record)">重置密码</a-button>
                        <a-popconfirm title="您确定要删除此条信息吗?" ok-text="是的" cancel-text="取消" @confirm="DelRow(record)">
                            <a-button type="link" danger>删除</a-button>
                        </a-popconfirm>
                    </a-space>
                </template>
            </template>
        </a-table>
        <a-modal v-model:open="userVisible" :title="modalTitle" :width="500" :bodyStyle="{
            marginTop: '20px'
        }" :footer="null">
            <a-form ref="formUserRef" :model="formUser" :rules="formUserRules" v-bind="formUserLayout"
                @finish="CreateAndUpdateClick">
                <a-form-item class="formSearch-item" label="用户姓名" name="name">
                    <a-input v-model:value="formUser.name" placeholder="请输入用户姓名" />
                </a-form-item>
                <a-form-item class="formSearch-item" label="账号" name="username">
                    <a-input v-model:value="formUser.username" :disabled="formUserDisabled" placeholder="请输入账号" />
                </a-form-item>
                <a-form-item class="formSearch-item" label="密码" name="password">
                    <a-input v-model:value="formUser.password" :disabled="formUserDisabled" placeholder="请输入密码" />
                </a-form-item>
                <a-form-item class="formSearch-item" label="手机号" name="phone">
                    <a-input v-model:value="formUser.phone" placeholder="请输入手机号" />
                </a-form-item>
                <a-form-item class="formSearch-item" label="邮箱" name="email">
                    <a-input v-model:value="formUser.email" placeholder="请输入邮箱" />
                </a-form-item>
                <a-form-item class="formSearch-item" :wrapper-col="{ span: 0, offset: 16 }">
                    <a-space>
                        <a-button type="primary" html-type="submit">确定</a-button>
                        <a-button @click="userVisible = false">取消</a-button>
                    </a-space>
                </a-form-item>
            </a-form>
        </a-modal>
    </div>
</template>
<script setup>
import verify from '@/utils/verify';
import { ClearReactiveObj } from '@/utils/func';
import { useStore } from '@/store';
import { POST } from '@/utils/axios';
import { columns } from './index';
import { message } from 'ant-design-vue';
const useState = useStore();
const router = useRouter();
const route = useRoute();
const imgError = ref(import.meta.env.VITE_IMG_ERROR);
//
let formSearchRef = ref(null);
const formSearch = reactive({});
const dataSource = ref([]); // 表格数据
const requireParams = reactive({ // 获取远程数据需要传的参数 
    page: 1,
    limit: 10,
    total: 10,
    order: 'addtime'
})
const pagination = computed(() => ({
    current: requireParams.page,
    pageSize: requireParams.limit, // 每页显示的数据条数
    total: requireParams.total,
}));
let userVisible = ref(false);
let modalTitle = ref('');
let formUserRef = ref(null);
let formUserDisabled = ref(false);
const formUser = reactive({});
const formUserRules = {
    name: [
        {
            required: true,
            message: '请输入用户姓名!',
            trigger: 'blur',
        }
    ],
    username: [
        {
            required: true,
            message: '请输入用户账号!',
            trigger: 'blur',
        }
    ],
    password: [
        {
            required: true,
            message: '请输入密码!',
            trigger: 'blur',
        }
    ],
    phone: [
        {
            required: true,
            trigger: 'blur',
            validator: verify.isPhoneNotNull
        }
    ],
    email: [
        {
            required: true,
            trigger: 'blur',
            validator: verify.isEmailNotNull
        }
    ]

};
const formUserLayout = {
    labelCol: { style: { width: '100px' } },
    // wrapperCol: { span: 6 },
};
//
const FinishSearch = () => {
    GetUserData();
}
const ResetSearch = () => {
    formSearchRef.value.resetFields();
    GetUserData();
}
const CreateAndUpdateVisible = (type, rowVal = undefined) => {
    modalTitle.value = type ? '创建' : '修改';
    userVisible.value = true;
    formUserDisabled.value = type ? false : true;
    ClearReactiveObj(formUser);
    if (!type) Object.assign(formUser, rowVal);
}
const CreateAndUpdateClick = async () => {
    let resultRes = await POST(`/user/${formUser.id ? 'update' : 'save'}`, Object.assign({
        role: '10'
    }, formUser, {
        username: formUser.id ? undefined : formUser.username,
        password: formUser.id ? undefined : formUser.password,
    }))
    let { code, data } = resultRes;
    if (code == 500) return message.error(`${modalTitle.value}失败`);
    userVisible.value = false;
    message.success(`${modalTitle.value}成功`);
    GetUserData();
}

// 获取数据
const GetUserData = async () => {
    const { code, data } = await POST(`/user/page`, Object.assign(requireParams, formSearch));
    if (code == 500) return message.error('获取列表信息失败');
    const { list, total } = data;
    dataSource.value = list;
    requireParams.total = Number(total);
}
const TableChange = (pagination) => {
    let { current, pageSize } = pagination
    requireParams.page = current;
    requireParams.limit = pageSize;
    GetUserData();
}
// 重置密码
const ResetPassword = async ({ id, username }) => {
    let resultRes = await POST(`/user/resetPass`, {
        id,
        username
    });
    let { code, data, msg } = resultRes;
    if (code == 500) return message.error(msg);
    message.success(data);
    GetUserData();
}
// 删除
const DelRow = async ({ id }) => {
    let data = [id];
    let resultRes = await POST(`/user/delete`, data);
    let { code } = resultRes;
    if (code == 500) return message.error('删除失败');
    message.success(`删除成功`);
    GetUserData();
}
onMounted(() => {
    GetUserData();

})
</script>
<style lang="scss" scoped>
.UserList {
    width: 100%;
    height: 100%;
    display: flex;
    flex-direction: column;
    overflow-y: auto;

    .formSearch {
        margin-bottom: 5px;

        &-item {
            margin-bottom: 5px;
        }
    }

    .table {
        width: 100%;
    }
}

:deep(.operaList) {
    display: flex;
    justify-content: flex-end;
}
</style>