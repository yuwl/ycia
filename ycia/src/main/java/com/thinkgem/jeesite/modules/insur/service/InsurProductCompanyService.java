/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.insur.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.insur.entity.InsurProductCompany;
import com.thinkgem.jeesite.modules.insur.dao.InsurProductCompanyDao;

/**
 * insur_product_companyService
 * @author ttat
 * @version 2016-09-02
 */
@Service
@Transactional(readOnly = true)
public class InsurProductCompanyService extends CrudService<InsurProductCompanyDao, InsurProductCompany> {

	public InsurProductCompany get(String id) {
		return super.get(id);
	}
	
	public List<InsurProductCompany> findList(InsurProductCompany insurProductCompany) {
		return super.findList(insurProductCompany);
	}
	
	public Page<InsurProductCompany> findPage(Page<InsurProductCompany> page, InsurProductCompany insurProductCompany) {
		return super.findPage(page, insurProductCompany);
	}
	
	@Transactional(readOnly = false)
	public void save(InsurProductCompany insurProductCompany) {
		super.save(insurProductCompany);
	}
	
	@Transactional(readOnly = false)
	public void delete(InsurProductCompany insurProductCompany) {
		super.delete(insurProductCompany);
	}
	
}