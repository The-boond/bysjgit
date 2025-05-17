<template>
  <div class="FormTempent">
    <a-form 
      ref="formTempent"
      :model="formModel" 
      :labelAlign="formConfig.labelAlign"
      :layout="formConfig.layout"
      :label-col="formConfig.labelCol" 
      :wrapper-col="formConfig.wrapperCol"
      :disabled="formConfig.disabled"
      @finish="OnSubmit">
      <a-row :gutter="24">
          <template v-for="(formItem,formItemTdx) in formList" :key="formItemTdx"> 
              <a-col :span="formItem.span" v-if="formItem.eleType == 'input'">
                  <a-form-item 
                      :label="formItem.label" 
                      :colon="formItem.colon"
                      :name="formItem.field"
                      :rules="formItem.rules">
                      <a-input-password 
                          v-model:value="formModel[`${formItem.field}`]" 
                          :placeholder="formItem.placeholder"
                          :bordered="formItem.bordered ? formItem.bordered : false"
                          v-if="formItem.type == 'password'">
                          <template #iconRender="v">
                              <EyeTwoTone v-if="v"></EyeTwoTone>
                              <EyeInvisibleOutlined v-else></EyeInvisibleOutlined>
                          </template>
                      </a-input-password>
                      <a-textarea 
                          v-model:value="formModel[`${formItem.field}`]" 
                          :placeholder="formItem.placeholder"
                          :bordered="formItem.bordered ? formItem.bordered : false"
                          :auto-size="{ minRows: 10, maxRows: 10 }"
                          v-else-if="formItem.type == 'textarea'">
                      </a-textarea>
                      <a-input 
                          v-model:value="formModel[`${formItem.field}`]" 
                          :disabled="formItem.disabled"
                          :placeholder="formItem.placeholder"
                          :bordered="formItem.bordered ? formItem.bordered : false"
                          v-else/>
                  </a-form-item>
              </a-col>
              <a-col :span="formItem.span" v-else-if="formItem.eleType == 'select'">
                  <a-form-item 
                      :label="formItem.label" 
                      :name="formItem.field"
                      :rules="formItem.rules"
                      v-if="formItem.isShowFlag"
                      >
                      <a-select 
                          v-model:value="formModel[`${formItem.field}`]"
                          :options="formItem.options"
                          :field-names="formItem.fieldNames">
                      </a-select>
                  </a-form-item>
              </a-col>
              <a-col :span="formItem.span"  v-else-if="formItem.eleType == 'radio'">
                  <a-form-item 
                      :label="formItem.label" 
                      :name="formItem.field"
                      :rules="formItem.rules"
                  >
                      <a-radio-group 
                        v-model:value="formModel[`${formItem.field}`]" 
                        :options="formItem.options"
                        :optionType="formItem.optionType"
                        :buttonStyle="formItem.buttonStyle"
                        @change="RadioGroupChange"/>
                  </a-form-item>
              </a-col>
              <a-col :span="formItem.span"  v-else-if="formItem.eleType == 'upload'">
                  <a-form-item 
                    :label="formItem.label" 
                    :name="formItem.field"
                    :rules="formItem.rules">
                    <a-upload
                      v-model:file-list="formModel[`${formItem.field}`]"
                      name="file"
                      :list-type="formItem.listType"
                      class="form-uploader"
                      :show-upload-list="false"
                      action="/api/file/upload" 
                      :max-count="1"
                      :before-upload="BeforeUpload"
                      @change="UploadChange">
                      <img class="showImg" v-if="imageUrl == '' && formModel.touxiang != undefined" :src="formModel.touxiang" alt="avatar" />
                      <img class="showImg" v-else-if="imageUrl" :src="imageUrl" alt="avatar" />
                      <div v-else>
                        <PlusOutlined />
                        <div class="ant-upload-text">uploading</div>
                      </div>    
                    </a-upload>
                  </a-form-item>
              </a-col>
          </template>
          <a-col 
            :span="formConfig.operaLocationObj.span" :offset="formConfig.operaLocationObj.offset"> 
              <div 
                  class="operaList"
                  v-if="formConfig.editText != ''">
                  <a-space>
                      <a-button 
                          class="loginAndRegistre" 
                          type="primary" 
                          html-type="submit">{{ formConfig.editText }}</a-button>
                  </a-space>
              </div>
          </a-col>
          <a-col :span="formConfig.operaLocationObj.span" :offset="formConfig.operaLocationObj.offset"> 
              <div 
                  class="operaList"
                  v-if="formConfig.submitText != '' || formConfig.resetText != ''">
                  <a-space>
                      <a-button 
                          v-if="formConfig.submitText != ''"
                          class="loginAndRegistre" 
                          type="primary" 
                          html-type="submit">{{ formConfig.submitText }}</a-button>
                      <a-button @click="Reset" v-if="formConfig.resetText != ''">{{ formConfig.resetText }}</a-button>
                  </a-space>
              </div>
          </a-col>
      </a-row>
    </a-form>
  </div>
</template>

<script setup> 
import { EyeTwoTone, EyeInvisibleOutlined,PlusOutlined } from '@ant-design/icons-vue';
import { useRouter } from "vue-router";
const router = useRouter()
const emit = defineEmits()
let props = defineProps({
  formList: {
      type: Array,
      default: []
  },
  formModel: {
      type: Object,
      default: {}
  },
  formConfig: {
      type: Object,
      default: {}
  }
});
let formTempent = ref();
const loading = ref(false);
const imageUrl = ref('');
function getBase64(img, callback) {
  const reader = new FileReader();
  reader.addEventListener('load', () => callback(reader.result));
  reader.readAsDataURL(img);
}
// 单选按钮回调
const RadioGroupChange = (e) => {
  emit('radioChange', e)
}
// 上传
const UploadChange = info => {
  if (info.file.status === 'uploading') {
    loading.value = true;
    return;
  }
  if (info.file.status === 'done') {
    getBase64(info.file.originFileObj, base64Url => {
      imageUrl.value = base64Url;
      loading.value = false;
    });
  }
  if (info.file.status === 'error') {
    loading.value = false;
    message.error('upload error');
  }
};
// 上传前
const BeforeUpload = file => {
    return true
};
/* 提交 */
const OnSubmit = () => {
  emit('success', {
      formModel: props.formModel,
      formTempent
  })
}
/* 重置 */
const Reset = () => {
  emit('reset', formTempent)
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">
.FormTempent {
  .form-uploader{
    :deep(.ant-upload) {
      width: 200px;
      height: 200px;
    }
    .showImg{
      width: 100%;
      height: 100%;
    }
  }
}
</style>
