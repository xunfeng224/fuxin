package com.fuxin.system.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.fuxin.common.core.annotation.Excel;
import com.fuxin.common.core.web.domain.BaseEntity;

/**
 * 收货地址对象 sys_delivery_address
 *
 * @author xfeng
 * @date 2022-03-18
 */
public class SysDeliveryAddress extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 收货地址表主键id
     */
    private Long addressId;

    /**
     * 客户编号
     */
    @Excel(name = "客户编号")
    private Long customerId;

    /**
     * 客户账号
     */
    @Excel(name = "客户账号")
    private String cusName;

    /**
     * 收件人姓名
     */
    @Excel(name = "收件人姓名")
    private String realname;

    /**
     * 联系电话
     */
    @Excel(name = "联系电话")
    private String telphone;

    /**
     * 备用联系电话
     */
    @Excel(name = "备用联系电话")
    private String telphone2;

    /**
     * 国家
     */
    @Excel(name = "国家")
    private String country;

    /**
     * 省份
     */
    @Excel(name = "省份")
    private String province;

    /**
     * 城市
     */
    @Excel(name = "城市")
    private String city;

    /**
     * 地区
     */
    @Excel(name = "地区")
    private String area;

    /**
     * 街道/详细收获地址
     */
    @Excel(name = "街道/详细收获地址")
    private String street;

    /**
     * 邮政编码
     */
    @Excel(name = "邮政编码")
    private String zip;

    /**
     * 是否默认收获地址，1是，0否
     */
    @Excel(name = "是否默认收获地址，1是，0否")
    private Long isDefaultAddress;

    /**
     * 创建时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "创建时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date createdTime;

    public void setAddressId(Long addressId) {
        this.addressId = addressId;
    }

    public Long getAddressId() {
        return addressId;
    }

    public void setCustomerId(Long customerId) {
        this.customerId = customerId;
    }

    public Long getCustomerId() {
        return customerId;
    }

    public String getCusName() {
        return cusName;
    }

    public void setCusName(String cusName) {
        this.cusName = cusName;
    }

    public void setRealname(String realname) {
        this.realname = realname;
    }

    public String getRealname() {
        return realname;
    }

    public void setTelphone(String telphone) {
        this.telphone = telphone;
    }

    public String getTelphone() {
        return telphone;
    }

    public void setTelphone2(String telphone2) {
        this.telphone2 = telphone2;
    }

    public String getTelphone2() {
        return telphone2;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getCountry() {
        return country;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getProvince() {
        return province;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCity() {
        return city;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public String getArea() {
        return area;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getStreet() {
        return street;
    }

    public void setZip(String zip) {
        this.zip = zip;
    }

    public String getZip() {
        return zip;
    }

    public void setIsDefaultAddress(Long isDefaultAddress) {
        this.isDefaultAddress = isDefaultAddress;
    }

    public Long getIsDefaultAddress() {
        return isDefaultAddress;
    }

    public void setCreatedTime(Date createdTime) {
        this.createdTime = createdTime;
    }

    public Date getCreatedTime() {
        return createdTime;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("addressId", getAddressId())
                .append("customerId", getCustomerId())
                .append("cusName", getCusName())
                .append("realname", getRealname())
                .append("telphone", getTelphone())
                .append("telphone2", getTelphone2())
                .append("country", getCountry())
                .append("province", getProvince())
                .append("city", getCity())
                .append("area", getArea())
                .append("street", getStreet())
                .append("zip", getZip())
                .append("isDefaultAddress", getIsDefaultAddress())
                .append("createdTime", getCreatedTime())
                .append("updateTime", getUpdateTime())
                .toString();
    }
}
