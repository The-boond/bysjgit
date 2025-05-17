<template>
  <div class="Details_1">
    <div class="product">
      <div class="product-images">
        <a-carousel arrows>
          <template #prevArrow>
            <div class="custom-slick-arrow" style="left: 10px; z-index: 1">
              <left-circle-outlined />
            </div>
          </template>
          <template #nextArrow>
            <div class="custom-slick-arrow" style="right: 10px">
              <right-circle-outlined />
            </div>
          </template>
          <img :src="detailsInfo?.photo" alt="" />
          <template v-for="(i, idx) in detailsInfo?.photos" :key="idx">
            <img :src="i" alt="" />
          </template>
        </a-carousel>
      </div>
      <div class="product-infos">
        <div class="product-title-with-save">
          <h3>{{ detailsInfo?.name }}</h3>
        </div>
        <h4 style="color: red" v-if="detailsInfo?.price">
          ¥ {{ detailsInfo?.price }}
        </h4>
        <div class="rev-share">
          <!-- <div class="rev-inside">
                                    <p><a-rate :value="2" disabled />(5 customer review)</p>
                                </div> -->
        </div>
        <div class="othersChunk">
          <div class="othersChunk-item">
            <SpecialIcon
              type="3"
              :id="detailsInfo.id"
              :name="detailsInfo.name"
              :picture="detailsInfo.photo"
            ></SpecialIcon>
            <p>收藏</p>
          </div>
        </div>
        <a-divider style="height: 1px; background-color: #fec7d7" />
        <div class="quantity-product">
          <a-button type="primary" @click="goShen(detailsInfo)">
            申领
          </a-button>
        </div>
        <a-divider style="height: 1px; background-color: #fec7d7" />
        <div class="important-list">
          <a-row :gutter="[8, 8]">
            <a-col :span="8">
              <p class="content-contentChunk-item">
                <span class="item-key">品牌:</span>
                <span class="item-value">{{ detailsInfo?.brand }}</span>
              </p>
            </a-col>

            <a-col :span="8">
              <p class="content-contentChunk-item">
                <span class="item-key">尺寸:</span>
                <span class="item-value">{{ detailsInfo?.size }}</span>
              </p>
            </a-col>

            <a-col :span="8">
              <p class="content-contentChunk-item">
                <span class="item-key">材质:</span>
                <span class="item-value">{{ detailsInfo?.material }}</span>
              </p>
            </a-col>

            <a-col :span="24">
              <p class="content-contentChunk-item">
                <span class="item-key">功能描述:</span>
                <span class="item-value">{{
                  detailsInfo?.functionaldescription
                }}</span>
              </p>
            </a-col>

            <a-col :span="24">
              <p class="content-contentChunk-item">
                <span class="item-key">使用场景:</span>
                <span class="item-value">{{
                  detailsInfo?.usagescenarios
                }}</span>
              </p>
            </a-col>
          </a-row>
        </div>
      </div>
    </div>
    <div class="containerBottom">
      <a-tabs v-model:activeKey="activeKey" type="card">
        <a-tab-pane key="0" tab="详情信息">
          <h3>详情信息</h3>
          <div class="single-block" v-html="detailsInfo?.details"></div>
        </a-tab-pane>

        <a-tab-pane key="1" tab="评价">
          <Comment :typeId="detailsInfo?.id"></Comment>
        </a-tab-pane>
      </a-tabs>
    </div>
  </div>
</template>
<script setup>
import { LeftCircleOutlined, RightCircleOutlined } from "@ant-design/icons-vue";
import { message } from "ant-design-vue";
import { POST } from "@/utils/axios";
import { useStore } from "@/store";
const router = useRouter();
const useState = useStore();
const imgError = ref(import.meta.env.VITE_IMG_ERROR);
const imgList = ref();
const detailsInfo = reactive({});
const activeKey = ref("0");

