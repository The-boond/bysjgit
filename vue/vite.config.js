import { defineConfig, loadEnv } from 'vite'
import vue from '@vitejs/plugin-vue'
import legacy from "@vitejs/plugin-legacy";
import AutoImport from 'unplugin-auto-import/vite'
import Components from 'unplugin-vue-components/vite';
import { AntDesignVueResolver } from 'unplugin-vue-components/resolvers';
import path from 'path'
// https://vitejs.dev/config/
//   /* 官方写法：process.cwd()，可以理解为当前目录就是和vite.config文件同级目录
//     根据当前工作目录中的 `mode` 加载 .env 文件
//     设置第三个参数为 '' 来加载所有环境变量，而不管是否有 `VITE_` 前缀
//     const env = loadEnv(mode, process.cwd(), '')
//   */
const env = loadEnv(process.env.NODE_ENV, process.cwd());
const renameHtmlPlugin = () => {
  return {
      name: 'rename-index-html',
      enforce: 'post',
      generateBundle(_, bundle) {
          const newFileName = `behind.html`;
          bundle['index.html'].fileName = newFileName;
      },
  };
};
export default defineConfig({
  plugins: [
    vue(),
    AutoImport({
      imports: ['vue', 'vue-router'], //自动引入vue的ref、toRefs、onmounted等，无需在页面中再次引入
      dts: "src/auto-import.d.js" // 生成在src路径下名为auto-import.d.ts的声明文件
    }),
    Components({
      resolvers: [
        AntDesignVueResolver({
          importStyle: false, // css in js
        }),
      ],
    })
  ],
  css: {
    preprocessorOptions: {
      scss: {
        api: 'modern-compiler', // or 'modern'
        additionalData: `@import "@/assets/styles/index.scss";`, // 配置scss 公共文件
      }
    }
  },
  server: {
    // 反向代理配置
    port: 8887,
    proxy: {
      '/api': {
        target: env.VITE_APP_BASE_URL,
        changeOrigin: true,
        rewrite: (path) => path.replace(/^\/api/, '')
      }
    }
  },
  build: {
    outDir: "dist",
    /** 打包后静态资源目录 */
    assetsDir: "assets",
    /** 消除打包大小超过 500kb 警告 */
    chunkSizeWarningLimit: 2000,
    /** Vite 2.6.x 以上需要配置 minify: "terser", terserOptions 才能生效 */
    minify: "terser",
    /** 在打包代码时移除 console.log、debugger 和 注释 */
    terserOptions: {
      compress: {
        drop_console: false,
        drop_debugger: true,
        pure_funcs: ["console.log"]
      },
      format: {
        /** 删除注释 */
        comments: false
      }
    },
    rollupOptions: {
      // input: ['dist/index.html'],
      output: {
        chunkFileNames: "js/[name]-[hash].js", // 引入文件名的名称
        entryFileNames: "js/[name]-[hash].js", // 包的入口文件名称
        assetFileNames: "[ext]/[name]-[hash].[ext]", // 资源文件像 字体，图片等
      },
    },
  },
  resolve: {
    alias: {
      '@': path.resolve(__dirname, './src') // 路径别名
    }
  },
})
