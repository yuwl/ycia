/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.pro.service;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.insur.entity.InsurProduct;
import com.thinkgem.jeesite.modules.order.entity.OrderPolicy;
import com.thinkgem.jeesite.modules.order.entity.Orders;
import com.thinkgem.jeesite.modules.pro.entity.ProZyMba;
import com.thinkgem.jeesite.modules.pro.dao.ProZyMbaDao;

/**
 * 中意小型商业定额A款Service
 * @author ywl
 * @version 2016-09-20
 */
@Service
@Transactional(readOnly = true)
public class ProZyMbaService extends CrudService<ProZyMbaDao, ProZyMba> {

	public ProZyMba get(String id) {
		return super.get(id);
	}
	
	public List<ProZyMba> findList(ProZyMba proZyMba) {
		return super.findList(proZyMba);
	}
	
	public Page<ProZyMba> findPage(Page<ProZyMba> page, ProZyMba proZyMba) {
		return super.findPage(page, proZyMba);
	}
	
	@Transactional(readOnly = false)
	public void save(ProZyMba proZyMba) {
		super.save(proZyMba);
	}
	
	@Transactional(readOnly = false)
	public void delete(ProZyMba proZyMba) {
		super.delete(proZyMba);
	}
	
	@Transactional(readOnly = false)
	public void add(InsurProduct insurProduct,Orders order,OrderPolicy orderPolicy){
		ProZyMba proZyMba = new ProZyMba();
		proZyMba.setInsurProductId(insurProduct.getProductName());
		proZyMba.setOrderId(order.getId());
		proZyMba.setEnterpriseType(orderPolicy.getProZyMba().getEnterpriseType());
		proZyMba.setBusinessContent(orderPolicy.getProZyMba().getBusinessContent());
		proZyMba.setOpenAddress(orderPolicy.getProZyMba().getOpenAddress());
		proZyMba.setStartTime(orderPolicy.getProZyMba().getStartTime());
		proZyMba.setEndTime(orderPolicy.getProZyMba().getEndTime());
		proZyMba.setTotalClaim(orderPolicy.getProZyMba().getTotalClaim());
		proZyMba.setEachClaim(orderPolicy.getProZyMba().getEachClaim());
		proZyMba.setCreateTime(new Date());
		super.save(proZyMba);
	}
}