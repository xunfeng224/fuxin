package com.fuxin.system.service.impl;

import java.util.List;
import com.fuxin.common.core.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.fuxin.system.mapper.SysDeliveryAddressMapper;
import com.fuxin.system.domain.SysDeliveryAddress;
import com.fuxin.system.service.ISysDeliveryAddressService;

/**
 * 收货地址Service业务层处理
 * 
 * @author xfeng
 * @date 2022-03-18
 */
@Service
public class SysDeliveryAddressServiceImpl implements ISysDeliveryAddressService 
{
    @Autowired
    private SysDeliveryAddressMapper sysDeliveryAddressMapper;

    /**
     * 查询收货地址
     * 
     * @param addressId 收货地址主键
     * @return 收货地址
     */
    @Override
    public SysDeliveryAddress selectSysDeliveryAddressByAddressId(Long addressId)
    {
        return sysDeliveryAddressMapper.selectSysDeliveryAddressByAddressId(addressId);
    }

    /**
     * 查询收货地址列表
     * 
     * @param sysDeliveryAddress 收货地址
     * @return 收货地址
     */
    @Override
    public List<SysDeliveryAddress> selectSysDeliveryAddressList(SysDeliveryAddress sysDeliveryAddress)
    {
        return sysDeliveryAddressMapper.selectSysDeliveryAddressList(sysDeliveryAddress);
    }

    /**
     * 新增收货地址
     * 
     * @param sysDeliveryAddress 收货地址
     * @return 结果
     */
    @Override
    public int insertSysDeliveryAddress(SysDeliveryAddress sysDeliveryAddress)
    {
        return sysDeliveryAddressMapper.insertSysDeliveryAddress(sysDeliveryAddress);
    }

    /**
     * 修改收货地址
     * 
     * @param sysDeliveryAddress 收货地址
     * @return 结果
     */
    @Override
    public int updateSysDeliveryAddress(SysDeliveryAddress sysDeliveryAddress)
    {
        sysDeliveryAddress.setUpdateTime(DateUtils.getNowDate());
        return sysDeliveryAddressMapper.updateSysDeliveryAddress(sysDeliveryAddress);
    }

    /**
     * 批量删除收货地址
     * 
     * @param addressIds 需要删除的收货地址主键
     * @return 结果
     */
    @Override
    public int deleteSysDeliveryAddressByAddressIds(Long[] addressIds)
    {
        return sysDeliveryAddressMapper.deleteSysDeliveryAddressByAddressIds(addressIds);
    }

    /**
     * 删除收货地址信息
     * 
     * @param addressId 收货地址主键
     * @return 结果
     */
    @Override
    public int deleteSysDeliveryAddressByAddressId(Long addressId)
    {
        return sysDeliveryAddressMapper.deleteSysDeliveryAddressByAddressId(addressId);
    }
}
