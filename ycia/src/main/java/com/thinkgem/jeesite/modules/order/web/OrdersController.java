/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.order.web;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.time.DateFormatUtils;
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
import com.thinkgem.jeesite.common.utils.DateUtils;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.agent.entity.Agent;
import com.thinkgem.jeesite.modules.agent.entity.AgentClent;
import com.thinkgem.jeesite.modules.agent.service.AgentClentService;
import com.thinkgem.jeesite.modules.agent.service.AgentService;
import com.thinkgem.jeesite.modules.insur.entity.InsurProduct;
import com.thinkgem.jeesite.modules.insur.entity.InsurProductCompany;
import com.thinkgem.jeesite.modules.insur.service.InsurProductCompanyService;
import com.thinkgem.jeesite.modules.insur.service.InsurProductService;
import com.thinkgem.jeesite.modules.order.entity.OfferDto;
import com.thinkgem.jeesite.modules.order.entity.OrderCompany;
import com.thinkgem.jeesite.modules.order.entity.OrderPolicy;
import com.thinkgem.jeesite.modules.order.entity.Orders;
import com.thinkgem.jeesite.modules.order.entity.OrdersDto;
import com.thinkgem.jeesite.modules.order.service.OrderCompanyService;
import com.thinkgem.jeesite.modules.order.service.OrderPolicyService;
import com.thinkgem.jeesite.modules.order.service.OrdersService;
import com.thinkgem.jeesite.modules.order.util.Constant;
import com.thinkgem.jeesite.modules.order.util.Word;
import com.thinkgem.jeesite.modules.pro.service.ProZyMbaService;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 订单管理Controller
 * @author ttat
 * @version 2016-09-02
 */
@Controller
@RequestMapping(value = "${adminPath}/order/orders")
public class OrdersController extends BaseController {

	@Autowired
	private OrdersService ordersService;
	
	@Autowired
	private InsurProductService insurProductService;
	
	@Autowired
	private AgentClentService agentClentService;
	
	@Autowired
	private OrderPolicyService orderPolicyService;
	
	@Autowired
	private InsurProductCompanyService insurProductCompanyService;
	
	@Autowired
	private AgentService agentService;
	
	@Autowired
	private OrderCompanyService orderCompanyService;
	
	@Autowired
	private ProZyMbaService proZyMbaService;
	
