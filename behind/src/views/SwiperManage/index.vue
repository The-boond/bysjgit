<template>
    <div class="SwiperManage">
        <div class="title">
            <p>上传轮播图</p>
            <a-upload v-model:file-list="fileList" name="file" action="/api/file/upload" :showUploadList="false"
                @change="UploadChange">
                <a-button>
                    <upload-outlined></upload-outlined>上传图片
                </a-button>
            </a-upload>
        </div>
        <a-divider />
        <div class="content" ref="contentRef">
            <div class="content-carouse">
                <a-carousel class="carouse" :style="{
                    width: `${carouselWidth}px`,
                }" arrows>
                    <template #prevArrow>
                        <div class="custom-slick-arrow" style="left: 10px; z-index: 1">
                            <left-circle-outlined />
                        </div>
                    </template>
                    <template #nextArrow>
                        <div class="custom-slick-arrow" style="right: 10px">
                            <right-circle-outlined />
                        </div>
                    </template>
                    <template v-for="(i, idx) in dataSource" :key="idx">
                        <div class="carouse-item">
                            <a-image :src="i.value" />
                        </div>
                    </template>
                </a-carousel>
            </div>
            <a-table class="table" :dataSource="dataSource" :columns="columns" :pagination="pagination"
                @change="TableChange">
                <template #bodyCell="{ column, record }">
                    <template v-if="column.dataIndex === 'opera'">
                        <a-space>
                            <a-popconfirm title="您确定要删除此条信息吗?" ok-text="是的" cancel-text="取消" @confirm="ImageRemove(record)">
                                <a-button type="link" danger>删除</a-button>
                            </a-popconfirm>
                        </a-space>
                    </template>
                </template>
            </a-table>
        </div>
    </div>
</template>
<script setup>
import { useStore } from '@/store';
import { POST } from '@/utils/axios';
import { message } from 'ant-design-vue';
import { watchEffect } from 'vue';
let contentRef = ref();
let carouselWidth = ref(0);
const fileList = ref([]);
let dataSource = ref([]);
let columns = ref([
    {
        title: '图片名',
        dataIndex: 'name',
        key: 'name',
    },
    {
        width: 100,
        title: "操作",
        fixed: "right",
        dataIndex: "opera",
        align: "center",
    },
])
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
// 上传
const UploadChange = async (info) => {
    if (info.file.status === "uploading") {
        return;
    }
    if (info.file.status === "done") {
        let { name, url } = info.file.response.data;
        let resultRes = await POST(`/config/save`, {
            name,
            value: info.file.response.data.url,
        });
        let { code } = resultRes;
        if (code == 500) return message.error("上传失败！");
        message.success("上传成功！");
        GetSwiperData();
    }
    if (info.file.status === "error") {
        message.error("上传失败！");
    }
};
//删除
const ImageRemove = async (file) => {
    let data = [file.id];
    let resultRes = await POST(`/config/delete`, data);
    const { code } = resultRes
    if (code == 500) return message.success(`删除失败`);
    message.success(`删除成功`);
    GetSwiperData();
};
// 获取数据
const GetSwiperData = async () => {
    let resultRes = await POST(`/config/page`, requireParams);
    const { code, data } = resultRes
    if (code == 500) return;
    dataSource.value = data.list;
    requireParams.total = Number(data.total);
};
const TableChange = (pagination) => {
    let { current, pageSize } = pagination
    requireParams.page = current;
    requireParams.limit = pageSize;
    GetSwiperData();
}
onMounted(() => {
    GetSwiperData();
    carouselWidth.value = contentRef.value.offsetWidth;
});




</script>
<style lang="scss" scoped>
.SwiperManage {
    width: 100%;
    height: 100%;
    display: flex;
    flex-direction: column;
    overflow-y: auto;

    .title {
        display: flex;
        justify-content: space-between;
        font-size: 20px;
        font-weight: 800;
    }

    .content {
        display: flex;
        flex-direction: column;
        width: 100%;
        overflow-y: auto;

        &-carouse {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 100%;
        }

    }
}

:deep(.ant-upload-list-item-container) {
    width: 200px !important;
    height: 200px !important;
}

:deep(.slick-slide) {
    text-align: center;
    height: 300px;
    // line-height: 160px;
    overflow: hidden;
}

:deep(.slick-arrow.custom-slick-arrow) {
    width: 25px;
    height: 25px;
    font-size: 25px;
    color: #fff;
    background-color: rgba(31, 45, 61, 0.11);
    transition: ease all 0.3s;
    opacity: 0.3;
    z-index: 1;
}

:deep(.slick-arrow.custom-slick-arrow:before) {
    display: none;
}

:deep(.slick-arrow.custom-slick-arrow:hover) {
    color: #fff;
    opacity: 0.5;
}

:deep(.slick-slide h3) {
    color: #fff;
}
</style>
    