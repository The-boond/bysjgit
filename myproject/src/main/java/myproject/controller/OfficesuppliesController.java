package myproject.controller;

import cn.dev33.satoken.annotation.SaIgnore;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.AllArgsConstructor;
import myproject.common.page.PageResult;
import myproject.common.utils.Result;
import myproject.convert.OfficesuppliesConvert;
import myproject.entity.OfficesuppliesEntity;
import myproject.service.OfficesuppliesService;
import myproject.query.OfficesuppliesQuery;
import myproject.vo.OfficesuppliesVO;
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
* 办公用品
*
*/
@RestController
@RequestMapping("officesupplies")
@Tag(name="办公用品")
@AllArgsConstructor
public class OfficesuppliesController {
private final OfficesuppliesService officesuppliesService;
    @PostMapping("page")
    @Operation(summary = "分页")
    @SysLog(title = "查看办公用品分页")
    public Result<PageResult<OfficesuppliesVO>> page(@RequestBody @Valid OfficesuppliesQuery query){
        PageResult<OfficesuppliesVO> page = officesuppliesService.page(query);
        return Result.ok(page);
    }
    @PostMapping("list")
    @Operation(summary = "列表")
    @SaIgnore
    @SysLog(title = "查看办公用品列表")
    public Result<List<OfficesuppliesVO>> list(@RequestBody @Valid OfficesuppliesQuery query){
        List<OfficesuppliesVO> list = officesuppliesService.queryList(query);
        return Result.ok(list);
    }
    @PostMapping("/info")
    @Operation(summary = "信息")
    @SysLog(title = "查看办公用品信息")
    public Result<OfficesuppliesVO> get(@RequestSingleParam(value = "id") Long id){
        OfficesuppliesEntity entity = officesuppliesService.getById(id);
        return Result.ok(OfficesuppliesConvert.INSTANCE.convert(entity));
    }

    @PostMapping("save")
    @Operation(summary = "保存")
    @SysLog(title = "保存办公用品信息")
    public Result<String> save(@RequestBody OfficesuppliesVO vo){
        officesuppliesService.save(vo);
        return Result.ok();
    }

    @PostMapping("update")
    @Operation(summary = "修改")
    @SysLog(title = "修改办公用品信息")
    public Result<String> update(@RequestBody @Valid OfficesuppliesVO vo){
        officesuppliesService.update(vo);
        return Result.ok();
    }

    @PostMapping("delete")
    @Operation(summary = "删除")
    @SysLog(title = "删除办公用品信息")
    public Result<String> delete(@RequestBody List<Long> idList){
            officesuppliesService.delete(idList);
            return Result.ok();
    }

    @PostMapping("export")
    @Operation(summary = "导出")
    @SysLog(title = "导出办公用品列表")
    public void export(@RequestBody @Valid OfficesuppliesQuery query) {
        officesuppliesService.export(query);
    }
    @PostMapping("import")
    @Operation(summary = "导入")
    public Result<String> importofficesupplies(@RequestSingleParam(value = "file") String file) {
        if (file.isEmpty()) {
            return Result.error("请选择需要上传的文件");
        }
        file = file.replace("api/", "");
        File importFile = new File(file);
        officesuppliesService.importofficesupplies(importFile);
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
    LambdaQueryWrapper<OfficesuppliesEntity> wrapper = Wrappers.lambdaQuery();
    List<Map<String, Object>> result = officesuppliesService.selectValue(params, wrapper);
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
    LambdaQueryWrapper<OfficesuppliesEntity> wrapper = Wrappers.lambdaQuery();
        List<Map<String, Object>> result = officesuppliesService.selectTimeStatValue(params, wrapper);
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
    LambdaQueryWrapper<OfficesuppliesEntity> wrapper = Wrappers.lambdaQuery();
        //		wrapper.orderByDesc(OfficesuppliesEntity::getCount);
        List<Map<String, Object>> result = officesuppliesService.selectGroup(params, wrapper);
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