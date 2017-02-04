/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.insur.entity;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * insur_product_companyEntity
 * @author ttat
 * @version 2016-09-02
 */
public class InsurProductCompany extends DataEntity<InsurProductCompany> {
	
	private static final long serialVersionUID = 1L;
	private String tbId;		// id
	private String productId;		// 险种
	private String companyId;		// 保险公司
	private String bankOpen;		// 银行卡开户行
	private String bankCardNo;		// 银行卡卡号
	private String bankCardName;		// 银行卡户名
	private Date createTime;		// 创建时间
	
	public InsurProductCompany() {
		super();
	}

	public InsurProductCompany(String id){
		super(id);
	}

	public String getTbId() {
		return tbId;
	}

	public void setTbId(String tbId) {
		this.tbId = tbId;
	}

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public String getCompanyId() {
		return companyId;
	}

	public void setCompanyId(String companyId) {
		this.companyId = companyId;
	}

	@Length(min=0, max=200, message="银行卡开户行长度必须介于 0 和 200 之间")
	public String getBankOpen() {
		return bankOpen;
	}

	public void setBankOpen(String bankOpen) {
		this.bankOpen = bankOpen;
	}
	
	@Length(min=0, max=100, message="银行卡卡号长度必须介于 0 和 100 之间")
	public String getBankCardNo() {
		return bankCardNo;
	}

	public void setBankCardNo(String bankCardNo) {
		this.bankCardNo = bankCardNo;
	}
	
	@Length(min=0, max=100, message="银行卡户名长度必须介于 0 和 100 之间")
	public String getBankCardName() {
		return bankCardName;
	}

	public void setBankCardName(String bankCardName) {
		this.bankCardName = bankCardName;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
}