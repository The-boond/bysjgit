package myproject.service;

import myproject.common.page.PageResult;
import myproject.common.utils.BaseService;
import myproject.vo.ItemapplicationVO;
import myproject.query.ItemapplicationQuery;
import myproject.entity.ItemapplicationEntity;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;

import java.util.List;
import java.util.Map;
import java.io.File;
/**
* 用品申领
*
*/
public interface ItemapplicationService extends BaseService<ItemapplicationEntity> {

    PageResult<ItemapplicationVO> page(ItemapplicationQuery query);

    List<ItemapplicationVO> queryList(ItemapplicationQuery query);

    void save(ItemapplicationVO vo);

    void update(ItemapplicationVO vo);

    void delete(List<Long> idList);

    void export(ItemapplicationQuery query);

    void importitemapplication(File importFile);
                
    List<Map<String, Object>> selectValue(Map<String, Object> params, LambdaQueryWrapper<ItemapplicationEntity> wrapper);

    List<Map<String, Object>> selectTimeStatValue(Map<String, Object> params, LambdaQueryWrapper<ItemapplicationEntity> wrapper);

    List<Map<String, Object>> selectGroup(Map<String, Object> params, LambdaQueryWrapper<ItemapplicationEntity> wrapper);
}