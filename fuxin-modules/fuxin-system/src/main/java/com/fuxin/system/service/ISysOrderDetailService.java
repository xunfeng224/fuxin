package com.fuxin.system.service;

import java.util.List;
import com.fuxin.system.domain.SysOrderDetail;

/**
 * 订单商品详情Service接口
 * 
 * @author xfeng
 * @date 2022-03-18
 */
public interface ISysOrderDetailService 
{
    /**
     * 查询订单商品详情
     * 
     * @param orderDetailId 订单商品详情主键
     * @return 订单商品详情
     */
    public SysOrderDetail selectSysOrderDetailByOrderDetailId(Long orderDetailId);

    /**
     * 查询订单商品详情列表
     * 
     * @param sysOrderDetail 订单商品详情
     * @return 订单商品详情集合
     */
    public List<SysOrderDetail> selectSysOrderDetailList(SysOrderDetail sysOrderDetail);

    /**
     * 新增订单商品详情
     * 
     * @param sysOrderDetail 订单商品详情
     * @return 结果
     */
    public int insertSysOrderDetail(SysOrderDetail sysOrderDetail);

    /**
     * 修改订单商品详情
     * 
     * @param sysOrderDetail 订单商品详情
     * @return 结果
     */
    public int updateSysOrderDetail(SysOrderDetail sysOrderDetail);

    /**
     * 批量删除订单商品详情
     * 
     * @param orderDetailIds 需要删除的订单商品详情主键集合
     * @return 结果
     */
    public int deleteSysOrderDetailByOrderDetailIds(Long[] orderDetailIds);

    /**
     * 删除订单商品详情信息
     * 
     * @param orderDetailId 订单商品详情主键
     * @return 结果
     */
    public int deleteSysOrderDetailByOrderDetailId(Long orderDetailId);
}
