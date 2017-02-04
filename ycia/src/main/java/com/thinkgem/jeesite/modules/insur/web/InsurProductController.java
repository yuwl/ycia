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
import com.thinkgem.jeesite.modules.insur.entity.InsurProduct;
import com.thinkgem.jeesite.modules.insur.service.InsurProductService;

/**
 * insur_productController
 * @author ttat
 * @version 2016-09-02
 */
@Controller
@RequestMapping(value = "${adminPath}/insur/insurProduct")
public class InsurProductController extends BaseController {

	@Autowired
	private InsurProductService insurProductService;
	
	@ModelAttribute
	public InsurProduct get(@RequestParam(required=false) String id) {
		InsurProduct entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = insurProductService.get(id);
		}
		if (entity == null){
			entity = new InsurProduct();
		}
		return entity;
	}
	
	@RequiresPermissions("insur:insurProduct:view")
	@RequestMapping(value = {"list", ""})
	public String list(InsurProduct insurProduct, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<InsurProduct> page = insurProductService.findPage(new Page<InsurProduct>(request, response), insurProduct); 
		model.addAttribute("page", page);
		return "modules/insur/insurProductList";
	}

	@RequiresPermissions("insur:insurProduct:view")
	@RequestMapping(value = "form")
	public String form(InsurProduct insurProduct, Model model) {
		model.addAttribute("insurProduct", insurProduct);
		return "modules/insur/insurProductForm";
	}

	@RequiresPermissions("insur:insurProduct:edit")
	@RequestMapping(value = "save")
	public String save(InsurProduct insurProduct, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, insurProduct)){
			return form(insurProduct, model);
		}
		insurProductService.save(insurProduct);
		addMessage(redirectAttributes, "保存insur_product成功");
		return "redirect:"+Global.getAdminPath()+"/insur/insurProduct/?repage";
	}
	
	@RequiresPermissions("insur:insurProduct:edit")
	@RequestMapping(value = "delete")
	public String delete(InsurProduct insurProduct, RedirectAttributes redirectAttributes) {
		insurProductService.delete(insurProduct);
		addMessage(redirectAttributes, "删除insur_product成功");
		return "redirect:"+Global.getAdminPath()+"/insur/insurProduct/?repage";
	}

}