/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.insur.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.insur.entity.InsurProductCompany;

/**
 * insur_product_companyDAO接口
 * @author ttat
 * @version 2016-09-02
 */
@MyBatisDao
public interface InsurProductCompanyDao extends CrudDao<InsurProductCompany> {
	
}