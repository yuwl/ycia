/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.pro.web;

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
import com.thinkgem.jeesite.modules.pro.entity.ProZyMba;
import com.thinkgem.jeesite.modules.pro.service.ProZyMbaService;

/**
 * 中意小型商业定额A款Controller
 * @author ywl
 * @version 2016-09-20
 */
@Controller
@RequestMapping(value = "${adminPath}/pro/proZyMba")
public class ProZyMbaController extends BaseController {

	@Autowired
	private ProZyMbaService proZyMbaService;
	
	@ModelAttribute
	public ProZyMba get(@RequestParam(required=false) String id) {
		ProZyMba entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = proZyMbaService.get(id);
		}
		if (entity == null){
			entity = new ProZyMba();
		}
		return entity;
	}
	
	@RequiresPermissions("pro:proZyMba:view")
	@RequestMapping(value = {"list", ""})
	public String list(ProZyMba proZyMba, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<ProZyMba> page = proZyMbaService.findPage(new Page<ProZyMba>(request, response), proZyMba); 
		model.addAttribute("page", page);
		return "modules/pro/proZyMbaList";
	}

	@RequiresPermissions("pro:proZyMba:view")
	@RequestMapping(value = "form")
	public String form(ProZyMba proZyMba, Model model) {
		model.addAttribute("proZyMba", proZyMba);
		return "modules/pro/proZyMbaForm";
	}

	@RequiresPermissions("pro:proZyMba:edit")
	@RequestMapping(value = "save")
	public String save(ProZyMba proZyMba, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, proZyMba)){
			return form(proZyMba, model);
		}
		proZyMbaService.save(proZyMba);
		addMessage(redirectAttributes, "保存中意小型商业定额A款成功");
		return "redirect:"+Global.getAdminPath()+"/pro/proZyMba/?repage";
	}
	
	@RequiresPermissions("pro:proZyMba:edit")
	@RequestMapping(value = "delete")
	public String delete(ProZyMba proZyMba, RedirectAttributes redirectAttributes) {
		proZyMbaService.delete(proZyMba);
		addMessage(redirectAttributes, "删除中意小型商业定额A款成功");
		return "redirect:"+Global.getAdminPath()+"/pro/proZyMba/?repage";
	}

}