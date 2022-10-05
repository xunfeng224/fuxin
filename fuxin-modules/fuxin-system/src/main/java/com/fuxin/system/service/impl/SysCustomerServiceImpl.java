package com.fuxin.system.service.impl;

import java.util.List;
import com.fuxin.common.core.utils.DateUtils;
import com.fuxin.system.domain.SysOrder;
import com.fuxin.system.mapper.SysOrderMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.fuxin.system.mapper.SysCustomerMapper;
import com.fuxin.system.domain.SysCustomer;
import com.fuxin.system.service.ISysCustomerService;

/**
 * 客户信息Service业务层处理
 * 
 * @author xiongfeng
 * @date 2022-03-14
 */
@Service
public class SysCustomerServiceImpl implements ISysCustomerService 
{
    @Autowired
    private SysCustomerMapper sysCustomerMapper;

    @Autowired
    private SysOrderMapper sysOrderMapper;

    /**
     * 查询客户信息
     * 
     * @param cusId 客户信息主键
     * @return 客户信息
     */
    @Override
    public SysCustomer selectSysCustomerByCusId(Long cusId)
    {
        return sysCustomerMapper.selectSysCustomerByCusId(cusId);
    }

    /**
     * 查询客户信息列表
     * 
     * @param sysCustomer 客户信息
     * @return 客户信息
     */
    @Override
    public List<SysCustomer> selectSysCustomerList(SysCustomer sysCustomer)
    {
        return sysCustomerMapper.selectSysCustomerList(sysCustomer);
    }

    /**
     * 新增客户信息
     * 
     * @param sysCustomer 客户信息
     * @return 结果
     */
    @Override
    public int insertSysCustomer(SysCustomer sysCustomer)
    {
        sysCustomer.setCreateTime(DateUtils.getNowDate());
        return sysCustomerMapper.insertSysCustomer(sysCustomer);
    }

    /**
     * 修改客户信息
     * 
     * @param sysCustomer 客户信息
     * @return 结果
     */
    @Override
    public int updateSysCustomer(SysCustomer sysCustomer)
    {
        sysCustomer.setUpdateTime(DateUtils.getNowDate());
        return sysCustomerMapper.updateSysCustomer(sysCustomer);
    }

    /**
     * 批量删除客户信息
     * 
     * @param cusIds 需要删除的客户信息主键
     * @return 结果
     */
    @Override
    public int deleteSysCustomerByCusIds(Long[] cusIds)
    {
        return sysCustomerMapper.deleteSysCustomerByCusIds(cusIds);
    }

    /**
     * 删除客户信息信息
     * 
     * @param cusId 客户信息主键
     * @return 结果
     */
    @Override
    public int deleteSysCustomerByCusId(Long cusId)
    {
        return sysCustomerMapper.deleteSysCustomerByCusId(cusId);
    }


    /**
     * 修改用户状态
     *
     * @param sysCustomer 用户信息
     * @return 结果
     */
    @Override
    public int updateUserStatus(SysCustomer sysCustomer) {
        return sysCustomerMapper.updateSysCustomer(sysCustomer);
    }

    /**
     * 获取客户订单
     *
     * @param cusId 用户信息
     * @return 结果
     */
    @Override
    public List<SysOrder> getCustomerOrder(Long cusId) {
        SysOrder sysOrder = new SysOrder();
        sysOrder.setCusId(cusId);
        List<SysOrder> sysOrders = sysOrderMapper.selectSysOrderList(sysOrder);
        return sysOrders;
    }

}
