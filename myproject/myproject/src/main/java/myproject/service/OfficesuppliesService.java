package myproject.service;

import myproject.common.page.PageResult;
import myproject.common.utils.BaseService;
import myproject.vo.OfficesuppliesVO;
import myproject.query.OfficesuppliesQuery;
import myproject.entity.OfficesuppliesEntity;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;

import java.util.List;
import java.util.Map;
import java.io.File;
/**
* 办公用品
*
*/
public interface OfficesuppliesService extends BaseService<OfficesuppliesEntity> {

    PageResult<OfficesuppliesVO> page(OfficesuppliesQuery query);

    List<OfficesuppliesVO> queryList(OfficesuppliesQuery query);

    void save(OfficesuppliesVO vo);

    void update(OfficesuppliesVO vo);

    void delete(List<Long> idList);

    void export(OfficesuppliesQuery query);

    void importofficesupplies(File importFile);
                
    List<Map<String, Object>> selectValue(Map<String, Object> params, LambdaQueryWrapper<OfficesuppliesEntity> wrapper);

    List<Map<String, Object>> selectTimeStatValue(Map<String, Object> params, LambdaQueryWrapper<OfficesuppliesEntity> wrapper);

    List<Map<String, Object>> selectGroup(Map<String, Object> params, LambdaQueryWrapper<OfficesuppliesEntity> wrapper);
}