package myproject.service.impl;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import lombok.AllArgsConstructor;
import lombok.SneakyThrows;
import myproject.common.page.PageResult;
import myproject.common.impl.BaseServiceImpl;
import myproject.convert.OfficesuppliesConvert;
import myproject.entity.OfficesuppliesEntity;
import myproject.query.OfficesuppliesQuery;
import myproject.vo.OfficesuppliesVO;
import myproject.dao.OfficesuppliesDao;
import myproject.service.OfficesuppliesService;
import myproject.common.utils.DateUtils;
import myproject.common.excel.ExcelFinishCallBack;
import org.apache.commons.lang3.ArrayUtils;
import org.apache.commons.lang3.StringUtils;
import myproject.common.utils.ExcelUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.io.File;

/**
* 办公用品
*
*/
@Service
@AllArgsConstructor
public class OfficesuppliesServiceImpl extends BaseServiceImpl<OfficesuppliesDao, OfficesuppliesEntity> implements OfficesuppliesService {

    @Override
    public PageResult<OfficesuppliesVO> page(OfficesuppliesQuery query) {
        IPage<OfficesuppliesEntity> page = baseMapper.selectPage(getPage(query), getWrapper(query));
        return new PageResult<>(OfficesuppliesConvert.INSTANCE.convertList(page.getRecords()), page.getTotal());
    }

    @Override
    public List<OfficesuppliesVO> queryList(OfficesuppliesQuery query) {
        return OfficesuppliesConvert.INSTANCE.convertList(baseMapper.selectList(getWrapper(query)));
    }

    private LambdaQueryWrapper<OfficesuppliesEntity> getWrapper(OfficesuppliesQuery query){
        LambdaQueryWrapper<OfficesuppliesEntity> wrapper = Wrappers.lambdaQuery();
                    wrapper.eq(null!=query.getId(), OfficesuppliesEntity::getId, query.getId());
                    wrapper.eq(null!=query.getClicknum(), OfficesuppliesEntity::getClicknum, query.getClicknum());
                    wrapper.eq(StringUtils.isNotEmpty(query.getName()), OfficesuppliesEntity::getName, query.getName());
                    wrapper.eq(StringUtils.isNotEmpty(query.getBrand()), OfficesuppliesEntity::getBrand, query.getBrand());
                    wrapper.eq(StringUtils.isNotEmpty(query.getSize()), OfficesuppliesEntity::getSize, query.getSize());
                    wrapper.eq(StringUtils.isNotEmpty(query.getMaterial()), OfficesuppliesEntity::getMaterial, query.getMaterial());
                    wrapper.eq(StringUtils.isNotEmpty(query.getFunctionaldescription()), OfficesuppliesEntity::getFunctionaldescription, query.getFunctionaldescription());
                    wrapper.eq(StringUtils.isNotEmpty(query.getUsagescenarios()), OfficesuppliesEntity::getUsagescenarios, query.getUsagescenarios());
                    wrapper.eq(StringUtils.isNotEmpty(query.getPhoto()), OfficesuppliesEntity::getPhoto, query.getPhoto());
                    wrapper.eq(StringUtils.isNotEmpty(query.getPhotos()), OfficesuppliesEntity::getPhotos, query.getPhotos());
                    wrapper.eq(StringUtils.isNotEmpty(query.getDetails()), OfficesuppliesEntity::getDetails, query.getDetails());
                    wrapper.between(ArrayUtils.isNotEmpty(query.getAddtime()), OfficesuppliesEntity::getAddtime, ArrayUtils.isNotEmpty(query.getAddtime()) ? query.getAddtime()[0] : null, ArrayUtils.isNotEmpty(query.getAddtime()) ? query.getAddtime()[1] : null);
            return wrapper;
    }

    @Override
    public void save(OfficesuppliesVO vo) {
        OfficesuppliesEntity entity = OfficesuppliesConvert.INSTANCE.convert(vo);
        baseMapper.insert(entity);
    }

    @Override
    public void update(OfficesuppliesVO vo) {
        OfficesuppliesEntity entity = OfficesuppliesConvert.INSTANCE.convert(vo);
        updateById(entity);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void delete(List<Long> idList) {
        removeByIds(idList);
    }

    @Override
    @SneakyThrows
    public void export(OfficesuppliesQuery query) {
        List<OfficesuppliesVO> list = OfficesuppliesConvert.INSTANCE.convertList(baseMapper.selectList(getWrapper(query)));
        // 写到浏览器打开
        ExcelUtils.excelExport(OfficesuppliesVO.class, "办公用品" + DateUtils.format(new Date()), null, list);
    }

    @Override
    @SneakyThrows
    public void importofficesupplies(File file) {
        ExcelUtils.readAnalysis(file, OfficesuppliesVO.class, new ExcelFinishCallBack<OfficesuppliesVO>() {
            @Override
            public void doAfterAllAnalysed(List<OfficesuppliesVO> result) {
                saveOfficesuppliess(result);
            }

            @Override
            public void doSaveBatch(List<OfficesuppliesVO> result) {
                saveOfficesuppliess(result);
            }

            private void saveOfficesuppliess(List<OfficesuppliesVO> result) {
                List<OfficesuppliesEntity> OfficesuppliesEntities = OfficesuppliesConvert.INSTANCE.convertEntityList(result);
                saveBatch(OfficesuppliesEntities);
            }
        });
    }

    @Override
    public List<Map<String, Object>> selectValue(Map<String, Object> params, LambdaQueryWrapper<OfficesuppliesEntity> wrapper) {
        return baseMapper.selectValue(params, wrapper);
    }

    @Override
    public List<Map<String, Object>> selectTimeStatValue(Map<String, Object> params, LambdaQueryWrapper<OfficesuppliesEntity> wrapper) {
        return baseMapper.selectTimeStatValue(params, wrapper);
    }

    @Override
    public List<Map<String, Object>> selectGroup(Map<String, Object> params, LambdaQueryWrapper<OfficesuppliesEntity> wrapper) {
        return baseMapper.selectGroup(params, wrapper);
    }
}