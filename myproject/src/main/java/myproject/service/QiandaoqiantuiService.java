package myproject.service;

import myproject.common.page.PageResult;
import myproject.common.utils.BaseService;
import myproject.vo.QiandaoqiantuiVO;
import myproject.query.QiandaoqiantuiQuery;
import myproject.entity.QiandaoqiantuiEntity;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;

import java.util.List;
import java.util.Map;
import java.io.File;
/**
* 签到签退
*
*/
public interface QiandaoqiantuiService extends BaseService<QiandaoqiantuiEntity> {

    PageResult<QiandaoqiantuiVO> page(QiandaoqiantuiQuery query);

    List<QiandaoqiantuiVO> queryList(QiandaoqiantuiQuery query);

    void save(QiandaoqiantuiVO vo);

    void update(QiandaoqiantuiVO vo);

    void delete(List<Long> idList);

    void export(QiandaoqiantuiQuery query);

    void importqiandaoqiantui(File importFile);

    List<Map<String, Object>> selectValue(Map<String, Object> params, LambdaQueryWrapper<QiandaoqiantuiEntity> wrapper);

    List<Map<String, Object>> selectTimeStatValue(Map<String, Object> params, LambdaQueryWrapper<QiandaoqiantuiEntity> wrapper);

    List<Map<String, Object>> selectGroup(Map<String, Object> params, LambdaQueryWrapper<QiandaoqiantuiEntity> wrapper);
}