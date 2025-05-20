package myproject.dao;

import myproject.common.utils.BaseDao;
import myproject.entity.WorkplanEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import java.util.List;
import java.util.Map;
/**
* 工作计划
*
*/
@Mapper
public interface WorkplanDao extends BaseDao<WorkplanEntity> {
    List<Map<String, Object>> selectValue(@Param("params") Map<String, Object> params, @Param(Constants.WRAPPER) LambdaQueryWrapper<WorkplanEntity> wrapper);

    List<Map<String, Object>> selectTimeStatValue(@Param("params") Map<String, Object> params, @Param(Constants.WRAPPER) LambdaQueryWrapper<WorkplanEntity> wrapper);

    List<Map<String, Object>> selectGroup(@Param("params") Map<String, Object> params, @Param(Constants.WRAPPER) LambdaQueryWrapper<WorkplanEntity> wrapper);
}