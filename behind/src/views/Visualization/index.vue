<template>
  <div class="Visualization">
    <a-card class="card-0">
      <div class="init0" ref="init0"></div>
    </a-card>
    <a-card class="card-1">
      <div class="init1" ref="init1"></div>
    </a-card>
    <a-card class="card-2">
      <div class="init2" ref="init2"></div>
    </a-card>
  </div>
</template>

<script setup>
  import { ref, onMounted } from "vue";
  import * as echarts from "echarts";
  import { POST } from "@/utils/axios";

  const init0 = ref(null);
  const init1 = ref(null);
  const init2 = ref(null);

  const Init0 = async () => {
    const { code, data } = await POST("/qiandaoqiantui/value/username/id");
    if (code != 0) return;
    const xData = data.map((i) => i.username);
    const yData = data.map((i) => i.total);
    const myChart = echarts.init(init0.value);
    const option = {
      title: { text: "用户签到次数柱状图", left: "center" },
      // 取消tooltip
      tooltip: { show: false },
      xAxis: { type: "category", data: xData },
      yAxis: { type: "value" },
      series: [
        {
          data: yData,
          type: "bar",
          label: { show: true, position: "top", formatter: "{c}" },
        },
      ],
    };
    myChart.setOption(option);
  };

  const Init1 = async () => {
    const { code, data } = await POST("/qiandaoqiantui/value/qiandaotime/id/月");
    if (code != 0) return;
    const xData = data.map((i) => i.qiandaotime);
    const yData = data.map((i) => i.qiandaoqiantui);
    const myChart = echarts.init(init1.value);
    const option = {
      title: { text: "每月签到次数趋势线型图", left: "center" },
      tooltip: { show: false },
      xAxis: { type: "category", data: xData },
      yAxis: { type: "value" },
      series: [
        {
          data: yData,
          type: "line",
          smooth: true,
          label: { show: true, position: "top", formatter: "{c}" },
        },
      ],
    };
    myChart.setOption(option);
  };

  const Init2 = async () => {
    const { code, data } = await POST("/qiandaoqiantui/group/username");
    if (code != 0) return;
    const pieData = data.map((i) => ({
      name: i.username,
      value: i.qiandaoqiantui,
    }));
    const myChart = echarts.init(init2.value);
    const option = {
      title: { text: "用户签到次数占比饼图", left: "center" },
      tooltip: { show: false },
      legend: { orient: "vertical", left: "left" },
      series: [
        {
          name: "签到次数",
          type: "pie",
          radius: "50%",
          data: pieData,
          label: { formatter: "{b}\n{d}%", show: true, position: "outside" },
          emphasis: {
            itemStyle: {
              shadowBlur: 10,
              shadowOffsetX: 0,
              shadowColor: "rgba(0,0,0,0.5)",
            },
          },
        },
      ],
    };
    myChart.setOption(option);
  };

  onMounted(() => {
    Init0();
    Init1();
    Init2();
  });
</script>

<style lang="scss" scoped>
  .Visualization {
    width: 100%;
    display: flex;
    justify-content: center;
    gap: 15px;
    flex-wrap: nowrap;

    .card-0,
    .card-1,
    .card-2 {
      width: calc(33.33% - 10px);
      height: 500px;

      :deep(.ant-card-body) {
        height: 100%;
        padding: 0;

        div {
          height: 100%;
        }
      }
    }
  }
</style>
