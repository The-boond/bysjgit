<template>
  <div class="Personal">
    <section class="section">
      <a-form ref="formRef" :model="formData" :rules="formRules" v-bind="layout" :disabled="editDisabled">
        <a-row :gutter="24">
          <a-col :span="24">
            <a-form-item label="账号" name="username">
              <a-input v-model:value="formData.username" placeholder="请输入账号" />
            </a-form-item>
          </a-col>
          <a-col :span="24">
            <a-form-item label="姓名" name="name">
              <a-input v-model:value="formData.name" placeholder="请输入姓名" />
            </a-form-item>
          </a-col>
          <a-col :span="24">
            <a-form-item label="邮箱" name="email">
              <a-input v-model:value="formData.email" placeholder="请输入邮箱" />
            </a-form-item>
          </a-col>
          <a-col :span="24">
            <a-form-item label="头像">
              <a-upload class="form-uploader" name="file" action="/api/file/upload" list-type="picture-card"
                :show-upload-list="false" :max-count="1" @change="UploadChange">
                <img class="showImg" v-if="imageUrl == '' && formData.avatarurl" :src="formData.avatarurl" alt="avatar" />
                <img class="showImg" v-else-if="imageUrl" :src="imageUrl" alt="avatar" />
                <div v-else>
                  <PlusOutlined />
                  <div class="ant-upload-text">uploading</div>
                </div>
              </a-upload>
            </a-form-item>
          </a-col>
        </a-row>
      </a-form>
      <a-row :getter="24">
        <a-col :span="4" :offset="10">
          <a-space>
            <a-button class="mainOpera" v-if="!editBtnFlag" type="primary" @click="Save()">保存</a-button>
            <a-button v-if="!editBtnFlag" @click="Reset()">重置</a-button>
            <a-button class="mainOpera" v-else type="primary" @click="UpdateConfig(0)">修改</a-button>
          </a-space>
        </a-col>
      </a-row>
    </section>
  </div>
</template>
<script setup>
import verify from '@/utils/verify';
import { useStore } from '@/store';
import { POST } from '@/utils/axios';
import { userPath } from "@/utils/const/reqUrlPath.js"
import { message } from 'ant-design-vue';
const useState = useStore();
// Form
let formRef = ref(null);
const layout = {
  labelCol: { style: { width: '100px' } },
  wrapperCol: { span: 6 },
};
const formData = reactive({});
const formRules = {
  username: [
    {
      required: true,
      message: '请输入用户账号!',
      trigger: 'blur',
    }
  ],
  name: [
    {
      required: true,
      message: '请输入用户姓名!',
      trigger: 'blur',
    }
  ],
  gender: [
    {
      required: true,
      message: '请选择性别!',
      trigger: 'blur',
    }
  ],
  phone: [
    {
      required: true,
      trigger: 'blur',
      validator: verify.isPhoneNotNull
    }
  ],
  email: [
    {
      required: true,
      trigger: 'blur',
      validator: verify.isEmailNotNull
    }
  ],

};
const imageUrl = ref('');
const editDisabled = ref(true);
const editBtnFlag = ref(true);
// 图片转base64
const GetBase64 = (img, callback) => {
  const reader = new FileReader();
  reader.addEventListener('load', () => callback(reader.result));
  reader.readAsDataURL(img);
}
// 上传
const UploadChange = info => {
  if (info.file.status === 'uploading') {
    return;
  }
  if (info.file.status === 'done') {
    let { file } = info;
    let { url } = file.response.data;
    formData.avatarurl = url;
    GetBase64(info.file.originFileObj, base64Url => {
      imageUrl.value = base64Url;
    });
  }
  if (info.file.status === 'error') {
    message.error('上传失败');
  }
};
// 获取用户信息
const GetUserInfo = async () => {
  let { userid } = useState.$state;
  let resultRes = await POST(`/${userPath}/info`, {
    id: userid
  });
  let { code } = resultRes;
  if (code == 0) {
    Object.assign(formData, resultRes.data);
  }
}
// 编辑/修改
const UpdateConfig = (flag) => {
  editBtnFlag.value = flag ? true : false;
  editDisabled.value = flag ? true : false;
}
// 保存
const Save = () => {
  formRef.value
    .validate()
    .then(async () => {
      let { avatarurl, name } = formData;
      let { userid } = useState.$state;
      let resultRes = await POST(`/${userPath}/update`, Object.assign(formData, {
        id: userid,
        password: undefined,
      }));
      if (resultRes.code == 0) {
        UpdateConfig(1)
        useState.$state.avatarurl = avatarurl;
        useState.$state.name = name;
        message.success('保存成功');
      }
    })
    .catch(error => {
      console.log('error', error);
    });
}
// 重置
const Reset = () => {
  formRef.value.resetFields();
}
onMounted(() => {
  GetUserInfo();
})
onBeforeUnmount(() => {
  UpdateConfig(1);
})
</script>

<style lang="scss" scoped>
.Personal {
  width: 100%;
  height: 100%;
  background: #fff;
  overflow-y: auto;
  overflow-x: hidden;

  .section {
    margin-top: 20px;

    :deep(.mainOpera) {
      color: $mainOperaColor;
      background-color: $mainOperaBack;
      outline: none;

      &:hover {
        color: $mainOperaColor;
        background-color: $mainOperaBack;
        border: 1px solid #fff;
      }
    }

    .form-uploader {
      :deep(.ant-upload) {
        width: 200px;
        height: 200px;
      }

      .showImg {
        width: 100%;
        height: 100%;
      }
    }
  }

}
</style>