/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.agent.web;

import java.io.UnsupportedEncodingException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.agent.entity.Agent;
import com.thinkgem.jeesite.modules.agent.entity.AgentAccount;
import com.thinkgem.jeesite.modules.agent.entity.AgentAccountR;
import com.thinkgem.jeesite.modules.agent.entity.AgentFundDetail;
import com.thinkgem.jeesite.modules.agent.service.AgentAccountService;
import com.thinkgem.jeesite.modules.agent.service.AgentFundDetailService;
import com.thinkgem.jeesite.modules.agent.service.AgentService;
import com.thinkgem.jeesite.modules.order.entity.Orders;
import com.thinkgem.jeesite.modules.order.service.OrdersService;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 代理人账户Controller
 * @author Leo
 * @version 2016-09-02
 */
@Controller
@RequestMapping(value = "${adminPath}/agent/agentAccount")
public class AgentAccountController extends BaseController {

	@Autowired
	private AgentAccountService agentAccountService;
	
	@Autowired
	private AgentService agentService;
	
	@Autowired
	private AgentFundDetailService agentFundDetailService;
	
	@Autowired
	private OrdersService ordersService;
	
	@ModelAttribute
	public AgentAccount get(@RequestParam(required=false) String id) {
		AgentAccount entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = agentAccountService.get(id);
		}
		if (entity == null){
			entity = new AgentAccount();
		}
		return entity;
	}
	
	@RequiresPermissions("agent:agentAccount:view")
	@RequestMapping(value = {"list", ""})
	public String list(AgentAccount agentAccount,Orders orders,AgentFundDetail agentFundDetail, HttpServletRequest request, HttpServletResponse response, Model model) {
		User user = UserUtils.getUser();
		Agent agent = new Agent();
		agent.setUserId(user.getId());
		agent = agentService.getAgentId(agent);
		AgentAccount account = agentAccountService.getAccountByAgentId(agent.getId());
		/*if(account==null){
			account = new AgentAccount();
			account.setAgentId(agent.getId());
			account.setCompanyId(user.getCompany().getId());
			account.setBalance(0.0);
			account.setIncome(0.0);
			account.setWithdraw(0.0);
			agentAccountService.save(account);
		}*/
		agentFundDetail.setAgentId(agent.getId());
		//orders.setAgentId(agent.getId());
		//Page<Orders> pageod = ordersService.findPage(new Page<Orders>(request, response), orders);
		
		//Page<AgentAccount> page = agentAccountService.findPage(new Page<AgentAccount>(request, response), agentAccount); 
		Page<AgentFundDetail> page = agentFundDetailService.findPage(new Page<AgentFundDetail>(request, response), agentFundDetail);
		model.addAttribute("page", page);
		model.addAttribute("agentAccount", account);
		return "modules/agent/agentAccountList";
	}

	@RequiresPermissions("caiwu:agentAccount:view")
	@RequestMapping(value = {"financeMgrList"})
	public String financeMgrList(AgentAccount agentAccount,Orders orders,AgentFundDetail agentFundDetail, HttpServletRequest request, HttpServletResponse response, Model model) {
		User user = UserUtils.getUser();
		Agent agent = new Agent();
		agent.setUserId(user.getId());
		agent = agentService.getAgentId(agent);
		//AgentAccount account = agentAccountService.getAccountByAgentId(agent.getId());
		//if(account==null){
		//	account = new AgentAccount();
		//	account.setAgentId(agent.getId());
		//	agentAccountService.save(account);
		//}
		//agentFundDetail.setAgentId(agent.getId());
		//orders.setAgentId(agent.getId());
		//Page<Orders> pageod = ordersService.findPage(new Page<Orders>(request, response), orders);
		agentAccount.setCompanyId(user.getCompany().getId());
		Page<AgentAccount> page = agentAccountService.findPageFinance(new Page<AgentAccount>(request, response), agentAccount); 
		//Page<AgentFundDetail> page = agentFundDetailService.findPage(new Page<AgentFundDetail>(request, response), agentFundDetail);
		model.addAttribute("page", page);
		//model.addAttribute("agentAccount", agentAccount);
		return "modules/finance/financeMgrList";
	}
	
	@RequiresPermissions("caiwu:agentAccount:view")
	@RequestMapping(value = {"financeWithdrawList"})
	public String financeWithdrawList(AgentAccount agentAccount,Orders orders,AgentFundDetail agentFundDetail, HttpServletRequest request, HttpServletResponse response, Model model) {
		String agentId = request.getParameter("agentId");
		//User user = UserUtils.getUser();
		Agent agent = agentService.get(agentId);
		AgentAccount account = agentAccountService.getAccountByAgentId(agentId);
		//if(account==null){
		//	account = new AgentAccount();
		//	account.setAgentId(agent.getId());
		//	agentAccountService.save(account);
		//}
		agentFundDetail.setAgentId(agentId);
		agentFundDetail.setTradeType("1");
		agentFundDetail.setTradeStatus("0");
		//orders.setAgentId(agent.getId());
		//Page<Orders> pageod = ordersService.findPage(new Page<Orders>(request, response), orders);
		//agentAccount.setCompanyId(user.getCompany().getId());
		//Page<AgentAccount> page = agentAccountService.findPageFinance(new Page<AgentAccount>(request, response), agentAccount); 
		Page<AgentFundDetail> page = agentFundDetailService.findPage(new Page<AgentFundDetail>(request, response), agentFundDetail);
		model.addAttribute("page", page);
		model.addAttribute("agentAccount", account);
		model.addAttribute("agentName", agent.getName());
		return "modules/finance/financeWithdrawList";
	}
	@RequiresPermissions("caiwu:agentAccount:view")
	@RequestMapping(value = {"financeWithdrawDetailList"})
	public String financeWithdrawDetailList(AgentAccount agentAccount,Orders orders,AgentFundDetail agentFundDetail, HttpServletRequest request, HttpServletResponse response, Model model) {
		String agentId = request.getParameter("agentId");
		//User user = UserUtils.getUser();
		Agent agent = agentService.get(agentId);
		AgentAccount account = agentAccountService.getAccountByAgentId(agentId);
		//if(account==null){
		//	account = new AgentAccount();
		//	account.setAgentId(agent.getId());
		//	agentAccountService.save(account);
		//}
		agentFundDetail.setAgentId(agentId);
		agentFundDetail.setTradeType("1");
		//orders.setAgentId(agent.getId());
		//Page<Orders> pageod = ordersService.findPage(new Page<Orders>(request, response), orders);
		//agentAccount.setCompanyId(user.getCompany().getId());
		//Page<AgentAccount> page = agentAccountService.findPageFinance(new Page<AgentAccount>(request, response), agentAccount); 
		Page<AgentFundDetail> page = agentFundDetailService.findPage(new Page<AgentFundDetail>(request, response), agentFundDetail);
		model.addAttribute("page", page);
		model.addAttribute("agentAccount", account);
		model.addAttribute("agentName", agent.getName());
		return "modules/finance/financeWithdrawList";
	}
	
	public String encodeStr(String str) {
		try {

			return java.net.URLDecoder.decode(str, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return null;
		}
	}
	@RequiresPermissions("agent:agentAccount:view")
	@RequestMapping(value = "form")
	public String form(AgentAccount agentAccount, Model model) {
		model.addAttribute("agentAccount", agentAccount);
		return "modules/agent/agentAccountForm";
	}

	@RequiresPermissions("agent:agentAccount:edit")
	@RequestMapping(value = "save")
	public String save(AgentAccount agentAccount, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, agentAccount)){
			return form(agentAccount, model);
		}
		agentAccountService.save(agentAccount);
		addMessage(redirectAttributes, "保存保存代理人账户成功成功");
		return "redirect:"+Global.getAdminPath()+"/agent/agentAccount/?repage";
	}
	/**
	 * 提现申请提交并保存提现资金明细
	 * @param agentFundDetail
	 * @param model
	 * @param redirectAttributes
	 * @return
	 */
	@RequiresPermissions("agent:agentFundDetail:edit")
	@RequestMapping(value = "saveFundDetail")
	public String saveFundDetail(AgentFundDetail agentFundDetail,AgentAccount agentAccount, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, agentFundDetail)){
			return form(agentAccount, model);
		}
		User user = UserUtils.getUser();
		agentFundDetail.setOperateBy(user.getName());
		Date date = new Date();
		agentFundDetail.setTradeTime(date);
		agentFundDetail.setTradeStatus("0");
		agentFundDetailService.save(agentFundDetail);
		addMessage(redirectAttributes, "提现申请已提交，请等待财务人员核实并回款");
		return "redirect:"+Global.getAdminPath()+"/agent/agentAccount/?repage";
	}
	
	@RequiresPermissions("agent:agentAccount:edit")
	@RequestMapping(value = "delete")
	public String delete(AgentAccount agentAccount, RedirectAttributes redirectAttributes) {
		agentAccountService.delete(agentAccount);
		addMessage(redirectAttributes, "删除保存代理人账户成功成功");
		return "redirect:"+Global.getAdminPath()+"/agent/agentAccount/?repage";
	}

}