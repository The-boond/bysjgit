package myproject.query;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import myproject.common.query.Query;
import org.springframework.format.annotation.DateTimeFormat;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
    import java.util.Date;

/**
* 请假查询
*
*/
@Data
@EqualsAndHashCode(callSuper = false)
@Schema(description = "请假查询")
@JsonIgnoreProperties(ignoreUnknown = true)
public class LeavessQuery extends Query {
    @Schema(description = "请假人id")
    private Long adduserid;

    @Schema(description = "请假人")
    private String addusername;

    @Schema(description = "主键")
    private Long id;

    @Schema(description = "审核")
    private String shenhe;

    @Schema(description = "请假理由")
    private String reasonforleave;

    @Schema(description = "封面")
    private String photo;

    @Schema(description = "请假时间")
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date[] leavetime;

    @Schema(description = "创建时间")
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date[] addtime;

}