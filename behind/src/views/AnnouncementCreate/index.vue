<template>
    <div class="AnnouncementCreate">
        <p class="title">{{ formData.id ? '修改' : '发布' }}公告</p>
        <a-divider />
        <a-form ref="formRef" :model="formData" v-bind="layout" @finish="OnSubmit">
            <a-form-item label="公告标题" name="title">
                <a-input v-model:value="formData.title" allowClear placeholder="请输入公告标题" />
            </a-form-item>
            <a-form-item label="封面">
                <a-upload v-model:file-list="formData.picture" name="file" list-type="picture-card" class="cover-uploader"
                    :show-upload-list="false" action="/api/file/upload" :maxCount="1" @change="PhotoUploadChange">
                    <a-image v-if="imageUrl" :src="imageUrl" :preview="false" />
                    <a-image v-else-if="formData.picture" :src="formData.picture[0].url" :preview="false" />
                    <div v-else class="coverDefault">
                        <PlusOutlined />
                        <div class="ant-upload-text">上传图片</div>
                    </div>
                </a-upload>
            </a-form-item>
            <a-form-item label="公告简介" name="introduction">
                <a-textarea v-model:value="formData.introduction" :auto-size="{ minRows: 3, maxRows: 3 }" allowClear
                    placeholder="请输入公告简介" />
            </a-form-item>
            <a-form-item label="公告内容" name="content">
                <div style="border: 1px solid #ccc">
                    <Toolbar style="border-bottom: 1px solid #ccc" :editor="editorRef" :defaultConfig="toolbarConfig"
                        :mode="mode" />
                    <Editor style="height: 500px; overflow-y: hidden;" v-model="formData.content"
                        :defaultConfig="editorConfig" :mode="mode" @onCreated="HandleCreated" />
                </div>
            </a-form-item>
            <a-form-item :wrapper-col="{ offset: 10, span: 10 }">
                <a-button type="primary" html-type="submit">{{ formData.id ? '修改' : '发布' }}</a-button>
                <a-button style="margin-left: 10px" @click="OnReset">重置</a-button>
            </a-form-item>
        </a-form>
    </div>
</template>

<script setup>
import { useStore } from '@/store';
import { POST } from '@/utils/axios';
import dayjs from 'dayjs';
import { message } from 'ant-design-vue';
import { Editor, Toolbar } from '@wangeditor/editor-for-vue'
import '@wangeditor/editor/dist/css/style.css';
const useState = useStore();
const router = useRouter();
const route = useRoute();
// Form
let formRef = ref(null);
const layout = {
    labelCol: { style: { width: '120px' } },
    wrapperCol: { span: 14 },
};
const formData = reactive({});
const imageUrl = ref();
//
const editorRef = shallowRef();// 编辑器实例，必须用 shallowRef
const mode = 'default';
const toolbarConfig = {};
const editorConfig = {
    placeholder: '请输入内容...',
    MENU_CONF: {
        'uploadImage': {
            server: '/api/file/upload',
            fieldName: 'file',
            methods: 'post',
            // 单个文件上传成功之后
            onSuccess(file, res) {

            },
            // 自定义插入图片
            customInsert(res, insertFn) {
                if (res.code == 0) {
                    let { url, alt, href } = res.data;
                    insertFn(url, alt, href)
                }
            },

        }
    }
}
const HandleCreated = (editor) => {
    editorRef.value = editor // 记录 editor 实例，重要！
}
const PhotoUploadChange = info => {
    if (info.file.status === 'uploading') {
        return;
    }
    if (info.file.status === 'done') {
        // Get this url from response in real world.
        GetBase64(info.file.originFileObj, base64Url => {
            imageUrl.value = base64Url;
        });
    }
    if (info.file.status === 'error') {
        message.error('上传失败！');
    }
}
const GetBase64 = (img, callback) => {
    const reader = new FileReader();
    reader.addEventListener('load', () => callback(reader.result));
    reader.readAsDataURL(img);
}
const OnSubmit = async values => {
    let { id } = formData;
    let data = Object.assign({}, formData, {
        id,
        picture: formData.picture ? formData.picture[0]?.url == undefined ? formData.picture[0]?.response?.data?.url : formData.picture[0]?.url : undefined,
        content: encodeURIComponent(formData.content)
    });
    let resultRes = await POST(`/news/${id ? 'update' : 'save'}`, data);
    let { code } = resultRes;
    if (code != 0) return message.error('创建失败');
    router.push('/announcementList')
};
const OnReset = () => {
    formRef.value.resetFields();
}
onMounted(() => {
    let { type, editVal } = history.state;
    if (type) {
        nextTick(() => {
            let editObj = JSON.parse(editVal)
            Object.assign(formData, editObj, {
                picture: [Object.assign({}, { url: editObj.picture })],
                content: decodeURIComponent(editObj.content)
            })
        })
    }
})
// 组件销毁时，也及时销毁编辑器
onBeforeUnmount(() => {
    const editor = editorRef.value
    if (editor == null) return
    editor.destroy()
})
</script>

<style lang="scss" scoped>
.AnnouncementCreate {
    width: 100%;
    height: 100%;
    overflow-y: auto;

    .title {
        font-size: 20px;
        font-weight: 800;
    }


    .cover-uploader {
        :deep(.ant-upload) {
            width: 200px;
            height: 200px;
        }

        .showImg {
            width: 100%;
            height: 100%;
        }
    }

    .coverDefault {
        width: 100%;
        height: 100%;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        padding: 0 10px;
    }
}
</style>