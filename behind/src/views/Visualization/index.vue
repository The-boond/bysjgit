<template>
  <div class="Visualization">
    <a-card class="card-0">
      <div class="init0" ref="init0"></div>
    </a-card>
  </div>
</template>
<script setup>
import * as echarts from "echarts";
import { POST } from "@/utils/axios";

const init0 = ref(null);
const Init0 = async () => {
  const { code, data } = await POST("/qiandaoqiantui/value/username/id");
  if (code != 0) return;
  const xData = data.map((i) => i.username);
  const yData = data.map((i) => i.total);
  const myChart = echarts.init(init0.value);
  const option = {
    title: {
      text: "考勤打卡统计",
      left: "center",
    },
    xAxis: {
      type: "category",
      data: xData,
    },
    yAxis: {
      type: "value",
    },
    series: [
      {
        data: yData,
        type: "bar",
      },
    ],
  };
  myChart.setOption(option);
};

onMounted(() => {
  Init0();
});
</script>
<style lang="scss" scoped>
.Visualization {
  width: 100%;
  display: flex;
  flex-wrap: wrap;

  .card-0 {
    width: calc(50% - 5px);
    height: 500px;
    margin-right: 5px;
    margin-bottom: 5px;
    :deep(.ant-card-body) {
      height: 100%;
      .init0 {
        height: 100%;
      }
    }
  }
}
</style>
