package com.fuxin.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.fuxin.common.core.annotation.Excel;
import com.fuxin.common.core.web.domain.BaseEntity;

/**
 * 订单商品详情对象 sys_order_detail
 *
 * @author xfeng
 * @date 2022-03-18
 */
public class SysOrderDetail extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 订单商品详情编号
     */
    private Long orderDetailId;

    /**
     * 订单编号
     */
    @Excel(name = "订单编号")
    private Long orderId;

    /**
     * 订单单号
     */
    @Excel(name = "订单单号")
    private String orderNo;

    /**
     * 商品编号
     */
    @Excel(name = "商品编号")
    private Long productId;

    /**
     * 商品名称
     */
    @Excel(name = "商品名称")
    private String productName;

    /**
     * 商品价格
     */
    @Excel(name = "商品价格")
    private Long productPrice;

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
     * 折扣比例
     */
    @Excel(name = "折扣比例")
    private Long discountRate;

    /**
     * 折扣金额
     */
    @Excel(name = "折扣金额")
    private Long discountAmount;

    /**
     * 购买数量
     */
    @Excel(name = "购买数量")
    private Long number;

    /**
     * 总金额
     */
    @Excel(name = "总金额")
    private Long subtotal;

    /**
     * 商品是否下架
     */
    @Excel(name = "商品是否下架")
    private Long isProductExists;

    /**
     * 删除标志（0代表存在 2代表删除）
     */
    private String delFlag;

    public void setOrderDetailId(Long orderDetailId) {
        this.orderDetailId = orderDetailId;
    }

    public Long getOrderDetailId() {
        return orderDetailId;
    }

    public void setOrderId(Long orderId) {
        this.orderId = orderId;
    }

    public Long getOrderId() {
        return orderId;
    }

    public String getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(String orderNo) {
        this.orderNo = orderNo;
    }

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

    public void setProductPrice(Long productPrice) {
        this.productPrice = productPrice;
    }

    public Long getProductPrice() {
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

    public void setDiscountRate(Long discountRate) {
        this.discountRate = discountRate;
    }

    public Long getDiscountRate() {
        return discountRate;
    }

    public void setDiscountAmount(Long discountAmount) {
        this.discountAmount = discountAmount;
    }

    public Long getDiscountAmount() {
        return discountAmount;
    }

    public void setNumber(Long number) {
        this.number = number;
    }

    public Long getNumber() {
        return number;
    }

    public void setSubtotal(Long subtotal) {
        this.subtotal = subtotal;
    }

    public Long getSubtotal() {
        return subtotal;
    }

    public void setIsProductExists(Long isProductExists) {
        this.isProductExists = isProductExists;
    }

    public Long getIsProductExists() {
        return isProductExists;
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
                .append("orderDetailId", getOrderDetailId())
                .append("orderId", getOrderId())
                .append("orderNo", getOrderNo())
                .append("productId", getProductId())
                .append("productName", getProductName())
                .append("productPrice", getProductPrice())
                .append("productMarque", getProductMarque())
                .append("productStoreBarcode", getProductStoreBarcode())
                .append("productModeDesc", getProductModeDesc())
                .append("productModeParams", getProductModeParams())
                .append("discountRate", getDiscountRate())
                .append("discountAmount", getDiscountAmount())
                .append("number", getNumber())
                .append("subtotal", getSubtotal())
                .append("isProductExists", getIsProductExists())
                .append("remark", getRemark())
                .append("delFlag", getDelFlag())
                .toString();
    }
}
