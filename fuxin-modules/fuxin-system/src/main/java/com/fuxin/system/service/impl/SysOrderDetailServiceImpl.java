package com.fuxin.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.fuxin.system.mapper.SysOrderDetailMapper;
import com.fuxin.system.domain.SysOrderDetail;
import com.fuxin.system.service.ISysOrderDetailService;

/**
 * 订单商品详情Service业务层处理
 * 
 * @author xfeng
 * @date 2022-03-18
 */
@Service
public class SysOrderDetailServiceImpl implements ISysOrderDetailService 
{
    @Autowired
    private SysOrderDetailMapper sysOrderDetailMapper;

    /**
     * 查询订单商品详情
     * 
     * @param orderDetailId 订单商品详情主键
     * @return 订单商品详情
     */
    @Override
    public SysOrderDetail selectSysOrderDetailByOrderDetailId(Long orderDetailId)
    {
        return sysOrderDetailMapper.selectSysOrderDetailByOrderDetailId(orderDetailId);
    }

    /**
     * 查询订单商品详情列表
     * 
     * @param sysOrderDetail 订单商品详情
     * @return 订单商品详情
     */
    @Override
    public List<SysOrderDetail> selectSysOrderDetailList(SysOrderDetail sysOrderDetail)
    {
        return sysOrderDetailMapper.selectSysOrderDetailList(sysOrderDetail);
    }

    /**
     * 新增订单商品详情
     * 
     * @param sysOrderDetail 订单商品详情
     * @return 结果
     */
    @Override
    public int insertSysOrderDetail(SysOrderDetail sysOrderDetail)
    {
        return sysOrderDetailMapper.insertSysOrderDetail(sysOrderDetail);
    }

    /**
     * 修改订单商品详情
     * 
     * @param sysOrderDetail 订单商品详情
     * @return 结果
     */
    @Override
    public int updateSysOrderDetail(SysOrderDetail sysOrderDetail)
    {
        return sysOrderDetailMapper.updateSysOrderDetail(sysOrderDetail);
    }

    /**
     * 批量删除订单商品详情
     * 
     * @param orderDetailIds 需要删除的订单商品详情主键
     * @return 结果
     */
    @Override
    public int deleteSysOrderDetailByOrderDetailIds(Long[] orderDetailIds)
    {
        return sysOrderDetailMapper.deleteSysOrderDetailByOrderDetailIds(orderDetailIds);
    }

    /**
     * 删除订单商品详情信息
     * 
     * @param orderDetailId 订单商品详情主键
     * @return 结果
     */
    @Override
    public int deleteSysOrderDetailByOrderDetailId(Long orderDetailId)
    {
        return sysOrderDetailMapper.deleteSysOrderDetailByOrderDetailId(orderDetailId);
    }
}
