<template>
  <div class="SchedulePage">
    <div class="header">
      <h1 class="title">📅 考勤打卡</h1>
      <div class="action-group">
        <!-- 签到按钮 -->
        <a-button
                type="primary"
                class="action-btn sign-in-btn"
                :loading="signInLoading"
                @click="handleSign"
                :data-type="'sign_in'"
                :disabled="todaySignInCount >= 1"
        >
          <template #icon>
            <ClockCircleOutlined v-if="!signInLoading" />
            <LoadingOutlined v-else />
          </template>
          {{ todaySignInCount >= 1 ? '今日已签到' : '签到' }}
        </a-button>

        <!-- 签退按钮 -->
        <a-button
                type="default"
                class="action-btn sign-out-btn"
                :loading="signOutLoading"
                @click="handleSign"
                :data-type="'sign_out'"
                :disabled="todaySignOutCount >= 1"
                style="margin-left: 12px"
        >
          <template #icon>
            <PoweroffOutlined v-if="!signOutLoading" />
            <LoadingOutlined v-else />
          </template>
          {{ todaySignOutCount >= 1 ? '今日已签退' : '签退' }}
        </a-button>
      </div>
    </div>
    <a-divider class="custom-divider" />

    <a-config-provider :locale="zhCN">
      <a-calendar
              v-model:value="currentDate"
              class="custom-calendar"
              :fullscreen="false"
              @panelChange="onPanelChange"
      >
        <template #dateCellRender="{ current }">
          <div class="calendar-cell">
            <div class="dot" v-if="hasRecord(current)"></div>
            <ul class="events">
              <li
                      v-for="(item, index) in getDayRecords(current)"
                      :key="index"
                      class="event-item"
                      :class="item.type"
              >
                <a-badge :status="item.type" :text="item.content" />
                <!-- 显示签到/签退地点 -->
                <div v-if="item.location" class="location-text" title="签到/签退地点">
                  📍 {{ item.location }}
                </div>
              </li>
            </ul>
          </div>
        </template>
      </a-calendar>
    </a-config-provider>
  </div>
</template>

