<template>
    <div class="FormTempent">
        <a-form ref="formTempent" :model="formModel" :labelAlign="formConfig.labelAlign" :layout="formConfig.layout"
            :label-col="formConfig.labelCol" @finish="OnSubmit">
            <a-row :gutter="24">
                <template v-for="(formItem, formItemTdx) in formList" :key="formItemTdx">
                    <a-col :span="6" v-if="formItem.eleType == 'input'">
                        <a-form-item :label="formItem.label" :colon="formItem.colon" :name="formItem.field"
                            :rules="formItem.rules">
                            <a-input v-model:value="formModel[`${formItem.field}`]" :placeholder="formItem.placeholder"
                                :bordered="formItem.bordered ? formItem.bordered : false" allow-clear />
                        </a-form-item>
                    </a-col>
                    <a-col :span="6" v-else-if="formItem.eleType == 'select'">
                        <a-form-item :label="formItem.label" :name="formItem.field" :rules="formItem.rules">
                            <a-select v-model:value="formModel[`${formItem.field}`]" :placeholder="formItem.placeholder"
                                allowClear>
                                <template v-for="(selectItem, selectItemIdx) in formItem.options" :key="selectItemIdx">
                                    <a-select-option :value="selectItem.value">{{ selectItem.label }}</a-select-option>
                                </template>
                            </a-select>
                        </a-form-item>
                    </a-col>
                    <a-col :span="4" v-else-if="formItem.eleType == 'radio'">
                        <a-form-item :label="formItem.label" :name="formItem.field" :rules="formItem.rules">
                            <a-radio-group v-model:value="formModel[`${formItem.field}`]" :optionType="formItem.optionType"
                                :buttonStyle="formItem.buttonStyle">
                                <template v-for="(radioItem, radioItemIdx) in formItem.options" :key="radioItemIdx">
                                    <a-radio v-model:value="radioItem.value">{{ radioItem.label }}</a-radio>
                                </template>
                            </a-radio-group>
                        </a-form-item>
                    </a-col>
                </template>
                <a-col :span="4">
                    <a-form-item>
                        <a-space>
                            <a-button class="loginAndRegistre" type="primary" html-type="submit">{{ formConfig.submitText
                            }}</a-button>
                            <a-button @click="Reset" v-if="formConfig.resetText != ''">{{ formConfig.resetText }}</a-button>
                        </a-space>
                    </a-form-item>
                </a-col>
            </a-row>
        </a-form>
    </div>
</template>
  
<script setup>
import { EyeTwoTone, EyeInvisibleOutlined } from '@ant-design/icons-vue';
import { useRouter } from "vue-router";
const router = useRouter()
const emit = defineEmits(['success', 'reset'])
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
    emit('success', props.formModel)
}
/* 重置 */
const Reset = () => {
    emit('reset', formTempent)
}
</script>
  
<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">
.FormTempent {}
</style>
  