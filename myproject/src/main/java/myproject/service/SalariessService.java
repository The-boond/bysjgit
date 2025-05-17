package myproject.service;

import myproject.common.page.PageResult;
import myproject.common.utils.BaseService;
import myproject.vo.SalariessVO;
import myproject.query.SalariessQuery;
import myproject.entity.SalariessEntity;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;

import java.util.List;
import java.util.Map;
import java.io.File;
/**
* 薪资
*
*/
public interface SalariessService extends BaseService<SalariessEntity> {

    PageResult<SalariessVO> page(SalariessQuery query);

    List<SalariessVO> queryList(SalariessQuery query);

    void save(SalariessVO vo);

    void update(SalariessVO vo);

    void delete(List<Long> idList);

    void export(SalariessQuery query);

    void importsalariess(File importFile);
                
    List<Map<String, Object>> selectValue(Map<String, Object> params, LambdaQueryWrapper<SalariessEntity> wrapper);

    List<Map<String, Object>> selectTimeStatValue(Map<String, Object> params, LambdaQueryWrapper<SalariessEntity> wrapper);

    List<Map<String, Object>> selectGroup(Map<String, Object> params, LambdaQueryWrapper<SalariessEntity> wrapper);
}