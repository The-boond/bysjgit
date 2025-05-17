package myproject.controller;

import cn.dev33.satoken.annotation.SaIgnore;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.AllArgsConstructor;
import myproject.common.page.PageResult;
import myproject.common.utils.Result;
import myproject.convert.WorkplanConvert;
import myproject.entity.WorkplanEntity;
import myproject.service.WorkplanService;
import myproject.query.WorkplanQuery;
import myproject.vo.WorkplanVO;
import org.springframework.web.bind.annotation.*;
import myproject.common.request.RequestSingleParam;
import myproject.common.sysLog.SysLog;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.List;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.io.File;
/**
* 工作计划
*
*/
@RestController
@RequestMapping("workplan")
@Tag(name="工作计划")
@AllArgsConstructor
public class WorkplanController {
private final WorkplanService workplanService;
    @PostMapping("page")
    @Operation(summary = "分页")
    @SysLog(title = "查看工作计划分页")
    public Result<PageResult<WorkplanVO>> page(@RequestBody @Valid WorkplanQuery query){
        PageResult<WorkplanVO> page = workplanService.page(query);
        return Result.ok(page);
    }
    @PostMapping("list")
    @Operation(summary = "列表")
    @SaIgnore
    @SysLog(title = "查看工作计划列表")
    public Result<List<WorkplanVO>> list(@RequestBody @Valid WorkplanQuery query){
        List<WorkplanVO> list = workplanService.queryList(query);
        return Result.ok(list);
    }
    @PostMapping("/info")
    @Operation(summary = "信息")
    @SysLog(title = "查看工作计划信息")
    public Result<WorkplanVO> get(@RequestSingleParam(value = "id") Long id){
        WorkplanEntity entity = workplanService.getById(id);
        return Result.ok(WorkplanConvert.INSTANCE.convert(entity));
    }

    @PostMapping("save")
    @Operation(summary = "保存")
    @SysLog(title = "保存工作计划信息")
    public Result<String> save(@RequestBody WorkplanVO vo){
        workplanService.save(vo);
        return Result.ok();
    }

    @PostMapping("update")
    @Operation(summary = "修改")
    @SysLog(title = "修改工作计划信息")
    public Result<String> update(@RequestBody @Valid WorkplanVO vo){
        workplanService.update(vo);
        return Result.ok();
    }

    @PostMapping("delete")
    @Operation(summary = "删除")
    @SysLog(title = "删除工作计划信息")
    public Result<String> delete(@RequestBody List<Long> idList){
            workplanService.delete(idList);
            return Result.ok();
    }

    @PostMapping("export")
    @Operation(summary = "导出")
    @SysLog(title = "导出工作计划列表")
    public void export(@RequestBody @Valid WorkplanQuery query) {
        workplanService.export(query);
    }
    @PostMapping("import")
    @Operation(summary = "导入")
    public Result<String> importworkplan(@RequestSingleParam(value = "file") String file) {
        if (file.isEmpty()) {
            return Result.error("请选择需要上传的文件");
        }
        file = file.replace("api/", "");
        File importFile = new File(file);
        workplanService.importworkplan(importFile);
        return Result.ok();
    }
    /**
    * （按值统计）
    */
    @SaIgnore
    @RequestMapping("/value/{xColumnName}/{yColumnName}")
    public Result value(@PathVariable("yColumnName") String yColumnName, @PathVariable("xColumnName") String xColumnName, HttpServletRequest request) {
    Map<String, Object> params = new HashMap<>();
    params.put("xColumn", xColumnName);
    params.put("yColumn", yColumnName);
    LambdaQueryWrapper<WorkplanEntity> wrapper = Wrappers.lambdaQuery();
    List<Map<String, Object>> result = workplanService.selectValue(params, wrapper);
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    for (Map<String, Object> m : result) {
        for (String k : m.keySet()) {
            if (m.get(k) instanceof Date) {
                m.put(k, sdf.format((Date) m.get(k)));
            }
        }
    }
    return Result.ok(result);
    }

    /**
    * （按值统计）时间统计类型
    */
    @SaIgnore
    @RequestMapping("/value/{xColumnName}/{yColumnName}/{timeStatType}")
    public Result valueDay(@PathVariable("yColumnName") String yColumnName, @PathVariable("xColumnName") String xColumnName, @PathVariable("timeStatType") String timeStatType, HttpServletRequest request) {
    Map<String, Object> params = new HashMap<>();
    params.put("xColumn", xColumnName);
    params.put("yColumn", yColumnName);
    params.put("timeStatType", timeStatType);
    LambdaQueryWrapper<WorkplanEntity> wrapper = Wrappers.lambdaQuery();
        List<Map<String, Object>> result = workplanService.selectTimeStatValue(params, wrapper);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        for (Map<String, Object> m : result) {
            for (String k : m.keySet()) {
                if (m.get(k) instanceof Date) {
                    m.put(k, sdf.format((Date) m.get(k)));
                }
            }
        }
    return Result.ok(result);
    }

    /**
    * 分组统计
    */
    @SaIgnore
    @RequestMapping("/group/{columnName}")
    public Result group(@PathVariable("columnName") String columnName, HttpServletRequest request) {
    Map<String, Object> params = new HashMap<>();
    params.put("column", columnName);
    LambdaQueryWrapper<WorkplanEntity> wrapper = Wrappers.lambdaQuery();
        //		wrapper.orderByDesc(WorkplanEntity::getCount);
        List<Map<String, Object>> result = workplanService.selectGroup(params, wrapper);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        for (Map<String, Object> m : result) {
            for (String k : m.keySet()) {
                if (m.get(k) instanceof Date) {
                    m.put(k, sdf.format((Date) m.get(k)));
                }
            }
        }
    return Result.ok(result);
    }
}