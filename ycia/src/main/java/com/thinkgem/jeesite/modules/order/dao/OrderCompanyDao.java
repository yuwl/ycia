/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.order.dao;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.order.entity.OfferDto;
import com.thinkgem.jeesite.modules.order.entity.OrderCompany;

/**
 * 保险公司订单DAO接口
 * @author ttat
 * @version 2016-09-05
 */
@MyBatisDao
public interface OrderCompanyDao extends CrudDao<OrderCompany> {
	
	public List<OfferDto> findLists(OfferDto offerDto);
	
	public OfferDto queryOne(OfferDto offerDto);
	
	public void updateByOrderCompanyId(OrderCompany orderCompany);
	
	public OfferDto getOrderCompanyByIdCompanyId(OfferDto offerDto);
	
	public OfferDto getDtoInfo(OfferDto offerDto);
	
	public void updateImage(OrderCompany orderCompany);
}