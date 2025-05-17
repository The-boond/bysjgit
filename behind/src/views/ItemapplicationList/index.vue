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
        <a-form-item class="formSearch-item" label="用品名称" name="name">
          <a-input
            v-model:value="formSearch.name"
            placeholder="请输入用品名称"
          />
        </a-form-item>

        <a-form-item class="formSearch-item" label="申领人" name="addusername">
          <a-input
            v-model:value="formSearch.addusername"
            placeholder="请输入申领人"
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
          <a-space wrap>
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

            <a-button type="link" @click="ItemapplicationOpen(record)"
              >审核</a-button
            >
          </a-space>
        </template>
      </template>
      <template #expandedRowRender="{ record }">
        <a-descriptions bordered>
          <a-descriptions-item label="用品封面" :span="1" v-if="record.photo">
            <a-image
              :width="100"
              :height="100"
              :src="record.photo"
              :fallback="imgError"
            />
          </a-descriptions-item>

          <a-descriptions-item
            label="使用说明"
            :span="3"
            v-if="record.instructionsforuse"
          >
            <p style="margin: 0" v-html="record.instructionsforuse"></p>
          </a-descriptions-item>
        </a-descriptions>
      </template>
    </a-table>

    <a-modal
      v-model:open="itemapplicationOpen"
      title="审核"
      @ok="ItemapplicationOk"
    >
      <a-form
        :model="itemapplicationFormState"
        :label-col="{ span: 6 }"
        :wrapper-col="{ span: 16 }"
        autocomplete="off"
      >
        <a-form-item label="审核">
          <a-select
            ref="select"
            v-model:value="itemapplicationFormState.shenhe"
          >
            <a-select-option value="同意">同意</a-select-option>
            <a-select-option value="拒绝">拒绝</a-select-option>
          </a-select>
        </a-form-item>
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
              <p v-html="formMessage.id"></p>
            </a-form-item>
          </a-col>

          <a-col :span="12">
            <a-form-item label="用品id" name="shenheid">
              <p v-html="formMessage.shenheid"></p>
            </a-form-item>
          </a-col>

          <a-col :span="12">
            <a-form-item label="用品名称" name="name">
              <p v-html="formMessage.name"></p>
            </a-form-item>
          </a-col>

          <a-col :span="12">
            <a-form-item label="申领人id" name="adduserid">
              <p v-html="formMessage.adduserid"></p>
            </a-form-item>
          </a-col>

          <a-col :span="12">
            <a-form-item label="申领人" name="addusername">
              <p v-html="formMessage.addusername"></p>
            </a-form-item>
          </a-col>

          <a-col :span="12">
            <a-form-item label="审核" name="shenhe">
              <p v-html="formMessage.shenhe"></p>
            </a-form-item>
          </a-col>

          <a-col :span="12">
            <a-form-item label="使用说明" name="instructionsforuse">
              <p v-html="formMessage.instructionsforuse"></p>
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

const AddItemapplication = () => {
  ClearReactiveObj(formData);
  createModalFlag.value = true;
  createModalTitle.value = "新增用品申领";
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
    "/itemapplication/page",
    Object.assign(requireParams, formSearch, {
      adduserid:
        useState.$state.userid == "1" ? undefined : useState.$state.userid,
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
    name: "ItemapplicationCreate",
    state: {
      type: 1,
      editVal: JSON.stringify(editObj),
    },
  });
};

const itemapplicationOpen = ref(false);
const itemapplicationFormState = reactive({});
const ItemapplicationOpen = (row) => {
  itemapplicationOpen.value = true;
  Object.assign(itemapplicationFormState, row);
};
const ItemapplicationOk = async () => {
  const { id, shenheid, shenhe } = itemapplicationFormState;
  const { code } = await POST("/itemapplication/update", {
    id,
    shenhe,
  });
  itemapplicationOpen.value = false;
  GetData();
};

const DelRow = async ({ id }) => {
  const { code } = await POST("/itemapplication/delete", [id]);
  if (code != 0) return message.error("删除失败");
  message.success("删除成功");
  GetData();
};

const messageDrawerFlag = ref(false);
const formMessage = reactive({});
const MessageRow = async ({ id }) => {
  const { code, data } = await POST("/itemapplication/info", { id });
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
let photoImageUrl = ref();

const PhotoUploadChange = (info) => {
  if (info.file.status === "uploading") {
    return;
  }
  if (info.file.status === "done") {
    // Get this url from response in real world.
    GetBase64(info.file.originFileObj, (base64Url) => {
      photoImageUrl.value = base64Url;
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

// 提交
const OnSubmit = async (values) => {
  const { id } = formData;
  const data = Object.assign(values, {
    id,

    photo: formData.photo
      ? formData.photo[0]?.url == undefined
        ? formData.photo[0]?.response?.data?.url
        : formData.photo[0]?.url
      : undefined,
  });
  const { code } = await POST(
    `/itemapplication/${id != undefined ? "update" : "save"}`,
    data
  );
  if (code != 0) return message.error("创建失败");
  router.push("/ItemapplicationList");
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
