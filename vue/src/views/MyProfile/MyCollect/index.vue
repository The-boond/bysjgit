<template>
  <div class="MyCollect">
    <section class="section">
      <a-table class="table" :dataSource="favoritesList" :columns="columns" :pagination="false">
        <template #bodyCell="{ column, record }">
          <template v-if="column.dataIndex === 'name'">
            <p class="goodName" style="cursor: pointer;" @click="Buy(record)">{{ record.name }}</p>
          </template>
          <template v-if="column.dataIndex === 'picture'">
            <img :src="record.picture" :style="{
              width: '100px',
              height: '100px'
            }" />
          </template>
        </template>
      </a-table>
    </section>
  </div>
</template>

<script setup>
import { useStore } from '@/store';
import { POST } from '@/utils/axios';
import { ref, onMounted, reactive } from 'vue';
import { columns } from './index.js';
import { useRouter } from 'vue-router';
const router = useRouter();
const useState = useStore();
let favoritesList = ref([])
const GetData = async () => {
  const data = {
    userid: useState.$state.userid,
    type: 3,
  }
  let resultRes = await POST('/storeup/list', data);
  if (resultRes.code == 500) return;
  favoritesList.value = resultRes.data;
  console.log(favoritesList.value)
}
const Buy = (tarVal) => {
  router.push({
    name: 'ShopDetail',
    state: {
      id: tarVal.refid
    }
  })
}
onMounted(() => {
  GetData()
})
</script>


<style lang="scss" scoped>
.MyCollect {
  width: 100%;
  height: 100%;
  background: #fff;
  overflow-y: auto;

  .section {
    margin: 20px;

    .goodName {
      width: 180px;
      white-space: nowrap;
      /* 防止文本换行 */
      overflow: hidden;
      /* 隐藏溢出的部分 */
      text-overflow: ellipsis;
    }
  }
}
</style>