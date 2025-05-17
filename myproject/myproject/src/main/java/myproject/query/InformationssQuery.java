package myproject.query;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import myproject.common.query.Query;
import org.springframework.format.annotation.DateTimeFormat;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
    import java.util.Date;

/**
* 资料查询
*
*/
@Data
@EqualsAndHashCode(callSuper = false)
@Schema(description = "资料查询")
@JsonIgnoreProperties(ignoreUnknown = true)
public class InformationssQuery extends Query {
    @Schema(description = "创建人id")
    private Long adduserid;

    @Schema(description = "创建人")
    private String addusername;

    @Schema(description = "主键")
    private Long id;

    @Schema(description = "资料名称")
    private String name;

    @Schema(description = "资料图片")
    private String photo;

    @Schema(description = "资料文件")
    private String files;

    @Schema(description = "审核")
    private String shenhe;

    @Schema(description = "资料简介")
    private String detail;

    @Schema(description = "创建时间")
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date[] addtime;

}