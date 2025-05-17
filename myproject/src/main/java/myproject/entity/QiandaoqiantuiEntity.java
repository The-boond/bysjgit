package myproject.entity;

import lombok.Data;
import lombok.EqualsAndHashCode;
import com.baomidou.mybatisplus.annotation.*;
import java.util.Date;

/**
 * 签到签退
 */
@Data
@TableName("qiandaoqiantui")
public class QiandaoqiantuiEntity {
        /**
         * 主键
         */
        @TableId
        private Long id;

        /**
         * 员工id
         */
        private Long userid;

        /**
         * 员工姓名
         */
        private String username;

        /**
         * 签到/签退
         */
        private String status;

        /**
         * 签到时间
         */
        private Date qiandaotime;

        /**
         * 签退时间
         */
        private Date qiantuitime;

        /**
         * 创建时间
         */
        @TableField(fill = FieldFill.INSERT)
        private Date addtime;

        // 签到地点字段
        private String qiandaodidian;

        // 签退地点字段
        private String qiantuididian;

        public QiandaoqiantuiEntity() {
        }
}