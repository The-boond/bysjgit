package myproject.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import com.alibaba.excel.annotation.ExcelProperty;
import com.alibaba.excel.annotation.ExcelIgnore;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import java.io.Serializable;
import myproject.common.utils.DateUtils;
import java.util.Date;

/**
 * 签到签退VO
 */
@Data
@Schema(description = "签到签退")
public class QiandaoqiantuiVO implements Serializable {
    private static final long serialVersionUID = 1L;

    @Schema(description = "主键")
    @ExcelIgnore
    private Long id;

    @Schema(description = "员工id")
    @ExcelProperty("员工id")
    private Long userid;

    @Schema(description = "员工姓名")
    @ExcelProperty("员工姓名")
    private String username;

    @Schema(description = "签到/签退")
    @ExcelProperty("签到/签退")
    private String status;

    @Schema(description = "签到时间")
    @JsonFormat(pattern = DateUtils.DATE_TIME_PATTERN)
    @ExcelProperty("签到时间")
    private Date qiandaotime;

    @Schema(description = "签退时间")
    @JsonFormat(pattern = DateUtils.DATE_TIME_PATTERN)
    @ExcelProperty("签退时间")
    private Date qiantuitime;

    @Schema(description = "创建时间")
    @JsonFormat(pattern = DateUtils.DATE_TIME_PATTERN)
    @ExcelProperty("创建时间")
    private Date addtime;

    @Schema(description = "签到地点")
    @ExcelProperty("签到地点")
    private String qiandaodidian;

    @Schema(description = "签退地点")
    @ExcelProperty("签退地点")
    private String qiantuididian;
}
