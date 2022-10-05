package com.fuxin.system.service.impl;

import java.util.List;
import com.fuxin.common.core.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.fuxin.system.mapper.SysProductMapper;
import com.fuxin.system.domain.SysProduct;
import com.fuxin.system.service.ISysProductService;

/**
 * 商品Service业务层处理
 * 
 * @author xfeng
 * @date 2022-03-20
 */
@Service
public class SysProductServiceImpl implements ISysProductService 
{
    @Autowired
    private SysProductMapper sysProductMapper;

    /**
     * 查询商品
     * 
     * @param productId 商品主键
     * @return 商品
     */
    @Override
    public SysProduct selectSysProductByProductId(Long productId)
    {
        return sysProductMapper.selectSysProductByProductId(productId);
    }

    /**
     * 查询商品列表
     * 
     * @param sysProduct 商品
     * @return 商品
     */
    @Override
    public List<SysProduct> selectSysProductList(SysProduct sysProduct)
    {
        return sysProductMapper.selectSysProductList(sysProduct);
    }

    /**
     * 新增商品
     * 
     * @param sysProduct 商品
     * @return 结果
     */
    @Override
    public int insertSysProduct(SysProduct sysProduct)
    {
        sysProduct.setCreateTime(DateUtils.getNowDate());
        return sysProductMapper.insertSysProduct(sysProduct);
    }

    /**
     * 修改商品
     * 
     * @param sysProduct 商品
     * @return 结果
     */
    @Override
    public int updateSysProduct(SysProduct sysProduct)
    {
        sysProduct.setUpdateTime(DateUtils.getNowDate());
        return sysProductMapper.updateSysProduct(sysProduct);
    }

    /**
     * 批量删除商品
     * 
     * @param productIds 需要删除的商品主键
     * @return 结果
     */
    @Override
    public int deleteSysProductByProductIds(Long[] productIds)
    {
        return sysProductMapper.deleteSysProductByProductIds(productIds);
    }

    /**
     * 删除商品信息
     * 
     * @param productId 商品主键
     * @return 结果
     */
    @Override
    public int deleteSysProductByProductId(Long productId)
    {
        return sysProductMapper.deleteSysProductByProductId(productId);
    }
}
