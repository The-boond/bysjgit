package myproject.service.impl;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import lombok.AllArgsConstructor;
import lombok.SneakyThrows;
import myproject.common.page.PageResult;
import myproject.common.impl.BaseServiceImpl;
import myproject.convert.LeavessConvert;
import myproject.entity.LeavessEntity;
import myproject.query.LeavessQuery;
import myproject.vo.LeavessVO;
import myproject.dao.LeavessDao;
import myproject.service.LeavessService;
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
* 请假
*
*/
@Service
@AllArgsConstructor
public class LeavessServiceImpl extends BaseServiceImpl<LeavessDao, LeavessEntity> implements LeavessService {

    @Override
    public PageResult<LeavessVO> page(LeavessQuery query) {
        IPage<LeavessEntity> page = baseMapper.selectPage(getPage(query), getWrapper(query));
        return new PageResult<>(LeavessConvert.INSTANCE.convertList(page.getRecords()), page.getTotal());
    }

    @Override
    public List<LeavessVO> queryList(LeavessQuery query) {
        return LeavessConvert.INSTANCE.convertList(baseMapper.selectList(getWrapper(query)));
    }

    private LambdaQueryWrapper<LeavessEntity> getWrapper(LeavessQuery query){
        LambdaQueryWrapper<LeavessEntity> wrapper = Wrappers.lambdaQuery();
                    wrapper.eq(null!=query.getAdduserid(), LeavessEntity::getAdduserid, query.getAdduserid());
                    wrapper.eq(StringUtils.isNotEmpty(query.getAddusername()), LeavessEntity::getAddusername, query.getAddusername());
                    wrapper.eq(null!=query.getId(), LeavessEntity::getId, query.getId());
                    wrapper.eq(StringUtils.isNotEmpty(query.getShenhe()), LeavessEntity::getShenhe, query.getShenhe());
                    wrapper.eq(StringUtils.isNotEmpty(query.getReasonforleave()), LeavessEntity::getReasonforleave, query.getReasonforleave());
                    wrapper.eq(StringUtils.isNotEmpty(query.getPhoto()), LeavessEntity::getPhoto, query.getPhoto());
                    wrapper.between(ArrayUtils.isNotEmpty(query.getLeavetime()), LeavessEntity::getLeavetime, ArrayUtils.isNotEmpty(query.getLeavetime()) ? query.getLeavetime()[0] : null, ArrayUtils.isNotEmpty(query.getLeavetime()) ? query.getLeavetime()[1] : null);
                    wrapper.between(ArrayUtils.isNotEmpty(query.getAddtime()), LeavessEntity::getAddtime, ArrayUtils.isNotEmpty(query.getAddtime()) ? query.getAddtime()[0] : null, ArrayUtils.isNotEmpty(query.getAddtime()) ? query.getAddtime()[1] : null);
            return wrapper;
    }

    @Override
    public void save(LeavessVO vo) {
        LeavessEntity entity = LeavessConvert.INSTANCE.convert(vo);
        baseMapper.insert(entity);
    }

    @Override
    public void update(LeavessVO vo) {
        LeavessEntity entity = LeavessConvert.INSTANCE.convert(vo);
        updateById(entity);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void delete(List<Long> idList) {
        removeByIds(idList);
    }

    @Override
    @SneakyThrows
    public void export(LeavessQuery query) {
        List<LeavessVO> list = LeavessConvert.INSTANCE.convertList(baseMapper.selectList(getWrapper(query)));
        // 写到浏览器打开
        ExcelUtils.excelExport(LeavessVO.class, "请假" + DateUtils.format(new Date()), null, list);
    }

    @Override
    @SneakyThrows
    public void importleavess(File file) {
        ExcelUtils.readAnalysis(file, LeavessVO.class, new ExcelFinishCallBack<LeavessVO>() {
            @Override
            public void doAfterAllAnalysed(List<LeavessVO> result) {
                saveLeavesss(result);
            }

            @Override
            public void doSaveBatch(List<LeavessVO> result) {
                saveLeavesss(result);
            }

            private void saveLeavesss(List<LeavessVO> result) {
                List<LeavessEntity> LeavessEntities = LeavessConvert.INSTANCE.convertEntityList(result);
                saveBatch(LeavessEntities);
            }
        });
    }

    @Override
    public List<Map<String, Object>> selectValue(Map<String, Object> params, LambdaQueryWrapper<LeavessEntity> wrapper) {
        return baseMapper.selectValue(params, wrapper);
    }

    @Override
    public List<Map<String, Object>> selectTimeStatValue(Map<String, Object> params, LambdaQueryWrapper<LeavessEntity> wrapper) {
        return baseMapper.selectTimeStatValue(params, wrapper);
    }

    @Override
    public List<Map<String, Object>> selectGroup(Map<String, Object> params, LambdaQueryWrapper<LeavessEntity> wrapper) {
        return baseMapper.selectGroup(params, wrapper);
    }
}