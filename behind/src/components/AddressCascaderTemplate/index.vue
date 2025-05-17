<template>
    <a-cascader
        v-model:value="addressValue"
        :options="options"
        :field-names="{ label: 'text', value: 'text' }"
        placeholder="选择地址"
        change-on-select
        @change="SelectCascader"
    >
    </a-cascader>
</template>
<script setup>
import addressJson from '@/utils/addressJson';
const emit = defineEmits(['selected']);
const props = defineProps({
    data: {
        type: Array,
        defult: []
    }
})
const addressValue = ref([]);
const options = ref(addressJson);
const SelectCascader = (value, selectedOptions) => {
    emit('selected', value)
}
watchEffect(() => {
    addressValue.value = props.data;
})
</script>