<template>
  <div class="createTemplate">
    <a-form ref="formRef" :model="formData" @finish="OnSubmit">
      <a-row :gutter="24">
        <a-col :span="24">
          <a-form-item label="票据图片" name="billpicture">
            <a-upload
              v-model:file-list="formData.billpicture"
              name="file"
              list-type="picture-card"
              class="cover-uploader"
              :show-upload-list="false"
              action="/api/file/upload"
              :maxCount="1"
              @change="BillpictureUploadChange"
              :disabled="oldFormData.billpicture"
            >
              <a-image
                v-if="billpictureImageUrl"
                :src="billpictureImageUrl"
                :preview="false"
              />
              <a-image
                v-else-if="formData.billpicture"
                :src="formData.billpicture[0].url"
                :preview="false"
              />
              <div v-else class="coverDefault">
                <PlusOutlined />
                <div class="ant-upload-text">上传图片</div>
              </div>
            </a-upload>
          </a-form-item>
        </a-col>

        <a-col :span="24">
          <a-form-item label="报销备注" name="remark">
            <div style="border: 1px solid #ccc">
              <Toolbar
                style="border-bottom: 1px solid #ccc"
                :editor="editorRef"
                :defaultConfig="toolbarConfig"
                :mode="mode"
              />
              <Editor
                style="height: 500px; overflow-y: hidden"
                v-model="formData.remark"
                :defaultConfig="editorConfig"
                :mode="mode"
                @onCreated="HandleCreated"
              />
            </div>
          </a-form-item>
        </a-col>

        <a-col :span="24">
          <a-form-item :wrapper-col="{ span: 10, offset: 10 }">
            <a-button type="primary" html-type="submit">提交</a-button>
            <!-- <a-button style="margin-left: 10px" @click="OnReset">重置</a-button> -->
          </a-form-item>
        </a-col>
      </a-row>
    </a-form>
  </div>
</template>
<script setup>
import { useStore } from "@/store";
import { POST } from "@/utils/axios";
import { message } from "ant-design-vue";
import { Editor, Toolbar } from "@wangeditor/editor-for-vue";
import "@wangeditor/editor/dist/css/style.css";
import dayjs from "dayjs";
const useState = useStore();
const router = useRouter();
const route = useRoute();

// 基础form相关
let formRef = ref(null);
const formData = reactive({});
const oldFormData = reactive({});
const formRules = reactive({});
let billpictureImageUrl = ref();

const BillpictureUploadChange = (info) => {
  if (info.file.status === "uploading") {
    return;
  }
  if (info.file.status === "done") {
    // Get this url from response in real world.
    GetBase64(info.file.originFileObj, (base64Url) => {
      billpictureImageUrl.value = base64Url;
    });
  }
  if (info.file.status === "error") {
    message.error("上传失败！");
  }
};

const GetBase64 = (img, callback) => {
  const reader = new FileReader();
  reader.addEventListener("load", () => callback(reader.result));
  reader.readAsDataURL(img);
};

// 编辑器
const editorRef = shallowRef(); // 编辑器实例，必须用 shallowRef
const mode = "default";
const toolbarConfig = {};
const editorConfig = {
  placeholder: "请输入内容...",
  MENU_CONF: {
    uploadImage: {
      server: "/api/file/upload",
      fieldName: "file",
      methods: "post",
      // 单个文件上传成功之后
      onSuccess(file, res) {},
      // 自定义插入图片
      customInsert(res, insertFn) {
        if (res.code == 0) {
          let { url, alt, href } = res.data;
          insertFn(url, alt, href);
        }
      },
    },
  },
};
const HandleCreated = (editor) => {
  editorRef.value = editor; // 记录 editor 实例，重要！
};

// 提交
const OnSubmit = async (values) => {
  const { id, shenheid, adduserid, addusername } = formData;
  const data = Object.assign(values, {
    shenheid,
    adduserid: useState.$state.userid,
    addusername: useState.$state.username,
    shenhe: "待审核",

    billpicture: formData.billpicture
      ? formData.billpicture[0]?.url == undefined
        ? formData.billpicture[0]?.response?.data?.url
        : formData.billpicture[0]?.url
      : undefined,
  });
  const { code } = await POST(
    `/claims/${id != undefined ? "update" : "save"}`,
    data
  );
  if (code != 0) return message.error("创建失败");
  router.push("/ClaimsList");
};
// 重置表单
const OnReset = () => {
  formRef.value.resetFields();
};

onMounted(() => {
  const { type, editVal } = history.state;
  if (type) {
    nextTick(() => {
      let editObj = JSON.parse(editVal);
      let {} = editObj;
      if (type === 6) {
        const { userid, username } = useState.$state;
        const obj = {};
        for (let i in editObj) {
          if (i == "id") {
            obj["shenheid"] = editObj["id"];
          } else obj[i] = editObj[i];
        }

        Object.assign(formData, obj, {
          billpicture: [Object.assign({}, { url: editObj.billpicture })],
        });

        Object.assign(oldFormData, formData);

        return;
      }

      Object.assign(formData, obj, {
        billpicture: [Object.assign({}, { url: editObj.billpicture })],
      });
    });
  }
});

// 组件销毁时，也及时销毁编辑器
onBeforeUnmount(() => {
  const editor = editorRef.value;
  if (editor == null) return;
  editor.destroy();
});
</script>
<style lang="scss" scoped>
.createTemplate {
  width: 60%;
  margin: 30px;
  .title {
    font-size: 20px;
    font-weight: 800;
  }
}
</style>
