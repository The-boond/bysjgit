import { useStore } from "@/store";
const socket = {
    ws: null,

    ws_url: null,

    init: (hostname) => {
        socket.close();
        const url = import.meta.env.VITE_STOCKET_BASE_URL != undefined ? import.meta.env.VITE_STOCKET_BASE_URL : '127.0.0.1:10086'
        socket.ws_url = `ws://${url}`;
        if (!window.WebSocket) {
            window.WebSocket = window.MozWebSocket;
        }
        socket.ws = new WebSocket(socket.ws_url);
        socket.ws.onmessage = (m) => {
            socket.receive(m);
        };
        // 连接关闭
        socket.ws.onclose = () => {
            console.log("ws连接断开");
        };

        // 连接成功
        socket.ws.onopen = () => {
            console.log("ws连接成功");
        };
        // 连接错误
        socket.ws.onerror = () => {
            console.log("ws连接错误");
        };
    },

    /**
     * 发送消息
     */
    send: (data, callback = null) => {
        // 开启状态直接发送
        if (socket.ws.readyState === socket.ws.OPEN) {
            socket.ws.send(JSON.stringify(data));
            if (callback) {
                callback();
            }

            // 正在开启状态，则等待1s后重新调用
        } else if (socket.ws.readyState === socket.ws.CONNECTING) {
            setTimeout(function () {
                socket.send(data, callback);
            }, 1000);

            // 未开启，则等待1s后重新调用
        } else {
            socket.init();
            setTimeout(function () {
                socket.send(data, callback);
            }, 1000);
        }
    },

    receive: (message) => {
        const useState = useStore();
        useState.DisService(message);
    },

    /**
     * 关闭连接
     */
    close: () => {
        if (socket.ws) {
            socket.ws.close();
        }
    },

    /**
     * 重新连接
     */
    reconnect: () => {
        if (socket.ws) {
            socket.close();
        }
        socket.init();
    },

    /**
     * 用户上线
     * @param {*} id
     */
    online: (id) => {
        socket.init();
        socket.send({
            id,
            ws_type: 1,
        });
    },
};

export { socket };
