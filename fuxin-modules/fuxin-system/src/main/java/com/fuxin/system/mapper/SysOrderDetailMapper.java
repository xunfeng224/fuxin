package com.fuxin.system.mapper;

import java.util.List;
import com.fuxin.system.domain.SysOrderDetail;

/**
 * 订单商品详情Mapper接口
 * 
 * @author xfeng
 * @date 2022-03-18
 */
public interface SysOrderDetailMapper 
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
     * 删除订单商品详情
     * 
     * @param orderDetailId 订单商品详情主键
     * @return 结果
     */
    public int deleteSysOrderDetailByOrderDetailId(Long orderDetailId);

    /**
     * 批量删除订单商品详情
     * 
     * @param orderDetailIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysOrderDetailByOrderDetailIds(Long[] orderDetailIds);
}
