/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.pro.entity;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 中意小型商业定额A款Entity
 * @author ywl
 * @version 2016-09-20
 */
public class ProZyMba extends DataEntity<ProZyMba> {
	
	private static final long serialVersionUID = 1L;
	private String insurProductId;		// 主险种id
	private String orderId;		// 主订单id
	private String enterpriseType;		// 企业类别
	private String businessContent;		// 经营内容
	private String openAddress;		// 营业场所
	private Date startTime;		// 保险开始时间
	private Date endTime;		// 保险结束时间
	private String totalClaim;		// 累积赔偿限额
	private String eachClaim;		// 每次赔偿限额
	private Date createTime;		// 创建时间
	
	public ProZyMba() {
		super();
	}

	public ProZyMba(String id){
		super(id);
	}

	@Length(min=0, max=64, message="主险种id长度必须介于 0 和 64 之间")
	public String getInsurProductId() {
		return insurProductId;
	}

	public void setInsurProductId(String insurProductId) {
		this.insurProductId = insurProductId;
	}
	
	@Length(min=0, max=64, message="主订单id长度必须介于 0 和 64 之间")
	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	
	@Length(min=0, max=200, message="企业类别长度必须介于 0 和 200 之间")
	public String getEnterpriseType() {
		return enterpriseType;
	}

	public void setEnterpriseType(String enterpriseType) {
		this.enterpriseType = enterpriseType;
	}
	
	@Length(min=0, max=200, message="经营内容长度必须介于 0 和 200 之间")
	public String getBusinessContent() {
		return businessContent;
	}

	public void setBusinessContent(String businessContent) {
		this.businessContent = businessContent;
	}
	
	@Length(min=0, max=100, message="营业场所长度必须介于 0 和 100 之间")
	public String getOpenAddress() {
		return openAddress;
	}

	public void setOpenAddress(String openAddress) {
		this.openAddress = openAddress;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	
	public String getTotalClaim() {
		return totalClaim;
	}

	public void setTotalClaim(String totalClaim) {
		this.totalClaim = totalClaim;
	}

	public String getEachClaim() {
		return eachClaim;
	}

	public void setEachClaim(String eachClaim) {
		this.eachClaim = eachClaim;
	}

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
}