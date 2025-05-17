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