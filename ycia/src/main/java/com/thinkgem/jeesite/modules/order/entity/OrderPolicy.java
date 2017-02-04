/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.order.entity;

import org.hibernate.validator.constraints.Length;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.modules.pro.entity.ProZyMba;

/**
 * 保单管理Entity
 * @author ttat
 * @version 2016-09-02
 */
public class OrderPolicy extends DataEntity<OrderPolicy> {
	
	private static final long serialVersionUID = 1L;
	private String policyNo;		// 保单编号
	private String orderId;		// order_id
	private String orderNo;		// 订单编号
	private String productId;		// 险种
	private String userId;		// user_id
	private String agentId;		// 代理人
	private String officeId;		// 所属部门
	private Double premium;		// 保费
	private Double amonut;		// 保额
	private Date startTime;		// 保单开始时间
	private Date endTime;		// 保单结束时间
	private String lastNo;		// 上一年保单号
	private String insureName;		// 投保人姓名
	private String insureCardNo;		// 投保人证件号码
	private String insurePhone;		// 投保人联系电话
	private String insureAddress;		// 投保人联系地址
	private String insurePostcode;		// 投保人邮政编码
	private String insureEmail;		// 投保人电子邮箱
	private String insuredName;		// 被保人姓名
	private String insuredCardNo;		// 被保人证件号码
	private String insuredPhone;		// 被保人联系电话
	private String insuredAddress;		// 被保人联系地址
	private String insuredPostcode;		// 被保人邮政编码
	private String insuredEmail;		// 被保人电子邮箱
	private String benefitName;		// 受益人姓名
	private String benefitCardNo;		// 受益人证件号码
	private String benefitPhone;		// 受益人联系电话
	private String benefitAddress;		// 受益人联系地址
	private String benefitPostcode;		// 受益人邮政编码
	private String benefitEmail;		// 受益人电子邮箱
	private String status;		// 保单状态
	private Date createTime;		// 创建时间
	private String clentId;
	private ProZyMba proZyMba;
	
	private String agentName;
	private String productName;
	
	public String getAgentName() {
		return agentName;
	}

	public void setAgentName(String agentName) {
		this.agentName = agentName;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public OrderPolicy() {
		super();
	}

	public OrderPolicy(String id){
		super(id);
	}
	
	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getOfficeId() {
		return officeId;
	}

	public void setOfficeId(String officeId) {
		this.officeId = officeId;
	}

	@Length(min=0, max=100, message="保单编号长度必须介于 0 和 100 之间")
	public String getPolicyNo() {
		return policyNo;
	}

	public void setPolicyNo(String policyNo) {
		this.policyNo = policyNo;
	}
	
	@Length(min=0, max=100, message="订单编号长度必须介于 0 和 100 之间")
	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}
	
	@Length(min=0, max=11, message="代理人长度必须介于 0 和 11 之间")
	public String getAgentId() {
		return agentId;
	}

	public void setAgentId(String agentId) {
		this.agentId = agentId;
	}
	
	public Double getPremium() {
		return premium;
	}

	public void setPremium(Double premium) {
		this.premium = premium;
	}
	
	public Double getAmonut() {
		return amonut;
	}

