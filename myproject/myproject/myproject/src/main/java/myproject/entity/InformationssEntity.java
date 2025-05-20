package myproject.entity;

import lombok.Data;
import lombok.EqualsAndHashCode;
import com.baomidou.mybatisplus.annotation.*;
    import java.util.Date;

/**
* 资料
*
*/

@Data
@TableName("informationss")
public class InformationssEntity {
        /**
        * 创建人id
        */
        private Long adduserid;

        /**
        * 创建人
        */
        private String addusername;

        /**
        * 主键
        */
        @TableId
        private Long id;

        /**
        * 资料名称
        */
        private String name;

        /**
        * 资料图片
        */
        private String photo;

        /**
        * 资料文件
        */
        private String files;

        /**
        * 审核
        */
        private String shenhe;

        /**
        * 资料简介
        */
        private String detail;

        /**
        * 创建时间
        */
        @TableField(fill = FieldFill.INSERT)
        private Date addtime;

}