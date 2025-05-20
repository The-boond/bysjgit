package myproject.service.impl;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import lombok.AllArgsConstructor;
import lombok.SneakyThrows;
import myproject.common.page.PageResult;
import myproject.common.impl.BaseServiceImpl;
import myproject.convert.ClaimsConvert;
import myproject.entity.ClaimsEntity;
import myproject.query.ClaimsQuery;
import myproject.vo.ClaimsVO;
import myproject.dao.ClaimsDao;
import myproject.service.ClaimsService;
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
* 报销申请
*
*/
@Service
@AllArgsConstructor
public class ClaimsServiceImpl extends BaseServiceImpl<ClaimsDao, ClaimsEntity> implements ClaimsService {

    @Override
    public PageResult<ClaimsVO> page(ClaimsQuery query) {
        IPage<ClaimsEntity> page = baseMapper.selectPage(getPage(query), getWrapper(query));
        return new PageResult<>(ClaimsConvert.INSTANCE.convertList(page.getRecords()), page.getTotal());
    }

    @Override
    public List<ClaimsVO> queryList(ClaimsQuery query) {
        return ClaimsConvert.INSTANCE.convertList(baseMapper.selectList(getWrapper(query)));
    }

    private LambdaQueryWrapper<ClaimsEntity> getWrapper(ClaimsQuery query){
        LambdaQueryWrapper<ClaimsEntity> wrapper = Wrappers.lambdaQuery();
                    wrapper.eq(null!=query.getId(), ClaimsEntity::getId, query.getId());
                    wrapper.eq(null!=query.getAdduserid(), ClaimsEntity::getAdduserid, query.getAdduserid());
                    wrapper.eq(StringUtils.isNotEmpty(query.getAddusername()), ClaimsEntity::getAddusername, query.getAddusername());
                    wrapper.eq(StringUtils.isNotEmpty(query.getBillpicture()), ClaimsEntity::getBillpicture, query.getBillpicture());
                    wrapper.eq(StringUtils.isNotEmpty(query.getShenhe()), ClaimsEntity::getShenhe, query.getShenhe());
                    wrapper.eq(StringUtils.isNotEmpty(query.getShenhehuifu()), ClaimsEntity::getShenhehuifu, query.getShenhehuifu());
                    wrapper.eq(StringUtils.isNotEmpty(query.getRemark()), ClaimsEntity::getRemark, query.getRemark());
                    wrapper.between(ArrayUtils.isNotEmpty(query.getAddtime()), ClaimsEntity::getAddtime, ArrayUtils.isNotEmpty(query.getAddtime()) ? query.getAddtime()[0] : null, ArrayUtils.isNotEmpty(query.getAddtime()) ? query.getAddtime()[1] : null);
            return wrapper;
    }

    @Override
    public void save(ClaimsVO vo) {
        ClaimsEntity entity = ClaimsConvert.INSTANCE.convert(vo);
        baseMapper.insert(entity);
    }

    @Override
    public void update(ClaimsVO vo) {
        ClaimsEntity entity = ClaimsConvert.INSTANCE.convert(vo);
        updateById(entity);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void delete(List<Long> idList) {
        removeByIds(idList);
    }

    @Override
    @SneakyThrows
    public void export(ClaimsQuery query) {
        List<ClaimsVO> list = ClaimsConvert.INSTANCE.convertList(baseMapper.selectList(getWrapper(query)));
        // 写到浏览器打开
        ExcelUtils.excelExport(ClaimsVO.class, "报销申请" + DateUtils.format(new Date()), null, list);
    }

    @Override
    @SneakyThrows
    public void importclaims(File file) {
        ExcelUtils.readAnalysis(file, ClaimsVO.class, new ExcelFinishCallBack<ClaimsVO>() {
            @Override
            public void doAfterAllAnalysed(List<ClaimsVO> result) {
                saveClaimss(result);
            }

            @Override
            public void doSaveBatch(List<ClaimsVO> result) {
                saveClaimss(result);
            }

            private void saveClaimss(List<ClaimsVO> result) {
                List<ClaimsEntity> ClaimsEntities = ClaimsConvert.INSTANCE.convertEntityList(result);
                saveBatch(ClaimsEntities);
            }
        });
    }

    @Override
    public List<Map<String, Object>> selectValue(Map<String, Object> params, LambdaQueryWrapper<ClaimsEntity> wrapper) {
        return baseMapper.selectValue(params, wrapper);
    }

    @Override
    public List<Map<String, Object>> selectTimeStatValue(Map<String, Object> params, LambdaQueryWrapper<ClaimsEntity> wrapper) {
        return baseMapper.selectTimeStatValue(params, wrapper);
    }

    @Override
    public List<Map<String, Object>> selectGroup(Map<String, Object> params, LambdaQueryWrapper<ClaimsEntity> wrapper) {
        return baseMapper.selectGroup(params, wrapper);
    }
}