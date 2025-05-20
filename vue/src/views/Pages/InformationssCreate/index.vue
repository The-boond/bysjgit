<template>
  <div class="createTemplate">
    <a-form ref="formRef" :model="formData" @finish="onSubmit" :label-col="{ span: 6 }" :wrapper-col="{ span: 14 }" :label-align="'right'">
      <a-row :gutter="24">
        <a-col :span="24">
          <a-form-item label="资料名称" name="name" :rules="[{ required: true, message: '请输入资料名称' }]">
            <a-input
                    v-model:value="formData.name"
                    placeholder="请输入资料名称"
                    :disabled="oldFormData.name"
                    class="input-style"
            />
          </a-form-item>
        </a-col>

        <a-col :span="24">
          <a-form-item label="图片" name="photo">
            <a-upload
                    v-model:file-list="formData.photo"
                    name="file"
                    list-type="picture-card"
                    class="cover-uploader"
                    :show-upload-list="false"
                    action="/api/file/upload"
                    :maxCount="1"
                    @change="photoUploadChange"
                    :disabled="oldFormData.photo"
            >
              <a-image
                      v-if="photoImageUrl"
                      :src="photoImageUrl"
                      :preview="false"
                      class="upload-image"
              />
              <a-image
                      v-else-if="formData.photo && formData.photo.length"
                      :src="formData.photo[0].url"
                      :preview="false"
                      class="upload-image"
              />
              <div v-else class="coverDefault">
                <PlusOutlined class="plus-icon" />
                <div class="ant-upload-text">上传图片</div>
              </div>
            </a-upload>
          </a-form-item>
        </a-col>

        <a-col :span="24">
          <a-form-item label="资料文件" name="files">
            <a-upload
                    v-model:file-list="formData.filesUpFiles"
                    action="/api/file/upload"
                    :max-count="1"
                    :disabled="oldFormData.files"
            >
              <a-button class="upload-btn" type="primary" icon="upload-outlined">
                上传文件
              </a-button>
            </a-upload>
          </a-form-item>
        </a-col>

        <a-col :span="24">
          <a-form-item label="资料简介" name="detail">
            <a-textarea
                    v-model:value="formData.detail"
                    placeholder="请输入资料简介"
                    :auto-size="{ minRows: 8, maxRows: 12 }"
                    :disabled="oldFormData.detail"
                    class="textarea-style"
            />
          </a-form-item>
        </a-col>

        <a-col :span="24">
          <a-form-item :wrapper-col="{ span: 14, offset: 6 }">
            <a-button type="primary" html-type="submit" class="submit-btn">提交</a-button>
            <!-- <a-button style="margin-left: 10px" @click="onReset">重置</a-button> -->
          </a-form-item>
        </a-col>
      </a-row>
    </a-form>
  </div>
</template>

<script setup>
  import { ref, reactive, shallowRef, onMounted, onBeforeUnmount, nextTick } from "vue";
  import { useStore } from "@/store";
  import { POST } from "@/utils/axios";
  import { message } from "ant-design-vue";
  import { PlusOutlined, UploadOutlined } from "@ant-design/icons-vue";

  const useState = useStore();
  const router = useRouter();

  const formRef = ref(null);
  const formData = reactive({});
  const oldFormData = reactive({});

  const photoImageUrl = ref(null);

  function photoUploadChange(info) {
    if (info.file.status === "uploading") return;

    if (info.file.status === "done") {
      getBase64(info.file.originFileObj, (base64Url) => {
        photoImageUrl.value = base64Url;
      });
    } else if (info.file.status === "error") {
      message.error("上传失败！");
    }
  }

  function getBase64(img, callback) {
    const reader = new FileReader();
    reader.addEventListener("load", () => callback(reader.result));
    reader.readAsDataURL(img);
  }

  async function onSubmit(values) {
    const { id, shenheid } = formData;

    const data = {
      ...values,
      shenheid,
      adduserid: useState.$state.userid,
      addusername: useState.$state.username,
      shenhe: "待审核",
      photo: formData.photo
              ? formData.photo[0]?.url ?? formData.photo[0]?.response?.data?.url
              : undefined,
      files: formData.filesUpFiles
              ? JSON.stringify(formData.filesUpFiles[0]?.response?.data)
              : formData.files,
    };

    try {
      const { code } = await POST(`/informationss/${id !== undefined ? "update" : "save"}`, data);
      if (code !== 0) {
        message.error("创建失败");
        return;
      }
      message.success("提交成功");
      router.push("/InformationssList");
    } catch (error) {
      message.error("提交异常，请稍后重试");
      console.error(error);
    }
  }

  onMounted(() => {
    const { type, editVal } = history.state || {};
    if (!type) return;

    nextTick(() => {
      const editObj = JSON.parse(editVal || "{}");
      if (type === 6) {
        const obj = {};
        for (const key in editObj) {
          if (key === "id") {
            obj["shenheid"] = editObj[key];
          } else {
            obj[key] = editObj[key];
          }
        }
        Object.assign(formData, obj, {
          filesUpFiles: editObj.files ? [JSON.parse(editObj.files)] : [],
        });
        Object.assign(oldFormData, formData);
      } else {
        Object.assign(formData, editObj, {
          filesUpFiles: editObj.files ? [JSON.parse(editObj.files)] : [],
        });
      }
    });
  });
</script>

<style lang="scss" scoped>
  .createTemplate {
    max-width: 700px;
    margin: 40px auto;
    padding: 30px 40px;
    background: #fff;
    border-radius: 12px;
    box-shadow: 0 8px 24px rgba(0, 0, 0, 0.12);
    font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;

    .input-style,
    .textarea-style {
      border-radius: 6px;
      border: 1px solid #d9d9d9;
      transition: border-color 0.3s ease, box-shadow 0.3s ease;

      &:focus,
      &:hover {
        border-color: #40a9ff;
        box-shadow: 0 0 5px rgba(24, 144, 255, 0.2);
        outline: none;
      }
    }

    .textarea-style {
      resize: vertical;
    }

    .cover-uploader {
      width: 120px;
      height: 120px;
      border-radius: 8px;
      display: flex;
      align-items: center;
      justify-content: center;
      cursor: pointer;
      transition: border-color 0.3s ease;

      &:hover {
        border-color: #40a9ff;
      }

      .upload-image {
        width: 100%;
        height: 100%;
        object-fit: cover;
        border-radius: 8px;
      }
    }

    .coverDefault {
      display: flex;
      flex-direction: column;
      align-items: center;
      color: #999;
      font-size: 14px;

      .plus-icon {
        font-size: 28px;
        margin-bottom: 6px;
        color: #1890ff;
      }
    }

    .upload-btn {
      display: flex;
      align-items: center;
      gap: 6px;
      border-radius: 6px;
      transition: background-color 0.3s ease;

      &:hover {
        background-color: #096dd9;
        border-color: #096dd9;
      }
    }

    .submit-btn {
      width: 100%;
      padding: 10px 5;
      font-weight: 600;
      border-radius: 8px;
      font-size: 16px;
    }

    /* 调整标签对齐 */
    .ant-form-item-label > label {
      font-weight: 600;
      color: #333;
    }
  }
</style>
