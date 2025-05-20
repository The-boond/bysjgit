package myproject.query;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import myproject.common.query.Query;
import org.springframework.format.annotation.DateTimeFormat;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
    import java.util.Date;

/**
* 工作计划查询
*
*/
@Data
@EqualsAndHashCode(callSuper = false)
@Schema(description = "工作计划查询")
@JsonIgnoreProperties(ignoreUnknown = true)
public class WorkplanQuery extends Query {
    @Schema(description = "创建人id")
    private Long adduserid;

    @Schema(description = "创建人")
    private String addusername;

    @Schema(description = "主键")
    private Long id;

    @Schema(description = "审核")
    private String shenhe;

    @Schema(description = "工作标题")
    private String name;

    @Schema(description = "工作内容")
    private String workcontent;

    @Schema(description = "任务类型")
    private String tasktype;

    @Schema(description = "负责人名称")
    private String nameofpersonincharge;

    @Schema(description = "优先级")
    private String priority;

    @Schema(description = "开始时间")
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date[] starttime;

    @Schema(description = "计划时长")
    private String planningduration;

    @Schema(description = "完成进度")
    private String completionprogress;

    @Schema(description = "工作封面")
    private String jobcover;

    @Schema(description = "创建时间")
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date[] addtime;

}