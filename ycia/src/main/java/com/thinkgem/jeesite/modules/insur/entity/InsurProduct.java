/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.insur.entity;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * insur_productEntity
 * @author ttat
 * @version 2016-09-02
 */
public class InsurProduct extends DataEntity<InsurProduct> {
	
	private static final long serialVersionUID = 1L;
	private String productName;		// 险种名称
	private String productType;		// 险种类型
	private String insureObject;		// 保险对象
	private String insureAge;		// 被保险人年龄
	private Double premiums;		// 保费
	private Double amonut;		// 保额
	private String image;		// 图片
	private String insureItems;		// 保险条款
	private String introduction;		// 产品介绍
	private String material;		// 配套材料
	private Date createTime;		// 创建时间
	private Double rate;		// 手续费费率
	private String template;		// 打印模板
	
	public InsurProduct() {
		super();
	}

	public InsurProduct(String id){
		super(id);
	}

	@Length(min=0, max=200, message="险种名称长度必须介于 0 和 200 之间")
	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}
	
	@Length(min=0, max=1, message="险种类型长度必须介于 0 和 1 之间")
	public String getProductType() {
		return productType;
	}

	public void setProductType(String productType) {
		this.productType = productType;
	}
	
	@Length(min=0, max=200, message="保险对象长度必须介于 0 和 200 之间")
	public String getInsureObject() {
		return insureObject;
	}

	public void setInsureObject(String insureObject) {
		this.insureObject = insureObject;
	}
	
	@Length(min=0, max=200, message="被保险人年龄长度必须介于 0 和 200 之间")
	public String getInsureAge() {
		return insureAge;
	}

	public void setInsureAge(String insureAge) {
		this.insureAge = insureAge;
	}
	
	public Double getPremiums() {
		return premiums;
	}

	public void setPremiums(Double premiums) {
		this.premiums = premiums;
	}
	
	public Double getAmonut() {
		return amonut;
	}

	public void setAmonut(Double amonut) {
		this.amonut = amonut;
	}
	
	@Length(min=0, max=200, message="图片长度必须介于 0 和 200 之间")
	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}
	
	@Length(min=0, max=200, message="保险条款长度必须介于 0 和 200 之间")
	public String getInsureItems() {
		return insureItems;
	}

	public void setInsureItems(String insureItems) {
		this.insureItems = insureItems;
	}
	
	@Length(min=0, max=200, message="产品介绍长度必须介于 0 和 200 之间")
	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	
	@Length(min=0, max=200, message="配套材料长度必须介于 0 和 200 之间")
	public String getMaterial() {
		return material;
	}

	public void setMaterial(String material) {
		this.material = material;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
	public Double getRate() {
		return rate;
	}

	public void setRate(Double rate) {
		this.rate = rate;
	}
	
	@Length(min=0, max=100, message="打印模板长度必须介于 0 和 100 之间")
	public String getTemplate() {
		return template;
	}

	public void setTemplate(String template) {
		this.template = template;
	}
	
}