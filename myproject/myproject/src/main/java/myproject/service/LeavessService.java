package myproject.service;

import myproject.common.page.PageResult;
import myproject.common.utils.BaseService;
import myproject.vo.LeavessVO;
import myproject.query.LeavessQuery;
import myproject.entity.LeavessEntity;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;

import java.util.List;
import java.util.Map;
import java.io.File;
/**
* 请假
*
*/
public interface LeavessService extends BaseService<LeavessEntity> {

    PageResult<LeavessVO> page(LeavessQuery query);

    List<LeavessVO> queryList(LeavessQuery query);

    void save(LeavessVO vo);

    void update(LeavessVO vo);

    void delete(List<Long> idList);

    void export(LeavessQuery query);

    void importleavess(File importFile);
                
    List<Map<String, Object>> selectValue(Map<String, Object> params, LambdaQueryWrapper<LeavessEntity> wrapper);

    List<Map<String, Object>> selectTimeStatValue(Map<String, Object> params, LambdaQueryWrapper<LeavessEntity> wrapper);

    List<Map<String, Object>> selectGroup(Map<String, Object> params, LambdaQueryWrapper<LeavessEntity> wrapper);
}