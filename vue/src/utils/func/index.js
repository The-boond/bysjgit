export const ClearReactiveObj = (obj) => {
    Object.keys(obj).forEach(key => {
        if (typeof obj[key] === 'object') {
            delete obj[key];
            // ClearReactiveObj(obj[key]); // 递归清空嵌套对象
        } else {
            // obj[key] = ''; // 字符串属性设置为空字符串
            delete obj[key];
        }
    });
}
export const GetImageUrl = (folder, name) => {
    return new URL(`/src/assets/${folder}/${name}`, import.meta.url).href
}
// 获取单个随机
export const GetRandom = (arr) => {
    if (arr.length === 0) return null; // 如果数组为空，返回null
    const index = Math.floor(Math.random() * arr.length); // 生成随机索引
    return arr[index]; // 返回随机元素
}
// 获取多个随机
export const GetRandoms = (arr, num) => {
    if (arr.length === 0) return null; // 如果数组为空，返回null
    const newArr = [];
    for(let i = 0; i < num; i++) {
        const index = Math.floor(Math.random() * arr.length); // 生成随机索引
        newArr.push(arr[index]);
    }
    return newArr; // 返回随机元素
}