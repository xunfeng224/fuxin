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
import com.fuxin.system.domain.SysDeliveryAddress;
import com.fuxin.system.service.ISysDeliveryAddressService;
import com.fuxin.common.core.web.controller.BaseController;
import com.fuxin.common.core.web.domain.AjaxResult;
import com.fuxin.common.core.utils.poi.ExcelUtil;
import com.fuxin.common.core.web.page.TableDataInfo;

/**
 * 收货地址Controller
 * 
 * @author xfeng
 * @date 2022-03-18
 */
@RestController
@RequestMapping("/address")
public class SysDeliveryAddressController extends BaseController
{
    @Autowired
    private ISysDeliveryAddressService sysDeliveryAddressService;

    /**
     * 查询收货地址列表
     */
    @RequiresPermissions("system:address:list")
    @GetMapping("/list")
    public TableDataInfo list(SysDeliveryAddress sysDeliveryAddress)
    {
        startPage();
        List<SysDeliveryAddress> list = sysDeliveryAddressService.selectSysDeliveryAddressList(sysDeliveryAddress);
        return getDataTable(list);
    }

    /**
     * 导出收货地址列表
     */
    @RequiresPermissions("system:address:export")
    @Log(title = "收货地址", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysDeliveryAddress sysDeliveryAddress)
    {
        List<SysDeliveryAddress> list = sysDeliveryAddressService.selectSysDeliveryAddressList(sysDeliveryAddress);
        ExcelUtil<SysDeliveryAddress> util = new ExcelUtil<SysDeliveryAddress>(SysDeliveryAddress.class);
        util.exportExcel(response, list, "收货地址数据");
    }

    /**
     * 获取收货地址详细信息
     */
    @RequiresPermissions("system:address:query")
    @GetMapping(value = "/{addressId}")
    public AjaxResult getInfo(@PathVariable("addressId") Long addressId)
    {
        return AjaxResult.success(sysDeliveryAddressService.selectSysDeliveryAddressByAddressId(addressId));
    }

    /**
     * 新增收货地址
     */
    @RequiresPermissions("system:address:add")
    @Log(title = "收货地址", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysDeliveryAddress sysDeliveryAddress)
    {
        return toAjax(sysDeliveryAddressService.insertSysDeliveryAddress(sysDeliveryAddress));
    }

    /**
     * 修改收货地址
     */
    @RequiresPermissions("system:address:edit")
    @Log(title = "收货地址", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysDeliveryAddress sysDeliveryAddress)
    {
        return toAjax(sysDeliveryAddressService.updateSysDeliveryAddress(sysDeliveryAddress));
    }

    /**
     * 删除收货地址
     */
    @RequiresPermissions("system:address:remove")
    @Log(title = "收货地址", businessType = BusinessType.DELETE)
	@DeleteMapping("/{addressIds}")
    public AjaxResult remove(@PathVariable Long[] addressIds)
    {
        return toAjax(sysDeliveryAddressService.deleteSysDeliveryAddressByAddressIds(addressIds));
    }
}
