import { createRouter, createWebHashHistory } from "vue-router";
import NProgress from "nprogress";
import { useStore } from "@/store";
const routes = [
  {
    path: "/",
    redirect: "/home",
  },
  {
    path: "/login",
    name: "Login",
    component: () => import("@/views/Login/index.vue"),
  },
  {
    path: "/home",
    name: "Home",
    redirect: "/personalCenter",
    component: () => import("@/views/Home/index.vue"),
    meta: {
      show: "true",
      title: "首页",
    },
    children: [],
  },
];
const router = createRouter({
  history: createWebHashHistory(),
  routes,
});
// 全局守卫 路由进入前
router.beforeEach(async (to, from, next) => {
  let useState = useStore();
  NProgress.start();
  let resultFlag = await useState.IsLogin();
  if (!resultFlag) {
    if (to.name != "Login") {
      if (to.name == "Register") next();
      else next({ name: "Login" });
    } else next();
  } else {
    let flag = await useState.ConfigRouter();
    if (flag) {
      useState.OnlineSocket(useState.$state.userid);
      if (!to.matched.length) {
        router.push(to.path);
      }
      next();
    } else next();
  }
});
// 全局守卫 路由离开
router.afterEach((_to) => {
  NProgress.done();
});
export default router;
