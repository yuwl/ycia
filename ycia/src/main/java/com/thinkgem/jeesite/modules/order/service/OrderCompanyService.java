/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.order.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.order.entity.OfferDto;
import com.thinkgem.jeesite.modules.order.entity.OrderCompany;
import com.thinkgem.jeesite.modules.order.dao.OrderCompanyDao;

/**
 * 保险公司订单Service
 * @author ttat
 * @version 2016-09-05
 */
@Service
@Transactional(readOnly = true)
public class OrderCompanyService extends CrudService<OrderCompanyDao, OrderCompany> {
	
	@Autowired
	private OrderCompanyDao orderCompanyDao;

	public OrderCompany get(String id) {
		return super.get(id);
	}
	
	public List<OrderCompany> findList(OrderCompany orderCompany) {
		return super.findList(orderCompany);
	}
	
	public Page<OrderCompany> findPage(Page<OrderCompany> page, OrderCompany orderCompany) {
		return super.findPage(page, orderCompany);
	}
	
	@Transactional(readOnly = false)
	public void save(OrderCompany orderCompany) {
		super.save(orderCompany);
	}
	
	@Transactional(readOnly = false)
	public void delete(OrderCompany orderCompany) {
		super.delete(orderCompany);
	}
	
	public Page<OfferDto> findPages(Page<OfferDto> page, OfferDto offerDto) {
		
		offerDto.setPage(page);
		page.setList(orderCompanyDao.findLists(offerDto));
		
		return page;
	}
	
	public OfferDto queryOne(OfferDto offerDto) {
		return orderCompanyDao.queryOne(offerDto);
	}
	
	@Transactional(readOnly = false)
	public void updateByOrderCompanyId(OrderCompany orderCompany){
		orderCompanyDao.updateByOrderCompanyId(orderCompany);
	}
	
	public OfferDto getOrderCompanyByIdCompanyId(OfferDto offerDto){
		return orderCompanyDao.getOrderCompanyByIdCompanyId(offerDto);
	}
	
	public OfferDto getDtoInfo(OfferDto offerDto){
		return orderCompanyDao.getDtoInfo(offerDto);
	}
	
	@Transactional(readOnly = false)
	public void updateImage(OrderCompany orderCompany){
		orderCompanyDao.updateImage(orderCompany);
	}
}