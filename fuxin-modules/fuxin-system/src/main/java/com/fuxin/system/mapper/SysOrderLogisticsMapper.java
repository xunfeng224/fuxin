package com.fuxin.system.mapper;

import java.util.List;
import com.fuxin.system.domain.SysOrderLogistics;

/**
 * 订单物流Mapper接口
 * 
 * @author xfeng
 * @date 2022-03-18
 */
public interface SysOrderLogisticsMapper 
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
     * 删除订单物流
     * 
     * @param orderlogisticsId 订单物流主键
     * @return 结果
     */
    public int deleteSysOrderLogisticsByOrderlogisticsId(Long orderlogisticsId);

    /**
     * 批量删除订单物流
     * 
     * @param orderlogisticsIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysOrderLogisticsByOrderlogisticsIds(Long[] orderlogisticsIds);
}
