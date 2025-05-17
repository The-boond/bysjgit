package myproject.controller;

import cn.dev33.satoken.annotation.SaIgnore;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.AllArgsConstructor;
import myproject.common.page.PageResult;
import myproject.common.utils.Result;
import myproject.convert.ItemapplicationConvert;
import myproject.entity.ItemapplicationEntity;
import myproject.service.ItemapplicationService;
import myproject.query.ItemapplicationQuery;
import myproject.vo.ItemapplicationVO;
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
* 用品申领
*
*/
@RestController
@RequestMapping("itemapplication")
@Tag(name="用品申领")
@AllArgsConstructor
public class ItemapplicationController {
private final ItemapplicationService itemapplicationService;
    @PostMapping("page")
    @Operation(summary = "分页")
    @SysLog(title = "查看用品申领分页")
    public Result<PageResult<ItemapplicationVO>> page(@RequestBody @Valid ItemapplicationQuery query){
        PageResult<ItemapplicationVO> page = itemapplicationService.page(query);
        return Result.ok(page);
    }
    @PostMapping("list")
    @Operation(summary = "列表")
    @SaIgnore
    @SysLog(title = "查看用品申领列表")
    public Result<List<ItemapplicationVO>> list(@RequestBody @Valid ItemapplicationQuery query){
        List<ItemapplicationVO> list = itemapplicationService.queryList(query);
        return Result.ok(list);
    }
    @PostMapping("/info")
    @Operation(summary = "信息")
    @SysLog(title = "查看用品申领信息")
    public Result<ItemapplicationVO> get(@RequestSingleParam(value = "id") Long id){
        ItemapplicationEntity entity = itemapplicationService.getById(id);
        return Result.ok(ItemapplicationConvert.INSTANCE.convert(entity));
    }

    @PostMapping("save")
    @Operation(summary = "保存")
    @SysLog(title = "保存用品申领信息")
    public Result<String> save(@RequestBody ItemapplicationVO vo){
        itemapplicationService.save(vo);
        return Result.ok();
    }

    @PostMapping("update")
    @Operation(summary = "修改")
    @SysLog(title = "修改用品申领信息")
    public Result<String> update(@RequestBody @Valid ItemapplicationVO vo){
        itemapplicationService.update(vo);
        return Result.ok();
    }

    @PostMapping("delete")
    @Operation(summary = "删除")
    @SysLog(title = "删除用品申领信息")
    public Result<String> delete(@RequestBody List<Long> idList){
            itemapplicationService.delete(idList);
            return Result.ok();
    }

    @PostMapping("export")
    @Operation(summary = "导出")
    @SysLog(title = "导出用品申领列表")
    public void export(@RequestBody @Valid ItemapplicationQuery query) {
        itemapplicationService.export(query);
    }
    @PostMapping("import")
    @Operation(summary = "导入")
    public Result<String> importitemapplication(@RequestSingleParam(value = "file") String file) {
        if (file.isEmpty()) {
            return Result.error("请选择需要上传的文件");
        }
        file = file.replace("api/", "");
        File importFile = new File(file);
        itemapplicationService.importitemapplication(importFile);
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
    LambdaQueryWrapper<ItemapplicationEntity> wrapper = Wrappers.lambdaQuery();
    List<Map<String, Object>> result = itemapplicationService.selectValue(params, wrapper);
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
    LambdaQueryWrapper<ItemapplicationEntity> wrapper = Wrappers.lambdaQuery();
        List<Map<String, Object>> result = itemapplicationService.selectTimeStatValue(params, wrapper);
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
    LambdaQueryWrapper<ItemapplicationEntity> wrapper = Wrappers.lambdaQuery();
        //		wrapper.orderByDesc(ItemapplicationEntity::getCount);
        List<Map<String, Object>> result = itemapplicationService.selectGroup(params, wrapper);
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