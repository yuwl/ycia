/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.agent.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.agent.entity.AgentClent;

/**
 * 代理人客户DAO接口
 * @author Leo
 * @version 2016-09-02
 */
@MyBatisDao
public interface AgentClentDao extends CrudDao<AgentClent> {
	
}