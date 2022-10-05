package com.fuxin.system.controller;

import java.util.List;
import java.io.IOException;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.fuxin.common.log.annotation.Log;
import com.fuxin.common.log.enums.BusinessType;
import com.fuxin.common.security.annotation.RequiresPermissions;
import com.fuxin.system.domain.SysOrderLogistics;
import com.fuxin.system.service.ISysOrderLogisticsService;
import com.fuxin.common.core.web.controller.BaseController;
import com.fuxin.common.core.web.domain.AjaxResult;
import com.fuxin.common.core.utils.poi.ExcelUtil;
import com.fuxin.common.core.web.page.TableDataInfo;

/**
 * 订单物流Controller
 * 
 * @author xfeng
 * @date 2022-03-18
 */
@RestController
@RequestMapping("/logistics")
public class SysOrderLogisticsController extends BaseController
{
    @Autowired
    private ISysOrderLogisticsService sysOrderLogisticsService;

    /**
     * 查询订单物流列表
     */
    @RequiresPermissions("system:logistics:list")
    @GetMapping("/list")
    public TableDataInfo list(SysOrderLogistics sysOrderLogistics)
    {
        startPage();
        List<SysOrderLogistics> list = sysOrderLogisticsService.selectSysOrderLogisticsList(sysOrderLogistics);
        return getDataTable(list);
    }

    /**
     * 导出订单物流列表
     */
    @RequiresPermissions("system:logistics:export")
    @Log(title = "订单物流", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysOrderLogistics sysOrderLogistics)
    {
        List<SysOrderLogistics> list = sysOrderLogisticsService.selectSysOrderLogisticsList(sysOrderLogistics);
        ExcelUtil<SysOrderLogistics> util = new ExcelUtil<SysOrderLogistics>(SysOrderLogistics.class);
        util.exportExcel(response, list, "订单物流数据");
    }

    /**
     * 获取订单物流详细信息
     */
    @RequiresPermissions("system:logistics:query")
    @GetMapping(value = "/{orderlogisticsId}")
    public AjaxResult getInfo(@PathVariable("orderlogisticsId") Long orderlogisticsId)
    {
        return AjaxResult.success(sysOrderLogisticsService.selectSysOrderLogisticsByOrderlogisticsId(orderlogisticsId));
    }

    /**
     * 新增订单物流
     */
    @RequiresPermissions("system:logistics:add")
    @Log(title = "订单物流", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysOrderLogistics sysOrderLogistics)
    {
        return toAjax(sysOrderLogisticsService.insertSysOrderLogistics(sysOrderLogistics));
    }

    /**
     * 修改订单物流
     */
    @RequiresPermissions("system:logistics:edit")
    @Log(title = "订单物流", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysOrderLogistics sysOrderLogistics)
    {
        return toAjax(sysOrderLogisticsService.updateSysOrderLogistics(sysOrderLogistics));
    }

    /**
     * 删除订单物流
     */
    @RequiresPermissions("system:logistics:remove")
    @Log(title = "订单物流", businessType = BusinessType.DELETE)
	@DeleteMapping("/{orderlogisticsIds}")
    public AjaxResult remove(@PathVariable Long[] orderlogisticsIds)
    {
        return toAjax(sysOrderLogisticsService.deleteSysOrderLogisticsByOrderlogisticsIds(orderlogisticsIds));
    }
}
