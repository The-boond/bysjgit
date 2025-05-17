package myproject.service.impl;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import lombok.AllArgsConstructor;
import lombok.SneakyThrows;
import myproject.common.page.PageResult;
import myproject.common.impl.BaseServiceImpl;
import myproject.convert.WorkplanConvert;
import myproject.entity.WorkplanEntity;
import myproject.query.WorkplanQuery;
import myproject.vo.WorkplanVO;
import myproject.dao.WorkplanDao;
import myproject.service.WorkplanService;
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
* 工作计划
*
*/
@Service
@AllArgsConstructor
public class WorkplanServiceImpl extends BaseServiceImpl<WorkplanDao, WorkplanEntity> implements WorkplanService {

    @Override
    public PageResult<WorkplanVO> page(WorkplanQuery query) {
        IPage<WorkplanEntity> page = baseMapper.selectPage(getPage(query), getWrapper(query));
        return new PageResult<>(WorkplanConvert.INSTANCE.convertList(page.getRecords()), page.getTotal());
    }

    @Override
    public List<WorkplanVO> queryList(WorkplanQuery query) {
        return WorkplanConvert.INSTANCE.convertList(baseMapper.selectList(getWrapper(query)));
    }

    private LambdaQueryWrapper<WorkplanEntity> getWrapper(WorkplanQuery query){
        LambdaQueryWrapper<WorkplanEntity> wrapper = Wrappers.lambdaQuery();
                    wrapper.eq(null!=query.getAdduserid(), WorkplanEntity::getAdduserid, query.getAdduserid());
                    wrapper.eq(StringUtils.isNotEmpty(query.getAddusername()), WorkplanEntity::getAddusername, query.getAddusername());
                    wrapper.eq(null!=query.getId(), WorkplanEntity::getId, query.getId());
                    wrapper.eq(StringUtils.isNotEmpty(query.getShenhe()), WorkplanEntity::getShenhe, query.getShenhe());
                    wrapper.eq(StringUtils.isNotEmpty(query.getName()), WorkplanEntity::getName, query.getName());
                    wrapper.eq(StringUtils.isNotEmpty(query.getWorkcontent()), WorkplanEntity::getWorkcontent, query.getWorkcontent());
                    wrapper.eq(StringUtils.isNotEmpty(query.getTasktype()), WorkplanEntity::getTasktype, query.getTasktype());
                    wrapper.eq(StringUtils.isNotEmpty(query.getNameofpersonincharge()), WorkplanEntity::getNameofpersonincharge, query.getNameofpersonincharge());
                    wrapper.eq(StringUtils.isNotEmpty(query.getPriority()), WorkplanEntity::getPriority, query.getPriority());
                    wrapper.between(ArrayUtils.isNotEmpty(query.getStarttime()), WorkplanEntity::getStarttime, ArrayUtils.isNotEmpty(query.getStarttime()) ? query.getStarttime()[0] : null, ArrayUtils.isNotEmpty(query.getStarttime()) ? query.getStarttime()[1] : null);
                    wrapper.eq(StringUtils.isNotEmpty(query.getPlanningduration()), WorkplanEntity::getPlanningduration, query.getPlanningduration());
                    wrapper.eq(StringUtils.isNotEmpty(query.getCompletionprogress()), WorkplanEntity::getCompletionprogress, query.getCompletionprogress());
                    wrapper.eq(StringUtils.isNotEmpty(query.getJobcover()), WorkplanEntity::getJobcover, query.getJobcover());
                    wrapper.between(ArrayUtils.isNotEmpty(query.getAddtime()), WorkplanEntity::getAddtime, ArrayUtils.isNotEmpty(query.getAddtime()) ? query.getAddtime()[0] : null, ArrayUtils.isNotEmpty(query.getAddtime()) ? query.getAddtime()[1] : null);
            return wrapper;
    }

    @Override
    public void save(WorkplanVO vo) {
        WorkplanEntity entity = WorkplanConvert.INSTANCE.convert(vo);
        baseMapper.insert(entity);
    }

    @Override
    public void update(WorkplanVO vo) {
        WorkplanEntity entity = WorkplanConvert.INSTANCE.convert(vo);
        updateById(entity);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void delete(List<Long> idList) {
        removeByIds(idList);
    }

    @Override
    @SneakyThrows
    public void export(WorkplanQuery query) {
        List<WorkplanVO> list = WorkplanConvert.INSTANCE.convertList(baseMapper.selectList(getWrapper(query)));
        // 写到浏览器打开
        ExcelUtils.excelExport(WorkplanVO.class, "工作计划" + DateUtils.format(new Date()), null, list);
    }

    @Override
    @SneakyThrows
    public void importworkplan(File file) {
        ExcelUtils.readAnalysis(file, WorkplanVO.class, new ExcelFinishCallBack<WorkplanVO>() {
            @Override
            public void doAfterAllAnalysed(List<WorkplanVO> result) {
                saveWorkplans(result);
            }

            @Override
            public void doSaveBatch(List<WorkplanVO> result) {
                saveWorkplans(result);
            }

            private void saveWorkplans(List<WorkplanVO> result) {
                List<WorkplanEntity> WorkplanEntities = WorkplanConvert.INSTANCE.convertEntityList(result);
                saveBatch(WorkplanEntities);
            }
        });
    }

    @Override
    public List<Map<String, Object>> selectValue(Map<String, Object> params, LambdaQueryWrapper<WorkplanEntity> wrapper) {
        return baseMapper.selectValue(params, wrapper);
    }

    @Override
    public List<Map<String, Object>> selectTimeStatValue(Map<String, Object> params, LambdaQueryWrapper<WorkplanEntity> wrapper) {
        return baseMapper.selectTimeStatValue(params, wrapper);
    }

    @Override
    public List<Map<String, Object>> selectGroup(Map<String, Object> params, LambdaQueryWrapper<WorkplanEntity> wrapper) {
        return baseMapper.selectGroup(params, wrapper);
    }
}