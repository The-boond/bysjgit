// src/utils/bmapLoader.js
let bmapPromise = null;

export function loadBMap() {
    if (bmapPromise) return bmapPromise;

    bmapPromise = new Promise((resolve, reject) => {
        window.initBMap = () => {
            resolve(window.BMapGL);
        };

        const script = document.createElement('script');
        script.src = 'https://api.map.baidu.com/api?v=3.0&ak=y1qEmoVgx7R6ewzzmSVTgRcXtwM9XX2P&callback=initBMap&s=1';
        script.async = true;
        script.onerror = () => reject(new Error('百度地图API加载失败'));
        document.head.appendChild(script);
    });

    return bmapPromise;
}