/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.order.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.order.entity.OrderOffer;
import com.thinkgem.jeesite.modules.order.dao.OrderOfferDao;

/**
 * 报价明细Service
 * @author ywl
 * @version 2016-09-20
 */
@Service
@Transactional(readOnly = true)
public class OrderOfferService extends CrudService<OrderOfferDao, OrderOffer> {

	public OrderOffer get(String id) {
		return super.get(id);
	}
	
	public List<OrderOffer> findList(OrderOffer orderOffer) {
		return super.findList(orderOffer);
	}
	
	public Page<OrderOffer> findPage(Page<OrderOffer> page, OrderOffer orderOffer) {
		return super.findPage(page, orderOffer);
	}
	
	@Transactional(readOnly = false)
	public void save(OrderOffer orderOffer) {
		super.save(orderOffer);
	}
	
	@Transactional(readOnly = false)
	public void delete(OrderOffer orderOffer) {
		super.delete(orderOffer);
	}
	
}