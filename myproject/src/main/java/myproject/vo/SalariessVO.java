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
* 薪资
*
*/
@Data
@Schema(description = "薪资")
@JsonIgnoreProperties(ignoreUnknown = true)
public class SalariessVO implements Serializable {
private static final long serialVersionUID = 1L;

        @Schema(description = "主键")
        @ExcelIgnore
    private Long id;

        @Schema(description = "员工id")
        @ExcelProperty("员工id")
    private Long employeeid;

        @Schema(description = "员工名称")
        @ExcelProperty("员工名称")
    private String employeename;

        @Schema(description = "月份")
        @ExcelProperty("月份")
    private String monthes;

        @Schema(description = "薪资")
        @ExcelProperty("薪资")
    private String salary;

        @Schema(description = "备注")
        @ExcelProperty("备注")
    private String remarks;

        @Schema(description = "五险")
        @ExcelProperty("五险")
    private String fiveinsurances;

        @Schema(description = "一金")
        @ExcelProperty("一金")
    private String onegold;

        @Schema(description = "创建时间")
        @JsonFormat(pattern = DateUtils.DATE_PATTERN)
        @ExcelProperty("创建时间")
    private Date addtime;


}