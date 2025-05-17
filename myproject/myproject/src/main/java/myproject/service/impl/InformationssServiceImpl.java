package myproject.service.impl;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import lombok.AllArgsConstructor;
import lombok.SneakyThrows;
import myproject.common.page.PageResult;
import myproject.common.impl.BaseServiceImpl;
import myproject.convert.InformationssConvert;
import myproject.entity.InformationssEntity;
import myproject.query.InformationssQuery;
import myproject.vo.InformationssVO;
import myproject.dao.InformationssDao;
import myproject.service.InformationssService;
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
* 资料
*
*/
@Service
@AllArgsConstructor
public class InformationssServiceImpl extends BaseServiceImpl<InformationssDao, InformationssEntity> implements InformationssService {

    @Override
    public PageResult<InformationssVO> page(InformationssQuery query) {
        IPage<InformationssEntity> page = baseMapper.selectPage(getPage(query), getWrapper(query));
        return new PageResult<>(InformationssConvert.INSTANCE.convertList(page.getRecords()), page.getTotal());
    }

    @Override
    public List<InformationssVO> queryList(InformationssQuery query) {
        return InformationssConvert.INSTANCE.convertList(baseMapper.selectList(getWrapper(query)));
    }

    private LambdaQueryWrapper<InformationssEntity> getWrapper(InformationssQuery query){
        LambdaQueryWrapper<InformationssEntity> wrapper = Wrappers.lambdaQuery();
                    wrapper.eq(null!=query.getAdduserid(), InformationssEntity::getAdduserid, query.getAdduserid());
                    wrapper.eq(StringUtils.isNotEmpty(query.getAddusername()), InformationssEntity::getAddusername, query.getAddusername());
                    wrapper.eq(null!=query.getId(), InformationssEntity::getId, query.getId());
                    wrapper.eq(StringUtils.isNotEmpty(query.getName()), InformationssEntity::getName, query.getName());
                    wrapper.eq(StringUtils.isNotEmpty(query.getPhoto()), InformationssEntity::getPhoto, query.getPhoto());
                    wrapper.eq(StringUtils.isNotEmpty(query.getFiles()), InformationssEntity::getFiles, query.getFiles());
                    wrapper.eq(StringUtils.isNotEmpty(query.getShenhe()), InformationssEntity::getShenhe, query.getShenhe());
                    wrapper.eq(StringUtils.isNotEmpty(query.getDetail()), InformationssEntity::getDetail, query.getDetail());
                    wrapper.between(ArrayUtils.isNotEmpty(query.getAddtime()), InformationssEntity::getAddtime, ArrayUtils.isNotEmpty(query.getAddtime()) ? query.getAddtime()[0] : null, ArrayUtils.isNotEmpty(query.getAddtime()) ? query.getAddtime()[1] : null);
            return wrapper;
    }

    @Override
    public void save(InformationssVO vo) {
        InformationssEntity entity = InformationssConvert.INSTANCE.convert(vo);
        baseMapper.insert(entity);
    }

    @Override
    public void update(InformationssVO vo) {
        InformationssEntity entity = InformationssConvert.INSTANCE.convert(vo);
        updateById(entity);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void delete(List<Long> idList) {
        removeByIds(idList);
    }

    @Override
    @SneakyThrows
    public void export(InformationssQuery query) {
        List<InformationssVO> list = InformationssConvert.INSTANCE.convertList(baseMapper.selectList(getWrapper(query)));
        // 写到浏览器打开
        ExcelUtils.excelExport(InformationssVO.class, "资料" + DateUtils.format(new Date()), null, list);
    }

    @Override
    @SneakyThrows
    public void importinformationss(File file) {
        ExcelUtils.readAnalysis(file, InformationssVO.class, new ExcelFinishCallBack<InformationssVO>() {
            @Override
            public void doAfterAllAnalysed(List<InformationssVO> result) {
                saveInformationsss(result);
            }

            @Override
            public void doSaveBatch(List<InformationssVO> result) {
                saveInformationsss(result);
            }

            private void saveInformationsss(List<InformationssVO> result) {
                List<InformationssEntity> InformationssEntities = InformationssConvert.INSTANCE.convertEntityList(result);
                saveBatch(InformationssEntities);
            }
        });
    }

    @Override
    public List<Map<String, Object>> selectValue(Map<String, Object> params, LambdaQueryWrapper<InformationssEntity> wrapper) {
        return baseMapper.selectValue(params, wrapper);
    }

    @Override
    public List<Map<String, Object>> selectTimeStatValue(Map<String, Object> params, LambdaQueryWrapper<InformationssEntity> wrapper) {
        return baseMapper.selectTimeStatValue(params, wrapper);
    }

    @Override
    public List<Map<String, Object>> selectGroup(Map<String, Object> params, LambdaQueryWrapper<InformationssEntity> wrapper) {
        return baseMapper.selectGroup(params, wrapper);
    }
}