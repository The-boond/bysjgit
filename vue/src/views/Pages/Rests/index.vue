<template>
  <div class="Rests">
    <section class="section">
      <a-menu
        class="section-menu"
        v-model:selectedKeys="selectedKey"
        mode="inline"
        @click="MenuClick"
      >
        <a-menu-item v-for="(i, idx) in items" :key="i.key">
          <component :is="i.icon"></component>
          <span>{{ i.label }}</span>
        </a-menu-item>
      </a-menu>
      <a-layout-content class="section-content">
        <router-view></router-view>
      </a-layout-content>
    </section>
  </div>
</template>
<script setup>
import { useStore } from "@/store";
import { onMounted } from "vue";
const router = useRouter();
const useState = useStore();
const selectedKey = ref([router.currentRoute.value.name]);
const items = ref([
  {
    icon: "AlignLeftOutlined",
    key: "InformationssList",
    label: "资料列表",
    title: "资料列表",
  },
  {
    icon: "AlignLeftOutlined",
    key: "ItemapplicationList",
    label: "用品申领列表",
    title: "用品申领列表",
  },
  {
    icon: "AlignLeftOutlined",
    key: "ClaimsList",
    label: "报销申请列表",
    title: "报销申请列表",
  },
  {
    icon: "AlignLeftOutlined",
    key: "WorkplanList",
    label: "工作计划列表",
    title: "工作计划列表",
  },
  {
    icon: "AlignLeftOutlined",
    key: "LeavessList",
    label: "请假列表",
    title: "请假列表",
  },
  {
    icon: "AlignLeftOutlined",
    key: "SalariessList",
    label: "薪资列表",
    title: "薪资列表",
  },
]);
const MenuClick = ({ item, key, keyPath }) => {
  router.push({
    name: key,
  });
};
watchEffect(() => {
  selectedKey.value = [router.currentRoute.value.name];
});
onMounted(() => {
  DisLogin();
});
const DisLogin = async () => {
  let resultRes = await useState.IsLogin();
  if (!resultRes) return router.push("/login");
};
</script>

<style lang="scss" scoped>
.Rests {
  width: 100%;
  height: 100%;
  background: #fff;
  // overflow-y: auto;

  .section {
    width: 1800px;
    height: 100%;
    margin: 0 auto 30px auto;
    padding: 10px 0 0;
    box-sizing: border-box;
    display: flex;

    &-menu {
      width: 200px;
    }

    &-content {
      flex: 1;
      margin: 20px;
    }
  }
}
</style>
