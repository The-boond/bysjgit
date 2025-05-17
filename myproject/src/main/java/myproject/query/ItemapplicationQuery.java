package myproject.query;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import myproject.common.query.Query;
import org.springframework.format.annotation.DateTimeFormat;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
    import java.util.Date;

/**
* 用品申领查询
*
*/
@Data
@EqualsAndHashCode(callSuper = false)
@Schema(description = "用品申领查询")
@JsonIgnoreProperties(ignoreUnknown = true)
public class ItemapplicationQuery extends Query {
    @Schema(description = "主键")
    private Long id;

    @Schema(description = "用品id")
    private Long shenheid;

    @Schema(description = "用品名称")
    private String name;

    @Schema(description = "申领人id")
    private Long adduserid;

    @Schema(description = "申领人")
    private String addusername;

    @Schema(description = "用品封面")
    private String photo;

    @Schema(description = "审核")
    private String shenhe;

    @Schema(description = "使用说明")
    private String instructionsforuse;

    @Schema(description = "归还时间")
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date[] returntime;

    @Schema(description = "创建时间")
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date[] addtime;

}