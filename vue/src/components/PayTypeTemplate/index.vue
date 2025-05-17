<template>
    <a-radio-group 
        v-model:value="payType" 
        class="payGroup"
        name="radioGroup"
        @change="GroupChange">
        <a-radio value="1">
            <img class="pay-type" src="@/assets/img/pay1.png" />
        </a-radio>
        <a-radio value="2">
            <img class="pay-type" src="@/assets/img/pay2.png" />
        </a-radio>
        <a-radio value="3">
            <img class="pay-type" src="@/assets/img/pay3.png" />
        </a-radio>
        <a-radio value="4">
            <img class="pay-type" src="@/assets/img/pay4.png" />
        </a-radio>
        <a-radio value="5">
            <img class="pay-type" src="@/assets/img/pay5.png" />
        </a-radio>
        <a-radio value="6">
            <img class="pay-type" src="@/assets/img/pay6.png" />
        </a-radio>
        <a-radio value="7">
            <img class="pay-type" src="@/assets/img/pay7.png" />
        </a-radio>
  </a-radio-group>
</template>
<script setup>
const emit = defineEmits(['groupSelected'])
let payType = ref('1');
const GroupChange = () => {
    emit('groupSelected', payType.value == '1' ? payType.value : '0');
}
</script>
<style lang="scss" scoped>
.payGroup{
    .pay-type{
        // width: 200px;
        // height: 80px;
    }
}
</style>