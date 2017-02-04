/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.agent.web;

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
import com.thinkgem.jeesite.modules.agent.entity.AgentClent;
import com.thinkgem.jeesite.modules.agent.service.AgentClentService;
import com.thinkgem.jeesite.modules.agent.service.AgentService;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 代理人客户Controller
 * @author Leo
 * @version 2016-09-02
 */
@Controller
@RequestMapping(value = "${adminPath}/agent/agentClent")
public class AgentClentController extends BaseController {

	@Autowired
	private AgentClentService agentClentService;
	
	@Autowired
	private AgentService agentService;
	
	@ModelAttribute
	public AgentClent get(@RequestParam(required=false) String id) {
		AgentClent entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = agentClentService.get(id);
		}
		if (entity == null){
			entity = new AgentClent();
		}
		return entity;
	}
	
	@RequiresPermissions("agent:agentClent:view")
	@RequestMapping(value = {"list", ""})
	public String list(AgentClent agentClent, HttpServletRequest request, HttpServletResponse response, Model model) {
		User user = UserUtils.getUser();
		Agent agent = new Agent();
		agent.setUserId(user.getId());
		agent = agentService.getAgentId(agent);
		
		if(agent!=null){
			agentClent.setAgentId(agent.getId());
		}
		Page<AgentClent> qpage = new Page<AgentClent>(request, response);
				//qpage.setOrderBy("a.create_time desc");
		Page<AgentClent> page = agentClentService.findPage(qpage, agentClent); 
		
		model.addAttribute("page", page);
		return "modules/agent/agentClentList";
	}

	@RequiresPermissions("agent:agentClent:view")
	@RequestMapping(value = "form")
	public String form(AgentClent agentClent, Model model) {
		model.addAttribute("agentClent", agentClent);
		return "modules/agent/agentClentForm";
	}

	@RequiresPermissions("agent:agentClent:view")
	@RequestMapping(value = "formv")
	public String formv(AgentClent agentClent, Model model,String chakan) {
		model.addAttribute("agentClent", agentClent);
		model.addAttribute("chakan", chakan);
		return "modules/agent/agentClentForm";
	}
	
	@RequiresPermissions("agent:agentClent:edit")
	@RequestMapping(value = "save")
	public String save(AgentClent agentClent, Model model, RedirectAttributes redirectAttributes,HttpServletRequest request, HttpServletResponse response) {
		if (!beanValidator(model, agentClent)){
			return form(agentClent, model);
		}else{
			User user = UserUtils.getUser();
			Agent entity=agentService.getByUserId(user.getId());
			agentClent.setAgentId(entity.getId());
			//agentClent.setAgentId(user.);
			agentClentService.save(agentClent);
			addMessage(redirectAttributes, "保存代理人客户成功");
			return "redirect:"+Global.getAdminPath()+"/agent/agentClent/?repage";
		}
		
	}
	
	@RequiresPermissions("agent:agentClent:edit")
	@RequestMapping(value = "delete")
	public String delete(AgentClent agentClent, RedirectAttributes redirectAttributes) {
		agentClentService.delete(agentClent);
		addMessage(redirectAttributes, "删除代理人客户成功");
		return "redirect:"+Global.getAdminPath()+"/agent/agentClent/?repage";
	}

}