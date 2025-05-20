package myproject.entity;

import lombok.Data;
import lombok.EqualsAndHashCode;
import com.baomidou.mybatisplus.annotation.*;
    import java.util.Date;

/**
* 请假
*
*/

@Data
@TableName("leavess")
public class LeavessEntity {
        /**
        * 请假人id
        */
        private Long adduserid;

        /**
        * 请假人
        */
        private String addusername;

        /**
        * 主键
        */
        @TableId
        private Long id;

        /**
        * 审核
        */
        private String shenhe;

        /**
        * 请假理由
        */
        private String reasonforleave;

        /**
        * 封面
        */
        private String photo;

        /**
        * 请假时间
        */
        private Date leavetime;

        /**
        * 创建时间
        */
        @TableField(fill = FieldFill.INSERT)
        private Date addtime;

}