	@ModelAttribute
	public Orders get(@RequestParam(required=false) String id) {
		Orders entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = ordersService.get(id);
		}
		if (entity == null){
			entity = new Orders();
		}
		return entity;
	}
	
	@RequiresPermissions("order:orders:view")
	@RequestMapping(value = {"list", ""})
	public String list(Orders orders, HttpServletRequest request, HttpServletResponse response, Model model) {
		User user = UserUtils.getUser();
		OrdersDto orderDto = new OrdersDto();
		Agent agent = agentService.getByUserId(user.getId());
		if(agent != null){
			orderDto.setAgentId(agent.getId());
		}else{
			orderDto.setOfficeId(user.getCompany().getId());
		}
		//Page<Orders> page = ordersService.findPage(new Page<Orders>(request, response), orders); 
		Page<OrdersDto> page = ordersService.findAddCompanyPage(new Page<OrdersDto>(request, response), orderDto);
		
		model.addAttribute("page", page);
		return "modules/order/ordersList";
	}
	
	@RequiresPermissions("order:orders:view")
	@RequestMapping(value = {"financeList"})
	public String financeList(Orders orders,OrdersDto ordersDto, HttpServletRequest request, HttpServletResponse response, Model model) {
		User user = UserUtils.getUser();
		orders.setOfficeId(user.getCompany().getId());
		//ordersDto.setOfficeId(user.getCompany().getId());
		Page<Orders> page = ordersService.findFinancePage(new Page<Orders>(request, response), orders); 
		//Page<OrdersDto> page = ordersService.findAddCompanyPage(new Page<OrdersDto>(request, response), new OrdersDto());
		
		model.addAttribute("page", page);
		return "modules/finance/financeOrderList";
	}
	
	/**
	 * 审核管理，订单列表
	 * @param orders
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequiresPermissions("order:orders:view")
	@RequestMapping(value = {"verifiedlist"})
	public String verifiedlist(Orders orders, HttpServletRequest request, HttpServletResponse response, Model model) {
		
		/*Page<Orders> page = ordersService.findFinancePage(new Page<Orders>(request, response), orders);*/
		Page<OrdersDto> page = ordersService.findAddCompanyPage(new Page<OrdersDto>(request, response), new OrdersDto());
		
		model.addAttribute("page", page);
		return "modules/order/verifiedOrdersList";
	}
	
	/**
	 * 跳转审核管理，订单详情页面
	 * @param agentClent
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequiresPermissions("order:orders:view")
	@RequestMapping(value = {"verifiedOrdersDetail", ""})
	public String verifiedOrdersDetail(HttpServletRequest request, HttpServletResponse response, Model model) {
		
		String orderId = request.getParameter("id");
		
		//根据orderId查询保单表
		OfferDto offerDto = new OfferDto(); 
		offerDto.setOrderId(orderId);
		offerDto = orderPolicyService.getOrderPolicyPZm(offerDto);
		
		//再根据orderId查询有哪些保险公司报价
		OrderCompany orderCompany = new OrderCompany();
		orderCompany.setOrderId(orderId);
		List<OrderCompany> orderCompanyList = orderCompanyService.findList(orderCompany);
		
		model.addAttribute("offerDto", offerDto);
		model.addAttribute("orderCompanyList", orderCompanyList);
		
		return "modules/order/verifiedOrdersDetail";
	}
	
	/**
	 * 更新审核状态
	 * @param orders
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequiresPermissions("order:orders:view")
	@RequestMapping(value = {"updateStatus"})
	public String updateStatus(HttpServletRequest request, HttpServletResponse response, Model model) {
		
		String orderCompanyId = request.getParameter("orderCompanyId");
		String companyId = request.getParameter("companyId");
		String orderNo = request.getParameter("orderNo");
		
		//根据orderCompanyId 和companyId 更新上传凭证及支付凭证
		OrderCompany orderCompany = new OrderCompany();
		orderCompany.setId(orderCompanyId);
		orderCompany.setCompanyId(companyId);
		orderCompany.setStatus("50");
		orderCompany.setUpdateDate(new Date());
		orderCompanyService.updateImage(orderCompany);
		
		//更新主订单状态
		Orders orders = new Orders();
		orders.setOrderNo(orderNo);
		orders.setStatus("50");
		ordersService.updateOrderStatus(orders);
		
		return "redirect:" + adminPath + "/order/orders/verifiedlist";
	}
	
	@RequiresPermissions("order:orders:view")
	@RequestMapping(value = {"verifylist"})
	public String verifylist(Orders orders, HttpServletRequest request, HttpServletResponse response, Model model) {
		
		//Page<Orders> page = ordersService.findPage(new Page<Orders>(request, response), orders); 
		orders.setStatus("50");
		Page<Orders> page = ordersService.findFinancePage(new Page<Orders>(request, response), orders);
		
		model.addAttribute("page", page);
		return "modules/order/verifyOrdersList";
	}
	@RequiresPermissions("order:orders:view")
	@RequestMapping(value = "form")
	public String form(Orders orders, Model model) {
		model.addAttribute("orders", orders);
		return "modules/order/ordersForm";
	}

	@RequiresPermissions("order:orders:view")
	@RequestMapping(value = "formv")
	public String formv(Orders orders, Model model) {
		model.addAttribute("orders", orders);
		return "modules/order/verifyOrdersForm";
	}
	@RequiresPermissions("order:orders:edit")
	@RequestMapping(value = "save")
	public String save(Orders orders, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, orders)){
			return form(orders, model);
		}
		ordersService.save(orders);
		addMessage(redirectAttributes, "保存订单管理成功");
		return "redirect:"+Global.getAdminPath()+"/order/orders/?repage";
	}
	@RequiresPermissions("order:orders:edit")
	@RequestMapping(value = "verifySave")
	public String verifySave(Orders orders, Model model, RedirectAttributes redirectAttributes) {
		/*if (!beanValidator(model, orders)){
			return form(orders, model);
		}*/
		orders.setStatus("60");
		ordersService.save(orders);
		addMessage(redirectAttributes, "保存订单管理成功");
		return "redirect:"+Global.getAdminPath()+"/order/orders/verifylist";
	}
	
	@RequiresPermissions("order:orders:edit")
	@RequestMapping(value = "delete")
	public String delete(Orders orders, RedirectAttributes redirectAttributes) {
		ordersService.delete(orders);
		addMessage(redirectAttributes, "删除订单管理成功");
		return "redirect:"+Global.getAdminPath()+"/order/orders/?repage";
	}

	/**
	 * 产品列表
	 * @param insurProduct
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequiresPermissions("order:orders:view")
	@RequestMapping(value = {"enquiry", ""})
	public String enquiry(InsurProduct insurProduct, HttpServletRequest request, HttpServletResponse response, Model model) {
		String insuretype = request.getParameter("insuretype");
		if(!"".equals(insuretype) && insuretype!=null){
			insurProduct.setProductType(insuretype);
		}
		Page<InsurProduct> page = insurProductService.findPage(new Page<InsurProduct>(request, response), insurProduct); 
		model.addAttribute("page", page);
		return "modules/order/enquiry";
	}
	
	/**
	 * 跳转客户选择页面
	 * @param agentClent
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequiresPermissions("order:orders:view")
	@RequestMapping(value = {"clent", ""})
	public String clent(AgentClent agentClent,HttpServletRequest request, HttpServletResponse response, Model model) {
		
		String id = request.getParameter("id");
		User user = UserUtils.getUser();
		Agent agent = new Agent();
		agent.setUserId(user.getId());
		agent = agentService.getAgentId(agent);
		
		if(agent!=null){
			agentClent.setAgentId(agent.getId());
		}
		
		Page<AgentClent> page = agentClentService.findPage(new Page<AgentClent>(request, response), agentClent); 
		
		model.addAttribute("page", page);
		model.addAttribute("productId", id);
		return "modules/order/clent";
	}
	
	/**
	 * 跳转投保页面
	 * @param agentClent
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequiresPermissions("order:orders:view")
	@RequestMapping(value = {"insure", ""})
	public String insure(AgentClent agentClent,HttpServletRequest request, HttpServletResponse response, Model model) {
		
		String userId = request.getParameter("id");
		String productId = request.getParameter("productId");
		if(!"".equals(userId) && userId!=null){
			agentClent.setUserId(userId);
		}
		agentClent = agentClentService.get(userId);
		
		OrderPolicy orderPolicy = new OrderPolicy();
		if(agentClent != null){
			
			//投保人信息
			orderPolicy.setClentId(agentClent.getId());
			orderPolicy.setInsureName(agentClent.getClientName());
			orderPolicy.setInsureCardNo(agentClent.getCardNo());
			orderPolicy.setInsurePhone(agentClent.getPhone());
			orderPolicy.setInsureAddress(agentClent.getAddress());
			orderPolicy.setInsurePostcode(agentClent.getPostcode());
			orderPolicy.setInsureEmail(agentClent.getEmail());
			//被保人信息
			orderPolicy.setInsuredName(agentClent.getClientName());
			orderPolicy.setInsuredCardNo(agentClent.getCardNo());
			orderPolicy.setInsuredPhone(agentClent.getPhone());
			orderPolicy.setInsuredAddress(agentClent.getAddress());
			orderPolicy.setInsuredPostcode(agentClent.getPostcode());
			orderPolicy.setInsuredEmail(agentClent.getEmail());
			//受益人信息
			orderPolicy.setBenefitName(agentClent.getClientName());
			orderPolicy.setBenefitCardNo(agentClent.getCardNo());
			orderPolicy.setBenefitPhone(agentClent.getPhone());
			orderPolicy.setBenefitAddress(agentClent.getAddress());
			orderPolicy.setBenefitPostcode(agentClent.getPostcode());
			orderPolicy.setBenefitEmail(agentClent.getEmail());
			//其他信息
			
			//上一年保单号
			orderPolicy.setLastNo("");
		}
		
		model.addAttribute("agentClent", agentClent);
		model.addAttribute("orderPolicy", orderPolicy);
		model.addAttribute("productId", productId);
		
		return "modules/order/insure";
	}
	
	/**
	 * 跳转投保确认页面
	 * @param agentClent
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequiresPermissions("order:orders:view")
	@RequestMapping(value = {"confirm", ""})
	public String confirm(AgentClent agentClent,OrderPolicy orderPolicy,HttpServletRequest request, HttpServletResponse response, Model model) {
		
		String productId = request.getParameter("productId");
		
		model.addAttribute("orderPolicy", orderPolicy);
		model.addAttribute("productId", productId);
		return "modules/order/insureConfirm";
	}
	
	
	/**
	 * 投保提交
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequiresPermissions("order:orders:view")
	@RequestMapping(value = {"insureSubmit", ""})
	public String insureSubmit(OrderPolicy orderPolicy,HttpServletRequest request, HttpServletResponse response, Model model, RedirectAttributes redirectAttributes) {
		
		String productId = request.getParameter("productId");
		String clentId = request.getParameter("clentId");
		//产品信息
		InsurProduct insurProduct = insurProductService.get(productId);
		
		//根据userId查询代理人信息
		User user = UserUtils.getUser();
		Agent agent = new Agent();
		agent.setUserId(user.getId());
		agent = agentService.getAgentId(agent);
		
		//订单信息
		Orders orders = new Orders();
		
		//String orderId = IdGen.uuid();
		String orderNo = "OD"+DateUtils.getDate("yyyyMMddHHmmsss");
		
		if(insurProduct!=null){
			//orders.setId(orderId);
			orders.setUserId(user.getId());
			orders.setClentId(clentId);
			orders.setAgentId(agent.getId());
			orders.setProductId(insurProduct.getProductName());
			orders.setOfficeId(user.getCompany().getId());
			orders.setOrderNo(orderNo);
			//orders.setPremium(insurProduct.getPremiums());保费，保险公司报价
			orders.setAmount(insurProduct.getAmonut());//保额
			orders.setStatus("10");
			orders.setInsureName(user.getName());
			orders.setCreateTime(DateUtils.parseDate(DateUtils.getDate("yyyy-MM-dd HH:mm:ss")));
			ordersService.save(orders);
		}
		
		//生成保单
		orderPolicy.setClentId(clentId);
		orderPolicy.setPolicyNo("BD"+DateUtils.getDate("yyyyMMddHHmmsss"));
		orderPolicy.setOrderId(orders.getId());
		orderPolicy.setOrderNo(orderNo);
		orderPolicy.setProductId(productId);
		orderPolicy.setUserId(user.getId());
		orderPolicy.setAgentId(agent.getId());
		orderPolicy.setOfficeId(user.getCompany().getId());
		orderPolicy.setStartTime(DateUtils.parseDate(DateUtils.getDate("yyyy-MM-dd HH:mm:ss")));
		orderPolicy.setEndTime(DateUtils.parseDate(DateUtils.getDate("yyyy-MM-dd HH:mm:ss")));//结束时间需要计算
		orderPolicy.setStatus("0");
		orderPolicy.setCreateTime(DateUtils.parseDate(DateUtils.getDate("yyyy-MM-dd HH:mm:ss")));
		//orderPolicy.setCreateBy();订单创建人
		orderPolicyService.save(orderPolicy);
		
		//生成险种订单,判断是哪个险种
		if(Constant.PRO_ZY_MBA.equals(insurProduct.getProductName())){
			proZyMbaService.add(insurProduct,orders,orderPolicy);
		}
		
		//查找该险种都与哪几家保险公司对接
		
		InsurProductCompany insurProductCompany = new InsurProductCompany();
		insurProductCompany.setProductId(productId);
		List<InsurProductCompany> insurProductCompanyList = insurProductCompanyService.findList(insurProductCompany);
		
		for(InsurProductCompany insProList:insurProductCompanyList){
			
			//初始化订单与保险公司关联表
			OrderCompany orderCompany = new OrderCompany();
			orderCompany.setOrderId(orders.getId());
			orderCompany.setOrderNo(orderNo);
			orderCompany.setAmount(insurProduct.getAmonut());
			orderCompany.setStatus("10");
			orderCompany.setCompanyId(insProList.getCompanyId());
			orderCompany.setCreateTime(DateUtils.parseDate(DateUtils.getDate("yyyy-MM-dd HH:mm:ss")));
			orderCompanyService.save(orderCompany);
		}
		
		addMessage(redirectAttributes, "订单'" + orderNo + "'添加成功");
		return "redirect:" + adminPath + "/order/orders/enquiry";
	}
	
	/**
	 * 跳转订单详情页面
	 * @param agentClent
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequiresPermissions("order:orders:view")
	@RequestMapping(value = {"detail", ""})
	public String orderDetail(HttpServletRequest request, HttpServletResponse response, Model model) {
		
		String orderId = request.getParameter("id");
		
		//根据orderId查询保单表
		OfferDto offerDto = new OfferDto(); 
		offerDto.setOrderId(orderId);
		offerDto = orderPolicyService.getOrderPolicyPZm(offerDto);
		
		//再根据orderId查询有哪些保险公司报价
		OrderCompany orderCompany = new OrderCompany();
		orderCompany.setOrderId(orderId);
		List<OrderCompany> orderCompanyList = orderCompanyService.findList(orderCompany);
		
		model.addAttribute("offerDto", offerDto);
		model.addAttribute("orderCompanyList", orderCompanyList);
		
		return "modules/order/detail";
	}
	
	/**
	 * 查看报价信息
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequiresPermissions("order:orders:view")
	@RequestMapping(value = {"showOffer", ""})
	public String showOffer(HttpServletRequest request, HttpServletResponse response, Model model) {
		
		String id = request.getParameter("id");
		String companyId = request.getParameter("companyId");
		OfferDto offerDto = new OfferDto();
		offerDto.setOrderCompanyId(id);
		offerDto.setCompanyId(companyId);
		offerDto = orderCompanyService.getOrderCompanyByIdCompanyId(offerDto);
		
		model.addAttribute("offerDto", offerDto);
		
		return "modules/order/showOffer";
	}
	
	/**
	 * 下载World文档
	 * @param request
	 * @param response
	 * @param model
	 */
	@RequiresPermissions("order:orders:view")
	@RequestMapping(value = {"download", ""})
	public void download(HttpServletRequest request, HttpServletResponse response, Model model){
		
		String filePath = Global.getConfig("templateFilePath")+"pro_zy_mba.doc";
		String fileName = "" + System.currentTimeMillis();
		String outPath = Global.getConfig("templateFilePath")+fileName+".doc";
		String orderId = request.getParameter("orderId");
		String companyId = request.getParameter("companyId");

		OfferDto offerDto = new OfferDto();
		offerDto.setOrderId(orderId);
		offerDto.setCompanyId(companyId);
		offerDto = orderCompanyService.getDtoInfo(offerDto);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("${policyNo}", offerDto.getPolicyNo());
		map.put("${insureName}", offerDto.getInsureName());
		map.put("${insureCardNo}", offerDto.getInsureCardNo());
		map.put("${insureAddress}", offerDto.getInsureAddress());
		map.put("${insurePostcode}", offerDto.getInsurePostcode());
		map.put("${insurePhone}", offerDto.getInsurePhone());
		map.put("${insureEmail}", offerDto.getInsureEmail());
		map.put("${insuredName}", offerDto.getInsuredName());
		map.put("${insuredCardNo}", offerDto.getInsuredCardNo());
		map.put("${insuredAddress}", offerDto.getInsuredAddress());
		map.put("${insuredPostcode}", offerDto.getInsuredPostcode());
		map.put("${insuredPhone}", offerDto.getInsuredPhone());
		map.put("${insuredEmail}", offerDto.getInsuredEmail());
		map.put("${benefitName}", offerDto.getBenefitName());
		map.put("${benefitCardNo}", offerDto.getBenefitCardNo());
		map.put("${benefitAddress}", offerDto.getBenefitAddress());
		map.put("${benefitPostcode}", offerDto.getBenefitPostcode());
		map.put("${benefitPhone}", offerDto.getBenefitPhone());
		map.put("${benefitEmail}", offerDto.getBenefitEmail());
		map.put("${enterpriseType}", offerDto.getEnterpriseType());
		map.put("${businessContent}", offerDto.getBusinessContent());
		map.put("${openAddress}", offerDto.getOpenAddress());
		map.put("${startTime}", DateFormatUtils.format(offerDto.getStartTime(),"yyyy-MM-dd HH:mm:ss"));
		map.put("${endTime}", DateFormatUtils.format(offerDto.getEndTime(),"yyyy-MM-dd HH:mm:ss"));
		map.put("${totalClaim}", offerDto.getTotalClaim());
		map.put("${eachClaim}", offerDto.getEachClaim());
		map.put("${premium}", offerDto.getPremium().toString());
		map.put("${premium}", offerDto.getPremium().toString());
		map.put("${companyName}", "天天安途(北京)信息技术有限公司");
		map.put("${companyAdress}", "北京市海淀区永嘉北路6号");
		map.put("${CompanyPhone}", "888-88888888");

		Word.readwriteWord(filePath, map,outPath);
		
		// path是指欲下载的文件的路径。
 		File file = new File(outPath);
 		// 取得文件名。
 		String filename = file.getName();
 		try {
 			// 以流的形式下载文件。
 			InputStream fis = new BufferedInputStream(new FileInputStream(outPath));
 			byte[] buffer = new byte[fis.available()];
 			fis.read(buffer);
 			fis.close();
 			// 清空response
 			response.reset();
 			// 设置response的Header
 			response.addHeader("Content-Disposition", "attachment;filename="+ new String(filename.getBytes()));
 			response.addHeader("Content-Length", "" + file.length());
 			OutputStream toClient = new BufferedOutputStream(response.getOutputStream());
 			response.setContentType("application/vnd.ms-word;charset=gb2312");
 			toClient.write(buffer);
 			toClient.flush();
 			toClient.close();
 		} catch (IOException exp) {
 			exp.printStackTrace();
 		}
	}
	
	/**
	 * 上传盖章及支付凭证
	 * @param request
	 * @param response
	 * @param model
	 */
	@RequiresPermissions("order:orders:view")
	@RequestMapping(value = {"uploadCret", ""})
	public String uploadCret(HttpServletRequest request, HttpServletResponse response, Model model){
		
		String orderCompanyId = request.getParameter("orderCompanyId");
		String companyId = request.getParameter("companyId");
		String sealCret = request.getParameter("sealCret");
		String payCret = request.getParameter("payCret");
		String orderNo = request.getParameter("orderNo");
		
		//根据orderCompanyId 和companyId 更新上传凭证及支付凭证
		OrderCompany orderCompany = new OrderCompany();
		orderCompany.setId(orderCompanyId);
		orderCompany.setCompanyId(companyId);
		orderCompany.setSealCret(sealCret);
		orderCompany.setPayCret(payCret);
		orderCompany.setStatus("40");
		orderCompany.setUpdateDate(new Date());
		orderCompanyService.updateImage(orderCompany);
		
		//更新主订单状态
		Orders orders = new Orders();
		orders.setOrderNo(orderNo);
		orders.setStatus("40");
		ordersService.updateOrderStatus(orders);
		
		return "redirect:" + adminPath + "/order/orders/list";
	}
	
	/**
	 * 代理确认完毕更新状态
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequiresPermissions("order:orders:view")
	@RequestMapping(value = {"doneUpdateStatus"})
	public String doneUpdateStatus(HttpServletRequest request, HttpServletResponse response, Model model) {
		
		String orderCompanyId = request.getParameter("orderCompanyId");
		String companyId = request.getParameter("companyId");
		String orderNo = request.getParameter("orderNo");
		
		//根据orderCompanyId 和companyId 更新上传凭证及支付凭证
		OrderCompany orderCompany = new OrderCompany();
		orderCompany.setId(orderCompanyId);
		orderCompany.setCompanyId(companyId);
		orderCompany.setStatus("70");
		orderCompany.setUpdateDate(new Date());
		orderCompanyService.updateImage(orderCompany);
		
		//更新主订单状态
		Orders orders = new Orders();
		orders.setOrderNo(orderNo);
		orders.setStatus("70");
		ordersService.updateOrderStatus(orders);
		
		return "redirect:" + adminPath + "/order/orders/list";
	}
}