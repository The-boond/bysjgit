<template>
    <div class="AboutUs">
        <p class="title">关于我们</p>
        <a-divider />
        <a-form ref="formRef" :model="formData" v-bind="layout" @finish="UpdateAboutUs">
            <a-form-item label="标题" name="title">
                <a-input v-model:value="formData.title" allowClear placeholder="请输入标题" />
            </a-form-item>
            <a-form-item label="内容">
                <div style="border: 1px solid #ccc">
                    <Toolbar style="border-bottom: 1px solid #ccc" :editor="editorRef" :defaultConfig="toolbarConfig"
                        :mode="mode" />
                    <Editor style="height: 500px; overflow-y: hidden;" v-model="formData.content"
                        :defaultConfig="editorConfig" :mode="mode" @onCreated="HandleCreated" />
                </div>
            </a-form-item>
            <a-form-item :wrapper-col="{ offset: 10, span: 14 }">
                <a-button type="primary" html-type="submit">保存</a-button>
            </a-form-item>
        </a-form>
    </div>
</template>
<script setup>
import { useStore } from '@/store';
import { POST } from '@/utils/axios';
import { message } from 'ant-design-vue';
import { Editor, Toolbar } from '@wangeditor/editor-for-vue'
import '@wangeditor/editor/dist/css/style.css';
const layout = {
    labelCol: { style: { width: '100px' } },
    wrapperCol: { span: 18 },
};
const formData = reactive({});
const editorRef = shallowRef();// 编辑器实例，必须用 shallowRef
const mode = 'default';
const toolbarConfig = {};
const editorConfig = {
    placeholder: '请输入内容...',
    MENU_CONF: {
        'uploadImage': {
            server: `/api/file/upload`,
            fieldName: 'file',
            methods: 'post',
            // 单个文件上传成功之后
            onSuccess(file, res) {
                console.log(`${file.name} 上传成功`, res);
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
};
const UpdateAboutUs = async values => {
    let resultRes = await POST(`/aboutus/update`, Object.assign({}, formData, {
        content: encodeURIComponent(formData.content)
    }));
    let { code, data } = resultRes;
    if (code != 0) return message.error('保存失败');
    message.success('保存成功');
    GetAboutUsData();
};
const HandleCreated = (editor) => {
    editorRef.value = editor // 记录 editor 实例，重要！
}
const GetAboutUsData = async () => {
    let resultRes = await POST(`/aboutus/list`);
    let { code, data } = resultRes;
    if (code != 0) return;
    nextTick(() => {
        formData.id = data[data.length - 1].id;
        formData.title = data[data.length - 1].title;
        formData.content = decodeURIComponent(data[data.length - 1].content);
    })
}
onMounted(() => {
    GetAboutUsData();
})
// 组件销毁时，也及时销毁编辑器
onBeforeUnmount(() => {
    const editor = editorRef.value
    if (editor == null) return
    editor.destroy()
})
</script>
<style lang="scss" scoped>
.AboutUs {
    width: 100%;
    height: 100%;
    overflow-y: auto;

    .title {
        font-size: 20px;
        font-weight: 800;
    }
}
</style>