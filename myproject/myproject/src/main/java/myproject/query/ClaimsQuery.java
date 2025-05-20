package myproject.query;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import myproject.common.query.Query;
import org.springframework.format.annotation.DateTimeFormat;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
    import java.util.Date;

/**
* 报销申请查询
*
*/
@Data
@EqualsAndHashCode(callSuper = false)
@Schema(description = "报销申请查询")
@JsonIgnoreProperties(ignoreUnknown = true)
public class ClaimsQuery extends Query {
    @Schema(description = "主键")
    private Long id;

    @Schema(description = "报销人id")
    private Long adduserid;

    @Schema(description = "报销人")
    private String addusername;

    @Schema(description = "票据图片")
    private String billpicture;

    @Schema(description = "审核")
    private String shenhe;

    @Schema(description = "审核回复")
    private String shenhehuifu;

    @Schema(description = "报销备注")
    private String remark;

    @Schema(description = "创建时间")
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date[] addtime;

}