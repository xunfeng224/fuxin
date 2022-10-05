package com.fuxin.system.service;

import java.util.List;

import com.fuxin.system.domain.SysDeliveryAddress;
import com.fuxin.system.domain.SysOrder;
import com.fuxin.system.domain.SysOrderDetail;

/**
 * 订单Service接口
 *
 * @author xiongfeng
 * @date 2022-03-15
 */
public interface ISysOrderService {
    /**
     * 查询订单
     *
     * @param orderId 订单主键
     * @return 订单
     */
    public SysOrder selectSysOrderByOrderId(Long orderId);

    /**
     * 查询订单列表
     *
     * @param sysOrder 订单
     * @return 订单集合
     */
    public List<SysOrder> selectSysOrderList(SysOrder sysOrder);

    /**
     * 新增订单
     *
     * @param sysOrder 订单
     * @return 结果
     */
    public int insertSysOrder(SysOrder sysOrder);

    /**
     * 修改订单
     *
     * @param sysOrder 订单
     * @return 结果
     */
    public int updateSysOrder(SysOrder sysOrder);

    /**
     * 批量删除订单
     *
     * @param orderIds 需要删除的订单主键集合
     * @return 结果
     */
    public int deleteSysOrderByOrderIds(Long[] orderIds);

    /**
     * 删除订单信息
     *
     * @param orderId 订单主键
     * @return 结果
     */
    public int deleteSysOrderByOrderId(Long orderId);

    /**
     * 查询收货地址信息
     *
     * @param addressId 收货地址主键
     * @return 结果
     */
    public List<SysDeliveryAddress> getAddressInfo(Long addressId);

    public List<SysOrderDetail> getOrderDetail(Long orderId);
}
