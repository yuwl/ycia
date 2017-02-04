/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.insur.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.insur.entity.InsurCompany;
import com.thinkgem.jeesite.modules.insur.dao.InsurCompanyDao;

/**
 * insur_companyService
 * @author ttat
 * @version 2016-09-02
 */
@Service
@Transactional(readOnly = true)
public class InsurCompanyService extends CrudService<InsurCompanyDao, InsurCompany> {

	public InsurCompany get(String id) {
		return super.get(id);
	}
	
	public List<InsurCompany> findList(InsurCompany insurCompany) {
		return super.findList(insurCompany);
	}
	
	public Page<InsurCompany> findPage(Page<InsurCompany> page, InsurCompany insurCompany) {
		return super.findPage(page, insurCompany);
	}
	
	@Transactional(readOnly = false)
	public void save(InsurCompany insurCompany) {
		super.save(insurCompany);
	}
	
	@Transactional(readOnly = false)
	public void delete(InsurCompany insurCompany) {
		super.delete(insurCompany);
	}
	
}