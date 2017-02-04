/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.order.entity;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 报价明细Entity
 * @author ywl
 * @version 2016-09-20
 */
public class OrderOffer extends DataEntity<OrderOffer> {
	
	private static final long serialVersionUID = 1L;
	private String orderCompanyId;		// 订单-保险公司id
	private String productName;		// 保险名称
	private String orderId;		// 主订单id
	private Double amonut;		// 保额
	private Double premium;		// 保费
	private String insurType;		// 主/附加险（1：表，0：附）
	private Date createTime;		// 创建时间
	
	public OrderOffer() {
		super();
	}

	public OrderOffer(String id){
		super(id);
	}

	@Length(min=0, max=64, message="订单-保险公司id长度必须介于 0 和 64 之间")
	public String getOrderCompanyId() {
		return orderCompanyId;
	}

	public void setOrderCompanyId(String orderCompanyId) {
		this.orderCompanyId = orderCompanyId;
	}
	
	@Length(min=0, max=100, message="保险名称长度必须介于 0 和 100 之间")
	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}
	
	@Length(min=0, max=64, message="主订单id长度必须介于 0 和 64 之间")
	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	
	public Double getAmonut() {
		return amonut;
	}

	public void setAmonut(Double amonut) {
		this.amonut = amonut;
	}
	
	public Double getPremium() {
		return premium;
	}

	public void setPremium(Double premium) {
		this.premium = premium;
	}
	
	@Length(min=0, max=1, message="主/附加险（1：表，0：附）长度必须介于 0 和 1 之间")
	public String getInsurType() {
		return insurType;
	}

	public void setInsurType(String insurType) {
		this.insurType = insurType;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
}