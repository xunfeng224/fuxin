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
import com.fuxin.system.domain.SysOrder;
import com.fuxin.system.service.ISysOrderService;
import com.fuxin.common.core.web.controller.BaseController;
import com.fuxin.common.core.web.domain.AjaxResult;
import com.fuxin.common.core.utils.poi.ExcelUtil;
import com.fuxin.common.core.web.page.TableDataInfo;

/**
 * 订单Controller
 *
 * @author xiongfeng
 * @date 2022-03-15
 */
@RestController
@RequestMapping("/order")
public class SysOrderController extends BaseController {
    @Autowired
    private ISysOrderService sysOrderService;

    /**
     * 查询订单列表
     */
    @RequiresPermissions("system:order:list")
    @GetMapping("/list")
    public TableDataInfo list(SysOrder sysOrder) {
        startPage();
        List<SysOrder> list = sysOrderService.selectSysOrderList(sysOrder);
        return getDataTable(list);
    }

    /**
     * 导出订单列表
     */
    @RequiresPermissions("system:order:export")
    @Log(title = "订单", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysOrder sysOrder) {
        List<SysOrder> list = sysOrderService.selectSysOrderList(sysOrder);
        ExcelUtil<SysOrder> util = new ExcelUtil<SysOrder>(SysOrder.class);
        util.exportExcel(response, list, "订单数据");
    }

    /**
     * 获取订单详细信息
     */
    @RequiresPermissions("system:order:query")
    @GetMapping(value = "/{orderId}")
    public AjaxResult getInfo(@PathVariable("orderId") Long orderId) {
        return AjaxResult.success(sysOrderService.selectSysOrderByOrderId(orderId));
    }

    /**
     * 新增订单
     */
    @RequiresPermissions("system:order:add")
    @Log(title = "订单", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysOrder sysOrder) {
        return toAjax(sysOrderService.insertSysOrder(sysOrder));
    }

    /**
     * 修改订单
     */
    @RequiresPermissions("system:order:edit")
    @Log(title = "订单", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysOrder sysOrder) {
        return toAjax(sysOrderService.updateSysOrder(sysOrder));
    }

    /**
     * 查看收货地址信息
     */
    @RequiresPermissions("system:order:queryAddress")
    @GetMapping(value = "/getAddressInfo/{addressId}")
    public AjaxResult getAddressInfo(@PathVariable("addressId") Long addressId) {
        return AjaxResult.success(sysOrderService.getAddressInfo(addressId));
    }


    /**
     * 查看订单详情
     */
    @RequiresPermissions("system:order:queryOrderDetail")
    @GetMapping(value = "/getOrderDetail/{orderId}")
    public AjaxResult getOrderDetail(@PathVariable("orderId") Long orderId) {
        return AjaxResult.success(sysOrderService.getOrderDetail(orderId));
    }

    /**
     * 删除订单
     */
    @RequiresPermissions("system:order:remove")
    @Log(title = "订单", businessType = BusinessType.DELETE)
    @DeleteMapping("/{orderIds}")
    public AjaxResult remove(@PathVariable Long[] orderIds) {
        return toAjax(sysOrderService.deleteSysOrderByOrderIds(orderIds));
    }
}
