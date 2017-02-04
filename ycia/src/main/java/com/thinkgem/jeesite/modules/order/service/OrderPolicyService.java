/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.order.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.order.entity.OfferDto;
import com.thinkgem.jeesite.modules.order.entity.OrderPolicy;
import com.thinkgem.jeesite.modules.order.dao.OrderPolicyDao;

/**
 * 保单管理Service
 * @author ttat
 * @version 2016-09-02
 */
@Service
@Transactional(readOnly = true)
public class OrderPolicyService extends CrudService<OrderPolicyDao, OrderPolicy> {

	public OrderPolicy get(String id) {
		return super.get(id);
	}
	
	public List<OrderPolicy> findList(OrderPolicy orderPolicy) {
		return super.findList(orderPolicy);
	}
	
	public Page<OrderPolicy> findPage(Page<OrderPolicy> page, OrderPolicy orderPolicy) {
		return super.findPage(page, orderPolicy);
	}
	
	@Transactional(readOnly = false)
	public void save(OrderPolicy orderPolicy) {
		super.save(orderPolicy);
	}
	
	@Transactional(readOnly = false)
	public void delete(OrderPolicy orderPolicy) {
		super.delete(orderPolicy);
	}

	public Page<OrderPolicy> findPage1(Page<OrderPolicy> page, OrderPolicy orderPolicy) {
		orderPolicy.setPage(page);
		page.setList(dao.findList1(orderPolicy));
		return page;
	}

	public OrderPolicy get1(String id) {
		return dao.get1(id);
	}
	
	public OfferDto getOrderPolicyPZm(OfferDto offerDto){
		return dao.getOrderPolicyPZm(offerDto);
	}
	
}