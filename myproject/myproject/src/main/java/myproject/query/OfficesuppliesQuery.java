package myproject.query;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import myproject.common.query.Query;
import org.springframework.format.annotation.DateTimeFormat;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
    import java.util.Date;

/**
* 办公用品查询
*
*/
@Data
@EqualsAndHashCode(callSuper = false)
@Schema(description = "办公用品查询")
@JsonIgnoreProperties(ignoreUnknown = true)
public class OfficesuppliesQuery extends Query {
    @Schema(description = "主键")
    private Long id;

    @Schema(description = "点击量")
    private Integer clicknum;

    @Schema(description = "名称")
    private String name;

    @Schema(description = "品牌")
    private String brand;

    @Schema(description = "尺寸")
    private String size;

    @Schema(description = "材质")
    private String material;

    @Schema(description = "功能描述")
    private String functionaldescription;

    @Schema(description = "使用场景")
    private String usagescenarios;

    @Schema(description = "封面")
    private String photo;

    @Schema(description = "详情图")
    private String photos;

    @Schema(description = "详情信息")
    private String details;

    @Schema(description = "创建时间")
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date[] addtime;

}