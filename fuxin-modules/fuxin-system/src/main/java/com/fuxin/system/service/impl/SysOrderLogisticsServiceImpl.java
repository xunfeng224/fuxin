package com.fuxin.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.fuxin.system.mapper.SysOrderLogisticsMapper;
import com.fuxin.system.domain.SysOrderLogistics;
import com.fuxin.system.service.ISysOrderLogisticsService;

/**
 * 订单物流Service业务层处理
 * 
 * @author xfeng
 * @date 2022-03-18
 */
@Service
public class SysOrderLogisticsServiceImpl implements ISysOrderLogisticsService 
{
    @Autowired
    private SysOrderLogisticsMapper sysOrderLogisticsMapper;

    /**
     * 查询订单物流
     * 
     * @param orderlogisticsId 订单物流主键
     * @return 订单物流
     */
    @Override
    public SysOrderLogistics selectSysOrderLogisticsByOrderlogisticsId(Long orderlogisticsId)
    {
        return sysOrderLogisticsMapper.selectSysOrderLogisticsByOrderlogisticsId(orderlogisticsId);
    }

    /**
     * 查询订单物流列表
     * 
     * @param sysOrderLogistics 订单物流
     * @return 订单物流
     */
    @Override
    public List<SysOrderLogistics> selectSysOrderLogisticsList(SysOrderLogistics sysOrderLogistics)
    {
        return sysOrderLogisticsMapper.selectSysOrderLogisticsList(sysOrderLogistics);
    }

    /**
     * 新增订单物流
     * 
     * @param sysOrderLogistics 订单物流
     * @return 结果
     */
    @Override
    public int insertSysOrderLogistics(SysOrderLogistics sysOrderLogistics)
    {
        return sysOrderLogisticsMapper.insertSysOrderLogistics(sysOrderLogistics);
    }

    /**
     * 修改订单物流
     * 
     * @param sysOrderLogistics 订单物流
     * @return 结果
     */
    @Override
    public int updateSysOrderLogistics(SysOrderLogistics sysOrderLogistics)
    {
        return sysOrderLogisticsMapper.updateSysOrderLogistics(sysOrderLogistics);
    }

    /**
     * 批量删除订单物流
     * 
     * @param orderlogisticsIds 需要删除的订单物流主键
     * @return 结果
     */
    @Override
    public int deleteSysOrderLogisticsByOrderlogisticsIds(Long[] orderlogisticsIds)
    {
        return sysOrderLogisticsMapper.deleteSysOrderLogisticsByOrderlogisticsIds(orderlogisticsIds);
    }

    /**
     * 删除订单物流信息
     * 
     * @param orderlogisticsId 订单物流主键
     * @return 结果
     */
    @Override
    public int deleteSysOrderLogisticsByOrderlogisticsId(Long orderlogisticsId)
    {
        return sysOrderLogisticsMapper.deleteSysOrderLogisticsByOrderlogisticsId(orderlogisticsId);
    }
}
