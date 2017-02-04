package com.thinkgem.jeesite.modules.order.entity;

import java.util.Date;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 报价员查看dto
 * @author GuoXiangyang
 *
 */
public class OfferDto  extends DataEntity<OfferDto>{
	
	private static final long serialVersionUID = 1L;
	private String orderCompanyId; //order_company_id;
	private String orderId;		// 订单id
	private String orderNo;		// 订单编号
	private Double premium;		// 保费
	private Double totalPremium;	// 总保费
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
	private String userId;		// user_id
	private String agentId;		// agent_id
	private String productId;		// product_id
	private String officeId;		// 所属部门
	private Date payTime;		// 支付时间
	private String clentId;		// 客户Id
	private String policyNo;		// 保单编号
	private Double amonut;		// 保额
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
	private String insurProductId;		// 主险种id
	private String enterpriseType;		// 企业类别
	private String businessContent;		// 经营内容
	private String openAddress;		// 营业场所
	private Date startTime;		// 保险开始时间
	private Date endTime;		// 保险结束时间
	private String totalClaim;		// 累积赔偿限额
	private String eachClaim;		// 每次赔偿限额
	private String sealCret; //盖章凭证
	private String payCret;	//支付凭证
	
	public String getOrderCompanyId() {
		return orderCompanyId;
	}
	public void setOrderCompanyId(String orderCompanyId) {
		this.orderCompanyId = orderCompanyId;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public String getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}
	public Double getTotalPremium() {
		return totalPremium;
	}
	public void setTotalPremium(Double totalPremium) {
		this.totalPremium = totalPremium;
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
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getCompanyId() {
		return companyId;
	}
	public void setCompanyId(String companyId) {
		this.companyId = companyId;
	}
	public String getOffer() {
		return offer;
	}
	public void setOffer(String offer) {
		this.offer = offer;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getAgentId() {
		return agentId;
	}
	public void setAgentId(String agentId) {
		this.agentId = agentId;
	}
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public String getOfficeId() {
		return officeId;
	}
	public void setOfficeId(String officeId) {
		this.officeId = officeId;
	}
	public Date getPayTime() {
		return payTime;
	}
	public void setPayTime(Date payTime) {
		this.payTime = payTime;
	}
	public String getClentId() {
		return clentId;
	}
	public void setClentId(String clentId) {
		this.clentId = clentId;
	}
	public String getPolicyNo() {
		return policyNo;
	}
	public void setPolicyNo(String policyNo) {
		this.policyNo = policyNo;
	}
	public Double getAmonut() {
		return amonut;
	}
	public void setAmonut(Double amonut) {
		this.amonut = amonut;
	}
	public String getLastNo() {
		return lastNo;
	}
	public void setLastNo(String lastNo) {
		this.lastNo = lastNo;
	}
	public String getInsureName() {
		return insureName;
	}
	public void setInsureName(String insureName) {
		this.insureName = insureName;
	}
	public String getInsureCardNo() {
		return insureCardNo;
	}
	public void setInsureCardNo(String insureCardNo) {
		this.insureCardNo = insureCardNo;
	}
	public String getInsurePhone() {
		return insurePhone;
	}
	public void setInsurePhone(String insurePhone) {
		this.insurePhone = insurePhone;
	}
	public String getInsureAddress() {
		return insureAddress;
	}
	public void setInsureAddress(String insureAddress) {
		this.insureAddress = insureAddress;
	}
	public String getInsurePostcode() {
		return insurePostcode;
	}
	public void setInsurePostcode(String insurePostcode) {
		this.insurePostcode = insurePostcode;
	}
	public String getInsureEmail() {
		return insureEmail;
	}
	public void setInsureEmail(String insureEmail) {
		this.insureEmail = insureEmail;
	}
	public String getInsuredName() {
		return insuredName;
	}
	public void setInsuredName(String insuredName) {
		this.insuredName = insuredName;
	}
	public String getInsuredCardNo() {
		return insuredCardNo;
	}
	public void setInsuredCardNo(String insuredCardNo) {
		this.insuredCardNo = insuredCardNo;
	}
	public String getInsuredPhone() {
		return insuredPhone;
	}
	public void setInsuredPhone(String insuredPhone) {
		this.insuredPhone = insuredPhone;
	}
	public String getInsuredAddress() {
		return insuredAddress;
	}
	public void setInsuredAddress(String insuredAddress) {
		this.insuredAddress = insuredAddress;
	}
	public String getInsuredPostcode() {
		return insuredPostcode;
	}
	public void setInsuredPostcode(String insuredPostcode) {
		this.insuredPostcode = insuredPostcode;
	}
	public String getInsuredEmail() {
		return insuredEmail;
	}
	public void setInsuredEmail(String insuredEmail) {
		this.insuredEmail = insuredEmail;
	}
	public String getBenefitName() {
		return benefitName;
	}
	public void setBenefitName(String benefitName) {
		this.benefitName = benefitName;
	}
	public String getBenefitCardNo() {
		return benefitCardNo;
	}
	public void setBenefitCardNo(String benefitCardNo) {
		this.benefitCardNo = benefitCardNo;
	}
	public String getBenefitPhone() {
		return benefitPhone;
	}
	public void setBenefitPhone(String benefitPhone) {
		this.benefitPhone = benefitPhone;
	}
	public String getBenefitAddress() {
		return benefitAddress;
	}
	public void setBenefitAddress(String benefitAddress) {
		this.benefitAddress = benefitAddress;
	}
	public String getBenefitPostcode() {
		return benefitPostcode;
	}
	public void setBenefitPostcode(String benefitPostcode) {
		this.benefitPostcode = benefitPostcode;
	}
	public String getBenefitEmail() {
		return benefitEmail;
	}
	public void setBenefitEmail(String benefitEmail) {
		this.benefitEmail = benefitEmail;
	}
	public String getInsurProductId() {
		return insurProductId;
	}
	public void setInsurProductId(String insurProductId) {
		this.insurProductId = insurProductId;
	}
	public String getEnterpriseType() {
		return enterpriseType;
	}
	public void setEnterpriseType(String enterpriseType) {
		this.enterpriseType = enterpriseType;
	}
	public String getBusinessContent() {
		return businessContent;
	}
	public void setBusinessContent(String businessContent) {
		this.businessContent = businessContent;
	}
	public String getOpenAddress() {
		return openAddress;
	}
	public void setOpenAddress(String openAddress) {
		this.openAddress = openAddress;
	}
	public Date getStartTime() {
		return startTime;
	}
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
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
