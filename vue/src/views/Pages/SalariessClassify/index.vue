
        <template>
            <div class="Classify_1">
                <div class="container">
                    <aside class="container-sider fadeInUp wow" data-wow-delay=".5s">
                        <div class="widget-cat">
                            <h3 class="widget-title">Search</h3>
                            <div class="search-box">
                                <a-input-search v-model:value="search" placeholder="搜索" size="large"
                                    @search="OnSearch" />
                            </div>
                        </div>
                        <div class="widget-cat">
                            <h3>Categories</h3>
                            <div class="categories-checkbox">
                                <ul>
                                    <template v-for="(i, idx) in classifyList" :key="idx">
                                        <li @click="TabClick(idx)">{{ i }}</li>
                                    </template>
                                </ul>
                            </div>
                        </div>
                    </aside>
                    <div class="container-content fadeInUp wow" data-wow-delay=".7s">
                        <a-row :gutter="[24, 24]">
                            <template v-for="(i, idx) in contentList" :key="idx">
                                <a-col :span="12">
                                    <div class="product-item">
                                        <div class="product-img">
                                            <img :src="i?.photo" alt="">
                                        </div>
                                        <div class="product-content">
                                            <div class="tag-product">
                                                <p>
                                                    <TagOutlined />
                                                    {{ i?.classify }}
                                                </p>
                                            </div>
                                            <div class="product-label product-label-list">
                                                <div class="product-name">
                                                    <h3 @click="GoDetails(i)">{{ i?.name }}</h3>
                                                </div>
                                                <div class="product-status">
                                                    <p>{{ i?.status }}</p>
                                                </div>
                                                <div class="product-price" v-if="i?.price">
                                                    <p>¥ {{ i?.price }}</p>
                                                </div>
                                                <div class="cart-btn">
                                                    <!-- <a class='btn-secondary'>Add to cart</a> -->
                                                </div>
                                                <div class="product-link">
                                                    <a-button type="primary" @click="GoDetails(i)">查看</a-button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </a-col>
                            </template>
                        </a-row>
                        <a-empty v-if="contentList.length == 0" description="暂无数据" />
                    </div>
                </div>
            </div>
        </template>
        <script setup>
        import { POST } from '@/utils/axios';
        import { useStore } from '@/store'
        import { message } from 'ant-design-vue';
        const router = useRouter();
        const useState = useStore();
        const imgError = ref(import.meta.env.VITE_IMG_ERROR);
        const activeKey = ref(0);
        const search = ref(history.state?.searchVal != undefined ? history.state.searchVal : '');
        const classifyList = ref(['全部']);
        const contentList = ref([]);
        const TabClick = (tarIdx) => {
            activeKey.value = tarIdx;
            GetContent();
        }
        const OnSearch = (val) => {
            search.value = val;
            GetContent();
        }
        // 前往下一页
        const GoDetails = (tarVal) => {
            router.push({
                name: 'Salariess',
                state: {
                    id: tarVal.id,
                }
            })
        }
        // 获取分类
        const GetClassify = async () => {
            const { code, data } = await POST('/undefined/list');
            if (code != '0') return;
            classifyList.value = classifyList.value.concat(data.map(i => i.name));
        }
        
        const GetContent = async () => {
            const { code, data } = await POST('/salariess/list', {
                classify: activeKey.value >= 1 ? classifyList.value[activeKey.value] : undefined,
                name: search.value != '' ? search.value : undefined,
            });
            if (code != '0') return;
            contentList.value = data;
        }
        onMounted(() => {
            GetClassify();
            GetContent();
        })
        </script>
        <style lang="scss" scoped>
        .Classify_1 {
            width: 100%;
            min-height: 100vh;
            background-color: #f9f9f9;
            background-color: #fff;
            .container {
                width: 100%;
                padding: 2% 5%;
                box-sizing: border-box;
                display: flex;
                &-content {
                padding: 0 15px;
                flex: 1;
                .single-item-grid {
                    margin-top: 0;
                }
                }

                &-sider {
                width: 25%;
                padding: 0 15px;
                box-sizing: border-box;
                .widget-cat {
                    background-color: #fff;
                    border-bottom: 1px solid #d9d4e77d;
                    padding: 20px 22px 19px;

                    h3 {
                    font-size: 20px;
                    font-weight: 600;
                    line-height: 24px;
                    color: #333333;
                    margin-bottom: 20px;
                    }

                    li {
                    display: block;
                    padding-left: 0px;
                    margin-bottom: 12px;
                    cursor: pointer;
                    font-size: 15px;
                    color: #343434;
                    font-weight: 400;
                    line-height: 16px;
                    }
                }

                .widget-list {
                    background-color: #fff;
                    padding: 0 30px 30px;
                    border: 1px solid #eee;
                    border-radius: 6px;
                    margin-bottom: 30px;

                    .widget-title {
                    font-size: 18px;
                    font-weight: 600;
                    display: block;
                    margin: 25px 0;
                    color: #081828;
                    }

                    .sidebar-body {
                    ul {
                        padding: 0;

                        li {
                        color: #888;
                        display: block;
                        position: relative;
                        padding-right: 35px;
                        font-size: 15px;
                        margin-bottom: 25px;

                        i {
                            margin-right: 15px;
                        }

                        &:hover {
                            // color: $primary-color;
                        }
                        }
                    }
                    }
                }
                }
            }
            }

            .product-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #fff;
            cursor: pointer;

            .product-img {
                width: 48%;
                height: 216px;

                img {
                width: 100%;
                height: 100%;
                object-fit: cover;
                object-position: center;
                }
            }

            .product-content {
                box-sizing: border-box;
                flex: 1;
                margin-left: 20px;

                .save-product {
                position: inherit;
                margin: 0 0 0 auto;
                margin-top: 10px;
                margin-right: 10px;
                padding-left: 20px;
                }

                .product-label {
                .product-name {
                    margin-bottom: 5px;
                }
                .product-status {
                    margin-bottom: 10px;
                }
                .product-price {
                    color: red;
                    margin-bottom: 10px;
                }

                .cart-btn {
                    margin: 25px 0;
                }

                .btn-secondary {
                    box-sizing: border-box;
                    text-decoration: none;
                    color: #fff;
                    background-color: #8546f0;
                    font-size: 15px;
                    font-weight: 500;
                    line-height: normal;
                    padding: 8px 12px;
                    border-radius: 2px;
                    transition: all 0.4s ease-in-out;
                }

                .btn-secondary:hover {
                    background-color: #070708;
                }

                .product-link a {
                    text-decoration: underline;
                    font-size: 16px;
                    color: #8546f0;
                    font-weight: 500;
                    line-height: 14px;
                    margin-bottom: 0;
                    transition: all 0.4s ease-in-out;
                }
                }
            }
        }
        </style>
        