package com.fuxin.system.service;

import java.util.List;

import com.fuxin.system.api.domain.SysUser;
import com.fuxin.system.domain.SysCustomer;
import com.fuxin.system.domain.SysOrder;

/**
 * 客户信息Service接口
 * 
 * @author xiongfeng
 * @date 2022-03-14
 */
public interface ISysCustomerService 
{
    /**
     * 查询客户信息
     * 
     * @param cusId 客户信息主键
     * @return 客户信息
     */
    public SysCustomer selectSysCustomerByCusId(Long cusId);

    /**
     * 查询客户信息列表
     * 
     * @param sysCustomer 客户信息
     * @return 客户信息集合
     */
    public List<SysCustomer> selectSysCustomerList(SysCustomer sysCustomer);

    /**
     * 新增客户信息
     * 
     * @param sysCustomer 客户信息
     * @return 结果
     */
    public int insertSysCustomer(SysCustomer sysCustomer);

    /**
     * 修改客户信息
     * 
     * @param sysCustomer 客户信息
     * @return 结果
     */
    public int updateSysCustomer(SysCustomer sysCustomer);

    /**
     * 批量删除客户信息
     * 
     * @param cusIds 需要删除的客户信息主键集合
     * @return 结果
     */
    public int deleteSysCustomerByCusIds(Long[] cusIds);

    /**
     * 删除客户信息信息
     * 
     * @param cusId 客户信息主键
     * @return 结果
     */
    public int deleteSysCustomerByCusId(Long cusId);

    /**
     * 修改客户状态
     *
     * @param sysCustomer 用户信息
     * @return 结果
     */
    public int updateUserStatus(SysCustomer sysCustomer);

    public  List<SysOrder> getCustomerOrder(Long cusId);
}
