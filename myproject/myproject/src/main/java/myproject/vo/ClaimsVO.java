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
* 报销申请
*
*/
@Data
@Schema(description = "报销申请")
@JsonIgnoreProperties(ignoreUnknown = true)
public class ClaimsVO implements Serializable {
private static final long serialVersionUID = 1L;

        @Schema(description = "主键")
        @ExcelIgnore
    private Long id;

        @Schema(description = "报销人id")
        @ExcelProperty("报销人id")
    private Long adduserid;

        @Schema(description = "报销人")
        @ExcelProperty("报销人")
    private String addusername;

        @Schema(description = "票据图片")
        @ExcelProperty("票据图片")
    private String billpicture;

        @Schema(description = "审核")
        @ExcelProperty("审核")
    private String shenhe;

        @Schema(description = "审核回复")
        @ExcelProperty("审核回复")
    private String shenhehuifu;

        @Schema(description = "报销备注")
        @ExcelProperty("报销备注")
    private String remark;

        @Schema(description = "创建时间")
        @JsonFormat(pattern = DateUtils.DATE_PATTERN)
        @ExcelProperty("创建时间")
    private Date addtime;


}