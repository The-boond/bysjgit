<template>
    <div v-if="type == '2'">
        <div>
            <HeartOutlined :style="{
                color: attentionFlag ? 'red' : '',
            }" @click="AttentionClick" />
        </div>
    </div>
    <div v-else-if="type == '3'">
        <div v-if="!collectFlag" @click="CollectClick">
            <svg t="1701249209036" class="collect-icon" viewBox="0 0 1024 1024" version="1.1"
                xmlns="http://www.w3.org/2000/svg" p-id="12290">
                <path
                    d="M902.211 410.358a31.766 31.766 0 0 0-25.644-21.62L644.34 354.994 540.485 144.561a31.765 31.765 0 0 0-56.971 0L379.659 354.995l-232.227 33.744a31.768 31.768 0 0 0-17.606 54.183l168.042 163.8-39.669 231.288a31.765 31.765 0 0 0 46.091 33.487L512 762.298l207.71 109.199c6.915 3.65 22.854 4.496 33.454-2.418 10.086-6.579 14.681-19.151 12.637-31.069l-39.669-231.288 168.041-163.8a31.765 31.765 0 0 0 8.038-32.564zM669.827 572.885a31.766 31.766 0 0 0-9.136 28.117l31.611 184.31-165.521-87.02a31.746 31.746 0 0 0-14.782-3.648 31.755 31.755 0 0 0-14.782 3.648l-165.521 87.02 31.611-184.31a31.766 31.766 0 0 0-9.135-28.117l-133.91-130.53 185.058-26.89a31.765 31.765 0 0 0 23.918-17.377L512 230.396l82.761 167.691a31.765 31.765 0 0 0 23.917 17.377l185.059 26.89-133.91 130.531z"
                    fill="" p-id="12291"></path>
            </svg>
        </div>
        <div v-else @click="CollectClick">
            <svg t="1701353681519" class="collectSelect-icon" viewBox="0 0 1024 1024" version="1.1"
                xmlns="http://www.w3.org/2000/svg" p-id="31231">
                <path
                    d="M509.606998 104.904235c-24.043602 0-45.922912 13.226233-56.177464 33.95637L356.189863 336.302419l-223.674269 32.54216c-22.983457 3.304256-42.100864 18.718317-49.481971 39.659255-7.381108 21.048385-1.812275 44.23241 14.431687 60.033281l163.916257 160.125931-38.011732 222.016513c-3.868097 22.408359 6.03239 44.819788 25.458835 57.94676 10.69662 7.116071 23.204491 10.784624 35.757388 10.784624 10.298554 0 20.663622-2.475378 30.055526-7.337105l194.987926-102.7205L704.662463 912.072815c9.369392 4.861728 19.712971 7.337105 29.990035 7.337105 12.57541 0 25.082258-3.668553 35.778878-10.784624 19.426445-13.126972 29.305443-35.538401 25.460882-57.94676l-38.012755-222.016513 163.937746-160.125931c16.22145-15.812127 21.810748-38.984896 14.408151-60.033281-7.402597-20.940938-26.51898-36.353976-49.503461-39.659255L663.04767 336.302419l-97.240695-197.441814C555.619962 118.131491 533.695626 104.904235 509.606998 104.904235L509.606998 104.904235z"
                    fill="#f4ea2a" p-id="31232"></path>
            </svg>
        </div>
    </div>
    <div class="praise-chunk" v-else-if="type == '4'">
        <div>
            <LikeOutlined class="left" :class="{
                'leftActive': leftActive
            }
                " @click="LeftLike()" />
            <DislikeOutlined class="right" :class="{
                'rightActive': rightActive
            }
                " @click="RightLike()" />
        </div>
    </div>
    <div v-else-if="type == '5'">
        <div>
            <HeartOutlined :style="{
                color: likeFlag ? 'red' : '',
            }" @click="LikeClick" />
        </div>
    </div>
