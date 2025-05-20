package myproject.entity;

import lombok.Data;
import lombok.EqualsAndHashCode;
import com.baomidou.mybatisplus.annotation.*;
    import java.util.Date;

/**
* 报销申请
*
*/

@Data
@TableName("claims")
public class ClaimsEntity {
        /**
        * 主键
        */
        @TableId
        private Long id;

        /**
        * 报销人id
        */
        private Long adduserid;

        /**
        * 报销人
        */
        private String addusername;

        /**
        * 票据图片
        */
        private String billpicture;

        /**
        * 审核
        */
        private String shenhe;

        /**
        * 审核回复
        */
        private String shenhehuifu;

        /**
        * 报销备注
        */
        private String remark;

        /**
        * 创建时间
        */
        @TableField(fill = FieldFill.INSERT)
        private Date addtime;

}