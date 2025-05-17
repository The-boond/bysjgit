<template>
  <div class="listTemplate" ref="contentRef">
    <a-table
      class="table"
      rowKey="id"
      :scroll="{ x: `calc(${tableWidth}px + 10%)` }"
      :dataSource="dataSource"
      :columns="columns"
      :pagination="pagination"
      @change="TableChange"
    >
      <template #bodyCell="{ column, record }">
        <template v-if="column.dataIndex === 'opera'">
          <a-space wrap>
            <a-button
              type="primary"
              shape="default"
              :icon="h(EditOutlined)"
              @click="UpdateRow(record)"
              >修改</a-button
            >
            <a-popconfirm
              title="您确定要删除此条信息吗?"
              ok-text="是的"
              cancel-text="取消"
              @confirm="DelRow(record)"
            >
              <a-button danger shape="default" :icon="h(DeleteOutlined)"
                >删除</a-button
              >
            </a-popconfirm>
            <a-button
              shape="default"
              :icon="h(MenuOutlined)"
              @click="MessageRow(record)"
              >详情</a-button
            >
          </a-space>
        </template>
      </template>
    </a-table>

    <div class="topChunk" ref="topChunk">
      <a-form
        class="formSearch"
        ref="formSearchRef"
        :model="formSearch"
        layout="horizontal"
        @finish="FinishSearch"
      >
        <a-form-item class="formSearch-item" label="员工姓名" name="username">
          <a-input
            v-model:value="formSearch.username"
            placeholder="请输入员工姓名"
          />
        </a-form-item>

        <a-form-item
          class="formSearch-item"
          :wrapper-col="{ span: 10, offset: 4 }"
        >
          <a-space class="space">
            <a-button type="primary" shape="circle" html-type="submit"
              >搜索</a-button
            >
            <a-button shape="circle" @click="ResetSearch()">重置</a-button>
          </a-space>
        </a-form-item>
      </a-form>
    </div>

    <a-modal
      v-model:visible="createModalFlag"
      :title="createModalTitle"
      :footer="null"
      width="1200px"
    >
      <a-form ref="formRef" :model="formData" @finish="OnSubmit">
        <a-row :gutter="24">
          <a-col :span="12">
            <a-form-item label="员工姓名" name="username">
              <a-input
                v-model:value="formData.username"
                placeholder="请输入员工姓名"
              />
            </a-form-item>
          </a-col>

          <a-col :span="12">
            <a-form-item label="签到" name="status">
              <a-radio-group
                v-model:value="formData.status"
                placeholder="请选择签到"
              >
                <a-radio value="是">是</a-radio>
                <a-radio value="否">否</a-radio>
              </a-radio-group>
            </a-form-item>
          </a-col>

          <a-col :span="12">
            <a-form-item label="签到时间" name="qiandaotime">
              <a-date-picker
                v-model:value="formData.qiandaotime"
                format="YYYY-MM-DD HH:mm:ss"
                valueFormat="YYYY-MM-DD HH:mm:ss"
                placeholder="选择时间"
                :show-time="{ defaultValue: dayjs('00:00:00', 'HH:mm:ss') }"
              />
            </a-form-item>
          </a-col>

          <!-- <a-col :span="12">
            <a-form-item label="签退时间" name="qiantuitime">
              <a-date-picker
                v-model:value="formData.qiantuitime"
                format="YYYY-MM-DD HH:mm:ss"
                valueFormat="YYYY-MM-DD HH:mm:ss"
                placeholder="选择时间"
                :show-time="{ defaultValue: dayjs('00:00:00', 'HH:mm:ss') }"
              />
            </a-form-item>
          </a-col> -->

          <a-col :span="12">
            <a-form-item label="创建时间" name="addtime">
              <a-date-picker
                v-model:value="formData.addtime"
                format="YYYY-MM-DD HH:mm:ss"
                valueFormat="YYYY-MM-DD HH:mm:ss"
                placeholder="选择时间"
                :show-time="{ defaultValue: dayjs('00:00:00', 'HH:mm:ss') }"
              />
            </a-form-item>
          </a-col>

          <a-col :span="24">
            <a-form-item :wrapper-col="{ span: 10, offset: 10 }">
              <a-button type="primary" html-type="submit">提交</a-button>
              <a-button style="margin-left: 10px" @click="OnReset"
                >重置</a-button
              >
            </a-form-item>
          </a-col>
        </a-row>
      </a-form>
    </a-modal>

    <a-drawer
      v-model:open="messageDrawerFlag"
      :width="600"
      title="详情信息"
      placement="right"
    >
      <a-form class="formMessage" layout="inline" :model="formMessage">
        <a-row :gutter="24">
          <a-col :span="12">
            <a-form-item label="主键" name="id">
              <a-input
                v-model:value="formMessage.id"
                placeholder="空"
                :bordered="false"
                disabled
              />
            </a-form-item>
          </a-col>

          <a-col :span="12">
            <a-form-item label="员工id" name="userid">
              <a-input
                v-model:value="formMessage.userid"
                placeholder="空"
                :bordered="false"
                disabled
              />
            </a-form-item>
          </a-col>

          <a-col :span="12">
            <a-form-item label="员工姓名" name="username">
              <a-input
                v-model:value="formMessage.username"
                placeholder="空"
                :bordered="false"
                disabled
              />
            </a-form-item>
          </a-col>

          <a-col :span="12">
            <a-form-item label="签到" name="status">
              <a-input
                v-model:value="formMessage.status"
                placeholder="空"
                :bordered="false"
                disabled
              />
            </a-form-item>
          </a-col>

          <a-col :span="12">
            <a-form-item label="签到时间" name="qiandaotime">
              <a-input
                v-model:value="formMessage.qiandaotime"
                placeholder="空"
                :bordered="false"
                disabled
              />
            </a-form-item>
          </a-col>

          <a-col :span="12">
            <a-form-item label="创建时间" name="addtime">
              <a-input
                v-model:value="formMessage.addtime"
                placeholder="空"
                :bordered="false"
                disabled
              />
            </a-form-item>
          </a-col>
        </a-row>
      </a-form>
    </a-drawer>
  </div>
