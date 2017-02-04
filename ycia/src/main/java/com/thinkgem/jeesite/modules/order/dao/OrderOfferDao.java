/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.order.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.order.entity.OrderOffer;

/**
 * 报价明细DAO接口
 * @author ywl
 * @version 2016-09-20
 */
@MyBatisDao
public interface OrderOfferDao extends CrudDao<OrderOffer> {
	
}