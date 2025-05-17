package myproject.entity;

import lombok.Data;
import lombok.EqualsAndHashCode;
import com.baomidou.mybatisplus.annotation.*;
    import java.util.Date;

/**
* 办公用品
*
*/

@Data
@TableName("officesupplies")
public class OfficesuppliesEntity {
        /**
        * 主键
        */
        @TableId
        private Long id;

        /**
        * 点击量
        */
        private Integer clicknum;

        /**
        * 名称
        */
        private String name;

        /**
        * 品牌
        */
        private String brand;

        /**
        * 尺寸
        */
        private String size;

        /**
        * 材质
        */
        private String material;

        /**
        * 功能描述
        */
        private String functionaldescription;

        /**
        * 使用场景
        */
        private String usagescenarios;

        /**
        * 封面
        */
        private String photo;

        /**
        * 详情图
        */
        private String photos;

        /**
        * 详情信息
        */
        private String details;

        /**
        * 创建时间
        */
        @TableField(fill = FieldFill.INSERT)
        private Date addtime;

}