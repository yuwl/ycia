/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.agent.entity;

import javax.validation.constraints.NotNull;
import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 代理人Entity
 * @author Leo
 * @version 2016-09-02
 */
public class Agent extends DataEntity<Agent> {
	
	private static final long serialVersionUID = 1L;
	private String userId;		// user_id
	private String officeId;		// 所属部门
	private String name;		// 代理人姓名
	private String cardType;		// 证件类型
	private String cardNo;		// 证件号码
	private String photoFront;		// 身份证正面照
	private String photoBack;		// 身份证反面照
	private Double rate;		// 佣金费率
	private Date createTime;		// 创建时间
	private Date updateTime;		// 更新时间
	private String remark;		// 备注
	private String mobile;		// 被推荐人手机号
	
	public Agent() {
		super();
	}

	public Agent(String id){
		super(id);
	}

	@NotNull(message="user_id不能为空")
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	@Length(min=1, max=100, message="所属部门长度必须介于 1 和 100 之间")
	public String getOfficeId() {
		return officeId;
	}

	public void setOfficeId(String officeId) {
		this.officeId = officeId;
	}
	
	@Length(min=1, max=100, message="代理人姓名长度必须介于 1 和 100 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=0, max=1, message="证件类型长度必须介于 0 和 1 之间")
	public String getCardType() {
		return cardType;
	}

	public void setCardType(String cardType) {
		this.cardType = cardType;
	}
	
	@Length(min=0, max=100, message="证件号码长度必须介于 0 和 100 之间")
	public String getCardNo() {
		return cardNo;
	}

	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}
	
	@Length(min=0, max=500, message="身份证正面照长度必须介于 0 和 500 之间")
	public String getPhotoFront() {
		return photoFront;
	}

	public void setPhotoFront(String photoFront) {
		this.photoFront = photoFront;
	}
	
	@Length(min=0, max=500, message="身份证反面照长度必须介于 0 和 500 之间")
	public String getPhotoBack() {
		return photoBack;
	}

	public void setPhotoBack(String photoBack) {
		this.photoBack = photoBack;
	}
	
	public Double getRate() {
		return rate;
	}

	public void setRate(Double rate) {
		this.rate = rate;
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
	
	@Length(min=0, max=255, message="备注长度必须介于 0 和 255 之间")
	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	@Length(min=0, max=50, message="被推荐人手机号长度必须介于 0 和 50 之间")
	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	
}