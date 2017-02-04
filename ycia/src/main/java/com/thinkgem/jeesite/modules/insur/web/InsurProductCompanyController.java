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
import com.thinkgem.jeesite.modules.insur.entity.InsurProductCompany;
import com.thinkgem.jeesite.modules.insur.service.InsurProductCompanyService;

/**
 * insur_product_companyController
 * @author ttat
 * @version 2016-09-02
 */
@Controller
@RequestMapping(value = "${adminPath}/insur/insurProductCompany")
public class InsurProductCompanyController extends BaseController {

	@Autowired
	private InsurProductCompanyService insurProductCompanyService;
	
	@ModelAttribute
	public InsurProductCompany get(@RequestParam(required=false) String id) {
		InsurProductCompany entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = insurProductCompanyService.get(id);
		}
		if (entity == null){
			entity = new InsurProductCompany();
		}
		return entity;
	}
	
	@RequiresPermissions("insur:insurProductCompany:view")
	@RequestMapping(value = {"list", ""})
	public String list(InsurProductCompany insurProductCompany, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<InsurProductCompany> page = insurProductCompanyService.findPage(new Page<InsurProductCompany>(request, response), insurProductCompany); 
		model.addAttribute("page", page);
		return "modules/insur/insurProductCompanyList";
	}

	@RequiresPermissions("insur:insurProductCompany:view")
	@RequestMapping(value = "form")
	public String form(InsurProductCompany insurProductCompany, Model model) {
		model.addAttribute("insurProductCompany", insurProductCompany);
		return "modules/insur/insurProductCompanyForm";
	}

	@RequiresPermissions("insur:insurProductCompany:edit")
	@RequestMapping(value = "save")
	public String save(InsurProductCompany insurProductCompany, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, insurProductCompany)){
			return form(insurProductCompany, model);
		}
		insurProductCompanyService.save(insurProductCompany);
		addMessage(redirectAttributes, "保存insur_product_company成功");
		return "redirect:"+Global.getAdminPath()+"/insur/insurProductCompany/?repage";
	}
	
	@RequiresPermissions("insur:insurProductCompany:edit")
	@RequestMapping(value = "delete")
	public String delete(InsurProductCompany insurProductCompany, RedirectAttributes redirectAttributes) {
		insurProductCompanyService.delete(insurProductCompany);
		addMessage(redirectAttributes, "删除insur_product_company成功");
		return "redirect:"+Global.getAdminPath()+"/insur/insurProductCompany/?repage";
	}

}