export default {
    isEmail2: function (s) {
        return /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((.[a-zA-Z0-9_-]{2,3}){1,2})$/.test(s);
    },
    isEmail: function (rule, value) {
        let reg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((.[a-zA-Z0-9_-]{2,3}){1,2})$/;
        if (value && reg.test(value) === false) {
            return Promise.reject('请输入正确的邮箱');
        } else {
            return Promise.resolve('');
        }
    },
    isEmailNotNull: function (rule, value, ) {
        let reg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((.[a-zA-Z0-9_-]{2,3}){1,2})$/;
        if (value && reg.test(value) === false) {
            return Promise.reject('请输入正确的邮箱');
        } else if (!value) {
            return Promise.reject('请输入邮箱');
        } else {
            return Promise.resolve('');
        }
    },
    isMobile2: function (s) {
        return /^1[0-9]{10}$/.test(s);
    },
    isMobile: function (rule, value, ) {
        let reg = /^1[0-9]{10}$/;
        if (value && reg.test(value) === false) {
            return Promise.reject('请输入正确的手机号码');
        } else {
            return Promise.resolve('');
        }
    },
    isMobileNotNull: function (rule, value, ) {
        let reg = /^1[0-9]{10}$/;
        if (value && reg.test(value) === false) {
            return Promise.reject('请输入正确的手机号码');
        } else if (!value) {
            return Promise.reject('请输入手机号码');
        } else {
            return Promise.resolve('');
        }
    },
    isPhoneNotNull: (rule, value) => {
        let reg = /^1[3-9]\d{9}$/;
        console.log(reg,  reg.test(value) === false)
        if (value && reg.test(value) === false) {
            return Promise.reject('请输入正确的联系方式');
        } else if (!value) {
            return Promise.reject('请输入联系方式');
        } else {
            return Promise.resolve('');
        }
    },
    isURL: function (rule, value, ) {
        let reg = /^http[s]?:\/\/.*/;
        if (value && reg.test(value) === false) {
            return Promise.reject('请输入正确的URL地址');
        } else {
            return Promise.resolve('');
        }
    },
    isURLNotNull: function (rule, value, ) {
        let reg = /^http[s]?:\/\/.*/;
        if (value && reg.test(value) === false) {
            return Promise.reject('请输入正确的URL地址');
        } else if (!value) {
            return Promise.reject('请输入地址');
        } else {
            return Promise.resolve('');
        }
    },
    isNumber: function (rule, value) {
        let reg =
            /(^-?[+-]?([0-9]*\.?[0-9]+|[0-9]+\.?[0-9]*)([eE][+-]?[0-9]+)?$)|(^$)/;
        if (value && reg.test(value) === false) {
            return Promise.reject('请输入正确的数字');
        } else {
            return Promise.resolve('');
        }
    },
    isNumberNotNull: function (rule, value, ) {
        let reg =
            /(^-?[+-]?([0-9]*\.?[0-9]+|[0-9]+\.?[0-9]*)([eE][+-]?[0-9]+)?$)|(^$)/;
        if (value && reg.test(value) === false) {
            return Promise.reject('请输入正确的数字');
        } else if (!value) {
            return Promise.reject('请输入数字');
        } else {
            return Promise.resolve('');
        }
    },
    isIntNumer: function (rule, value) {
        let reg = /(^-?\d+$)|(^$)/;
        if (value && reg.test(value) === false) {
            return Promise.reject('请输入正确的整数');
        } else {
            return Promise.resolve('');
        }
    },
    isIntNumerNotNull: function (rule, value) {
        let reg = /(^-?\d+$)|(^$)/;
        if (value && reg.test(value) === false) {
            return Promise.reject('请输入正确的整数');
        } else if (!value) {
            return Promise.reject('请输入整数');
        } else {
            return Promise.resolve('');
        }
    },
    isIdCard: function (rule, value) {
        let reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
        if (value && reg.test(value) === false) {
            return Promise.reject('请输入正确的身份证');
        } else {
            return Promise.resolve('');
        }
    },
    isIdCardNotNull: function (rule, value) {
        let reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
        if (value && reg.test(value) === false) {
            return Promise.reject('请输入正确的身份证');
        } else if (!value) {
            return Promise.reject('请输入身份证');
        } else {
            return Promise.resolve('');
        }
    },
};
