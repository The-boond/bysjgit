export const createOneModel = {};
export const createOneList = [
  {
    label: "标题",
    colon: true,
    field: "name",
    eleType: "input",
    type: "text",
    placeholder: "请输入标题",
    bordered: true,
  },
  {
    label: "时间",
    colon: true,
    field: "shijian",
    eleType: "input",
    type: "text",
    placeholder: "请输入时间",
    bordered: true,
  },
  {
    label: "状态",
    colon: true,
    field: "status",
    eleType: "input",
    type: "text",
    placeholder: "请输入状态",
    bordered: true,
  },
];
export const createOneConfig = {
  labelAlign: "right",
  layout: "horizontal",
  labelCol: {
    span: 4,
  },
  wrapperCol: {
    span: 15,
  },
  operaLocationObj: {
    span: 4,
    offset: 10,
  },
  submitText: "确定",
  resetText: "",
};
