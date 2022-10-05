package com.fuxin.system.service.impl;

import java.util.List;

import com.fuxin.common.core.utils.DateUtils;
import com.fuxin.system.domain.SysDeliveryAddress;
import com.fuxin.system.domain.SysOrderDetail;
import com.fuxin.system.mapper.SysDeliveryAddressMapper;
import com.fuxin.system.mapper.SysOrderDetailMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.fuxin.system.mapper.SysOrderMapper;
import com.fuxin.system.domain.SysOrder;
import com.fuxin.system.service.ISysOrderService;

/**
 * 订单Service业务层处理
 *
 * @author xiongfeng
 * @date 2022-03-15
 */
@Service
public class SysOrderServiceImpl implements ISysOrderService {
    @Autowired
    private SysOrderMapper sysOrderMapper;

    @Autowired
    private SysDeliveryAddressMapper sysDeliveryAddressMapper;

    @Autowired
    private SysOrderDetailMapper sysOrderDetailMapper;

    /**
     * 查询订单
     *
     * @param orderId 订单主键
     * @return 订单
     */
    @Override
    public SysOrder selectSysOrderByOrderId(Long orderId) {
        return sysOrderMapper.selectSysOrderByOrderId(orderId);
    }

    /**
     * 查询订单列表
     *
     * @param sysOrder 订单
     * @return 订单
     */
    @Override
    public List<SysOrder> selectSysOrderList(SysOrder sysOrder) {
        return sysOrderMapper.selectSysOrderList(sysOrder);
    }

    /**
     * 新增订单
     *
     * @param sysOrder 订单
     * @return 结果
     */
    @Override
    public int insertSysOrder(SysOrder sysOrder) {
        sysOrder.setCreateTime(DateUtils.getNowDate());
        return sysOrderMapper.insertSysOrder(sysOrder);
    }

    /**
     * 修改订单
     *
     * @param sysOrder 订单
     * @return 结果
     */
    @Override
    public int updateSysOrder(SysOrder sysOrder) {
        return sysOrderMapper.updateSysOrder(sysOrder);
    }

    /**
     * 批量删除订单
     *
     * @param orderIds 需要删除的订单主键
     * @return 结果
     */
    @Override
    public int deleteSysOrderByOrderIds(Long[] orderIds) {
        return sysOrderMapper.deleteSysOrderByOrderIds(orderIds);
    }

    /**
     * 删除订单信息
     *
     * @param orderId 订单主键
     * @return 结果
     */
    @Override
    public int deleteSysOrderByOrderId(Long orderId) {
        return sysOrderMapper.deleteSysOrderByOrderId(orderId);
    }

    @Override
    public List<SysDeliveryAddress> getAddressInfo(Long addressId) {
        SysDeliveryAddress sysDeliveryAddress = new SysDeliveryAddress();
        sysDeliveryAddress.setAddressId(addressId);
        return sysDeliveryAddressMapper.selectSysDeliveryAddressList(sysDeliveryAddress);
    }

    @Override
    public List<SysOrderDetail> getOrderDetail(Long orderId) {
        SysOrderDetail sysOrderDetail = new SysOrderDetail();
        sysOrderDetail.setOrderId(orderId);
        return sysOrderDetailMapper.selectSysOrderDetailList(sysOrderDetail);
    }
}
