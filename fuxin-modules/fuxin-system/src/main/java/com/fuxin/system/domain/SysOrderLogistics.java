package com.fuxin.system.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.fuxin.common.core.annotation.Excel;
import com.fuxin.common.core.web.domain.BaseEntity;

/**
 * 订单物流对象 sys_order_logistics
 *
 * @author xfeng
 * @date 2022-03-18
 */
public class SysOrderLogistics extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 物流表id
     */
    private Long orderlogisticsId;

    /**
     * 订单编号
     */
    @Excel(name = "订单编号")
    private Long orderId;

    /**
     * 订单单号
     */
    @Excel(name = "订单单号")
    private Long orderNo;

    /**
     * 物流单号
     */
    @Excel(name = "物流单号")
    private String expressNo;

    /**
     * 收货人姓名
     */
    @Excel(name = "收货人姓名")
    private String consigneeRealname;

    /**
     * 联系电话
     */
    @Excel(name = "联系电话")
    private String consigneeTelphone;

    /**
     * 备用联系电话
     */
    @Excel(name = "备用联系电话")
    private String consigneeTelphone2;

    /**
     * 收货地址
     */
    @Excel(name = "收货地址")
    private String consigneeAddress;

    /**
     * 邮政编码
     */
    @Excel(name = "邮政编码")
    private String consigneZip;

    /**
     * 物流方式
     */
    @Excel(name = "物流方式")
    private Long logisticsType;

    /**
     * 物流商家编号
     */
    @Excel(name = "物流商家编号")
    private Long logisticsId;

    /**
     * 物流发货运费
     */
    @Excel(name = "物流发货运费")
    private Long logisticsFee;

    /**
     * 付款金额
     */
    @Excel(name = "付款金额")
    private Long deliveryAmount;

    /**
     * 物流状态
     */
    @Excel(name = "物流状态")
    private Long orderlogisticsStatus;

    /**
     * 物流结算状态
     */
    @Excel(name = "物流结算状态")
    private Long logisticsSettlementStatus;

    /**
     * 物流描述
     */
    @Excel(name = "物流描述")
    private String logisticsResult;

    /**
     * 物流发货时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "物流发货时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date logisticsCreateTime;

    /**
     * 物流更新时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "物流更新时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date logisticsUpdateTime;

    /**
     * 物流结算时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "物流结算时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date logisticsSettlementTime;

    /**
     * 物流订单支付渠道
     */
    @Excel(name = "物流订单支付渠道")
    private Long logisticsPayChannel;

    /**
     * 物流订单支付单号
     */
    @Excel(name = "物流订单支付单号")
    private String outTradeNo;

    /**
     * 物流公司对账状态
     */
    @Excel(name = "物流公司对账状态")
    private Long reconciliationStatus;

    /**
     * 物流公司对账日期
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "物流公司对账日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date reconciliationTime;

    /**
     * 删除标志（0代表存在 2代表删除）
     */
    private String delFlag;

    public void setOrderlogisticsId(Long orderlogisticsId) {
        this.orderlogisticsId = orderlogisticsId;
    }

    public Long getOrderlogisticsId() {
        return orderlogisticsId;
    }

    public void setOrderId(Long orderId) {
        this.orderId = orderId;
    }

    public Long getOrderId() {
        return orderId;
    }

    public Long getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(Long orderNo) {
        this.orderNo = orderNo;
    }

    public void setExpressNo(String expressNo) {
        this.expressNo = expressNo;
    }

    public String getExpressNo() {
        return expressNo;
    }

    public void setConsigneeRealname(String consigneeRealname) {
        this.consigneeRealname = consigneeRealname;
    }

    public String getConsigneeRealname() {
        return consigneeRealname;
    }

    public void setConsigneeTelphone(String consigneeTelphone) {
        this.consigneeTelphone = consigneeTelphone;
    }

    public String getConsigneeTelphone() {
        return consigneeTelphone;
    }

    public void setConsigneeTelphone2(String consigneeTelphone2) {
        this.consigneeTelphone2 = consigneeTelphone2;
    }

    public String getConsigneeTelphone2() {
        return consigneeTelphone2;
    }

    public void setConsigneeAddress(String consigneeAddress) {
        this.consigneeAddress = consigneeAddress;
    }

    public String getConsigneeAddress() {
        return consigneeAddress;
    }

    public void setConsigneZip(String consigneZip) {
        this.consigneZip = consigneZip;
    }

    public String getConsigneZip() {
        return consigneZip;
    }

    public void setLogisticsType(Long logisticsType) {
        this.logisticsType = logisticsType;
    }

    public Long getLogisticsType() {
        return logisticsType;
    }

    public void setLogisticsId(Long logisticsId) {
        this.logisticsId = logisticsId;
    }

    public Long getLogisticsId() {
        return logisticsId;
    }

    public void setLogisticsFee(Long logisticsFee) {
        this.logisticsFee = logisticsFee;
    }

    public Long getLogisticsFee() {
        return logisticsFee;
    }

    public void setDeliveryAmount(Long deliveryAmount) {
        this.deliveryAmount = deliveryAmount;
    }

    public Long getDeliveryAmount() {
        return deliveryAmount;
    }

    public void setOrderlogisticsStatus(Long orderlogisticsStatus) {
        this.orderlogisticsStatus = orderlogisticsStatus;
    }

    public Long getOrderlogisticsStatus() {
        return orderlogisticsStatus;
    }

    public void setLogisticsSettlementStatus(Long logisticsSettlementStatus) {
        this.logisticsSettlementStatus = logisticsSettlementStatus;
    }

    public Long getLogisticsSettlementStatus() {
        return logisticsSettlementStatus;
    }

    public void setLogisticsResult(String logisticsResult) {
        this.logisticsResult = logisticsResult;
    }

    public String getLogisticsResult() {
        return logisticsResult;
    }

    public void setLogisticsCreateTime(Date logisticsCreateTime) {
        this.logisticsCreateTime = logisticsCreateTime;
    }

    public Date getLogisticsCreateTime() {
        return logisticsCreateTime;
    }

    public void setLogisticsUpdateTime(Date logisticsUpdateTime) {
        this.logisticsUpdateTime = logisticsUpdateTime;
    }

    public Date getLogisticsUpdateTime() {
        return logisticsUpdateTime;
    }

    public void setLogisticsSettlementTime(Date logisticsSettlementTime) {
        this.logisticsSettlementTime = logisticsSettlementTime;
    }

    public Date getLogisticsSettlementTime() {
        return logisticsSettlementTime;
    }

    public void setLogisticsPayChannel(Long logisticsPayChannel) {
        this.logisticsPayChannel = logisticsPayChannel;
    }

    public Long getLogisticsPayChannel() {
        return logisticsPayChannel;
    }

    public void setOutTradeNo(String outTradeNo) {
        this.outTradeNo = outTradeNo;
    }

    public String getOutTradeNo() {
        return outTradeNo;
    }

    public void setReconciliationStatus(Long reconciliationStatus) {
        this.reconciliationStatus = reconciliationStatus;
    }

    public Long getReconciliationStatus() {
        return reconciliationStatus;
    }

    public void setReconciliationTime(Date reconciliationTime) {
        this.reconciliationTime = reconciliationTime;
    }

    public Date getReconciliationTime() {
        return reconciliationTime;
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
                .append("orderlogisticsId", getOrderlogisticsId())
                .append("orderId", getOrderId())
                .append("orderNo", getOrderNo())
                .append("expressNo", getExpressNo())
                .append("consigneeRealname", getConsigneeRealname())
                .append("consigneeTelphone", getConsigneeTelphone())
                .append("consigneeTelphone2", getConsigneeTelphone2())
                .append("consigneeAddress", getConsigneeAddress())
                .append("consigneZip", getConsigneZip())
                .append("logisticsType", getLogisticsType())
                .append("logisticsId", getLogisticsId())
                .append("logisticsFee", getLogisticsFee())
                .append("deliveryAmount", getDeliveryAmount())
                .append("orderlogisticsStatus", getOrderlogisticsStatus())
                .append("logisticsSettlementStatus", getLogisticsSettlementStatus())
                .append("logisticsResult", getLogisticsResult())
                .append("logisticsCreateTime", getLogisticsCreateTime())
                .append("logisticsUpdateTime", getLogisticsUpdateTime())
                .append("logisticsSettlementTime", getLogisticsSettlementTime())
                .append("logisticsPayChannel", getLogisticsPayChannel())
                .append("outTradeNo", getOutTradeNo())
                .append("reconciliationStatus", getReconciliationStatus())
                .append("reconciliationTime", getReconciliationTime())
                .append("delFlag", getDelFlag())
                .toString();
    }
}
