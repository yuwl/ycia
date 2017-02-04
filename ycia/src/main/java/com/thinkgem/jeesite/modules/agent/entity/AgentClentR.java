
/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.agent.entity;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.jeesite.common.persistence.DataEntity;
/**
 * 代理人客户Entity
 * @author Leo
 * @version 2016-09-02
 */
public class AgentClentR extends DataEntity<AgentClent>{
	
		private static final long serialVersionUID = 1L;
		private String agentName;
		private String agentId;		// 所属代理人
		private String clientName;		// 客户名称
		private String clientType;		// 客户类型
		private String phone;		// 联系电话
		private String address;		// 联系地址
		private String postcode;		// 邮政编码
		private String email;		// 电子邮箱
		private String cardType;		// 证件类型
		private String cardNo;		// 证件号码
		private String photoFront;		// 身份证正面照
		private String photoBack;		// 身份证反面照
		private Date createTime;		// 创建时间
		private Date updateTime;		// 更新时间
		private Integer userId;		// user_id
		
		public AgentClentR() {
			super();
		}

		public AgentClentR(String id){
			super(id);
		}

		public String getAgentId() {
			return agentId;
		}

		public void setAgentId(String agentId) {
			this.agentId = agentId;
		}
		
		@Length(min=0, max=100, message="客户名称长度必须介于 0 和 100 之间")
		public String getClientName() {
			return clientName;
		}

		public void setClientName(String clientName) {
			this.clientName = clientName;
		}
		
		@Length(min=0, max=1, message="客户类型长度必须介于 0 和 1 之间")
		public String getClientType() {
			return clientType;
		}

		public void setClientType(String clientType) {
			this.clientType = clientType;
		}
		
		@Length(min=0, max=50, message="联系电话长度必须介于 0 和 50 之间")
		public String getPhone() {
			return phone;
		}

		public void setPhone(String phone) {
			this.phone = phone;
		}
		
		@Length(min=0, max=200, message="联系地址长度必须介于 0 和 200 之间")
		public String getAddress() {
			return address;
		}

		public void setAddress(String address) {
			this.address = address;
		}
		
		@Length(min=0, max=10, message="邮政编码长度必须介于 0 和 10 之间")
		public String getPostcode() {
			return postcode;
		}

		public void setPostcode(String postcode) {
			this.postcode = postcode;
		}
		
		@Length(min=0, max=100, message="电子邮箱长度必须介于 0 和 100 之间")
		public String getEmail() {
			return email;
		}

		public void setEmail(String email) {
			this.email = email;
		}
		
		@Length(min=0, max=1, message="证件类型长度必须介于 0 和 1 之间")
		public String getCardType() {
			return cardType;
		}

		public void setCardType(String cardType) {
			this.cardType = cardType;
		}
		
		@Length(min=0, max=50, message="证件号码长度必须介于 0 和 50 之间")
		public String getCardNo() {
			return cardNo;
		}

		public void setCardNo(String cardNo) {
			this.cardNo = cardNo;
		}
		
		@Length(min=0, max=200, message="身份证正面照长度必须介于 0 和 200 之间")
		public String getPhotoFront() {
			return photoFront;
		}

		public void setPhotoFront(String photoFront) {
			this.photoFront = photoFront;
		}
		
		@Length(min=0, max=200, message="身份证反面照长度必须介于 0 和 200 之间")
		public String getPhotoBack() {
			return photoBack;
		}

		public void setPhotoBack(String photoBack) {
			this.photoBack = photoBack;
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
		
		public Integer getUserId() {
			return userId;
		}

		public void setUserId(Integer userId) {
			this.userId = userId;
		}

		public String getAgentName() {
			return agentName;
		}

		public void setAgentName(String agentName) {
			this.agentName = agentName;
		}
		
	
}
