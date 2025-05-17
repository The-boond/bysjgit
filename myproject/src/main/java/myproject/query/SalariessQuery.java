package myproject.query;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import myproject.common.query.Query;
import org.springframework.format.annotation.DateTimeFormat;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
    import java.util.Date;

/**
* 薪资查询
*
*/
@Data
@EqualsAndHashCode(callSuper = false)
@Schema(description = "薪资查询")
@JsonIgnoreProperties(ignoreUnknown = true)
public class SalariessQuery extends Query {
    @Schema(description = "主键")
    private Long id;

    @Schema(description = "员工id")
    private Long employeeid;

    @Schema(description = "员工名称")
    private String employeename;

    @Schema(description = "月份")
    private String monthes;

    @Schema(description = "薪资")
    private String salary;

    @Schema(description = "备注")
    private String remarks;

    @Schema(description = "五险")
    private String fiveinsurances;

    @Schema(description = "一金")
    private String onegold;

    @Schema(description = "创建时间")
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date[] addtime;

}