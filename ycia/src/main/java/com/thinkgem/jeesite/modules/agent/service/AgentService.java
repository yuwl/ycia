/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.agent.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.agent.entity.Agent;
import com.thinkgem.jeesite.modules.agent.entity.AgentAccount;
import com.thinkgem.jeesite.modules.agent.entity.AgentFundDetail;
import com.thinkgem.jeesite.modules.sys.dao.UserDao;
import com.thinkgem.jeesite.modules.sys.entity.Role;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.agent.dao.AgentDao;

/**
 * 代理人Service
 * @author Leo
 * @version 2016-09-02
 */
@Service
@Transactional(readOnly = true)
public class AgentService extends CrudService<AgentDao, Agent> {

	@Autowired
	private AgentAccountService agentAccountService;
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private AgentFundDetailService agentFundDetailService;
	
	public Agent getByUserId(String id) {
		// TODO Auto-generated method stub
		return dao.getByUserId(id);
	}
	public Agent get(String id) {
		return super.get(id);
	}
	
	public Agent getAgentId(Agent agent) {
		return dao.getAgentId(agent);
	}
	
	public List<Agent> findList(Agent agent) {
		return super.findList(agent);
	}
	
	public Page<Agent> findPage(Page<Agent> page, Agent agent) {
		return super.findPage(page, agent);
	}
	
	@Transactional(readOnly = false)
	public void save(Agent agent) {
		super.save(agent);
	}
	
	@Transactional(readOnly = false)
	public void delete(Agent agent) {
		super.delete(agent);
	}
	@Transactional(readOnly = false)
	public void saveAgentUserAndAccount(Agent agent, User user) {
		int resCode = userDao.insertUser(user);
		
			//System.out.println(resCode+"===="+user.getId());
			agent.setUserId(user.getId());
			int res = dao.insert(agent);
			AgentAccount aacount = new AgentAccount();
			aacount.setAgentId(agent.getId());
			aacount.setCompanyId(agent.getOfficeId());
			aacount.setCreateTime(new Date());
			aacount.setBalance(0.0);
			aacount.setIncome(0.0);
			aacount.setWithdraw(0.0);
			agentAccountService.save(aacount);
			User queryUser = new User();
			if(!agent.getMobile().equals("")){
				queryUser.setMobile(agent.getMobile());
				User resUser=userDao.getByMobile(queryUser);
				Agent ag = dao.getByUserId(resUser.getId());
				AgentAccount aa= agentAccountService.getAccountByAgentId(ag.getId());
				aa.setIncome(aa.getIncome()+10.0);
				aa.setBalance(aa.getBalance()+10.0);
				aa.setUpdateTime(new Date());
				agentAccountService.save(aa);
				AgentFundDetail agentFundDetail = new AgentFundDetail();
				agentFundDetail.setAgentId(aa.getAgentId());
				agentFundDetail.setMoney(10.0);
				agentFundDetail.setTradeType("2");
				agentFundDetail.setTradeStatus("2");
				agentFundDetail.setTradeTime(new Date());
				agentFundDetail.setOperateBy(user.getName());
				agentFundDetailService.save(agentFundDetail);
			}
				
			
			//System.out.println(res);
		
	}
	@Transactional(readOnly = false)
	public void saveAgentUser(Agent agent, User user) {
		super.save(agent);
		userDao.updateUser(user);
		if(agent.getDelFlag().equals("0")){
			user.setRole(new Role("0924cb3da3cf46e7a847d5e95bd854a9"));
			userDao.insUserRole(user);
		}
		
	}
	
}