package myproject.service.impl;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import lombok.AllArgsConstructor;
import lombok.SneakyThrows;
import myproject.common.page.PageResult;
import myproject.common.impl.BaseServiceImpl;
import myproject.convert.QiandaoqiantuiConvert;
import myproject.entity.QiandaoqiantuiEntity;
import myproject.query.QiandaoqiantuiQuery;
import myproject.vo.QiandaoqiantuiVO;
import myproject.dao.QiandaoqiantuiDao;
import myproject.service.QiandaoqiantuiService;
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
* 签到签退
*
*/
@Service
@AllArgsConstructor
public class QiandaoqiantuiServiceImpl extends BaseServiceImpl<QiandaoqiantuiDao, QiandaoqiantuiEntity> implements QiandaoqiantuiService {

    @Override
    public PageResult<QiandaoqiantuiVO> page(QiandaoqiantuiQuery query) {
        IPage<QiandaoqiantuiEntity> page = baseMapper.selectPage(getPage(query), getWrapper(query));
        return new PageResult<>(QiandaoqiantuiConvert.INSTANCE.convertList(page.getRecords()), page.getTotal());
    }

    @Override
    public List<QiandaoqiantuiVO> queryList(QiandaoqiantuiQuery query) {
        return QiandaoqiantuiConvert.INSTANCE.convertList(baseMapper.selectList(getWrapper(query)));
    }

    private LambdaQueryWrapper<QiandaoqiantuiEntity> getWrapper(QiandaoqiantuiQuery query){
        LambdaQueryWrapper<QiandaoqiantuiEntity> wrapper = Wrappers.lambdaQuery();
                    wrapper.eq(null!=query.getId(), QiandaoqiantuiEntity::getId, query.getId());
                    wrapper.eq(null!=query.getUserid(), QiandaoqiantuiEntity::getUserid, query.getUserid());
                    wrapper.eq(StringUtils.isNotEmpty(query.getUsername()), QiandaoqiantuiEntity::getUsername, query.getUsername());
                    wrapper.eq(StringUtils.isNotEmpty(query.getStatus()), QiandaoqiantuiEntity::getStatus, query.getStatus());
                    wrapper.between(ArrayUtils.isNotEmpty(query.getQiandaotime()), QiandaoqiantuiEntity::getQiandaotime, ArrayUtils.isNotEmpty(query.getQiandaotime()) ? query.getQiandaotime()[0] : null, ArrayUtils.isNotEmpty(query.getQiandaotime()) ? query.getQiandaotime()[1] : null);
                    wrapper.between(ArrayUtils.isNotEmpty(query.getQiantuitime()), QiandaoqiantuiEntity::getQiantuitime, ArrayUtils.isNotEmpty(query.getQiantuitime()) ? query.getQiantuitime()[0] : null, ArrayUtils.isNotEmpty(query.getQiantuitime()) ? query.getQiantuitime()[1] : null);
                    wrapper.between(ArrayUtils.isNotEmpty(query.getAddtime()), QiandaoqiantuiEntity::getAddtime, ArrayUtils.isNotEmpty(query.getAddtime()) ? query.getAddtime()[0] : null, ArrayUtils.isNotEmpty(query.getAddtime()) ? query.getAddtime()[1] : null);
            return wrapper;
    }

    @Override
    public void save(QiandaoqiantuiVO vo) {
        QiandaoqiantuiEntity entity = QiandaoqiantuiConvert.INSTANCE.convert(vo);
        baseMapper.insert(entity);
    }

    @Override
    public void update(QiandaoqiantuiVO vo) {
        QiandaoqiantuiEntity entity = QiandaoqiantuiConvert.INSTANCE.convert(vo);
        updateById(entity);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void delete(List<Long> idList) {
        removeByIds(idList);
    }

    @Override
    @SneakyThrows
    public void export(QiandaoqiantuiQuery query) {
        List<QiandaoqiantuiVO> list = QiandaoqiantuiConvert.INSTANCE.convertList(baseMapper.selectList(getWrapper(query)));
        // 写到浏览器打开
        ExcelUtils.excelExport(QiandaoqiantuiVO.class, "签到签退" + DateUtils.format(new Date()), null, list);
    }

    @Override
    @SneakyThrows
    public void importqiandaoqiantui(File file) {
        ExcelUtils.readAnalysis(file, QiandaoqiantuiVO.class, new ExcelFinishCallBack<QiandaoqiantuiVO>() {
            @Override
            public void doAfterAllAnalysed(List<QiandaoqiantuiVO> result) {
                saveQiandaoqiantuis(result);
            }

            @Override
            public void doSaveBatch(List<QiandaoqiantuiVO> result) {
                saveQiandaoqiantuis(result);
            }

            private void saveQiandaoqiantuis(List<QiandaoqiantuiVO> result) {
                List<QiandaoqiantuiEntity> QiandaoqiantuiEntities = QiandaoqiantuiConvert.INSTANCE.convertEntityList(result);
                saveBatch(QiandaoqiantuiEntities);
            }
        });
    }

    @Override
    public List<Map<String, Object>> selectValue(Map<String, Object> params, LambdaQueryWrapper<QiandaoqiantuiEntity> wrapper) {
        return baseMapper.selectValue(params, wrapper);
    }

    @Override
    public List<Map<String, Object>> selectTimeStatValue(Map<String, Object> params, LambdaQueryWrapper<QiandaoqiantuiEntity> wrapper) {
        return baseMapper.selectTimeStatValue(params, wrapper);
    }

    @Override
    public List<Map<String, Object>> selectGroup(Map<String, Object> params, LambdaQueryWrapper<QiandaoqiantuiEntity> wrapper) {
        return baseMapper.selectGroup(params, wrapper);
    }
}