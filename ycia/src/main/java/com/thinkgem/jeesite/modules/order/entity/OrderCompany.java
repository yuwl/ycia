/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.order.entity;

import org.hibernate.validator.constraints.Length;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 保险公司订单Entity
 * @author ttat
 * @version 2016-09-05
 */
public class OrderCompany extends DataEntity<OrderCompany> {
	
	private static final long serialVersionUID = 1L;
	private String orderId;		// 订单id
	private String orderNo;		// 订单编号
	private Double premium;		// 保费
	private Double amount;		// 保额
	private Double feeRate;		// 安途手续费费率
	private Double fee;		// 安途手续费
	private Double rate;		// 代理人佣金费率
	private Double commission;		// 代理人佣金
	private Double deductible;		//免赔额
	private String deductibleDesc;	//免赔细则
	private String status;		// 订单状态
	private String companyId;		// 保险公司
	private String offer;		// 报价人
	private Date createTime;		// 创建时间
	private Date updateTime;		// 更新时间
	private String sealCret; //盖章凭证
	private String payCret;	//支付凭证
	
	public OrderCompany() {
		super();
	}

	public OrderCompany(String id){
		super(id);
	}

	@Length(min=0, max=11, message="订单id长度必须介于 0 和 11 之间")
	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	
	@Length(min=0, max=50, message="订单编号长度必须介于 0 和 50 之间")
	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}
	
	public Double getPremium() {
		return premium;
	}

	public void setPremium(Double premium) {
		this.premium = premium;
	}

	public Double getAmount() {
		return amount;
	}

	public void setAmount(Double amount) {
		this.amount = amount;
	}

	public Double getFeeRate() {
		return feeRate;
	}

	public void setFeeRate(Double feeRate) {
		this.feeRate = feeRate;
	}

	public Double getFee() {
		return fee;
	}

	public void setFee(Double fee) {
		this.fee = fee;
	}

	public Double getRate() {
		return rate;
	}

	public void setRate(Double rate) {
		this.rate = rate;
	}

	public Double getCommission() {
		return commission;
	}

	public void setCommission(Double commission) {
		this.commission = commission;
	}
	
	public Double getDeductible() {
		return deductible;
	}

	public void setDeductible(Double deductible) {
		this.deductible = deductible;
	}

	public String getDeductibleDesc() {
		return deductibleDesc;
	}

	public void setDeductibleDesc(String deductibleDesc) {
		this.deductibleDesc = deductibleDesc;
	}

	@Length(min=0, max=1, message="订单状态长度必须介于 0 和 1 之间")
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	@Length(min=0, max=11, message="保险公司长度必须介于 0 和 11 之间")
	public String getCompanyId() {
		return companyId;
	}

	public void setCompanyId(String companyId) {
		this.companyId = companyId;
	}
	
	@Length(min=0, max=1, message="报价人长度必须介于 0 和 1 之间")
	public String getOffer() {
		return offer;
	}

	public void setOffer(String offer) {
		this.offer = offer;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public String getSealCret() {
		return sealCret;
	}

	public void setSealCret(String sealCret) {
		this.sealCret = sealCret;
	}

	public String getPayCret() {
		return payCret;
	}

	public void setPayCret(String payCret) {
		this.payCret = payCret;
	}
	
}