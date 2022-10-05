package com.fuxin.system.domain;

import java.math.BigDecimal;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.fuxin.common.core.annotation.Excel;
import com.fuxin.common.core.web.domain.BaseEntity;

/**
 * 商品对象 sys_product
 *
 * @author xfeng
 * @date 2022-03-20
 */
public class SysProduct extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 商品编号id
     */
    private Long productId;

    /**
     * 商品名称
     */
    @Excel(name = "商品名称")
    private String productName;

    /**
     * 商品类别
     */
    @Excel(name = "商品类别")
    private String productCategory;

    /**
     * 商品图片地址
     */
    @Excel(name = "商品图片地址")
    private String avatar;

    /**
     * 商品价格
     */
    @Excel(name = "商品价格")
    private BigDecimal productPrice;

    /**
     * 商品型号
     */
    @Excel(name = "商品型号")
    private String productMarque;

    /**
     * 商品仓库条码
     */
    @Excel(name = "商品仓库条码")
    private String productStoreBarcode;

    /**
     * 商品型号信息
     */
    @Excel(name = "商品型号信息")
    private String productModeDesc;

    /**
     * 商品型号参数
     */
    @Excel(name = "商品型号参数")
    private String productModeParams;

    /**
     * 删除标志（0代表存在 2代表删除）
     */
    private String delFlag;

    public void setProductId(Long productId) {
        this.productId = productId;
    }

    public Long getProductId() {
        return productId;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductCategory(String productCategory) {
        this.productCategory = productCategory;
    }

    public String getProductCategory() {
        return productCategory;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setProductPrice(BigDecimal productPrice) {
        this.productPrice = productPrice;
    }

    public BigDecimal getProductPrice() {
        return productPrice;
    }

    public void setProductMarque(String productMarque) {
        this.productMarque = productMarque;
    }

    public String getProductMarque() {
        return productMarque;
    }

    public void setProductStoreBarcode(String productStoreBarcode) {
        this.productStoreBarcode = productStoreBarcode;
    }

    public String getProductStoreBarcode() {
        return productStoreBarcode;
    }

    public void setProductModeDesc(String productModeDesc) {
        this.productModeDesc = productModeDesc;
    }

    public String getProductModeDesc() {
        return productModeDesc;
    }

    public void setProductModeParams(String productModeParams) {
        this.productModeParams = productModeParams;
    }

    public String getProductModeParams() {
        return productModeParams;
    }

    public void setDelFlag(String delFlag) {
        this.delFlag = delFlag;
    }

    public String getDelFlag() {
        return delFlag;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("productId", getProductId())
                .append("productName", getProductName())
                .append("productCategory", getProductCategory())
                .append("avatar", getAvatar())
                .append("productPrice", getProductPrice())
                .append("productMarque", getProductMarque())
                .append("productStoreBarcode", getProductStoreBarcode())
                .append("productModeDesc", getProductModeDesc())
                .append("productModeParams", getProductModeParams())
                .append("delFlag", getDelFlag())
                .append("createTime", getCreateTime())
                .append("updateTime", getUpdateTime())
                .toString();
    }
}