// 获取详情
const GetDetails = async () => {
  const { code, data } = await POST("/officesupplies/info", {
    id: history.state.id,
  });
  if (code != "0") return;
  Object.assign(detailsInfo, data, {
    photos: data.photos != undefined ? JSON.parse(data.photos) : [data?.photo],
  });
};
const goShen = async (val) => {
  const { code, data } = await POST("/itemapplication/save", {
    shenheid: val.id,
    name: val.name,
    photo: val.photo,
    adduserid: useState.$state.userid,
    addusername: useState.$state.username,
    shenhe: "待审核",
  });
  if (code != "0") return;
  message.success("申领中");
};
onMounted(async () => {
  await DisLogin();
  await GetDetails();
});
// 是否登录
const DisLogin = async () => {
  let resultRes = await useState.IsLogin();
  if (!resultRes) return router.push("/index");
};
// 轮播每块点击
const SwiperItem = (tarVal) => {
  Object.assign(info, {
    photo: tarVal,
  });
};
onUnmounted(() => {});
</script>
<style lang="scss" scoped>
.Details_1 {
  width: 100%;
  min-height: 100vh;
  background-color: #f9f9f9;
  background-color: #fff;
  display: flex;
  flex-direction: column;
  align-items: center;
  padding: 2% 0;
  .product {
    width: 70%;
    display: flex;
    padding: 30px;
    border: 1px solid #eee;
    border-radius: 6px;
    background-color: #fff;

    .product-images {
      width: 50%;
      height: 572px;

      img {
        display: block;
        width: 100%;
        height: 572px;
        cursor: pointer;
      }
    }

    .product-infos {
      flex: 1;
      padding-left: 24px;

      .important-list {
        display: flex;
        align-items: center;
        justify-content: flex-start;
        margin-top: 15px;
        flex-wrap: wrap;

        div {
          margin-right: 30px;
          margin-bottom: 20px;

          h4 {
            font-size: 14px;
            margin-bottom: 0;
            color: #727272;
            font-weight: 400;
            line-height: 18px;

            span {
              font-weight: 500;
              color: #212021;
            }
          }
        }
      }

      > p {
        margin-bottom: 0;
        font-size: 16px;
        color: #212021;
        font-weight: 400;
        line-height: 24px;
      }

      .othersChunk {
        color: #357a0b;
        font-size: 16px;
        font-weight: 400;
        line-height: 18px;
        margin-top: 15px;
        margin-bottom: 23px;
        &-item {
          display: flex;
          align-items: center;
          cursor: pointer;
          margin-right: 10px;
          > p {
            margin-left: 5px;
            font-size: 14px;
          }
        }
      }

      .quantity-product {
        display: flex;
        align-items: center;
        margin: 15px 0;

        .btn-add-cart {
          margin-left: 15px;
          cursor: pointer;
          box-sizing: border-box;
          text-decoration: none;
          background-color: #0e172c;
          color: #fff;
          display: block;
          padding: 15px 30px;
          font-size: 15px;
          font-weight: 500;
          line-height: 8px;
          height: 40px;
          transition: all 0.4s ease-in-out;

          &:hover {
            background-color: #8546f0;
          }
        }
      }

      .rev-share {
        display: flex;
        align-items: center;

        p {
          display: flex;
          align-items: center;
          margin-bottom: 0;
          font-size: 15px;
          font-weight: 400;
          line-height: 16px;
          color: #4f4d4e;

          a {
            color: #8546f0;
          }
        }

        h4 {
          font-size: 24px;
          font-weight: 500;
          line-height: 28px;
          color: #8546f0;
          margin-bottom: 13px;
        }
      }

      .product-title-with-save {
        display: flex;
        justify-content: space-between;
        padding-top: 30px;
        align-items: center;

        h3 {
          font-size: 32px;
          color: #070708;
          font-weight: 600;
          line-height: 42px;
          margin-bottom: 0;
          width: 68%;
        }
      }
    }
  }
  .containerBottom {
    width: 70%;
    padding: 30px;
    margin: 20px 0 0;
    border: 1px solid #eee;
    border-radius: 6px;
    background-color: #fff;
  }
}

:deep(.slick-slide) {
  text-align: center;
  // height: 100%;
  height: 572px;
}

:deep(.slick-arrow.custom-slick-arrow) {
  width: 25px;
  height: 25px;
  font-size: 25px;
  color: #fff;
  background-color: rgba(31, 45, 61, 0.11);
  transition: ease all 0.3s;
  opacity: 0.3;
  z-index: 1;
}

:deep(.slick-arrow.custom-slick-arrow:before) {
  display: none;
}

:deep(.slick-arrow.custom-slick-arrow:hover) {
  color: #fff;
  opacity: 0.5;
}
</style>
