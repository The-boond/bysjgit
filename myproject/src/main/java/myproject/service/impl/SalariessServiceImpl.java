package myproject.service.impl;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import lombok.AllArgsConstructor;
import lombok.SneakyThrows;
import myproject.common.page.PageResult;
import myproject.common.impl.BaseServiceImpl;
import myproject.convert.SalariessConvert;
import myproject.entity.SalariessEntity;
import myproject.query.SalariessQuery;
import myproject.vo.SalariessVO;
import myproject.dao.SalariessDao;
import myproject.service.SalariessService;
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
* 薪资
*
*/
@Service
@AllArgsConstructor
public class SalariessServiceImpl extends BaseServiceImpl<SalariessDao, SalariessEntity> implements SalariessService {

    @Override
    public PageResult<SalariessVO> page(SalariessQuery query) {
        IPage<SalariessEntity> page = baseMapper.selectPage(getPage(query), getWrapper(query));
        return new PageResult<>(SalariessConvert.INSTANCE.convertList(page.getRecords()), page.getTotal());
    }

    @Override
    public List<SalariessVO> queryList(SalariessQuery query) {
        return SalariessConvert.INSTANCE.convertList(baseMapper.selectList(getWrapper(query)));
    }

    private LambdaQueryWrapper<SalariessEntity> getWrapper(SalariessQuery query){
        LambdaQueryWrapper<SalariessEntity> wrapper = Wrappers.lambdaQuery();
                    wrapper.eq(null!=query.getId(), SalariessEntity::getId, query.getId());
                    wrapper.eq(null!=query.getEmployeeid(), SalariessEntity::getEmployeeid, query.getEmployeeid());
                    wrapper.eq(StringUtils.isNotEmpty(query.getEmployeename()), SalariessEntity::getEmployeename, query.getEmployeename());
                    wrapper.eq(StringUtils.isNotEmpty(query.getMonthes()), SalariessEntity::getMonthes, query.getMonthes());
                    wrapper.eq(StringUtils.isNotEmpty(query.getSalary()), SalariessEntity::getSalary, query.getSalary());
                    wrapper.eq(StringUtils.isNotEmpty(query.getRemarks()), SalariessEntity::getRemarks, query.getRemarks());
                    wrapper.eq(StringUtils.isNotEmpty(query.getFiveinsurances()), SalariessEntity::getFiveinsurances, query.getFiveinsurances());
                    wrapper.eq(StringUtils.isNotEmpty(query.getOnegold()), SalariessEntity::getOnegold, query.getOnegold());
                    wrapper.between(ArrayUtils.isNotEmpty(query.getAddtime()), SalariessEntity::getAddtime, ArrayUtils.isNotEmpty(query.getAddtime()) ? query.getAddtime()[0] : null, ArrayUtils.isNotEmpty(query.getAddtime()) ? query.getAddtime()[1] : null);
            return wrapper;
    }

    @Override
    public void save(SalariessVO vo) {
        SalariessEntity entity = SalariessConvert.INSTANCE.convert(vo);
        baseMapper.insert(entity);
    }

    @Override
    public void update(SalariessVO vo) {
        SalariessEntity entity = SalariessConvert.INSTANCE.convert(vo);
        updateById(entity);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void delete(List<Long> idList) {
        removeByIds(idList);
    }

    @Override
    @SneakyThrows
    public void export(SalariessQuery query) {
        List<SalariessVO> list = SalariessConvert.INSTANCE.convertList(baseMapper.selectList(getWrapper(query)));
        // 写到浏览器打开
        ExcelUtils.excelExport(SalariessVO.class, "薪资" + DateUtils.format(new Date()), null, list);
    }

    @Override
    @SneakyThrows
    public void importsalariess(File file) {
        ExcelUtils.readAnalysis(file, SalariessVO.class, new ExcelFinishCallBack<SalariessVO>() {
            @Override
            public void doAfterAllAnalysed(List<SalariessVO> result) {
                saveSalariesss(result);
            }

            @Override
            public void doSaveBatch(List<SalariessVO> result) {
                saveSalariesss(result);
            }

            private void saveSalariesss(List<SalariessVO> result) {
                List<SalariessEntity> SalariessEntities = SalariessConvert.INSTANCE.convertEntityList(result);
                saveBatch(SalariessEntities);
            }
        });
    }

    @Override
    public List<Map<String, Object>> selectValue(Map<String, Object> params, LambdaQueryWrapper<SalariessEntity> wrapper) {
        return baseMapper.selectValue(params, wrapper);
    }

    @Override
    public List<Map<String, Object>> selectTimeStatValue(Map<String, Object> params, LambdaQueryWrapper<SalariessEntity> wrapper) {
        return baseMapper.selectTimeStatValue(params, wrapper);
    }

    @Override
    public List<Map<String, Object>> selectGroup(Map<String, Object> params, LambdaQueryWrapper<SalariessEntity> wrapper) {
        return baseMapper.selectGroup(params, wrapper);
    }
}