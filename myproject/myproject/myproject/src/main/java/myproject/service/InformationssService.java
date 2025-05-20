package myproject.service;

import myproject.common.page.PageResult;
import myproject.common.utils.BaseService;
import myproject.vo.InformationssVO;
import myproject.query.InformationssQuery;
import myproject.entity.InformationssEntity;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;

import java.util.List;
import java.util.Map;
import java.io.File;
/**
* 资料
*
*/
public interface InformationssService extends BaseService<InformationssEntity> {

    PageResult<InformationssVO> page(InformationssQuery query);

    List<InformationssVO> queryList(InformationssQuery query);

    void save(InformationssVO vo);

    void update(InformationssVO vo);

    void delete(List<Long> idList);

    void export(InformationssQuery query);

    void importinformationss(File importFile);
                
    List<Map<String, Object>> selectValue(Map<String, Object> params, LambdaQueryWrapper<InformationssEntity> wrapper);

    List<Map<String, Object>> selectTimeStatValue(Map<String, Object> params, LambdaQueryWrapper<InformationssEntity> wrapper);

    List<Map<String, Object>> selectGroup(Map<String, Object> params, LambdaQueryWrapper<InformationssEntity> wrapper);
}