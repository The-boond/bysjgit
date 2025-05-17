<template>
    <div class="Home">
        <Menu></Menu>
        <Swiper v-if="flag"></Swiper>
        <div class="middle">
            <router-view></router-view>
        </div>
    </div>
</template>
<script setup>
    const router = useRouter();
    const route = useRoute();
    const filterList = ref({
        'Abouts': false
    })
    const flag = ref(true)
    watchEffect(() => {
        flag.value = filterList.value[route.name] == undefined ? true : filterList.value[route.name];
    })
</script>

<style lang="scss" scoped>
    .Home {
        width: 100%;
        height: 100%;

        .middle {
            width: 100%;
            display: flex;
            flex-direction: column;
            align-items: center;


        }
    }
</style>