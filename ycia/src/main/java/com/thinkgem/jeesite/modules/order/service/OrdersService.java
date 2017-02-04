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
import com.thinkgem.jeesite.modules.order.entity.Orders;
import com.thinkgem.jeesite.modules.order.entity.OrdersDto;
import com.thinkgem.jeesite.modules.order.dao.OrdersDao;

/**
 * 订单管理Service
 * @author ttat
 * @version 2016-09-02
 */
@Service
@Transactional(readOnly = true)
public class OrdersService extends CrudService<OrdersDao, Orders> {

	@Autowired
	private OrdersDao ordersDao;
	
	public Orders get(String id) {
		return super.get(id);
	}
	
	public List<Orders> findList(Orders orders) {
		return super.findList(orders);
	}
	
	public Page<Orders> findPage(Page<Orders> page, Orders orders) {
		return super.findPage(page, orders);
	}
	
	@Transactional(readOnly = false)
	public void save(Orders orders) {
		super.save(orders);
	}
	
	@Transactional(readOnly = false)
	public void delete(Orders orders) {
		super.delete(orders);
	}
	
	public Page<OrdersDto> findAddCompanyPage(Page<OrdersDto> page,OrdersDto ordersDto) {
		ordersDto.setPage(page);
		page.setList(ordersDao.findAddCompanyList(ordersDto));
		return page;
	}

	public Page<Orders> findFinancePage(Page<Orders> page, Orders orders) {
		orders.setPage(page);
		page.setList(ordersDao.findFinanceList(orders));
		return page;
	}
	
	@Transactional(readOnly = false)
	public void updateOrderStatus(Orders orders){
		ordersDao.updateOrderStatus(orders);
	}
}