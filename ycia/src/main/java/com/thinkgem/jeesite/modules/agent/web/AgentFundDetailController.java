/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.agent.web;

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
import com.thinkgem.jeesite.modules.agent.entity.AgentFundDetail;
import com.thinkgem.jeesite.modules.agent.service.AgentAccountService;
import com.thinkgem.jeesite.modules.agent.service.AgentFundDetailService;
import com.thinkgem.jeesite.modules.agent.service.AgentService;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 资金明细Controller
 * @author Leo
 * @version 2016-09-02
 */
@Controller
@RequestMapping(value = "${adminPath}/agent/agentFundDetail")
public class AgentFundDetailController extends BaseController {

	@Autowired
	private AgentFundDetailService agentFundDetailService;
	
	@Autowired
	private AgentAccountService agentAccountService;
	
	@Autowired
	private AgentService agentService;
	
	@ModelAttribute
	public AgentFundDetail get(@RequestParam(required=false) String id) {
		AgentFundDetail entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = agentFundDetailService.get(id);
		}
		if (entity == null){
			entity = new AgentFundDetail();
		}
		return entity;
	}
	
	@RequiresPermissions("agent:agentFundDetail:view")
	@RequestMapping(value = {"list", ""})
	public String list(AgentFundDetail agentFundDetail, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<AgentFundDetail> page = agentFundDetailService.findPage(new Page<AgentFundDetail>(request, response), agentFundDetail); 
		model.addAttribute("page", page);
		return "modules/agent/agentFundDetailList";
	}

	@RequiresPermissions("agent:agentFundDetail:view")
	@RequestMapping(value = "form")
	public String form(AgentFundDetail agentFundDetail, Model model) {
		Agent agent = new Agent();
		agent = agentService.get(agentFundDetail.getAgentId());
		model.addAttribute("agentFundDetail", agentFundDetail);
		model.addAttribute("agentName", agent.getName());
		return "modules/agent/agentFundDetailForm";
	}

	@RequiresPermissions("caiwu:agentFundDetail:view")
	@RequestMapping(value = "formv")
	public String formv(AgentFundDetail agentFundDetail, Model model) {
		Agent agent = new Agent();
		agent = agentService.get(agentFundDetail.getAgentId());
		model.addAttribute("agentFundDetail", agentFundDetail);
		model.addAttribute("agentName", agent.getName());
		return "modules/finance/agentFundDetailFormv";
	}
	
	@RequiresPermissions("agent:agentFundDetail:edit")
	@RequestMapping(value = "paybackSave")
	public String paybackSave(AgentFundDetail agentFundDetail, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, agentFundDetail)){
			return form(agentFundDetail, model);
		}
		User user = UserUtils.getUser();
		agentFundDetail.setOperateBy(user.getName());
		Date date = new Date();
		agentFundDetail.setTradeTime(date);
		agentFundDetail.setTradeStatus("1");
		//agentFundDetailService.save(agentFundDetail);
		AgentAccount aacount = agentAccountService.getAccountByAgentId(agentFundDetail.getAgentId());
		aacount.setBalance(aacount.getBalance()-agentFundDetail.getMoney());
		aacount.setWithdraw(aacount.getWithdraw()+agentFundDetail.getMoney());
		aacount.setUpdateTime(new Date());
		agentFundDetailService.savePayback(agentFundDetail,aacount);
		//agentFundDetailService.save(agentFundDetail);
		//agentAccountService.save(aacount);
		
		addMessage(redirectAttributes, "回款成功 ");
		return "redirect:"+Global.getAdminPath()+"/agent/agentAccount/financeMgrList";
	}
	@RequiresPermissions("agent:agentFundDetail:edit")
	@RequestMapping(value = "save")
	public String save(AgentFundDetail agentFundDetail, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, agentFundDetail)){
			return form(agentFundDetail, model);
		}
		User user = UserUtils.getUser();
		agentFundDetail.setOperateBy(user.getName());
		Date date = new Date();
		agentFundDetail.setTradeTime(date);
		agentFundDetailService.save(agentFundDetail);
		addMessage(redirectAttributes, "保存资金明细成功 ");
		return "redirect:"+Global.getAdminPath()+"/agent/agentFundDetail/?repage";
	}
	
	@RequiresPermissions("agent:agentFundDetail:edit")
	@RequestMapping(value = "delete")
	public String delete(AgentFundDetail agentFundDetail, RedirectAttributes redirectAttributes) {
		agentFundDetailService.delete(agentFundDetail);
		addMessage(redirectAttributes, "删除资金明细成功");
		return "redirect:"+Global.getAdminPath()+"/agent/agentFundDetail/?repage";
	}

}