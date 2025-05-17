<template>
  <div class="MyProfile">
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
    icon: "UserOutlined",
    key: "Personal",
    label: "个人中心",
    title: "个人中心",
  },
  {
    icon: "KeyOutlined",
    key: "ChangePassword",
    label: "修改密码",
    title: "修改密码",
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
.MyProfile {
  width: 100%;
  height: 100%;
  background: #fff;
  min-height: 700px;
  // overflow-y: auto;
  .section {
    width: 1400px;
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
    }
  }
}
</style>
