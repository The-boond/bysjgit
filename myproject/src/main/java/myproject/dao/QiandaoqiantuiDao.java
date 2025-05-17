package myproject.dao;

import myproject.common.utils.BaseDao;
import myproject.entity.QiandaoqiantuiEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import java.util.List;
import java.util.Map;
/**
* 签到签退
*
*/
@Mapper
public interface QiandaoqiantuiDao extends BaseDao<QiandaoqiantuiEntity> {
    List<Map<String, Object>> selectValue(@Param("params") Map<String, Object> params, @Param(Constants.WRAPPER) LambdaQueryWrapper<QiandaoqiantuiEntity> wrapper);

    List<Map<String, Object>> selectTimeStatValue(@Param("params") Map<String, Object> params, @Param(Constants.WRAPPER) LambdaQueryWrapper<QiandaoqiantuiEntity> wrapper);

    List<Map<String, Object>> selectGroup(@Param("params") Map<String, Object> params, @Param(Constants.WRAPPER) LambdaQueryWrapper<QiandaoqiantuiEntity> wrapper);
}