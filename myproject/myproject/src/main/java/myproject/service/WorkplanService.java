package myproject.service;

import myproject.common.page.PageResult;
import myproject.common.utils.BaseService;
import myproject.vo.WorkplanVO;
import myproject.query.WorkplanQuery;
import myproject.entity.WorkplanEntity;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;

import java.util.List;
import java.util.Map;
import java.io.File;
/**
* 工作计划
*
*/
public interface WorkplanService extends BaseService<WorkplanEntity> {

    PageResult<WorkplanVO> page(WorkplanQuery query);

    List<WorkplanVO> queryList(WorkplanQuery query);

    void save(WorkplanVO vo);

    void update(WorkplanVO vo);

    void delete(List<Long> idList);

    void export(WorkplanQuery query);

    void importworkplan(File importFile);
                
    List<Map<String, Object>> selectValue(Map<String, Object> params, LambdaQueryWrapper<WorkplanEntity> wrapper);

    List<Map<String, Object>> selectTimeStatValue(Map<String, Object> params, LambdaQueryWrapper<WorkplanEntity> wrapper);

    List<Map<String, Object>> selectGroup(Map<String, Object> params, LambdaQueryWrapper<WorkplanEntity> wrapper);
}