</template>
<script setup>
import { POST } from '@/utils/axios';
import { message } from 'ant-design-vue';
import { reactive } from 'vue';
let props = defineProps({
    type: {
        type: String,
    },
    id: {
        type: String,
    },
    name: {
        type: String,
    },
    picture: {
        type: String,
    }
})
let attentionFlag = ref(false)
let likeFlag = ref(false);
let collectFlag = ref(false);
let leftActive = ref(false);
let rightActive = ref(false);
let tarVal = reactive({});
let disTarVal = reactive({});
// 关注
const AttentionClick = async () => {
    let data = [tarVal.id]
    let resultRes = await POST(`/storeup/${attentionFlag.value ? 'delete' : 'save'}`, attentionFlag.value ? data : {
        refid: props.id,
        type: props.type,
        name: props.name,
        picture: props.picture
    });
    if (resultRes.code == 500) return;
    attentionFlag.value = !attentionFlag.value;
    GetType();
}
// 喜欢
const LikeClick = async () => {
    let data = [tarVal.id]
    let resultRes = await POST(`/storeup/${likeFlag.value ? 'delete' : 'save'}`, likeFlag.value ? data : {
        refid: props.id,
        type: props.type,
        name: props.name,
        picture: props.picture
    });
    if (resultRes.code == 500) return;
    likeFlag.value = !likeFlag.value;
    GetType();
}
// 左边点赞
const LeftLike = async () => {
    let data = [tarVal.id]
    let resultRes = await POST(`/storeup/${leftActive.value ? 'delete' : 'save'}`, leftActive.value ? data : {
        refid: props.id,
        type: props.type,
        name: props.name,
        picture: props.picture
    });
    if (resultRes.code == 500) return;
    leftActive.value = !leftActive.value;
    GetType();
}
// 右边踩
const RightLike = async () => {
    let data = [disTarVal.id]
    let resultRes = await POST(`/storeup/${rightActive.value ? 'delete' : 'save'}`, rightActive.value ? data : {
        refid: props.id,
        type: '-1',
        name: props.name,
        picture: props.picture
    });
    if (resultRes.code == 500) return;
    if (leftActive.value) {
        let data = [tarVal.id]
        let resultRes = await POST(`/storeup/delete`, data);
        if (resultRes.code == 500) return;
        leftActive.value = !leftActive.value;
        GetType();
    }
    rightActive.value = !rightActive.value;
    GetType('-1');
}
// 收藏
const CollectClick = async () => {
    let data = [tarVal.id]
    let resultRes = await POST(`/storeup/${collectFlag.value ? 'delete' : 'save'}`, collectFlag.value ? data : {
        refid: props.id,
        type: props.type,
        name: props.name,
        picture: props.picture
    });
    if (resultRes.code == 500) return;
    collectFlag.value = !collectFlag.value;
    GetType();
}
const GetType = async (type = undefined) => {
    let resultRes = await POST('/storeup/list', {
        refid: props.id,
        type: type == undefined ? props.type : type
    });
    if (resultRes.code == 500) return;
    switch (props.type) {
        case '3':
            collectFlag.value = props.id == resultRes?.data[0]?.refid;
            tarVal = Object.assign(tarVal, resultRes?.data[0]);
            break;
        case '4':
            if (type == '-1') {
                rightActive.value = props.id == resultRes?.data[0]?.refid;
                disTarVal = Object.assign(tarVal, resultRes?.data[0]);
            } else {
                leftActive.value = props.id == resultRes?.data[0]?.refid;
                tarVal = Object.assign(tarVal, resultRes?.data[0]);
            }
            break;
        case '5':
            likeFlag.value = props.id == resultRes?.data[0]?.refid;
            tarVal = Object.assign(tarVal, resultRes?.data[0]);
            break;
    }
}
watchEffect(() => {
    if (props.type) {
        GetType();
        if (props.type == 4) return GetType('-1');
    }

})
</script>
<style lang="scss" scoped>
.collect-icon {
    width: 16px;
    height: 16px;
    display: flex;
    align-items: center;
    justify-content: center;
}

.collectSelect-icon {
    width: 16px;
    height: 16px;
    display: flex;
    align-items: center;
    justify-content: center;
}

.praise-chunk {
    display: flex;

    .left {
        margin-right: 5px;

        &:hover {
            color: red;
        }
    }

    .leftActive {
        color: red;
    }

    .right {
        margin-left: 5px;

        &:hover {
            color: red;
        }
    }

    .rightActive {
        color: red;
    }
}
</style>