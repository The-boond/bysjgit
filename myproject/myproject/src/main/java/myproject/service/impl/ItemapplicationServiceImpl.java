package myproject.service.impl;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import lombok.AllArgsConstructor;
import lombok.SneakyThrows;
import myproject.common.page.PageResult;
import myproject.common.impl.BaseServiceImpl;
import myproject.convert.ItemapplicationConvert;
import myproject.entity.ItemapplicationEntity;
import myproject.query.ItemapplicationQuery;
import myproject.vo.ItemapplicationVO;
import myproject.dao.ItemapplicationDao;
import myproject.service.ItemapplicationService;
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
* 用品申领
*
*/
@Service
@AllArgsConstructor
public class ItemapplicationServiceImpl extends BaseServiceImpl<ItemapplicationDao, ItemapplicationEntity> implements ItemapplicationService {

    @Override
    public PageResult<ItemapplicationVO> page(ItemapplicationQuery query) {
        IPage<ItemapplicationEntity> page = baseMapper.selectPage(getPage(query), getWrapper(query));
        return new PageResult<>(ItemapplicationConvert.INSTANCE.convertList(page.getRecords()), page.getTotal());
    }

    @Override
    public List<ItemapplicationVO> queryList(ItemapplicationQuery query) {
        return ItemapplicationConvert.INSTANCE.convertList(baseMapper.selectList(getWrapper(query)));
    }

    private LambdaQueryWrapper<ItemapplicationEntity> getWrapper(ItemapplicationQuery query){
        LambdaQueryWrapper<ItemapplicationEntity> wrapper = Wrappers.lambdaQuery();
                    wrapper.eq(null!=query.getId(), ItemapplicationEntity::getId, query.getId());
                    wrapper.eq(null!=query.getShenheid(), ItemapplicationEntity::getShenheid, query.getShenheid());
                    wrapper.eq(StringUtils.isNotEmpty(query.getName()), ItemapplicationEntity::getName, query.getName());
                    wrapper.eq(null!=query.getAdduserid(), ItemapplicationEntity::getAdduserid, query.getAdduserid());
                    wrapper.eq(StringUtils.isNotEmpty(query.getAddusername()), ItemapplicationEntity::getAddusername, query.getAddusername());
                    wrapper.eq(StringUtils.isNotEmpty(query.getPhoto()), ItemapplicationEntity::getPhoto, query.getPhoto());
                    wrapper.eq(StringUtils.isNotEmpty(query.getShenhe()), ItemapplicationEntity::getShenhe, query.getShenhe());
                    wrapper.eq(StringUtils.isNotEmpty(query.getInstructionsforuse()), ItemapplicationEntity::getInstructionsforuse, query.getInstructionsforuse());
                    wrapper.between(ArrayUtils.isNotEmpty(query.getReturntime()), ItemapplicationEntity::getReturntime, ArrayUtils.isNotEmpty(query.getReturntime()) ? query.getReturntime()[0] : null, ArrayUtils.isNotEmpty(query.getReturntime()) ? query.getReturntime()[1] : null);
                    wrapper.between(ArrayUtils.isNotEmpty(query.getAddtime()), ItemapplicationEntity::getAddtime, ArrayUtils.isNotEmpty(query.getAddtime()) ? query.getAddtime()[0] : null, ArrayUtils.isNotEmpty(query.getAddtime()) ? query.getAddtime()[1] : null);
            return wrapper;
    }

    @Override
    public void save(ItemapplicationVO vo) {
        ItemapplicationEntity entity = ItemapplicationConvert.INSTANCE.convert(vo);
        baseMapper.insert(entity);
    }

    @Override
    public void update(ItemapplicationVO vo) {
        ItemapplicationEntity entity = ItemapplicationConvert.INSTANCE.convert(vo);
        updateById(entity);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void delete(List<Long> idList) {
        removeByIds(idList);
    }

    @Override
    @SneakyThrows
    public void export(ItemapplicationQuery query) {
        List<ItemapplicationVO> list = ItemapplicationConvert.INSTANCE.convertList(baseMapper.selectList(getWrapper(query)));
        // 写到浏览器打开
        ExcelUtils.excelExport(ItemapplicationVO.class, "用品申领" + DateUtils.format(new Date()), null, list);
    }

    @Override
    @SneakyThrows
    public void importitemapplication(File file) {
        ExcelUtils.readAnalysis(file, ItemapplicationVO.class, new ExcelFinishCallBack<ItemapplicationVO>() {
            @Override
            public void doAfterAllAnalysed(List<ItemapplicationVO> result) {
                saveItemapplications(result);
            }

            @Override
            public void doSaveBatch(List<ItemapplicationVO> result) {
                saveItemapplications(result);
            }

            private void saveItemapplications(List<ItemapplicationVO> result) {
                List<ItemapplicationEntity> ItemapplicationEntities = ItemapplicationConvert.INSTANCE.convertEntityList(result);
                saveBatch(ItemapplicationEntities);
            }
        });
    }

    @Override
    public List<Map<String, Object>> selectValue(Map<String, Object> params, LambdaQueryWrapper<ItemapplicationEntity> wrapper) {
        return baseMapper.selectValue(params, wrapper);
    }

    @Override
    public List<Map<String, Object>> selectTimeStatValue(Map<String, Object> params, LambdaQueryWrapper<ItemapplicationEntity> wrapper) {
        return baseMapper.selectTimeStatValue(params, wrapper);
    }

    @Override
    public List<Map<String, Object>> selectGroup(Map<String, Object> params, LambdaQueryWrapper<ItemapplicationEntity> wrapper) {
        return baseMapper.selectGroup(params, wrapper);
    }
}