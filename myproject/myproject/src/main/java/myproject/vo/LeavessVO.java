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
* 请假
*
*/
@Data
@Schema(description = "请假")
@JsonIgnoreProperties(ignoreUnknown = true)
public class LeavessVO implements Serializable {
private static final long serialVersionUID = 1L;

        @Schema(description = "请假人id")
        @ExcelProperty("请假人id")
    private Long adduserid;

        @Schema(description = "请假人")
        @ExcelProperty("请假人")
    private String addusername;

        @Schema(description = "主键")
        @ExcelIgnore
    private Long id;

        @Schema(description = "审核")
        @ExcelProperty("审核")
    private String shenhe;

        @Schema(description = "请假理由")
        @ExcelProperty("请假理由")
    private String reasonforleave;

        @Schema(description = "封面")
        @ExcelProperty("封面")
    private String photo;

        @Schema(description = "请假时间")
        @JsonFormat(pattern = DateUtils.DATE_PATTERN)
        @ExcelProperty("请假时间")
    private Date leavetime;

        @Schema(description = "创建时间")
        @JsonFormat(pattern = DateUtils.DATE_PATTERN)
        @ExcelProperty("创建时间")
    private Date addtime;


}