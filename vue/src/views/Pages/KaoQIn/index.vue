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
                        :disabled="todaySignInCount >= 1 || !canSign"
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
                        :disabled="todaySignOutCount >= 1 || !canSign"
                        style="margin-left: 12px"
                >
                    <template #icon>
                        <PoweroffOutlined v-if="!signOutLoading" />
                        <LoadingOutlined v-else />
                    </template>
                    {{ todaySignOutCount >= 1 ? '今日已签退' : '签退' }}
                </a-button>

                <!-- 新增定位按钮 -->
                <a-button
                        type="default"
                        class="action-btn locate-btn"
                        :loading="locationLoading"
                        @click="handleLocate"
                        style="margin-left: 12px"
                >
                    <template #icon>
                        <ClockCircleOutlined v-if="!locationLoading" />
                        <LoadingOutlined v-else />
                    </template>
                    定位
                </a-button>
            </div>
            <!-- 定位地址显示区域 -->
            <div class="location-display" style="margin-top: 12px; min-height: 20px; color: #555;">
                <template v-if="locationLoading">定位中...</template>
                <template v-else-if="locationError">{{ locationError }}</template>
                <template v-else-if="locationAddress">
                    当前位置：{{ locationAddress }}
                    <span v-if="!canSign" style="color: red; margin-left: 8px;">未在签到范围内，无法签到签退</span>
                </template>
                <template v-else>请先点击定位按钮获取当前位置，定位后才能签到签退</template>
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

    const useState = useStore()
    const signInLoading = ref(false)
    const signOutLoading = ref(false)
    const locationLoading = ref(false)
    const locationAddress = ref('')
    const locationError = ref('')
    const hasLocation = ref(false) // 是否已定位成功
    const canSign = ref(false) // 是否在允许签到范围内

    const currentDate = ref(dayjs())
    const dataSource = reactive({ records: {} })

    const today = computed(() => dayjs().format('YYYY-MM-DD'))
    const todaySignInCount = computed(() =>
        dataSource.records[today.value]?.sign_in?.length || 0
    )
    const todaySignOutCount = computed(() =>
        dataSource.records[today.value]?.sign_out?.length || 0
    )

    // 签到范围中心点（经度，纬度）
    const centerLng = 107.93391775389864
    const centerLat = 22.6081949303604
    const allowedRadiusMeters = 888 // 800米范围

    // 计算两点距离（米） - Haversine公式
    function getDistance(lat1, lng1, lat2, lng2) {
        const toRad = (d) => d * Math.PI / 180
        const R = 6378137 // 地球半径 米
        const radLat1 = toRad(lat1)
        const radLat2 = toRad(lat2)
        const a = radLat1 - radLat2
        const b = toRad(lng1) - toRad(lng2)
        const s = 2 * Math.asin(Math.sqrt(Math.pow(Math.sin(a / 2), 2) +
            Math.cos(radLat1) * Math.cos(radLat2) * Math.pow(Math.sin(b / 2), 2)))
        return s * R
    }

    // 加载考勤数据
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
                    content: `${actionType === 'sign_in' ? '签到' : '签退'} ${dayjs(item.qiandaotime).format('HH:mm:ss')}`
                })

                return acc
            }, {})
        } catch (error) {
            message.error('获取考勤数据失败')
        }
    }

    // 高德逆地理编码获取地址
    async function getAddressByLocation(lng, lat) {
        try {
            const key = '574d4334dc57a9b1aec9010c32686f2d'
            const url = `https://restapi.amap.com/v3/geocode/regeo?location=${lng},${lat}&key=${key}&radius=1000&extensions=base`
            const res = await fetch(url)
            const json = await res.json()
            if (json.status === '1') {
                return json.regeocode.formatted_address || '未知位置'
            } else {
                return '定位地址获取失败'
            }
        } catch {
            return '定位地址获取异常'
        }
    }

    // 保存定位信息到localStorage
    function saveLocationToStorage(lng, lat, address) {
        const obj = { lng, lat, address, timestamp: Date.now() }
        localStorage.setItem('attendance_location', JSON.stringify(obj))
    }

    // 从localStorage读取定位信息
    function loadLocationFromStorage() {
        try {
            const str = localStorage.getItem('attendance_location')
            if (!str) return null
            const obj = JSON.parse(str)
            // 可选：判断缓存时间是否过期，比如1小时内有效
            const now = Date.now()
            if (now - obj.timestamp > 1000 * 60 * 60) { // 1小时过期
                localStorage.removeItem('attendance_location')
                return null
            }
            return obj
        } catch {
            return null
        }
    }

    // 定位按钮点击事件
    const handleLocate = () => {
        locationLoading.value = true
        locationError.value = ''
        locationAddress.value = ''
        hasLocation.value = false
        canSign.value = false

        if (!navigator.geolocation) {
            locationError.value = '浏览器不支持定位功能'
            locationLoading.value = false
            return
        }

        navigator.geolocation.getCurrentPosition(
            async (position) => {
                const { longitude, latitude } = position.coords
                const distance = getDistance(latitude, longitude, centerLat, centerLng)
                if (distance > allowedRadiusMeters) {
                    const exceed = Math.round(distance - allowedRadiusMeters)
                    locationError.value = `您距离签到范围约${exceed}米，超出允许范围。`
                    locationLoading.value = false
                    hasLocation.value = true
                    canSign.value = false
                    locationAddress.value = ''
                    localStorage.removeItem('attendance_location')
                    return
                }
                const address = await getAddressByLocation(longitude, latitude)
                locationAddress.value = address
                locationLoading.value = false
                hasLocation.value = true
                canSign.value = true
                saveLocationToStorage(longitude, latitude, address) // 保存缓存
            },
            (error) => {
                locationError.value = '定位失败，请允许定位权限'
                locationLoading.value = false
                hasLocation.value = false
                canSign.value = false
            },
            { enableHighAccuracy: true, timeout: 10000 }
        )
    }

    // 签到签退按钮点击事件，必须先定位且在范围内
    const handleSign = async (e) => {
        if (!hasLocation.value) {
            message.warning('请先定位，获取当前位置后才能签到签退。')
            return
        }
        if (!canSign.value) {
            message.warning('您不在允许签到范围内，无法签到签退。')
            return
        }
        const actionType = e.currentTarget.dataset.type
        const isSignIn = actionType === 'sign_in'
        const loading = isSignIn ? signInLoading : signOutLoading

        if ((isSignIn && todaySignInCount.value >= 1) ||
            (!isSignIn && todaySignOutCount.value >= 1)) {
            return
        }

        loading.value = true
        try {
            await POST(`/qiandaoqiantui/save`, {
                name: useState.$state.username,
                userid: useState.$state.userid,
                status: isSignIn ? '签到' : '签退',
                qiandaotime: dayjs().format('YYYY-MM-DD HH:mm:ss'),
            })

            message.success(`${isSignIn ? '签到' : '签退'}成功 ✅`)
            await loadData()
        } catch (error) {
            message.error(`${isSignIn ? '签到' : '签退'}失败，请重试`)
        } finally {
            loading.value = false
        }
    }

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

    const onPanelChange = (date, mode) => {
        currentDate.value = date
    }

    // 页面加载时尝试读取缓存定位信息
    onMounted(async () => {
        await loadData()
        const loc = loadLocationFromStorage()
        if (loc) {
            // 检查距离是否仍在范围内
            const distance = getDistance(loc.lat, loc.lng, centerLat, centerLng)
            if (distance <= allowedRadiusMeters) {
                locationAddress.value = loc.address
                hasLocation.value = true
                canSign.value = true
                locationError.value = ''
            } else {
                localStorage.removeItem('attendance_location')
                hasLocation.value = true
                canSign.value = false
                locationAddress.value = ''
                const exceed = Math.round(distance - allowedRadiusMeters)
                locationError.value = `您距离签到范围约${exceed}米，超出允许范围，请重新定位。`
            }
        }
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
            flex-wrap: wrap;

            .title {
                font-size: 35px;
                font-weight: 600;
                color: #1d3557;
                margin: 0;
                display: flex;
                align-items: center;
                gap: 8px;
                flex-shrink: 0;
            }

            .action-group {
                display: flex;
                gap: 12px;
                flex-shrink: 0;

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

                    &.locate-btn {
                        background: #17a2b8;
                        border-color: #17a2b8;
                        color: white;

                        &:hover:not(:disabled) {
                            background: #117a8b;
                            border-color: #117a8b;
                        }
                    }

                    &[disabled] {
                        opacity: 0.7;
                        cursor: not-allowed;
                    }
                }
            }

            .location-display {
                width: 100%;
                margin-top: 12px;
                color: #555;
                font-size: 14px;
                min-height: 20px;
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
    }
</style>
