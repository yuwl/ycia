/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.insur.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.insur.entity.InsurProduct;
import com.thinkgem.jeesite.modules.insur.dao.InsurProductDao;

/**
 * insur_productService
 * @author ttat
 * @version 2016-09-02
 */
@Service
@Transactional(readOnly = true)
public class InsurProductService extends CrudService<InsurProductDao, InsurProduct> {

	public InsurProduct get(String id) {
		return super.get(id);
	}
	
	public List<InsurProduct> findList(InsurProduct insurProduct) {
		return super.findList(insurProduct);
	}
	
	public Page<InsurProduct> findPage(Page<InsurProduct> page, InsurProduct insurProduct) {
		return super.findPage(page, insurProduct);
	}
	
	@Transactional(readOnly = false)
	public void save(InsurProduct insurProduct) {
		super.save(insurProduct);
	}
	
	@Transactional(readOnly = false)
	public void delete(InsurProduct insurProduct) {
		super.delete(insurProduct);
	}
	
}