</template>
<script setup>
import { columns } from "./index";
import { ClearReactiveObj } from "@/utils/func";
import { h } from "vue";
import { useStore } from "@/store";
import { POST } from "@/utils/axios";
import { message } from "ant-design-vue";
import {
  SearchOutlined,
  SyncOutlined,
  PlusOutlined,
  EditOutlined,
  DeleteOutlined,
  MenuOutlined,
  SendOutlined,
  HighlightOutlined,
  MonitorOutlined,
} from "@ant-design/icons-vue";
import { Editor, Toolbar } from "@wangeditor/editor-for-vue";
import "@wangeditor/editor/dist/css/style.css";
import dayjs from "dayjs";
const useState = useStore();
const router = useRouter();
const route = useRoute();
const imgError = ref(import.meta.env.VITE_IMG_ERROR);

let formSearchRef = ref(null);
const formSearch = reactive({});

const FinishSearch = () => {
  GetData();
};
const ResetSearch = () => {
  formSearchRef.value.resetFields();
  GetData();
};

const AddQiandaoqiantui = () => {
  ClearReactiveObj(formData);
  createModalFlag.value = true;
  createModalTitle.value = "修改签到签退";
};

const dataSource = ref([]); // 表格数据
const requireParams = reactive({
  // 获取远程数据需要传的参数
  page: 1,
  limit: 10,
  total: 10,
  order: "addtime",
});
const pagination = computed(() => ({
  current: requireParams.page,
  pageSize: requireParams.limit, // 每页显示的数据条数
  total: requireParams.total,
}));
const GetData = async (values) => {
  let resultRes = await POST(
    "/qiandaoqiantui/page",
    Object.assign(requireParams, formSearch)
  );
  let { code, data } = resultRes;
  let { list, total } = data;
  if (code != "0") return message.error("获取列表信息失败");
  dataSource.value = list;
  requireParams.total = Number(total);
};
const TableChange = (pagination) => {
  let { current, pageSize } = pagination;
  requireParams.page = current;
  requireParams.limit = pageSize;
  GetData();
};
const UpdateRow = (editObj = undefined) => {
  createModalFlag.value = true;
  createModalTitle.value = "修改签到签退";

  Object.assign(formData, editObj, {});
};

const DelRow = async ({ id }) => {
  let data = [id];
  let resultRes = await POST("/qiandaoqiantui/delete", data);
  let { code } = resultRes;
  if (code == 500) return message.error("删除失败");
  message.success("删除成功");
  GetData();
};

const messageDrawerFlag = ref(false);
const formMessage = reactive({});
const MessageRow = async ({ id }) => {
  let resultRes = await POST("/qiandaoqiantui/info", { id });
  let { code, data } = resultRes;
  if (code == 500) return;
  messageDrawerFlag.value = true;
  Object.assign(formMessage, data);
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

let createModalFlag = ref(false);
let createModalTitle = ref("");

// 基础form相关
let formRef = ref(null);
const formData = reactive({});

const GetBase64 = (img, callback) => {
  const reader = new FileReader();
  reader.addEventListener("load", () => callback(reader.result));
  reader.readAsDataURL(img);
};

// 提交
const OnSubmit = async (values) => {
  let { id } = formData;
  let data = Object.assign(values, {
    id,
  });
  let resultRes = await POST(
    `/qiandaoqiantui/${id != undefined ? "update" : "save"}`,
    data
  );
  let { code } = resultRes;
  if (code != 0) return message.error("创建失败");
  createModalFlag.value = false;
  GetData();
};
// 重置表单
const OnReset = () => {
  formRef.value.resetFields();
};

onMounted(() => {
  GetData();
});

// 组件销毁时，也及时销毁编辑器
onBeforeUnmount(() => {
  const editor = editorRef.value;
  if (editor == null) return;
  editor.destroy();
});

let contentRef = ref(null);
let tableWidth = ref(null);
watchEffect(() => {
  if (contentRef.value) {
    tableWidth.value = contentRef.value.offsetWidth - 300;
  }
});
</script>
<style lang="scss" scoped>
.listTemplate {
  width: 100%;
  height: 100%;
  display: flex;
  overflow-y: auto;
  .topChunk {
    width: 300px;
    margin-left: 10px;
    .formSearch {
      &-item {
        margin-bottom: 10px;
      }
    }
    .space {
      padding: 5px;
    }

    .opera {
      margin: 0 0 10px 0;
    }
  }
  .table {
    flex: 1;
  }
}
:deep(.operaList) {
  display: flex;
  justify-content: flex-end;
}
</style>
