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
        <a-form-item class="formSearch-item" label="报销人" name="addusername">
          <a-input
            v-model:value="formSearch.addusername"
            placeholder="请输入报销人"
          />
        </a-form-item>

        <a-form-item class="formSearch-item">
          <a-space class="space">
            <a-button type="primary" html-type="submit">搜索</a-button>
            <a-button @click="ResetSearch()">重置</a-button>
          </a-space>
        </a-form-item>
      </a-form>
    </div>

    <a-table
      class="table"
      rowKey="id"
      :dataSource="dataSource"
      :columns="columns"
      :pagination="pagination"
      @change="TableChange"
    >
      <template #bodyCell="{ column, record }">
        <template v-if="column.dataIndex === 'opera'">
          <a-space wrap>
            <!--
                    <a-button type="link" @click="IssueOpen(record)">审核</a-button>
                    -->

            <!-- 
                                    <a-button type="link" @click="UpdateRow(record)">修改</a-button>
                                    <a-popconfirm title="您确定要删除此条信息吗?" ok-text="是的" cancel-text="取消" @confirm="DelRow(record)">
                                        <a-button type="link" danger>删除</a-button>
                                    </a-popconfirm>
                                -->
          </a-space>
        </template>
      </template>
      <template #expandedRowRender="{ record }">
        <a-descriptions bordered>
          <a-descriptions-item
            label="票据图片"
            :span="1"
            v-if="record.billpicture"
          >
            <a-image
              :width="100"
              :height="100"
              :src="record.billpicture"
              :fallback="imgError"
            />
          </a-descriptions-item>

          <a-descriptions-item
            label="审核回复"
            :span="3"
            v-if="record.shenhehuifu"
          >
            <p style="margin: 0" v-html="record.shenhehuifu"></p>
          </a-descriptions-item>

          <a-descriptions-item label="报销备注" :span="3" v-if="record.remark">
            <p style="margin: 0" v-html="record.remark"></p>
          </a-descriptions-item>
        </a-descriptions>
      </template>
    </a-table>

    <a-modal v-model:open="claimsOpen" title="审核" @ok="ClaimsOk">
      <a-form
        :model="claimsFormState"
        :label-col="{ span: 6 }"
        :wrapper-col="{ span: 16 }"
        autocomplete="off"
      >
        <a-form-item label="审核">
          <a-select ref="select" v-model:value="claimsFormState.shenhe">
            <a-select-option value="同意">同意</a-select-option>

            <a-select-option value="驳回">驳回</a-select-option>
          </a-select>
        </a-form-item>
      </a-form>
    </a-modal>
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
    "/claims/page",
    Object.assign(requireParams, formSearch, {
      adduserid: useState.$state.userid,
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
    name: "ClaimsCreate",
    state: {
      type: 1,
      editVal: JSON.stringify(editObj),
    },
  });
};

const claimsOpen = ref(false);
const claimsFormState = reactive({});
const ClaimsOpen = (row) => {
  claimsOpen.value = true;
  Object.assign(claimsFormState, row);
};
const ClaimsOk = async () => {
  const { id, shenheid, shenhe } = claimsFormState;
  const { code } = await POST("/claims/update", {
    id,
    shenhe,
  });
  claimsOpen.value = false;
  GetData();
};

const DelRow = async ({ id }) => {
  const { code } = await POST("/claims/delete", [id]);
  if (code != 0) return message.error("删除失败");
  message.success("删除成功");
  GetData();
};

onMounted(() => {
  GetData();
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
