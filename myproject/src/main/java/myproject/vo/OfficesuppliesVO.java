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
* 办公用品
*
*/
@Data
@Schema(description = "办公用品")
@JsonIgnoreProperties(ignoreUnknown = true)
public class OfficesuppliesVO implements Serializable {
private static final long serialVersionUID = 1L;

        @Schema(description = "主键")
        @ExcelIgnore
    private Long id;

        @Schema(description = "点击量")
        @ExcelProperty("点击量")
    private Integer clicknum;

        @Schema(description = "名称")
        @ExcelProperty("名称")
    private String name;

        @Schema(description = "品牌")
        @ExcelProperty("品牌")
    private String brand;

        @Schema(description = "尺寸")
        @ExcelProperty("尺寸")
    private String size;

        @Schema(description = "材质")
        @ExcelProperty("材质")
    private String material;

        @Schema(description = "功能描述")
        @ExcelProperty("功能描述")
    private String functionaldescription;

        @Schema(description = "使用场景")
        @ExcelProperty("使用场景")
    private String usagescenarios;

        @Schema(description = "封面")
        @ExcelProperty("封面")
    private String photo;

        @Schema(description = "详情图")
        @ExcelProperty("详情图")
    private String photos;

        @Schema(description = "详情信息")
        @ExcelProperty("详情信息")
    private String details;

        @Schema(description = "创建时间")
        @JsonFormat(pattern = DateUtils.DATE_PATTERN)
        @ExcelProperty("创建时间")
    private Date addtime;


}