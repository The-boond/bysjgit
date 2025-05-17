<template>
  <div class="listTemplate" ref="contentRef">
    <div class="topChunk" ref="topChunk">
      <a-form
        class="formSearch"
        ref="formSearchRef"
        :model="formSearch"
        layout="inline"
        @finish="FinishSearch"
      >
        <a-form-item
          class="formSearch-item"
          label="员工名称"
          name="employeename"
        >
          <a-input
            v-model:value="formSearch.employeename"
            placeholder="请输入员工名称"
          />
        </a-form-item>

        <a-form-item class="formSearch-item">
          <a-space class="space">
            <a-button type="primary" shape="default" html-type="submit"
              >搜索</a-button
            >
            <a-button shape="default" @click="ResetSearch()">重置</a-button>
          </a-space>
        </a-form-item>
      </a-form>

      <a-space class="space"> </a-space>
    </div>

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
          <!-- <a-space wrap>
            <a-button type="link" @click="UpdateRow(record)">修改</a-button>
            <a-popconfirm
              title="您确定要删除此条信息吗?"
              ok-text="是的"
              cancel-text="取消"
              @confirm="DelRow(record)"
            >
              <a-button type="link" danger>删除</a-button>
            </a-popconfirm>
            <a-button type="text" @click="MessageRow(record)">详情</a-button>
          </a-space> -->
        </template>
      </template>
      <template #expandedRowRender="{ record }">
        <a-descriptions bordered>
          <a-descriptions-item label="备注" :span="3" v-if="record.remarks">
            <p style="margin: 0" v-html="record.remarks"></p>
          </a-descriptions-item>
        </a-descriptions>
      </template>
    </a-table>

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
              <p v-html="formMessage.id"></p>
            </a-form-item>
          </a-col>

          <a-col :span="12">
            <a-form-item label="员工id" name="employeeid">
              <p v-html="formMessage.employeeid"></p>
            </a-form-item>
          </a-col>

          <a-col :span="12">
            <a-form-item label="员工名称" name="employeename">
              <p v-html="formMessage.employeename"></p>
            </a-form-item>
          </a-col>

          <a-col :span="12">
            <a-form-item label="月份" name="monthes">
              <p v-html="formMessage.monthes"></p>
            </a-form-item>
          </a-col>

          <a-col :span="12">
            <a-form-item label="薪资" name="salary">
              <p v-html="formMessage.salary"></p>
            </a-form-item>
          </a-col>

          <a-col :span="12">
            <a-form-item label="备注" name="remarks">
              <p v-html="formMessage.remarks"></p>
            </a-form-item>
          </a-col>

          <a-col :span="12">
            <a-form-item label="五险" name="fiveinsurances">
              <p v-html="formMessage.fiveinsurances"></p>
            </a-form-item>
          </a-col>

          <a-col :span="12">
            <a-form-item label="一金" name="onegold">
              <p v-html="formMessage.onegold"></p>
            </a-form-item>
          </a-col>

          <a-col :span="12">
            <a-form-item label="创建时间" name="addtime">
              <p v-html="formMessage.addtime"></p>
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

const AddSalariess = () => {
  ClearReactiveObj(formData);
  createModalFlag.value = true;
  createModalTitle.value = "新增薪资";
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
  const { code, data } = await POST(
    "/salariess/page",
    Object.assign(requireParams, formSearch, {
      employeeid: useState.$state.userid,
    })
  );
  const { list, total } = data;
  if (code != 0) return message.error("获取列表信息失败");
  dataSource.value = list;
  requireParams.total = Number(total);
};
const TableChange = (pagination) => {
  const { current, pageSize } = pagination;
  requireParams.page = current;
  requireParams.limit = pageSize;
  GetData();
};
const UpdateRow = (editObj = undefined) => {
  router.push({
    name: "SalariessCreate",
    state: {
      type: 1,
      editVal: JSON.stringify(editObj),
    },
  });
};

const DelRow = async ({ id }) => {
  const { code } = await POST("/salariess/delete", [id]);
  if (code != 0) return message.error("删除失败");
  message.success("删除成功");
  GetData();
};

const messageDrawerFlag = ref(false);
const formMessage = reactive({});
const MessageRow = async ({ id }) => {
  const { code, data } = await POST("/salariess/info", { id });
  if (code != 0) return;
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
const formRules = reactive({});

const GetBase64 = (img, callback) => {
  const reader = new FileReader();
  reader.addEventListener("load", () => callback(reader.result));
  reader.readAsDataURL(img);
};

// 提交
const OnSubmit = async (values) => {
  const { id } = formData;
  const data = Object.assign(values, {
    id,

    userid: formData.employeename,
    employeename: employeenameSelectList.value.filter(
      (i) => i.value == formData.employeename
    )[0].label,
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

const employeenameSelectList = ref([]);

// 获取员工名称分类
const GetEmployeenameClassify = async () => {
  const { code, data } = await POST("/user/list");
  if (code != 0) return;
  employeenameSelectList.value = data.map((i) => {
    return Object.assign(i, {
      value: i.name,
      label: i.name,
    });
  });
};

onMounted(() => {
  GetEmployeenameClassify();
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
    tableWidth.value = contentRef.value.offsetWidth - 0;
  }
});
</script>
<style lang="scss" scoped>
.listTemplate {
  width: 100%;
  height: 100%;
  display: flex;
  flex-direction: column;
  overflow-y: auto;
  .topChunk {
    width: 100%;

    .formSearch {
      &-item {
        margin-bottom: 5px;
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
