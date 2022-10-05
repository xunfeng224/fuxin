package com.fuxin.system.service;

import java.util.List;
import com.fuxin.system.domain.SysProduct;

/**
 * 商品Service接口
 * 
 * @author xfeng
 * @date 2022-03-20
 */
public interface ISysProductService 
{
    /**
     * 查询商品
     * 
     * @param productId 商品主键
     * @return 商品
     */
    public SysProduct selectSysProductByProductId(Long productId);

    /**
     * 查询商品列表
     * 
     * @param sysProduct 商品
     * @return 商品集合
     */
    public List<SysProduct> selectSysProductList(SysProduct sysProduct);

    /**
     * 新增商品
     * 
     * @param sysProduct 商品
     * @return 结果
     */
    public int insertSysProduct(SysProduct sysProduct);

    /**
     * 修改商品
     * 
     * @param sysProduct 商品
     * @return 结果
     */
    public int updateSysProduct(SysProduct sysProduct);

    /**
     * 批量删除商品
     * 
     * @param productIds 需要删除的商品主键集合
     * @return 结果
     */
    public int deleteSysProductByProductIds(Long[] productIds);

    /**
     * 删除商品信息
     * 
     * @param productId 商品主键
     * @return 结果
     */
    public int deleteSysProductByProductId(Long productId);
}
