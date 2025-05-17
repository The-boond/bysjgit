<template>
    <div class="AnnouncementList" ref="contentRef">
        <a-form class="formSearch" ref="formSearchRef" layout="inline" :model="formSearch" @finish="FinishSearch">

            <a-form-item class="formSearch-item" label="标题" name="title">
                <a-input v-model:value="formSearch.title" placeholder="请输入标题" />
            </a-form-item>
            <a-form-item class="formSearch-item">
                <a-space>
                    <a-button type="primary" shape="default" html-type="submit">搜索</a-button>
                    <a-button shape="default" @click="ResetSearch()">重置</a-button>
                </a-space>
            </a-form-item>
            <a-form-item class="formSearch-item">
                <a-space>
                    <a-button type="primary" shape="default" @click="AddAnnouncement">发布公告</a-button>
                </a-space>
            </a-form-item>
        </a-form>
        <a-table class="table" rowKey="id" :dataSource="dataSource" :columns="columns" :pagination="pagination"
            :expand-column-title="200" @change="TableChange">
            <template #bodyCell="{ column, record }">
                <template v-if="column.dataIndex === 'picture'">
                    <a-image
                        v-if="record.picture != undefined"
                        :width="100"
                        :height="100"
                        :src="record.picture"
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
                        <a-button type="link" @click="UpdateRow(record)">修改</a-button>
                        <a-popconfirm title="您确定要删除此条信息吗?" ok-text="是的" cancel-text="取消" @confirm="DelRow(record)">
                            <a-button type="link" danger>删除</a-button>
                        </a-popconfirm>
                    </a-space>
                </template>
            </template>
            <template #expandedRowRender="{ record }">
                <p style="margin: 0">
                    {{ record.introduction }}
                </p>
            </template>
        </a-table>

    </div>
</template>
<script setup>
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
let formSearch = reactive({});
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
//
const FinishSearch = () => {
    GetAnnouncementListData();
}
const ResetSearch = () => {
    formSearchRef.value.resetFields();
    GetAnnouncementListData();
}
const AddAnnouncement = () => {
    router.push({
        name: 'AnnouncementCreate',
    })
}
// 获取数据
const GetAnnouncementListData = async () => {
    let resultRes = await POST(`/news/page`, Object.assign(requireParams, formSearch));
    let { code, data } = resultRes;
    if (code != '0') return message.error('获取列表信息失败');
    let { list, total } = data;
    dataSource.value = list;
    requireParams.total = Number(total);
}
const TableChange = (pagination) => {
    let { current, pageSize } = pagination
    requireParams.page = current;
    requireParams.limit = pageSize;
    GetAnnouncementListData();
}
const UpdateRow = (rowVal = undefined) => {
    router.push({
        name: 'AnnouncementCreate',
        state: {
            type: 1,
            editVal: JSON.stringify(rowVal)
        }
    })
}
// 删除
const DelRow = async ({id}) => {
    let data = [id];
    let resultRes = await POST(`/news/delete`, data);
    let { code } = resultRes;
    if (code == 500) return message.error('删除失败');
    message.success('删除成功');
    GetAnnouncementListData();
}

onMounted(() => {
    GetAnnouncementListData();
})
</script>
<style lang="scss" scoped>
.AnnouncementList {
    width: 100%;
    height: 100%;
    display: flex;
    flex-direction: column;

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