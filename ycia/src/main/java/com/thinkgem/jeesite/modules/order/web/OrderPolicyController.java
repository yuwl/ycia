/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.order.web;

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
import com.thinkgem.jeesite.modules.agent.service.AgentService;
import com.thinkgem.jeesite.modules.order.entity.OrderPolicy;
import com.thinkgem.jeesite.modules.order.service.OrderPolicyService;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 保单管理Controller
 * @author ttat
 * @version 2016-09-02
 */
@Controller
@RequestMapping(value = "${adminPath}/order/orderPolicy")
public class OrderPolicyController extends BaseController {

	@Autowired
	private OrderPolicyService orderPolicyService;
	
	@Autowired
	private AgentService agentService;
	
	@ModelAttribute
	public OrderPolicy get(@RequestParam(required=false) String id) {
		OrderPolicy entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = orderPolicyService.get(id);
		}
		if (entity == null){
			entity = new OrderPolicy();
		}
		return entity;
	}
	
	@RequiresPermissions("order:orderPolicy:view")
	@RequestMapping(value = {"list", ""})
	public String list(OrderPolicy orderPolicy, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<OrderPolicy> page = orderPolicyService.findPage(new Page<OrderPolicy>(request, response), orderPolicy); 
		model.addAttribute("page", page);
		return "modules/order/orderPolicyList";
	}

	@RequiresPermissions("order:orderPolicy:view")
	@RequestMapping(value = {"list1"})
	public String list1(OrderPolicy orderPolicy, HttpServletRequest request, HttpServletResponse response, Model model) {
		User user = UserUtils.getUser();
		Agent agent = new Agent();
		agent.setUserId(user.getId());
		agent = agentService.getAgentId(agent);
		if(agent != null){
			orderPolicy.setAgentId(agent.getId());
		}else{
			orderPolicy.setOfficeId(user.getCompany().getId());
		}
		Page<OrderPolicy> page = orderPolicyService.findPage1(new Page<OrderPolicy>(request, response), orderPolicy); 
		model.addAttribute("page", page);
		return "modules/order/orderPolicyList";
	}
	
	@RequiresPermissions("order:orderPolicy:view")
	@RequestMapping(value = "form")
	public String form(OrderPolicy orderPolicy, Model model) {
/*		OrderPolicy entity = orderPolicyService.get(orderPolicy.getId());*/
		model.addAttribute("orderPolicy", orderPolicy);
		return "modules/order/orderPolicyForm";
	}
	
	@RequiresPermissions("order:orderPolicy:view")
	@RequestMapping(value = "formv")
	public String formv(OrderPolicy orderPolicy, Model model,String chakan) {
		OrderPolicy entity = orderPolicyService.get1(orderPolicy.getId());
		model.addAttribute("orderPolicy", entity);
		model.addAttribute("chakan", chakan);
		return "modules/order/orderPolicyForm";
	}
	

	@RequiresPermissions("order:orderPolicy:edit")
	@RequestMapping(value = "save")
	public String save(OrderPolicy orderPolicy, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, orderPolicy)){
			return form(orderPolicy, model);
		}
		orderPolicyService.save(orderPolicy);
		addMessage(redirectAttributes, "保存保单管理成功");
		return "redirect:"+Global.getAdminPath()+"/order/orderPolicy/?repage";
	}
	
	@RequiresPermissions("order:orderPolicy:edit")
	@RequestMapping(value = "delete")
	public String delete(OrderPolicy orderPolicy, RedirectAttributes redirectAttributes) {
		orderPolicyService.delete(orderPolicy);
		addMessage(redirectAttributes, "删除保单管理成功");
		return "redirect:"+Global.getAdminPath()+"/order/orderPolicy/?repage";
	}

}