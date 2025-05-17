<template>
    <a-empty v-if="data.length == 0" :image="simpleImage" description="暂无评论"/>
    <template v-else>
        <a-comment v-for="(i, idx) in data" :key="idx">
            <template #author>
                <a>{{ i.nickname }}</a>
            </template>
            <template #avatar>
                <a-avatar
                    :src="i.avatarurl"
                />
            </template>
            <template #content>
                <p>{{ i.content }}</p> 
            </template>
            <template #actions>
                <span key="comment-nested-reply-to" @click="SetReplyTo(i)">评论</span>
                <LikeFilled class="like-icon" :class="{
                    'like-iconActive': i.likeActive 
                }" @click="LikeClick(i)"/>
                <p>{{ i.likesCount }}</p>
                <p class="comment-time">{{ i.createTime }}</p>
            </template>
            <component 
                :is="'CommentTemplate'" 
                v-if="i.children != undefined"  
                :data="i.children"></component>
        </a-comment>
    </template>
</template>
<script setup>
import { Empty } from 'ant-design-vue';
const simpleImage = Empty.PRESENTED_IMAGE_SIMPLE;
const emit = defineEmits()
let SetReplyTo  = inject("replyTo");
let LikeClick  = inject("like");
let prop = defineProps({
    data: {
        type: Array,
        default: []
    }
})

</script>
<style lang="scss" scoped>
.comment-time{
    margin-left: 20px;
}
:deep(.like-icon){
    margin-right: 5px !important;

}
:deep(.like-iconActive){
    color: red !important;
}

</style>