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
* 用品申领
*
*/
@Data
@Schema(description = "用品申领")
@JsonIgnoreProperties(ignoreUnknown = true)
public class ItemapplicationVO implements Serializable {
private static final long serialVersionUID = 1L;

        @Schema(description = "主键")
        @ExcelIgnore
    private Long id;

        @Schema(description = "用品id")
        @ExcelProperty("用品id")
    private Long shenheid;

        @Schema(description = "用品名称")
        @ExcelProperty("用品名称")
    private String name;

        @Schema(description = "申领人id")
        @ExcelProperty("申领人id")
    private Long adduserid;

        @Schema(description = "申领人")
        @ExcelProperty("申领人")
    private String addusername;

        @Schema(description = "用品封面")
        @ExcelProperty("用品封面")
    private String photo;

        @Schema(description = "审核")
        @ExcelProperty("审核")
    private String shenhe;

        @Schema(description = "使用说明")
        @ExcelProperty("使用说明")
    private String instructionsforuse;

        @Schema(description = "归还时间")
        @JsonFormat(pattern = DateUtils.DATE_PATTERN)
        @ExcelProperty("归还时间")
    private Date returntime;

        @Schema(description = "创建时间")
        @JsonFormat(pattern = DateUtils.DATE_PATTERN)
        @ExcelProperty("创建时间")
    private Date addtime;


}