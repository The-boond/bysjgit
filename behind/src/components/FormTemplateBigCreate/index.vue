<template>
    <div class="FormTempent">
        <a-form ref="formTempent" :model="formModel" :labelAlign="formConfig.labelAlign" :layout="formConfig.layout"
            :label-col="formConfig.labelCol" :wrapper-col="formConfig.wrapperCol" :disabled="formConfig.disabled"
            @finish="OnSubmit">
            <a-row :gutter="24">
                <slot name="header"></slot>
                <template v-for="(formItem, formItemTdx) in formList" :key="formItemTdx">
                    <a-col :span="24" v-if="formItem.eleType == 'input'">
                        <a-form-item :label="formItem.label" :colon="formItem.colon" :name="formItem.field"
                            :rules="formItem.rules">
                            <a-textarea v-model:value="formModel[`${formItem.field}`]" :placeholder="formItem.placeholder"
                                :bordered="formItem.bordered ? formItem.bordered : false"
                                :auto-size="{ minRows: 10, maxRows: 10 }" v-if="formItem.type == 'textarea'">
                            </a-textarea>
                            <a-input-number v-else-if="formItem.type == 'inputNumber'"
                                v-model:value="formModel[`${formItem.field}`]" :min="1" :max="99999999999" />
                            <a-input v-model:value="formModel[`${formItem.field}`]" :disabled="formItem.disabled"
                                :placeholder="formItem.placeholder"
                                :bordered="formItem.bordered ? formItem.bordered : false" v-else />
                        </a-form-item>
                    </a-col>
                    <a-col :span="24" v-else-if="formItem.eleType == 'select'">
                        <a-form-item :label="formItem.label" :name="formItem.field" :rules="formItem.rules">
                            <a-select v-model:value="formModel[`${formItem.field}`]" :options="formItem.options"
                                :field-names="formItem.fieldNames" :placeholder="formItem.placeholder">
                            </a-select>
                        </a-form-item>
                    </a-col>
                    <a-col :span="24" v-else-if="formItem.eleType == 'radio'">
                        <a-form-item :label="formItem.label" :name="formItem.field" :rules="formItem.rules">
                            <a-radio-group v-model:value="formModel[`${formItem.field}`]" :optionType="formItem.optionType"
                                :buttonStyle="formItem.buttonStyle">
                                <template v-for="(radioItem, radioItemIdx) in formItem.options" :key="radioItemIdx">
                                    <a-radio v-model:value="radioItem.value">{{ radioItem.label }}</a-radio>
                                </template>
                            </a-radio-group>
                        </a-form-item>
                    </a-col>
                    <a-col :span="24" v-else-if="formItem.eleType == 'dateTime'">
                        <a-form-item :label="formItem.label" :name="formItem.field" :rules="formItem.rules">
                            <a-time-picker v-if="formItem.type == 'time'" v-model:value="formModel[`${formItem.field}`]"
                                placeholder="选择时间" valueFormat="HH-mm-ss" />
                            <a-date-picker v-else-if="formItem.type == 'datetime'"
                                v-model:value="formModel[`${formItem.field}`]" format="YYYY-MM-DD HH:mm:ss"
                                valueFormat="YYYY-MM-DD HH:mm:ss" placeholder="选择时间"
                                :show-time="{ defaultValue: dayjs('00:00:00', 'HH:mm:ss') }" />
                            <a-date-picker v-else v-model:value="formModel[`${formItem.field}`]" placeholder="选择日期"
                                valueFormat="YYYY-MM-DD" />
                        </a-form-item>
                    </a-col>
                </template>
                <slot name="content"></slot>
                <a-col :span="formConfig.operaLocationObj.span" :offset="formConfig.operaLocationObj.offset">
                    <div class="operaList" v-if="formConfig.submitText != ''">
                        <a-space>
                            <a-button v-if="formConfig.submitText != ''" class="loginAndRegistre" type="primary"
                                html-type="submit">{{ formConfig.submitText }}</a-button>
                        </a-space>
                    </div>
                </a-col>
            </a-row>
        </a-form>
    </div>
</template>
  
<script setup>
import dayjs from 'dayjs';
import { EyeTwoTone, EyeInvisibleOutlined } from '@ant-design/icons-vue';
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
    .ant-row {
        margin: 0 !important;
    }
}
</style>
  