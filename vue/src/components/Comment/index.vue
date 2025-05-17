<template>
    <CommentTemplate :data="commentList"></CommentTemplate>
    <a-comment>
        <template #avatar>
            <a-avatar :src="useState.$state.avatarurl" @click="SetOneSelf" />
        </template>
        <template #content>
            <a-form-item>
                <a-textarea :auto-size="{ minRows: 2, maxRows: 5 }" v-model:value="commentVal"
                    :placeholder="commentPlaceholder" />
            </a-form-item>
            <a-form-item>
                <a-button class="send-comment mainOpera" html-type="submit" :loading="replyLoading" type="primary"
                    @click="SendComment">
                    发送评论
                </a-button>
            </a-form-item>
        </template>
    </a-comment>
</template>
<script setup>
import { message } from 'ant-design-vue';
import { POST } from '@/utils/axios';
import { commentPath } from '@/utils/const/reqUrlPath';
import { useStore } from '@/store';
import { watchEffect } from 'vue';
const useState = useStore();
let props = defineProps({
    typeId: {
        type: String,
    }
})
let commentList = ref([]);
let commentVal = ref('');
let commentPlaceholder = ref('发表评论');
let targetReplyVal = reactive({});
let clearReactive = reactive({});
let replyLoading = ref(false);
provide("replyTo", (val) => SetReplyTo(val))
provide("like", (val) => LikeClick(val))
// 获取评论列表
const GetCommentList = async () => {
    let reqObj = {
        refid: props.typeId,
    }
    let resultRes = await POST(`/${commentPath}/list`, reqObj);
    if (resultRes.code != 0) return;
    commentList.value = resultRes.data;
}
// 发送评论
const SendComment = async () => {
    replyLoading.value = true;
    let reqObj = {
        refid: props.typeId,
        userid: useState.$state.userid,
        content: commentVal.value,
        parentId: targetReplyVal.id
    };
    let resultRes = await POST(`/${commentPath}/save`, reqObj);
    if (resultRes.code != 0) return message.error('评论失败');
    message.success('评论成功');
    GetCommentList();
    commentVal.value = '';
    replyLoading.value = false;
}
const SetOneSelf = () => {
    targetReplyVal = clearReactive;
    commentPlaceholder.value = "发表评论"
}
// 设置评论
const SetReplyTo = (val) => {
    Object.assign(targetReplyVal, val);
    commentPlaceholder.value = `评论:${val.nickname}`
}
// 点赞
const LikeClick = async (val) => {
    let resultRes = await POST(`/${commentPath}/like`, { id: val.id });
    if (resultRes.code != 0) return message.error('点赞失败');
    val.likeActive = true;
    val.likesCount = ++val.likesCount;
    message.success('点赞成功');
}
watchEffect(() => {
    if (props.typeId) {
        GetCommentList()
    }
})
</script>

<style lang="scss" scoped>
:deep(.mainOpera){
    background-color: $mainOperaBack;
    color: $mainOperaColor;
    outline: none;

    &:hover {
        background-color: $mainOperaBack;
        color: $mainOperaColor;
        border: 1px solid #fff;
    }
}
</style>