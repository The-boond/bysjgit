package myproject.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import com.alibaba.excel.annotation.ExcelIgnore;
import com.alibaba.excel.annotation.ExcelProperty;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.io.Serializable;

import myproject.common.utils.DateUtils;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import java.util.Date;

/**
 * 资料
 */
@Data
@Schema(description = "资料")
@JsonIgnoreProperties(ignoreUnknown = true)
public class InformationssVO implements Serializable {
    private static final long serialVersionUID = 1L;

    @Schema(description = "创建人id")
    @ExcelProperty("创建人id")
    private Long adduserid;

    @Schema(description = "创建人")
    @ExcelProperty("创建人")
    private String addusername;

    @Schema(description = "主键")
    @ExcelIgnore
    private Long id;

    @Schema(description = "资料名称")
    @ExcelProperty("资料名称")
    private String name;

    @Schema(description = "资料图片")
    @ExcelProperty("资料图片")
    private String photo;

    @Schema(description = "资料文件")
    @ExcelProperty("资料文件")
    private String files;

    @Schema(description = "审核")
    @ExcelProperty("审核")
    private String shenhe;

    @Schema(description = "资料简介")
    @ExcelProperty("资料简介")
    private String detail;

    @Schema(description = "创建时间")
    @JsonFormat(pattern = DateUtils.DATE_PATTERN)
    @ExcelProperty("创建时间")
    private Date addtime;


}