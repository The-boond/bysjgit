import axios from "axios";
// 在发送请求之前做某件事
const INTERCEPTORS_REQUEST = (example) => {
  example.interceptors.request.use(
    (config) => {
      if (config.url.lastIndexOf("save") != -1) {
        const { userid, name } = JSON.parse(sessionStorage.behind);
        let newObj = Object.assign(config.data, {
          adduserid: userid,
          addusername: name,
        });
        config.data = newObj;
      }
      config.headers.Authorization =
        sessionStorage.token != undefined ? sessionStorage.token : "";
      return config;
    },
    (error) => {
      return Promise.reject(error);
    }
  );
  return example;
};

// 返回响应之后拦截
const INTERCEPTORS_RESPONSE = (example) => {
  example.interceptors.response.use(
    (res) => {
      if (
        !res.data.success &&
        Object.prototype.toString.call(res.data) === "[object Blob]"
      ) {
        let fileNameUrl = res.headers["content-disposition"];
        let fileNameIdx = fileNameUrl.lastIndexOf("'");
        let fileName = decodeURIComponent(
          fileNameUrl.substr(fileNameIdx + 1, fileNameUrl.length)
        );
        return {
          data: res.data,
          name: fileName,
        };
      }
      // 对响应数据做些事
      if (!res.data.success) {
        return Promise.resolve(res.data);
      }

      return res.data;
    },
    (error) => {
      return Promise.reject(error);
    }
  );
};

/**
 * @name wangyanpeng
 * @param {*} type 'post'|'get'
 * @returns
 */
const SEND = (type = "get") => {
  return (url, data = {}, config = {}) => {
    /* 公共参数配置 */
    const CONFIG = { baseURL: "/api", timeout: 10000 };
    /* 请求拦截 */
    const INTERCEPTORS = (example) => {
      INTERCEPTORS_REQUEST(example);
      INTERCEPTORS_RESPONSE(example);
      return example;
    };
    /* 请求实例类型区分 */
    const methods = {
      get: () => {
        const AXIOS_INSTANCE = axios.create({
          ...CONFIG,
          params: data,
          ...config,
        });
        return INTERCEPTORS(AXIOS_INSTANCE).get(url, data);
      },
      post: () => {
        const AXIOS_INSTANCE = axios.create({
          ...CONFIG,
          data: data,
          ...config,
        });
        return INTERCEPTORS(AXIOS_INSTANCE).post(url, data);
      },
    };
    if (methods[type]) {
      return methods[type]();
    }
    throw new Error("Request type error");
  };
};

export const POST = SEND("post");
export const GET = SEND("get");
