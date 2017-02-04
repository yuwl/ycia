/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.agent.dao;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.agent.entity.AgentAccount;
import com.thinkgem.jeesite.modules.agent.entity.AgentAccountR;

/**
 * 代理人账户DAO接口
 * @author Leo
 * @version 2016-09-02
 */
@MyBatisDao
public interface AgentAccountDao extends CrudDao<AgentAccount> {
	/**
	 * 获取代理人账户
	 * @param id
	 * @return
	 */
	AgentAccount getAccountByAgentId(String id);

	//Page<AgentAccount> findPageFinance(Page<AgentAccount> page, AgentAccount agentAccount);

	List<AgentAccount> findListFinance(AgentAccount agentAccount);
}