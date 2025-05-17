<template>
    <a-cascader
        v-model:value="value"
        :options="options"
        :field-names="{ label: 'label', value: 'label' }"
        placeholder="选择地址"
        change-on-select
        @change="SelectCascader"
    >
    </a-cascader>
</template>
<script setup>
import addressJson from '@/utils/addressJson';
const emit = defineEmits();
const props = defineProps({
    data: {
        type: Array,
        defult: []
    }
})
const value = ref(props.data);
const options = ref(addressJson);
const SelectCascader = (value, selectedOptions) => {
    emit('selected', value)
}
watchEffect(() => {
    value.value = props.data;
})
</script>