<script setup>
  import { ref, reactive, computed, onMounted } from 'vue'
  import {
    ClockCircleOutlined,
    LoadingOutlined,
    PoweroffOutlined
  } from '@ant-design/icons-vue'
  import dayjs from 'dayjs'
  import zhCN from 'ant-design-vue/es/locale/zh_CN'
  import { useStore } from '@/store'
  import { POST } from '@/utils/axios'
  import { message } from 'ant-design-vue'

  // 状态管理
  const useState = useStore()
  const signInLoading = ref(false)
  const signOutLoading = ref(false)
  const currentDate = ref(dayjs())
  const dataSource = reactive({ records: {} })

  // 计算属性
  const today = computed(() => dayjs().format('YYYY-MM-DD'))
  const todaySignInCount = computed(() =>
          dataSource.records[today.value]?.sign_in?.length || 0
  )
  const todaySignOutCount = computed(() =>
          dataSource.records[today.value]?.sign_out?.length || 0
  )

  // 高德地图2.0版本定位初始化
  const initGeolocation = () => {
    return new Promise(async (resolve, reject) => {
      if (!window.AMap) {
        reject('高德地图API未加载')
        return
      }
      // 加载定位插件
      await new Promise((res) => {
        AMap.plugin('AMap.Geolocation', () => {
          res()
        })
      })

      const geolocation = new AMap.Geolocation({
        enableHighAccuracy: true,
        timeout: 10000,
        maximumAge: 0,
        convert: true,
        showButton: false,
        showMarker: false,
        showCircle: false,
      })

      geolocation.getCurrentPosition((status, result) => {
        if (status === 'complete') {
          resolve(result)
        } else {
          reject(result.message)
        }
      })
    })
  }

  // 高德地图2.0版本逆地理编码
  const getAddressByLocation = async (lnglat) => {
    if (!window.AMap) {
      throw new Error('高德地图API未加载')
    }
    // 加载逆地理编码插件
    await new Promise((resolve) => {
      AMap.plugin('AMap.Geocoder', () => {
        resolve()
      })
    })

    const geocoder = new AMap.Geocoder()

    return new Promise((resolve, reject) => {
      geocoder.getAddress(lnglat, (status, result) => {
        if (status === 'complete' && result.regeocode) {
          resolve(result.regeocode.formattedAddress)
        } else {
          reject('获取地址失败')
        }
      })
    })
  }

  // 数据加载
  const loadData = async () => {
    try {
      const { data } = await POST(`/qiandaoqiantui/list`, {
        userid: useState.$state.userid,
      })

      dataSource.records = data.reduce((acc, item) => {
        const dateKey = dayjs(item.qiandaotime).format('YYYY-MM-DD')
        const actionType = item.status === '签到' ? 'sign_in' : 'sign_out'

        if (!acc[dateKey]) {
          acc[dateKey] = { sign_in: [], sign_out: [] }
        }

        acc[dateKey][actionType].push({
          time: dayjs(item.qiandaotime).format('HH:mm'),
          type: actionType === 'sign_in' ? 'processing' : 'error',
          content: `${actionType === 'sign_in' ? '签到' : '签退'} ${dayjs(item.qiandaotime).format('HH:mm:ss')}`,
          location: actionType === 'sign_in' ? item.qiandaodidian : item.qiantuididian || '' // 显示对应地点
        })

        return acc
      }, {})
    } catch (error) {
      message.error('加载考勤数据失败')
    }
  }

  // 核心逻辑
  const handleSign = async (e) => {
    const actionType = e.currentTarget.dataset.type
    const isSignIn = actionType === 'sign_in'
    const loading = isSignIn ? signInLoading : signOutLoading

    // 增加重复操作校验
    if ((isSignIn && todaySignInCount.value >= 1) ||
            (!isSignIn && todaySignOutCount.value >= 1)) {
      return message.warning('今日已操作过该类型')
    }

    loading.value = true
    try {
      let location = ''
      if (isSignIn) {
        // 仅签到时获取定位
        const posResult = await initGeolocation()
        location = await getAddressByLocation([posResult.position.lng, posResult.position.lat])
      } else {
        // 签退时也获取定位（如果需要）
        const posResult = await initGeolocation()
        location = await getAddressByLocation([posResult.position.lng, posResult.position.lat])
      }

      await POST(`/qiandaoqiantui/save`, {
        name: useState.$state.username,
        userid: useState.$state.userid,
        status: isSignIn ? '签到' : '签退',
        [isSignIn ? 'qiandaotime' : 'qiantuitime']: dayjs().format('YYYY-MM-DD HH:mm:ss'),
        [isSignIn ? 'qiandaodidian' : 'qiantuididian']: location // 传递签到或签退地点
      })

      message.success(`${isSignIn ? '签到' : '签退'}成功 ✅`)
      await loadData() // 刷新数据
    } catch (error) {
      console.error(error)
      message.error(`${isSignIn ? '签到' : '签退'}失败，请重试`)
    } finally {
      loading.value = false
    }
  }

  // 日历面板切换事件处理
  const onPanelChange = (value, mode) => {
    console.log('日历面板切换:', value.format('YYYY-MM-DD'), mode)
    currentDate.value = value
  }

  // 工具方法
  const hasRecord = (date) => {
    const dateKey = dayjs(date).format('YYYY-MM-DD')
    return !!dataSource.records[dateKey]
  }

  const getDayRecords = (date) => {
    const dateKey = dayjs(date).format('YYYY-MM-DD')
    return dataSource.records[dateKey] ? [
      ...dataSource.records[dateKey].sign_in,
      ...dataSource.records[dateKey].sign_out
    ] : []
  }

  // 生命周期
  onMounted(async () => {
    await loadData()
  })
</script>

<style lang="scss" scoped>
  .SchedulePage {
    max-width: 1500px;
    margin: 0 auto;
    padding: 20px;
    min-height: 55vh;

    .header {
      display: flex;
      align-items: center;
      justify-content: space-between;
      margin-bottom: 25px;

      .title {
        font-size: 35px;
        font-weight: 600;
        color: #1d3557;
        margin: 0;
        display: flex;
        align-items: center;
        gap: 8px;
      }

      .action-group {
        display: flex;
        gap: 12px;

        .action-btn {
          width: 120px;
          height: 45px;
          border-radius: 25px;
          font-weight: 500;
          transition: all 0.3s;

          &.sign-in-btn {
            background: #007bff;
            border-color: #007bff;
            color: white;

            &:hover:not(:disabled) {
              background: #0056b3;
              border-color: #0056b3;
            }
          }

          &.sign-out-btn {
            background: #dc3545;
            border-color: #dc3545;
            color: white;

            &:hover:not(:disabled) {
              background: #bb2d3b;
              border-color: #bb2d3b;
            }
          }

          &[disabled] {
            opacity: 0.7;
            cursor: not-allowed;
          }
        }
      }
    }
    .calendar-cell {
      .events {
        .event-item {
          &.processing {
            :deep(.ant-badge-status-dot) {
              background-color: #52c41a;
            }
          }
          &.error {
            :deep(.ant-badge-status-dot) {
              background-color: #ff4d4f;
            }
          }
        }
      }
    }
    .location-text {
      font-size: 12px;
      color: #888;
      margin-top: 2px;
      white-space: nowrap;
      overflow: hidden;
      text-overflow: ellipsis;
    }
  }
</style>
