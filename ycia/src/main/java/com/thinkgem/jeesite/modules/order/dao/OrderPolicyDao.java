/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.order.dao;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.order.entity.OfferDto;
import com.thinkgem.jeesite.modules.order.entity.OrderPolicy;

/**
 * 保单管理DAO接口
 * @author ttat
 * @version 2016-09-02
 */
@MyBatisDao
public interface OrderPolicyDao extends CrudDao<OrderPolicy> {
	/**
	 * 续保页面获取保单列表
	 * @param orderPolicy
	 * @return
	 */
	List<OrderPolicy> findList1( OrderPolicy orderPolicy);
	/**
	 * 续保页面查看保单详情
	 * @param id
	 * @return
	 */
	OrderPolicy get1(String id);
	
	public OfferDto getOrderPolicyPZm(OfferDto offerDto);
}