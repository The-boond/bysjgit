import { useStore } from './modules'
import { createPinia } from 'pinia';
import piniaPluginPersistedstate from 'pinia-plugin-persistedstate';
const store = createPinia();
store.use(piniaPluginPersistedstate);
export {
    useStore
}
export default store;
