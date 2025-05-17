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
* 工作计划
*
*/
@Data
@Schema(description = "工作计划")
@JsonIgnoreProperties(ignoreUnknown = true)
public class WorkplanVO implements Serializable {
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

        @Schema(description = "审核")
        @ExcelProperty("审核")
    private String shenhe;

        @Schema(description = "工作标题")
        @ExcelProperty("工作标题")
    private String name;

        @Schema(description = "工作内容")
        @ExcelProperty("工作内容")
    private String workcontent;

        @Schema(description = "任务类型")
        @ExcelProperty("任务类型")
    private String tasktype;

        @Schema(description = "负责人名称")
        @ExcelProperty("负责人名称")
    private String nameofpersonincharge;

        @Schema(description = "优先级")
        @ExcelProperty("优先级")
    private String priority;

        @Schema(description = "开始时间")
        @JsonFormat(pattern = DateUtils.DATE_PATTERN)
        @ExcelProperty("开始时间")
    private Date starttime;

        @Schema(description = "计划时长")
        @ExcelProperty("计划时长")
    private String planningduration;

        @Schema(description = "完成进度")
        @ExcelProperty("完成进度")
    private String completionprogress;

        @Schema(description = "工作封面")
        @ExcelProperty("工作封面")
    private String jobcover;

        @Schema(description = "创建时间")
        @JsonFormat(pattern = DateUtils.DATE_PATTERN)
        @ExcelProperty("创建时间")
    private Date addtime;


}