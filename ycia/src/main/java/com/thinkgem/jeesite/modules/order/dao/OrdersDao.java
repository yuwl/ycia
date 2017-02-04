/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.order.dao;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.agent.entity.Agent;
import com.thinkgem.jeesite.modules.order.entity.Orders;
import com.thinkgem.jeesite.modules.order.entity.OrdersDto;

/**
 * 订单管理DAO接口
 * @author ttat
 * @version 2016-09-02
 */
@MyBatisDao
public interface OrdersDao extends CrudDao<Orders> {
	
	/**
	 * 获取单条数据
	 * @param entity
	 * @return
	 */
	public Agent getAgentId(Agent entity);
	
	public List<OrdersDto> findAddCompanyList(OrdersDto ordersDto);

	public List<Orders> findFinanceList(Orders orders);
	
	public void updateOrderStatus(Orders orders);
}