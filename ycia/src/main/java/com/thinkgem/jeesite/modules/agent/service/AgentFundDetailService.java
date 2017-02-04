/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.agent.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.agent.entity.AgentAccount;
import com.thinkgem.jeesite.modules.agent.entity.AgentFundDetail;
import com.thinkgem.jeesite.modules.agent.dao.AgentFundDetailDao;

/**
 * 资金明细Service
 * @author Leo
 * @version 2016-09-02
 */
@Service
@Transactional(readOnly = true)
public class AgentFundDetailService extends CrudService<AgentFundDetailDao, AgentFundDetail> {
	@Autowired
	private AgentAccountService agentAccountService;
	
	public AgentFundDetail get(String id) {
		return super.get(id);
	}
	
	public List<AgentFundDetail> findList(AgentFundDetail agentFundDetail) {
		return super.findList(agentFundDetail);
	}
	
	public Page<AgentFundDetail> findPage(Page<AgentFundDetail> page, AgentFundDetail agentFundDetail) {
		return super.findPage(page, agentFundDetail);
	}
	
	@Transactional(readOnly = false)
	public void save(AgentFundDetail agentFundDetail) {
		super.save(agentFundDetail);
	}
	
	@Transactional(readOnly = false)
	public void delete(AgentFundDetail agentFundDetail) {
		super.delete(agentFundDetail);
	}
	@Transactional(readOnly = false)
	public void savePayback(AgentFundDetail agentFundDetail, AgentAccount aacount) {
		// TODO Auto-generated method stub
		super.save(agentFundDetail);
		agentAccountService.save(aacount);
	}
	
}