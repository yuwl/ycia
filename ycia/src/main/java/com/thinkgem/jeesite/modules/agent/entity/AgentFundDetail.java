/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.agent.entity;

import javax.validation.constraints.NotNull;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 资金明细Entity
 * @author Leo
 * @version 2016-09-02
 */
public class AgentFundDetail extends DataEntity<AgentFundDetail> {
	
	private static final long serialVersionUID = 1L;
	private String agentId;		// agent_id
	private Double money;		// 交易金额
	private Date tradeTime;		// 交易时间
	private String imgUrl;		// 交易凭证
	private String tradeType;		// 交易类型
	private String tradeStatus;		// 交易状态
	private String operateBy;		// 操作人
	
	public AgentFundDetail() {
		super();
	}

	public AgentFundDetail(String id){
		super(id);
	}

	@NotNull(message="agent_id不能为空")
	public String getAgentId() {
		return agentId;
	}

	public void setAgentId(String agentId) {
		this.agentId = agentId;
	}
	
	public Double getMoney() {
		return money;
	}

	public void setMoney(Double money) {
		this.money = money;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getTradeTime() {
		return tradeTime;
	}

	public void setTradeTime(Date tradeTime) {
		this.tradeTime = tradeTime;
	}
	
	@Length(min=0, max=300, message="交易凭证长度必须介于 0 和 300 之间")
	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	
	@Length(min=0, max=1, message="交易类型长度必须介于 0 和 1 之间")
	public String getTradeType() {
		return tradeType;
	}

	public void setTradeType(String tradeType) {
		this.tradeType = tradeType;
	}
	
	@Length(min=0, max=1, message="交易状态长度必须介于 0 和 1 之间")
	public String getTradeStatus() {
		return tradeStatus;
	}

	public void setTradeStatus(String tradeStatus) {
		this.tradeStatus = tradeStatus;
	}
	
	@Length(min=0, max=100, message="操作人长度必须介于 0 和 100 之间")
	public String getOperateBy() {
		return operateBy;
	}

	public void setOperateBy(String operateBy) {
		this.operateBy = operateBy;
	}
	
}