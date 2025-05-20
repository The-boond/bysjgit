package myproject.entity;

import lombok.Data;
import lombok.EqualsAndHashCode;
import com.baomidou.mybatisplus.annotation.*;
    import java.util.Date;

/**
* 工作计划
*
*/

@Data
@TableName("workplan")
public class WorkplanEntity {
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
        * 审核
        */
        private String shenhe;

        /**
        * 工作标题
        */
        private String name;

        /**
        * 工作内容
        */
        private String workcontent;

        /**
        * 任务类型
        */
        private String tasktype;

        /**
        * 负责人名称
        */
        private String nameofpersonincharge;

        /**
        * 优先级
        */
        private String priority;

        /**
        * 开始时间
        */
        private Date starttime;

        /**
        * 计划时长
        */
        private String planningduration;

        /**
        * 完成进度
        */
        private String completionprogress;

        /**
        * 工作封面
        */
        private String jobcover;

        /**
        * 创建时间
        */
        @TableField(fill = FieldFill.INSERT)
        private Date addtime;

}