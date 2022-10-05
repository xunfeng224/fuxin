package com.fuxin.system.service;

import java.util.List;
import com.fuxin.system.domain.SysOrderLogistics;

/**
 * 订单物流Service接口
 * 
 * @author xfeng
 * @date 2022-03-18
 */
public interface ISysOrderLogisticsService 
{
    /**
     * 查询订单物流
     * 
     * @param orderlogisticsId 订单物流主键
     * @return 订单物流
     */
    public SysOrderLogistics selectSysOrderLogisticsByOrderlogisticsId(Long orderlogisticsId);

    /**
     * 查询订单物流列表
     * 
     * @param sysOrderLogistics 订单物流
     * @return 订单物流集合
     */
    public List<SysOrderLogistics> selectSysOrderLogisticsList(SysOrderLogistics sysOrderLogistics);

    /**
     * 新增订单物流
     * 
     * @param sysOrderLogistics 订单物流
     * @return 结果
     */
    public int insertSysOrderLogistics(SysOrderLogistics sysOrderLogistics);

    /**
     * 修改订单物流
     * 
     * @param sysOrderLogistics 订单物流
     * @return 结果
     */
    public int updateSysOrderLogistics(SysOrderLogistics sysOrderLogistics);

    /**
     * 批量删除订单物流
     * 
     * @param orderlogisticsIds 需要删除的订单物流主键集合
     * @return 结果
     */
    public int deleteSysOrderLogisticsByOrderlogisticsIds(Long[] orderlogisticsIds);

    /**
     * 删除订单物流信息
     * 
     * @param orderlogisticsId 订单物流主键
     * @return 结果
     */
    public int deleteSysOrderLogisticsByOrderlogisticsId(Long orderlogisticsId);
}
