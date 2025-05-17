package myproject.service;

import myproject.common.page.PageResult;
import myproject.common.utils.BaseService;
import myproject.vo.ClaimsVO;
import myproject.query.ClaimsQuery;
import myproject.entity.ClaimsEntity;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;

import java.util.List;
import java.util.Map;
import java.io.File;
/**
* 报销申请
*
*/
public interface ClaimsService extends BaseService<ClaimsEntity> {

    PageResult<ClaimsVO> page(ClaimsQuery query);

    List<ClaimsVO> queryList(ClaimsQuery query);

    void save(ClaimsVO vo);

    void update(ClaimsVO vo);

    void delete(List<Long> idList);

    void export(ClaimsQuery query);

    void importclaims(File importFile);
                
    List<Map<String, Object>> selectValue(Map<String, Object> params, LambdaQueryWrapper<ClaimsEntity> wrapper);

    List<Map<String, Object>> selectTimeStatValue(Map<String, Object> params, LambdaQueryWrapper<ClaimsEntity> wrapper);

    List<Map<String, Object>> selectGroup(Map<String, Object> params, LambdaQueryWrapper<ClaimsEntity> wrapper);
}