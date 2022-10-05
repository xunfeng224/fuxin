package com.fuxin.system.service;

import java.util.List;
import com.fuxin.system.domain.SysDeliveryAddress;

/**
 * 收货地址Service接口
 * 
 * @author xfeng
 * @date 2022-03-18
 */
public interface ISysDeliveryAddressService 
{
    /**
     * 查询收货地址
     * 
     * @param addressId 收货地址主键
     * @return 收货地址
     */
    public SysDeliveryAddress selectSysDeliveryAddressByAddressId(Long addressId);

    /**
     * 查询收货地址列表
     * 
     * @param sysDeliveryAddress 收货地址
     * @return 收货地址集合
     */
    public List<SysDeliveryAddress> selectSysDeliveryAddressList(SysDeliveryAddress sysDeliveryAddress);

    /**
     * 新增收货地址
     * 
     * @param sysDeliveryAddress 收货地址
     * @return 结果
     */
    public int insertSysDeliveryAddress(SysDeliveryAddress sysDeliveryAddress);

    /**
     * 修改收货地址
     * 
     * @param sysDeliveryAddress 收货地址
     * @return 结果
     */
    public int updateSysDeliveryAddress(SysDeliveryAddress sysDeliveryAddress);

    /**
     * 批量删除收货地址
     * 
     * @param addressIds 需要删除的收货地址主键集合
     * @return 结果
     */
    public int deleteSysDeliveryAddressByAddressIds(Long[] addressIds);

    /**
     * 删除收货地址信息
     * 
     * @param addressId 收货地址主键
     * @return 结果
     */
    public int deleteSysDeliveryAddressByAddressId(Long addressId);
}
