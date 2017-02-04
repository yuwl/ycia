/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.agent.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.agent.entity.AgentAccount;
import com.thinkgem.jeesite.modules.agent.entity.AgentAccountR;
import com.thinkgem.jeesite.modules.agent.dao.AgentAccountDao;

/**
 * 代理人账户Service
 * @author Leo
 * @version 2016-09-02
 */
@Service
@Transactional(readOnly = true)
public class AgentAccountService extends CrudService<AgentAccountDao, AgentAccount> {

	public AgentAccount get(String id) {
		return super.get(id);
	}
	
	public List<AgentAccount> findList(AgentAccount agentAccount) {
		return super.findList(agentAccount);
	}
	
	public Page<AgentAccount> findPage(Page<AgentAccount> page, AgentAccount agentAccount) {
		return super.findPage(page, agentAccount);
	}
	
	@Transactional(readOnly = false)
	public void save(AgentAccount agentAccount) {
		super.save(agentAccount);
	}
	
	@Transactional(readOnly = false)
	public void delete(AgentAccount agentAccount) {
		super.delete(agentAccount);
	}

	public AgentAccount getAccountByAgentId(String id) {
		// TODO Auto-generated method stub
		return dao.getAccountByAgentId(id);
	}

	public Page<AgentAccount> findPageFinance(Page<AgentAccount> page, AgentAccount agentAccount) {
		// TODO Auto-generated method stub
		agentAccount.setPage(page);
		page.setList(dao.findListFinance(agentAccount));
		return page;
		//return dao.findPageFinance(page,agentAccount);
	}
	
}