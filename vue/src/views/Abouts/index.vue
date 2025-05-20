<template>
    <div class="aboutsTemTwo">
        <div class="overlay"></div>
        <div class="content-wrapper">
            <div class="top">
                <p class="title" v-text="aboutsDetails?.title || 'About Us'"></p>
                <p class="titleEnglish">About Us</p>
            </div>
            <div class="container">
                <p class="container-time" v-if="aboutsDetails?.addtime">
                    <span>发布时间：</span>
                    <span class="container-time-date">{{ aboutsDetails.addtime }}</span>
                </p>
                <a-divider />
                <div class="container-content" v-html="decodedContent"></div>
            </div>
        </div>
    </div>
</template>

<script setup>
    import { reactive, onMounted, computed } from 'vue'
    import { POST } from '@/utils/axios'

    const aboutsDetails = reactive({})

    const decodedContent = computed(() => {
        if (!aboutsDetails.content) return ''
        try {
            return decodeURIComponent(aboutsDetails.content)
        } catch {
            return aboutsDetails.content
        }
    })

    const GetAboutsInfo = async () => {
        try {
            const { code, data } = await POST('/aboutus/list', {})
            if (code !== '0' || !data?.length) return
            Object.assign(aboutsDetails, data[0])
        } catch (error) {
            console.error('获取关于我们信息失败:', error)
        }
    }

    onMounted(() => {
        GetAboutsInfo()
    })
</script>

<style lang="scss" scoped>
    .aboutsTemTwo {
        position: relative;
        width: 100%;
        min-height: 100vh;
        padding: 60px 10%;
        box-sizing: border-box;
        background: url('@/assets/indexImg/aboutsBack.jpg') no-repeat center center;
        background-size: cover;
        color: #fff;
        display: flex;
        justify-content: center;
        align-items: center;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;

        // 亮度更高的渐变遮罩，透明度降低
        .overlay {
            position: absolute;
            inset: 0;
            background: linear-gradient(
                            180deg,
                            rgba(0, 0, 0, 0.35) 0%,
                            rgba(0, 0, 0, 0.15) 50%,
                            rgba(0, 0, 0, 0.35) 100%
            );
            z-index: 1;
        }

        .content-wrapper {
            position: relative;
            z-index: 2;
            max-width: 900px;
            width: 100%;
            // 背景色提亮，透明度降低，模糊稍弱
            background: rgba(255, 255, 255, 0.15);
            padding: 40px 50px;
            border-radius: 20px;
            box-shadow: 0 12px 40px rgba(0, 0, 0, 0.5);
            backdrop-filter: blur(8px);
            color: #f0f0f0;

            .top {
                display: flex;
                align-items: flex-end;
                margin-bottom: 40px;

                .title {
                    font-size: 56px;
                    font-weight: 900;
                    letter-spacing: 18px;
                    margin: 0;
                    line-height: 1;
                    text-transform: uppercase;
                    text-shadow: 2px 2px 6px rgba(0, 0, 0, 0.6);
                    user-select: none;
                }

                .titleEnglish {
                    font-size: 28px;
                    font-weight: 600;
                    margin-left: 24px;
                    margin-bottom: 6px;
                    font-style: italic;
                    opacity: 0.85;
                    user-select: none;
                    text-shadow: 1px 1px 4px rgba(0, 0, 0, 0.4);
                }
            }

            .container {
                width: 100%;
                display: flex;
                flex-direction: column;
                align-items: flex-start;

                &-time {
                    margin-bottom: 24px;
                    font-size: 14px;
                    color: rgba(255, 255, 255, 0.85);
                    font-weight: 500;
                    letter-spacing: 1px;

                    &-date {
                        margin-left: 10px;
                        font-weight: 700;
                        color: #a0d8ef;
                        user-select: text;
                    }
                }

                a-divider {
                    border-color: rgba(255, 255, 255, 0.35);
                    margin-bottom: 30px;
                }

                &-content {
                    font-size: 18px;
                    line-height: 1.9;
                    color: #eaeaea;
                    user-select: text;

                    p {
                        margin-bottom: 1.2em;
                    }

                    a {
                        color: #7ec8f5;
                        text-decoration: underline;
                        transition: color 0.3s ease;

                        &:hover {
                            color: #4aa3e0;
                        }
                    }

                    strong {
                        color: #fff;
                        font-weight: 700;
                    }

                    em {
                        font-style: italic;
                        color: #c0d6e4;
                    }
                }
            }
        }

        // 响应式保持不变
        @media (max-width: 992px) {
            padding: 40px 5%;

            .content-wrapper {
                padding: 30px 35px;

                .top {
                    flex-direction: column;
                    align-items: flex-start;

                    .title {
                        font-size: 42px;
                        letter-spacing: 12px;
                    }

                    .titleEnglish {
                        font-size: 22px;
                        margin-left: 0;
                        margin-top: 8px;
                    }
                }

                .container {
                    &-time {
                        font-size: 13px;
                        margin-bottom: 20px;
                    }

                    &-content {
                        font-size: 16px;
                        line-height: 1.7;
                    }
                }
            }
        }

        @media (max-width: 576px) {
            padding: 30px 3%;

            .content-wrapper {
                padding: 25px 20px;

                .top {
                    .title {
                        font-size: 32px;
                        letter-spacing: 8px;
                    }

                    .titleEnglish {
                        font-size: 18px;
                    }
                }

                .container {
                    &-time {
                        font-size: 12px;
                        margin-bottom: 16px;
                    }

                    &-content {
                        font-size: 14px;
                        line-height: 1.6;
                    }
                }
            }
        }
    }
</style>
