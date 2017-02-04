/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.agent.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.agent.entity.AgentClent;
import com.thinkgem.jeesite.modules.agent.dao.AgentClentDao;

/**
 * 代理人客户Service
 * @author Leo
 * @version 2016-09-02
 */
@Service
@Transactional(readOnly = true)
public class AgentClentService extends CrudService<AgentClentDao, AgentClent> {

	public AgentClent get(String id) {
		return super.get(id);
	}
	
	public List<AgentClent> findList(AgentClent agentClent) {
		return super.findList(agentClent);
	}
	
	public Page<AgentClent> findPage(Page<AgentClent> page, AgentClent agentClent) {
		return super.findPage(page, agentClent);
	}
	
	@Transactional(readOnly = false)
	public void save(AgentClent agentClent) {
		super.save(agentClent);
	}
	
	@Transactional(readOnly = false)
	public void delete(AgentClent agentClent) {
		super.delete(agentClent);
	}
	
}