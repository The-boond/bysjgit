<template>
    <div class="Home">
        <div class="sider">
            <div class="sider-title">
                <!-- <div @click="ToggleCollapsed">
                    <MenuUnfoldOutlined v-if="siderCollapsed" />
                    <MenuFoldOutlined v-else />
                </div> -->
            </div>
            <a-menu class="siderMenu" v-model:selectedKeys="selectedKeys" :openKeys="openKeysArr"
                :inline-collapsed="siderCollapsed" mode="inline">
                <template v-for="(v, k) in menuList" :key="k">
                    <a-menu-item v-if="!Array.isArray(v)" @click="MenuItemClick(v)" :key="v.path">
                        <component :is="v.meta.icon"></component>
                        <span>{{ k }}</span>
                    </a-menu-item>
                    <a-sub-menu v-else :key="v">
                        <template #title>
                            <component :is="v[0].icon"></component>
                            <span>
                                {{ k }}
                            </span>
                        </template>
                        <template v-for="(c) in v" :key="c.path">
                            <a-menu-item @click="MenuItemClick(c)">
                                <component :is="c.meta.icon"></component>
                                <span>{{ c.meta.title }}</span>
                            </a-menu-item>
                        </template>
                    </a-sub-menu>
                </template>
            </a-menu>
        </div>
        <div class="content">
            <div class="content-header">
                <div class="header-left">
                    <p class="header-left-title">{{ title }}</p>
                    <p class="header-left-secondTitle">{{ tarMenuTitle }}</p>
                </div>
                <div class="header-right">
                    <a-avatar>
                        <template #icon>
                            <UserOutlined v-if="useState.$state.avatarurl == ''" />
                            <img :src="useState.$state.avatarurl" />
                        </template>
                    </a-avatar>
                    <p class="header-right-title">{{ useState.$state.name }}</p>
                    <a-button type="link" @click="LoginOut">退出</a-button>
                </div>
            </div>
            <div class="content-content">
                <a-card class="contentCard">
                    <router-view></router-view>
                </a-card>
            </div>
        </div>
    </div>
</template>
<script setup>
import { UserOutlined, VideoCameraOutlined, UploadOutlined, MenuFoldOutlined, MenuUnfoldOutlined } from '@ant-design/icons-vue';
import { useStore } from '@/store';
const router = useRouter();
const title = import.meta.env.VITE_WEB_TITLE;
let siderCollapsed = ref(false);
const selectedKeys = ref();
const openKeysArr = ref([router.currentRoute.value.meta.parentTitle]);
const useState = useStore();
const menuList = ref([])
let tarMenuTitle = ref('');
// 菜单点击
const MenuItemClick = (tarVal) => {
    router.push({
        name: tarVal.name
    })
}
const LoginOut = async () => {
    let flag = await useState.LoginOut()
    if (flag) {
        router.push({
            name: 'Login'
        })
    }
}
onMounted(() => {
    let childrenArr = router['options'].routes.filter(i => i.name == 'Home')[0].children;
    let newMenuList = childrenArr.concat(useState.routes).reduce((res, item) => {
        if (item.meta.parentTitle == undefined) {
            res[item.meta.title] = item
        } else {
            res[item.meta.parentTitle] ? res[item.meta.parentTitle].push(item) : res[item.meta.parentTitle] = [item]
        }

        return res;
    }, {});
    menuList.value = newMenuList;
})
watchEffect(() => {
    selectedKeys.value = [router.currentRoute.value.path]
    tarMenuTitle.value = router.currentRoute.value.meta.title;
})
const ToggleCollapsed = () => {
    siderCollapsed.value = !siderCollapsed.value
};
</script>
<style lang="scss" scoped>
.Home {
    width: 100%;
    height: 100%;
    display: flex;

    .sider {
        width: 200px;
        display: flex;
        flex-direction: column;
        background: linear-gradient(to bottom, #5eb6dc, #1268a3);

        &-title {
            display: flex;

            .title {
                font-size: 24px;
            }
        }

        .siderMenu {
            flex: 1;
            overflow-y: auto;
            background: transparent;
        }
    }

    .content {
        width: calc(100% - 200px);
        height: 100%;
        display: flex;
        flex-direction: column;
        background: linear-gradient(to bottom, #5eb6dc, #1268a3);

        &-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            width: 100%;
            height: 64px;
            border-top-left-radius: 8px;
            box-sizing: border-box;
            background: #fff;
            padding: 16px 12px;

            .header-left {
                display: flex;
                align-items: flex-end;
                justify-content: flex-end;

                &-title {
                    font-size: 20px;
                    font-weight: 600;
                }

                &-secondTitle {
                    font-size: 14px;
                    margin-left: 12px;
                    font-weight: 600;
                }
            }

            .header-right {
                display: flex;
                align-items: center;

                &-title {
                    font-size: 14px;
                    font-weight: 500;
                    margin-left: 5px;
                }
            }
        }

        &-content {
            height: calc(100%);
            padding: 12px;
            overflow: hidden;
            box-sizing: border-box;
            background: #f5f5f5;


            .contentCard {
                height: calc(100%);
                overflow-y: scroll;
            }
        }
    }
}
</style>