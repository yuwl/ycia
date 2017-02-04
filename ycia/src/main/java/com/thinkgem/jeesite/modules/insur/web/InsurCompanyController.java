/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.insur.web;

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
import com.thinkgem.jeesite.modules.insur.entity.InsurCompany;
import com.thinkgem.jeesite.modules.insur.service.InsurCompanyService;

/**
 * insur_companyController
 * @author ttat
 * @version 2016-09-02
 */
@Controller
@RequestMapping(value = "${adminPath}/insur/insurCompany")
public class InsurCompanyController extends BaseController {

	@Autowired
	private InsurCompanyService insurCompanyService;
	
	@ModelAttribute
	public InsurCompany get(@RequestParam(required=false) String id) {
		InsurCompany entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = insurCompanyService.get(id);
		}
		if (entity == null){
			entity = new InsurCompany();
		}
		return entity;
	}
	
	@RequiresPermissions("insur:insurCompany:view")
	@RequestMapping(value = {"list", ""})
	public String list(InsurCompany insurCompany, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<InsurCompany> page = insurCompanyService.findPage(new Page<InsurCompany>(request, response), insurCompany); 
		model.addAttribute("page", page);
		return "modules/insur/insurCompanyList";
	}

	@RequiresPermissions("insur:insurCompany:view")
	@RequestMapping(value = "form")
	public String form(InsurCompany insurCompany, Model model) {
		model.addAttribute("insurCompany", insurCompany);
		return "modules/insur/insurCompanyForm";
	}

	@RequiresPermissions("insur:insurCompany:edit")
	@RequestMapping(value = "save")
	public String save(InsurCompany insurCompany, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, insurCompany)){
			return form(insurCompany, model);
		}
		insurCompanyService.save(insurCompany);
		addMessage(redirectAttributes, "保存insur_company成功");
		return "redirect:"+Global.getAdminPath()+"/insur/insurCompany/?repage";
	}
	
	@RequiresPermissions("insur:insurCompany:edit")
	@RequestMapping(value = "delete")
	public String delete(InsurCompany insurCompany, RedirectAttributes redirectAttributes) {
		insurCompanyService.delete(insurCompany);
		addMessage(redirectAttributes, "删除insur_company成功");
		return "redirect:"+Global.getAdminPath()+"/insur/insurCompany/?repage";
	}

}