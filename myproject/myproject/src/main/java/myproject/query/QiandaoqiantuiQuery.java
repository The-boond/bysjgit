package myproject.query;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import myproject.common.query.Query;
import org.springframework.format.annotation.DateTimeFormat;

    import java.util.Date;

/**
* 签到签退查询
*
*/
@Data
@EqualsAndHashCode(callSuper = false)
@Schema(description = "签到签退查询")
public class QiandaoqiantuiQuery extends Query {
    @Schema(description = "主键")
    private Long id;

    @Schema(description = "员工id")
    private Long userid;

    @Schema(description = "员工姓名")
    private String username;

    @Schema(description = "签到/签退")
    private String status;

    @Schema(description = "签到时间")
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date[] qiandaotime;

    @Schema(description = "签退时间")
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date[] qiantuitime;

    @Schema(description = "创建时间")
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date[] addtime;

}