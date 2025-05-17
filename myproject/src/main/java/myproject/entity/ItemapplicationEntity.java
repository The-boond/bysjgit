package myproject.entity;

import lombok.Data;
import lombok.EqualsAndHashCode;
import com.baomidou.mybatisplus.annotation.*;
    import java.util.Date;

/**
* 用品申领
*
*/

@Data
@TableName("itemapplication")
public class ItemapplicationEntity {
        /**
        * 主键
        */
        @TableId
        private Long id;

        /**
        * 用品id
        */
        private Long shenheid;

        /**
        * 用品名称
        */
        private String name;

        /**
        * 申领人id
        */
        private Long adduserid;

        /**
        * 申领人
        */
        private String addusername;

        /**
        * 用品封面
        */
        private String photo;

        /**
        * 审核
        */
        private String shenhe;

        /**
        * 使用说明
        */
        private String instructionsforuse;

        /**
        * 归还时间
        */
        private Date returntime;

        /**
        * 创建时间
        */
        @TableField(fill = FieldFill.INSERT)
        private Date addtime;

}