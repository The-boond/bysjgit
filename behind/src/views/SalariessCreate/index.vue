<template>
  <div class="createTemplate">
    <p class="title">{{ formData.id ? "修改" : "录入" }}薪资</p>
    <a-divider />

    <a-form
      ref="formRef"
      :model="formData"
      :rules="formRules"
      @finish="OnSubmit"
    >
      <a-row :gutter="24">
        <a-col :span="12">
          <a-form-item label="员工名称" name="employeename">
            <a-select
              v-model:value="formData.employeename"
              :options="employeenameSelectList"
              @change="changeSelect"
              placeholder="请选择员工名称"
            >
            </a-select>
          </a-form-item>
        </a-col>

        <a-col :span="12">
          <a-form-item label="月份" name="monthes">
            <a-input
              v-model:value="formData.monthes"
              placeholder="请输入月份"
            />
          </a-form-item>
        </a-col>

        <a-col :span="12">
          <a-form-item label="薪资" name="salary">
            <a-input v-model:value="formData.salary" placeholder="请输入薪资" />
          </a-form-item>
        </a-col>

        <a-col :span="12">
          <a-form-item label="备注" name="remarks">
            <a-textarea
              v-model:value="formData.remarks"
              placeholder="请输入备注"
              :auto-size="{ minRows: 10, maxRows: 10 }"
            />
          </a-form-item>
        </a-col>

        <a-col :span="12">
          <a-form-item label="五险" name="fiveinsurances">
            <a-input
              v-model:value="formData.fiveinsurances"
              placeholder="请输入五险"
            />
          </a-form-item>
        </a-col>

        <a-col :span="12">
          <a-form-item label="一金" name="onegold">
            <a-input
              v-model:value="formData.onegold"
              placeholder="请输入一金"
            />
          </a-form-item>
        </a-col>

        <a-col :span="24">
          <a-form-item :wrapper-col="{ span: 10, offset: 10 }">
            <a-button type="primary" html-type="submit">提交</a-button>
            <a-button style="margin-left: 10px" @click="OnReset">重置</a-button>
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
const formRules = reactive({});

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
const employeenameSelectList = ref([]);

// 获取员工名称分类
const GetEmployeenameClassify = async () => {
  const { code, data } = await POST("/user/list");
  if (code != 0) return;
  employeenameSelectList.value = data.map((i) => {
    return Object.assign(i, {
      value: i.id,
      label: i.name,
    });
  });
};

const changeSelect = (val) => {
  const selectedOption = employeenameSelectList.value.find(
    (option) => option.value === val || option.label === val
  );
  if (selectedOption) {
    formData.employeeid = selectedOption.value;
    formData.employeename = selectedOption.label;
  }
};
// 提交
const OnSubmit = async (values) => {
  const { id, employeeid } = formData;
  const data = Object.assign(values, {
    id,
    employeeid: formData.employeeid,

    employeename: formData.employeename,
  });
  const { code } = await POST(
    `/salariess/${id != undefined ? "update" : "save"}`,
    data
  );
  if (code != 0) return message.error("创建失败");
  router.push("/SalariessList");
};
// 重置表单
const OnReset = () => {
  formRef.value.resetFields();
};

onMounted(() => {
  GetEmployeenameClassify();
  const { type, editVal } = history.state;
  if (type) {
    nextTick(() => {
      let editObj = JSON.parse(editVal);
      let {} = editObj;

      Object.assign(formData, editObj, {});
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
  .title {
    font-size: 20px;
    font-weight: 800;
  }
}
</style>
