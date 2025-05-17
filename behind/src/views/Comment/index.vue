<template>
    <div class="Comment" ref="contentRef">
        <a-form class="formSearch" ref="formSearchRef" layout="inline" :model="formSearch" @finish="FinishSearch">
            <a-form-item class="formSearch-item" label="用户名" name="nickname">
                <a-input v-model:value="formSearch.nickname" placeholder="请输入用户名" />
            </a-form-item>
            <a-form-item class="formSearch-item" label="评论内容" name="content">
                <a-input v-model:value="formSearch.content" placeholder="请输入评论内容" />
            </a-form-item>
            <a-form-item class="formSearch-item">
                <a-space>
                    <a-button type="primary" shape="default" html-type="submit">搜索</a-button>
                    <a-button shape="default" @click="ResetSearch()">重置</a-button>
                </a-space>
            </a-form-item>
        </a-form>
        <a-table class="table" :dataSource="dataSource" :columns="columns" :pagination="pagination"
            :expand-column-width="100" @change="TableChange">
            <template #bodyCell="{ column, record }">
                <template v-if="column.dataIndex === 'avatarurl'">
                    <a-image
                        v-if="record.avatarurl != undefined"
                        :width="100"
                        :height="100"
                        :src="record.avatarurl"
                        :fallback="imgError"
                    />
                    <a-image
                        v-else
                        :width="100"
                        :height="100"
                        src="https://www.antdv.com/#error"
                        :fallback="imgError"
                    />
                </template>
                <template v-if="column.dataIndex === 'opera'">
                    <a-space>
                        <a-button type="link" @click="ReplyComment(record)">回复</a-button>
                        <a-popconfirm title="您确定要删除此条信息吗?" ok-text="是的" cancel-text="取消" @confirm="DelRow(record)">
                            <a>删除</a>
                        </a-popconfirm>
                    </a-space>
                </template>
            </template>
        </a-table>
        <a-modal v-model:open="replyVisible" title="回复评论" :width="600" :bodyStyle="{
            marginTop: '20px'
        }" @ok="ReplyCommentClick">
            <!-- @finish="FinishSearch" bcontent -->
            <a-form :model="formReply">
                <a-form-item class="formSearch-item" label="回复" name="content">
                    <a-textarea v-model:value="formReply.content" :rows="4" placeholder="回复信息" :maxlength="6" />
                </a-form-item>
            </a-form>
        </a-modal>
    </div>
</template>
<script setup>
import { useStore } from '@/store';
import { POST } from '@/utils/axios';
import { columns } from './index';
import { message } from 'ant-design-vue';
const contentRef = ref();
const useState = useStore();
// 搜索Form
let formSearchRef = ref(null);
let formSearch = reactive({});
// 表格
const dataSource = ref([]); // 表格数据
const requireParams = reactive({ // 获取远程数据需要传的参数 
    page: 1,
    limit: 10,
    total: 10,
    // order: 'addtime'
})
const pagination = computed(() => ({
    current: requireParams.page,
    pageSize: requireParams.limit, // 每页显示的数据条数
    total: requireParams.total,
}));
//
const replyVisible = ref(false);
const formReply = reactive({});
const FinishSearch = () => {
    GetCommentData();
}
const ResetSearch = () => {
    formSearchRef.value.resetFields();
    GetCommentData();
}
// 获取数据
const GetCommentData = async () => {
    let resultRes = await POST(`/discuss/page`, Object.assign(requireParams, formSearch));
    let { code, data } = resultRes;
    if (code != '0') return message.error('获取列表信息失败');
    let { list, total } = data;
    dataSource.value = list;
    requireParams.total = Number(total);
}
// 表格分页
const TableChange = (pagination) => {
    let { current, pageSize } = pagination
    requireParams.page = current;
    requireParams.limit = pageSize;
    GetCommentData();
}
const ReplyComment = (record) => {
    replyVisible.value = true;
    Object.assign(formReply, record, {
        content: ''
    })
}
const ReplyCommentClick = async () => {


    let resultRes = await POST(`/discuss/save`, {
        userid: useState.$state.userid,
        refid: formReply.refid,
        content: formReply.content,
        parentId: formReply.id
    });
    let { code, data } = resultRes;
    if (code == 500) return message.error('回复失败');
    replyVisible.value = false;
    message.success('回复成功');
    GetCommentData();
}
const DelRow = async ({ id }) => {
    let data = [id];
    let resultRes = await POST('/discuss/delete', data);
    let { code } = resultRes;
    if (code == 500) return message.error('删除失败');
    message.success('删除成功');
    GetCommentData();
}
onMounted(() => {
    GetCommentData();
})
</script>
<style lang="scss" scoped>
.Comment {
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