	public void setAmonut(Double amonut) {
		this.amonut = amonut;
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
	
	@Length(min=0, max=100, message="上一年保单号长度必须介于 0 和 100 之间")
	public String getLastNo() {
		return lastNo;
	}

	public void setLastNo(String lastNo) {
		this.lastNo = lastNo;
	}
	
	@Length(min=0, max=100, message="投保人姓名长度必须介于 0 和 100 之间")
	public String getInsureName() {
		return insureName;
	}

	public void setInsureName(String insureName) {
		this.insureName = insureName;
	}
	
	@Length(min=0, max=50, message="投保人证件号码长度必须介于 0 和 50 之间")
	public String getInsureCardNo() {
		return insureCardNo;
	}

	public void setInsureCardNo(String insureCardNo) {
		this.insureCardNo = insureCardNo;
	}
	
	@Length(min=0, max=50, message="投保人联系电话长度必须介于 0 和 50 之间")
	public String getInsurePhone() {
		return insurePhone;
	}

	public void setInsurePhone(String insurePhone) {
		this.insurePhone = insurePhone;
	}
	
	@Length(min=0, max=200, message="投保人联系地址长度必须介于 0 和 200 之间")
	public String getInsureAddress() {
		return insureAddress;
	}

	public void setInsureAddress(String insureAddress) {
		this.insureAddress = insureAddress;
	}
	
	@Length(min=0, max=20, message="投保人邮政编码长度必须介于 0 和 20 之间")
	public String getInsurePostcode() {
		return insurePostcode;
	}

	public void setInsurePostcode(String insurePostcode) {
		this.insurePostcode = insurePostcode;
	}
	
	@Length(min=0, max=100, message="投保人电子邮箱长度必须介于 0 和 100 之间")
	public String getInsureEmail() {
		return insureEmail;
	}

	public void setInsureEmail(String insureEmail) {
		this.insureEmail = insureEmail;
	}
	
	@Length(min=0, max=100, message="被保人姓名长度必须介于 0 和 100 之间")
	public String getInsuredName() {
		return insuredName;
	}

	public void setInsuredName(String insuredName) {
		this.insuredName = insuredName;
	}
	
	@Length(min=0, max=50, message="被保人证件号码长度必须介于 0 和 50 之间")
	public String getInsuredCardNo() {
		return insuredCardNo;
	}

	public void setInsuredCardNo(String insuredCardNo) {
		this.insuredCardNo = insuredCardNo;
	}
	
	@Length(min=0, max=50, message="被保人联系电话长度必须介于 0 和 50 之间")
	public String getInsuredPhone() {
		return insuredPhone;
	}

	public void setInsuredPhone(String insuredPhone) {
		this.insuredPhone = insuredPhone;
	}
	
	@Length(min=0, max=200, message="被保人联系地址长度必须介于 0 和 200 之间")
	public String getInsuredAddress() {
		return insuredAddress;
	}

	public void setInsuredAddress(String insuredAddress) {
		this.insuredAddress = insuredAddress;
	}
	
	@Length(min=0, max=20, message="被保人邮政编码长度必须介于 0 和 20 之间")
	public String getInsuredPostcode() {
		return insuredPostcode;
	}

	public void setInsuredPostcode(String insuredPostcode) {
		this.insuredPostcode = insuredPostcode;
	}
	
	@Length(min=0, max=100, message="被保人电子邮箱长度必须介于 0 和 100 之间")
	public String getInsuredEmail() {
		return insuredEmail;
	}

	public void setInsuredEmail(String insuredEmail) {
		this.insuredEmail = insuredEmail;
	}
	
	@Length(min=0, max=100, message="受益人姓名长度必须介于 0 和 100 之间")
	public String getBenefitName() {
		return benefitName;
	}

	public void setBenefitName(String benefitName) {
		this.benefitName = benefitName;
	}
	
	@Length(min=0, max=50, message="受益人证件号码长度必须介于 0 和 50 之间")
	public String getBenefitCardNo() {
		return benefitCardNo;
	}

	public void setBenefitCardNo(String benefitCardNo) {
		this.benefitCardNo = benefitCardNo;
	}
	
	@Length(min=0, max=50, message="受益人联系电话长度必须介于 0 和 50 之间")
	public String getBenefitPhone() {
		return benefitPhone;
	}

	public void setBenefitPhone(String benefitPhone) {
		this.benefitPhone = benefitPhone;
	}
	
	@Length(min=0, max=200, message="受益人联系地址长度必须介于 0 和 200 之间")
	public String getBenefitAddress() {
		return benefitAddress;
	}

	public void setBenefitAddress(String benefitAddress) {
		this.benefitAddress = benefitAddress;
	}
	
	@Length(min=0, max=20, message="受益人邮政编码长度必须介于 0 和 20 之间")
	public String getBenefitPostcode() {
		return benefitPostcode;
	}

	public void setBenefitPostcode(String benefitPostcode) {
		this.benefitPostcode = benefitPostcode;
	}
	
	@Length(min=0, max=100, message="受益人电子邮箱长度必须介于 0 和 100 之间")
	public String getBenefitEmail() {
		return benefitEmail;
	}

	public void setBenefitEmail(String benefitEmail) {
		this.benefitEmail = benefitEmail;
	}
	
	@Length(min=0, max=1, message="保单状态长度必须介于 0 和 1 之间")
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getClentId() {
		return clentId;
	}

	public void setClentId(String clentId) {
		this.clentId = clentId;
	}

	public ProZyMba getProZyMba() {
		return proZyMba;
	}

	public void setProZyMba(ProZyMba proZyMba) {
		this.proZyMba = proZyMba;
	}
	
}