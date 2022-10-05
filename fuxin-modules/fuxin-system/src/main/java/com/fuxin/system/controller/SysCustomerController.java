package com.fuxin.system.controller;

import com.fuxin.common.core.utils.poi.ExcelUtil;
import com.fuxin.common.core.web.controller.BaseController;
import com.fuxin.common.core.web.domain.AjaxResult;
import com.fuxin.common.core.web.page.TableDataInfo;
import com.fuxin.common.log.annotation.Log;
import com.fuxin.common.log.enums.BusinessType;
import com.fuxin.common.security.annotation.RequiresPermissions;
import com.fuxin.common.security.utils.SecurityUtils;
import com.fuxin.system.domain.SysCustomer;
import com.fuxin.system.service.ISysCustomerService;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 客户信息Controller
 * 
 * @author xiongfeng
 * @date 2022-03-14
 */
@RestController
@RequestMapping("/customer")
public class SysCustomerController extends BaseController
{
    @Autowired
    private ISysCustomerService sysCustomerService;

    /**
     * 查询客户信息列表
     */
    @RequiresPermissions("system:customer:list")
    @GetMapping("/list")
    public TableDataInfo list(SysCustomer sysCustomer)
    {
        startPage();
        List<SysCustomer> list = sysCustomerService.selectSysCustomerList(sysCustomer);
        return getDataTable(list);
    }

    /**
     * 导出客户信息列表
     */
    @RequiresPermissions("system:customer:export")
    @Log(title = "客户信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysCustomer sysCustomer)
    {
        List<SysCustomer> list = sysCustomerService.selectSysCustomerList(sysCustomer);
        ExcelUtil<SysCustomer> util = new ExcelUtil<SysCustomer>(SysCustomer.class);
        util.exportExcel(response, list, "客户信息数据");
    }

    /**
     * 获取客户信息详细信息
     */
    @RequiresPermissions("system:customer:query")
    @GetMapping(value = "/{cusId}")
    public AjaxResult getInfo(@PathVariable("cusId") Long cusId)
    {
        return AjaxResult.success(sysCustomerService.selectSysCustomerByCusId(cusId));
    }

    /**
     * 新增客户信息
     */
    @RequiresPermissions("system:customer:add")
    @Log(title = "客户信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysCustomer sysCustomer)
    {
        return toAjax(sysCustomerService.insertSysCustomer(sysCustomer));
    }

    /**
     * 修改客户信息
     */
    @RequiresPermissions("system:customer:edit")
    @Log(title = "客户信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysCustomer sysCustomer)
    {
        return toAjax(sysCustomerService.updateSysCustomer(sysCustomer));
    }
    /**
     * 查看客户订单
     */
    @RequiresPermissions("system:customer:queryOrder")
    @GetMapping(value = "/getCustomerOrder/{cusId}")
    public AjaxResult getCustomerOrder(@PathVariable("cusId") Long cusId)
    {
        return AjaxResult.success(sysCustomerService.getCustomerOrder(cusId));
    }

    /**
     * 删除客户信息
     */
    @RequiresPermissions("system:customer:remove")
    @Log(title = "客户信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{cusIds}")
    public AjaxResult remove(@PathVariable Long[] cusIds)
    {
        return toAjax(sysCustomerService.deleteSysCustomerByCusIds(cusIds));
    }

    /**
     * 状态修改
     */
    @RequiresPermissions("system:user:edit")
    @Log(title = "客户信息", businessType = BusinessType.UPDATE)
    @PutMapping("/changeStatus")
    public AjaxResult changeStatus(@RequestBody SysCustomer sysCustomer)
    {
        sysCustomer.setUpdateBy(SecurityUtils.getUsername());
        return toAjax(sysCustomerService.updateUserStatus(sysCustomer));
    }
}
