package myproject.entity;

import lombok.Data;
import lombok.EqualsAndHashCode;
import com.baomidou.mybatisplus.annotation.*;
    import java.util.Date;

/**
* 薪资
*
*/

@Data
@TableName("salariess")
public class SalariessEntity {
        /**
        * 主键
        */
        @TableId
        private Long id;

        /**
        * 员工id
        */
        private Long employeeid;

        /**
        * 员工名称
        */
        private String employeename;

        /**
        * 月份
        */
        private String monthes;

        /**
        * 薪资
        */
        private String salary;

        /**
        * 备注
        */
        private String remarks;

        /**
        * 五险
        */
        private String fiveinsurances;

        /**
        * 一金
        */
        private String onegold;

        /**
        * 创建时间
        */
        @TableField(fill = FieldFill.INSERT)
        private Date addtime;

}