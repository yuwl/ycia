/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.order.web;

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
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.agent.entity.AgentClent;
import com.thinkgem.jeesite.modules.order.entity.OfferDto;
import com.thinkgem.jeesite.modules.order.entity.OrderCompany;
import com.thinkgem.jeesite.modules.order.entity.OrderPolicy;
import com.thinkgem.jeesite.modules.order.entity.Orders;
import com.thinkgem.jeesite.modules.order.service.OrderCompanyService;
import com.thinkgem.jeesite.modules.order.service.OrdersService;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 保险公司订单Controller
 * @author ttat
 * @version 2016-09-05
 */
@Controller
@RequestMapping(value = "${adminPath}/order/orderCompany")
public class OrderCompanyController extends BaseController {

	@Autowired
	private OrderCompanyService orderCompanyService;
	
	@Autowired
	private OrdersService ordersService;
	
	@ModelAttribute
	public OrderCompany get(@RequestParam(required=false) String id) {
		OrderCompany entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = orderCompanyService.get(id);
		}
		if (entity == null){
			entity = new OrderCompany();
		}
		return entity;
	}
	
	@RequiresPermissions("order:orderCompany:view")
	@RequestMapping(value = {"list", ""})
	public String list(OrderCompany orderCompany, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<OrderCompany> page = orderCompanyService.findPage(new Page<OrderCompany>(request, response), orderCompany); 
		model.addAttribute("page", page);
		return "modules/order/orderCompanyList";
	}

	@RequiresPermissions("order:orderCompany:view")
	@RequestMapping(value = "form")
	public String form(OrderCompany orderCompany, Model model) {
		model.addAttribute("orderCompany", orderCompany);
		return "modules/order/orderCompanyForm";
	}

	@RequiresPermissions("order:orderCompany:edit")
	@RequestMapping(value = "save")
	public String save(OrderCompany orderCompany, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, orderCompany)){
			return form(orderCompany, model);
		}
		orderCompanyService.save(orderCompany);
		addMessage(redirectAttributes, "保存保险公司订单成功");
		return "redirect:"+Global.getAdminPath()+"/order/orderCompany/?repage";
	}
	
	@RequiresPermissions("order:orderCompany:edit")
	@RequestMapping(value = "delete")
	public String delete(OrderCompany orderCompany, RedirectAttributes redirectAttributes) {
		orderCompanyService.delete(orderCompany);
		addMessage(redirectAttributes, "删除保险公司订单成功");
		return "redirect:"+Global.getAdminPath()+"/order/orderCompany/?repage";
	}

	/**
	 * 报价列表
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequiresPermissions("order:orderCompany:view")
	@RequestMapping(value = {"offer", ""})
	public String offerList(HttpServletRequest request, HttpServletResponse response, Model model) {
		
		//从session中拿到用户的officeId,保险公司ID
		User user = UserUtils.getUser();
		
		OfferDto offerDto = new OfferDto();
		offerDto.setCompanyId(user.getOffice().getId());
		Page<OfferDto> page = orderCompanyService.findPages(new Page<OfferDto>(request, response), offerDto); 
		model.addAttribute("page", page);
		return "modules/order/offerList";
	}
	
	/**
	 * 跳转报价员查看页面
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequiresPermissions("order:orderCompany:view")
	@RequestMapping(value = {"detail", ""})
	public String detail(HttpServletRequest request, HttpServletResponse response, Model model) {
		
		String orderId = request.getParameter("orderId");
		String companyId = request.getParameter("companyId");
		
		OfferDto offerDto = new OfferDto();
		offerDto.setOrderId(orderId);
		offerDto.setCompanyId(companyId);
		offerDto = orderCompanyService.queryOne(offerDto);
		
		model.addAttribute("offerDto", offerDto);
		return "modules/insurCategory/ProZyMba/detail";
	}
	
	/**
	 * 跳转保险公司确认
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequiresPermissions("order:orderCompany:view")
	@RequestMapping(value = {"detailConfirm", ""})
	public String detailConfirm(HttpServletRequest request, HttpServletResponse response, Model model) {
		
		String orderId = request.getParameter("orderId");
		String companyId = request.getParameter("companyId");
		
		OfferDto offerDto = new OfferDto();
		offerDto.setOrderId(orderId);
		offerDto.setCompanyId(companyId);
		offerDto = orderCompanyService.queryOne(offerDto);
		
		model.addAttribute("offerDto", offerDto);
		return "modules/insurCategory/ProZyMba/detailConfirm";
	}
	
	/**
	 * 保险公司确认完毕更新状态
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequiresPermissions("order:orderCompany:view")
	@RequestMapping(value = {"updateStatus"})
	public String updateStatus(HttpServletRequest request, HttpServletResponse response, Model model) {
		
		String orderCompanyId = request.getParameter("orderCompanyId");
		String companyId = request.getParameter("companyId");
		String orderNo = request.getParameter("orderNo");
		
		//根据orderCompanyId 和companyId 更新上传凭证及支付凭证
		OrderCompany orderCompany = new OrderCompany();
		orderCompany.setId(orderCompanyId);
		orderCompany.setCompanyId(companyId);
		orderCompany.setStatus("60");
		orderCompany.setUpdateDate(new Date());
		orderCompanyService.updateImage(orderCompany);
		
		//更新主订单状态
		Orders orders = new Orders();
		orders.setOrderNo(orderNo);
		orders.setStatus("60");
		ordersService.updateOrderStatus(orders);
		
		return "redirect:" + adminPath + "/order/orderCompany/offer";
	}
	
	/**
	 * 跳转报价员报价页面
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequiresPermissions("order:orderCompany:view")
	@RequestMapping(value = {"offerSubmit", ""})
	public String offerSubmit(HttpServletRequest request, HttpServletResponse response, Model model) {
		
		String orderId = request.getParameter("orderId");
		String companyId = request.getParameter("companyId");
		
		OfferDto offerDto = new OfferDto();
		offerDto.setOrderId(orderId);
		offerDto.setCompanyId(companyId);
		offerDto = orderCompanyService.queryOne(offerDto);
		
		model.addAttribute("offerDto", offerDto);
		
		return "modules/insurCategory/ProZyMba/offerSubmit";
	}
	
	/**
	 * 报价
	 * @param offerDto
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequiresPermissions("order:orderCompany:view")
	@RequestMapping(value = {"offerSubmitComplete", ""})
	public String offerSubmitComplete(OfferDto offerDto,HttpServletRequest request, HttpServletResponse response, Model model) {
		
		OrderCompany orderCompany = new OrderCompany();
		orderCompany.setId(offerDto.getOrderCompanyId());
		orderCompany.setCompanyId(offerDto.getCompanyId());
		orderCompany.setAmount(offerDto.getAmount());
		orderCompany.setPremium(offerDto.getPremium());
		orderCompany.setFeeRate(offerDto.getFeeRate());
		orderCompany.setDeductible(offerDto.getDeductible());
		orderCompany.setDeductibleDesc(offerDto.getDeductibleDesc());
		orderCompany.setUpdateDate(new Date());
		orderCompany.setStatus("20");//已报价
		orderCompanyService.updateByOrderCompanyId(orderCompany);
		
		//更新主订单状态
		Orders orders = new Orders();
		orders.setOrderNo(offerDto.getOrderNo());
		orders.setFeeRate(offerDto.getFeeRate());
		orders.setPremium(offerDto.getPremium());
		orders.setStatus("20");
		ordersService.updateOrderStatus(orders);
		
		return "redirect:" + adminPath + "/order/orderCompany/offer";
	}
	
}