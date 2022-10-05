package com.fuxin.system.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.fuxin.common.core.annotation.Excel;
import com.fuxin.common.core.web.domain.BaseEntity;

/**
 * 订单对象 sys_order
 *
 * @author xiongfeng
 * @date 2022-03-15
 */
public class SysOrder extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 订单id
     */
    private Long orderId;

    /**
     * 订单单号，唯一值，供客户查询
     */
    @Excel(name = "订单单号，唯一值，供客户查询")
    private String orderNo;

    /**
     * 订单状态，1未付款,2已付款,3已发货,4已签收,5退货申请,6退货中,7已退货,8取消交易
     */
    @Excel(name = "订单状态，1未付款,2已付款,3已发货,4已签收,5退货申请,6退货中,7已退货,8取消交易")
    private Long orderStatus;

    /**
     * 商品项目数量，不是商品
     */
    @Excel(name = "商品项目数量，不是商品")
    private Long productCount;

    /**
     * 商品总价
     */
    @Excel(name = "商品总价")
    private Long productAmountTotal;

    /**
     * 订单金额,实际付款金额
     */
    @Excel(name = "订单金额,实际付款金额")
    private Long orderAmountTotal;

    /**
     * 运费金额
     */
    @Excel(name = "运费金额")
    private Long logisticsFee;

    /**
     * 收货地址编号,收货地址表自动编号
     */
    @Excel(name = "收货地址编号,收货地址表自动编号")
    private Long addressId;

    /**
     * 订单物流编号,订单物流表自动编号
     */
    @Excel(name = "订单物流编号,订单物流表自动编号")
    private Long orderlogisticsId;

    /**
     * 订单支付渠道，1微信，2支付宝，3银行卡
     */
    @Excel(name = "订单支付渠道，1微信，2支付宝，3银行卡")
    private Long payChannel;

    /**
     * 订单支付单号，第三方支付流水号
     */
    @Excel(name = "订单支付单号，第三方支付流水号")
    private String outTradeNo;

    /**
     * 付款时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "付款时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date payTime;

    /**
     * 发货时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "发货时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date deliveryTime;

    /**
     * 客户编号
     */
    @Excel(name = "客户编号")
    private Long cusId;

    /**
     * 客户账号
     */
    @Excel(name = "客户编号")
    private String cusName;

    /**
     * 订单结算时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "订单结算时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date orderSettlementTime;

    /**
     * 删除标志（0代表存在 2代表删除）
     */
    private String delFlag;

    public void setOrderId(Long orderId) {
        this.orderId = orderId;
    }

    public Long getOrderId() {
        return orderId;
    }

    public void setOrderNo(String orderNo) {
        this.orderNo = orderNo;
    }

    public String getOrderNo() {
        return orderNo;
    }

    public void setOrderStatus(Long orderStatus) {
        this.orderStatus = orderStatus;
    }

    public Long getOrderStatus() {
        return orderStatus;
    }

    public void setProductCount(Long productCount) {
        this.productCount = productCount;
    }

    public Long getProductCount() {
        return productCount;
    }

    public void setProductAmountTotal(Long productAmountTotal) {
        this.productAmountTotal = productAmountTotal;
    }

    public Long getProductAmountTotal() {
        return productAmountTotal;
    }

    public void setOrderAmountTotal(Long orderAmountTotal) {
        this.orderAmountTotal = orderAmountTotal;
    }

    public Long getOrderAmountTotal() {
        return orderAmountTotal;
    }

    public void setLogisticsFee(Long logisticsFee) {
        this.logisticsFee = logisticsFee;
    }

    public Long getLogisticsFee() {
        return logisticsFee;
    }

    public void setAddressId(Long addressId) {
        this.addressId = addressId;
    }

    public Long getAddressId() {
        return addressId;
    }

    public void setOrderlogisticsId(Long orderlogisticsId) {
        this.orderlogisticsId = orderlogisticsId;
    }

    public Long getOrderlogisticsId() {
        return orderlogisticsId;
    }

    public void setPayChannel(Long payChannel) {
        this.payChannel = payChannel;
    }

    public Long getPayChannel() {
        return payChannel;
    }

    public void setOutTradeNo(String outTradeNo) {
        this.outTradeNo = outTradeNo;
    }

    public String getOutTradeNo() {
        return outTradeNo;
    }

    public void setPayTime(Date payTime) {
        this.payTime = payTime;
    }

    public Date getPayTime() {
        return payTime;
    }

    public void setDeliveryTime(Date deliveryTime) {
        this.deliveryTime = deliveryTime;
    }

    public Date getDeliveryTime() {
        return deliveryTime;
    }

    public void setCusId(Long cusId) {
        this.cusId = cusId;
    }

    public Long getCusId() {
        return cusId;
    }

    public String getCusName() {
        return cusName;
    }

    public void setCusName(String cusName) {
        this.cusName = cusName;
    }

    public void setOrderSettlementTime(Date orderSettlementTime) {
        this.orderSettlementTime = orderSettlementTime;
    }

    public Date getOrderSettlementTime() {
        return orderSettlementTime;
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
                .append("orderId", getOrderId())
                .append("orderNo", getOrderNo())
                .append("orderStatus", getOrderStatus())
                .append("productCount", getProductCount())
                .append("productAmountTotal", getProductAmountTotal())
                .append("orderAmountTotal", getOrderAmountTotal())
                .append("logisticsFee", getLogisticsFee())
                .append("addressId", getAddressId())
                .append("orderlogisticsId", getOrderlogisticsId())
                .append("payChannel", getPayChannel())
                .append("outTradeNo", getOutTradeNo())
                .append("createBy", getCreateBy())
                .append("createTime", getCreateTime())
                .append("payTime", getPayTime())
                .append("deliveryTime", getDeliveryTime())
                .append("cusId", getCusId())
                .append("cusName", getCusName())
                .append("remark", getRemark())
                .append("orderSettlementTime", getOrderSettlementTime())
                .append("delFlag", getDelFlag())
                .toString();
    }
}
