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
import com.fuxin.system.domain.SysOrderDetail;
import com.fuxin.system.service.ISysOrderDetailService;
import com.fuxin.common.core.web.controller.BaseController;
import com.fuxin.common.core.web.domain.AjaxResult;
import com.fuxin.common.core.utils.poi.ExcelUtil;
import com.fuxin.common.core.web.page.TableDataInfo;

/**
 * 订单商品详情Controller
 * 
 * @author xfeng
 * @date 2022-03-18
 */
@RestController
@RequestMapping("/orderdetail")
public class SysOrderDetailController extends BaseController
{
    @Autowired
    private ISysOrderDetailService sysOrderDetailService;

    /**
     * 查询订单商品详情列表
     */
    @RequiresPermissions("system:orderdetail:list")
    @GetMapping("/list")
    public TableDataInfo list(SysOrderDetail sysOrderDetail)
    {
        startPage();
        List<SysOrderDetail> list = sysOrderDetailService.selectSysOrderDetailList(sysOrderDetail);
        return getDataTable(list);
    }

    /**
     * 导出订单商品详情列表
     */
    @RequiresPermissions("system:orderdetail:export")
    @Log(title = "订单商品详情", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysOrderDetail sysOrderDetail)
    {
        List<SysOrderDetail> list = sysOrderDetailService.selectSysOrderDetailList(sysOrderDetail);
        ExcelUtil<SysOrderDetail> util = new ExcelUtil<SysOrderDetail>(SysOrderDetail.class);
        util.exportExcel(response, list, "订单商品详情数据");
    }

    /**
     * 获取订单商品详情详细信息
     */
    @RequiresPermissions("system:orderdetail:query")
    @GetMapping(value = "/{orderDetailId}")
    public AjaxResult getInfo(@PathVariable("orderDetailId") Long orderDetailId)
    {
        return AjaxResult.success(sysOrderDetailService.selectSysOrderDetailByOrderDetailId(orderDetailId));
    }

    /**
     * 新增订单商品详情
     */
    @RequiresPermissions("system:orderdetail:add")
    @Log(title = "订单商品详情", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysOrderDetail sysOrderDetail)
    {
        return toAjax(sysOrderDetailService.insertSysOrderDetail(sysOrderDetail));
    }

    /**
     * 修改订单商品详情
     */
    @RequiresPermissions("system:orderdetail:edit")
    @Log(title = "订单商品详情", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysOrderDetail sysOrderDetail)
    {
        return toAjax(sysOrderDetailService.updateSysOrderDetail(sysOrderDetail));
    }

    /**
     * 删除订单商品详情
     */
    @RequiresPermissions("system:orderdetail:remove")
    @Log(title = "订单商品详情", businessType = BusinessType.DELETE)
	@DeleteMapping("/{orderDetailIds}")
    public AjaxResult remove(@PathVariable Long[] orderDetailIds)
    {
        return toAjax(sysOrderDetailService.deleteSysOrderDetailByOrderDetailIds(orderDetailIds));
    }
}
