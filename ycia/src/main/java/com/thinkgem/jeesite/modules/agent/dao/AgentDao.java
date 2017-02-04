/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.agent.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.agent.entity.Agent;

/**
 * 代理人DAO接口
 * @author Leo
 * @version 2016-09-02
 */
@MyBatisDao
public interface AgentDao extends CrudDao<Agent> {

	Agent getByUserId(String id);
	
	/**
	 * 获取单条数据
	 * @param entity
	 * @return
	 */
	public Agent getAgentId(Agent entity);
	
}