import { createApp } from 'vue';
import './assets/styles/base.css';
import App from './App.vue';
import router from './router';
import pinia from './store';
import * as Icons from '@ant-design/icons-vue';
import 'nprogress/nprogress.css';
import 'vue3-emoji-picker/css';
const app = createApp(App)
    .use(router)
    .use(pinia)
// 注册图标组件

for (const i in Icons) {
    app.component(i, Icons[i])
}
app.mount('#app')
