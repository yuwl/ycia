/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.insur.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.insur.entity.InsurCompany;

/**
 * insur_companyDAO接口
 * @author ttat
 * @version 2016-09-02
 */
@MyBatisDao
public interface InsurCompanyDao extends CrudDao<InsurCompany> {
	
}