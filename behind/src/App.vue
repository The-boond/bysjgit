<template> 
  <a-config-provider :locale="locale">
    <router-view></router-view>
  </a-config-provider>
</template>

<script setup>
import dayjs from 'dayjs';
import 'dayjs/locale/zh-cn';
import zhCN from 'ant-design-vue/es/locale/zh_CN';
const locale = ref(zhCN);
dayjs.locale('zh-cn');
</script>


<style scoped>
</style>
