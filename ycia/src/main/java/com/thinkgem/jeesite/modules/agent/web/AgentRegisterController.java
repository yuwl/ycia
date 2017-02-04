/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.agent.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.common.collect.Maps;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.FileUtil;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.agent.entity.Agent;
import com.thinkgem.jeesite.modules.agent.service.AgentService;
import com.thinkgem.jeesite.modules.sys.entity.Office;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.service.OfficeService;
import com.thinkgem.jeesite.modules.sys.service.SystemService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;


/**
 * 代理人Controller
 * @author Leo
 * @version 2016-09-02
 */
@Controller
@RequestMapping(value = "/agent/agent")
public class AgentRegisterController extends BaseController {

	@Value("#{APP_PROP['imageServiceRealPath']}")  
    private String realPath;
	
	public String getRealPath() {
		return realPath;
	}

	public void setRealPath(String realPath) {
		this.realPath = realPath;
	}
	@Autowired
	private AgentService agentService;
	
	@Autowired
	private OfficeService officeService;
	
	@Autowired
	private SystemService systemService;
	
	@ModelAttribute
	public Agent get(@RequestParam(required=false) String id) {
		Agent entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = agentService.get(id);
		}
		if (entity == null){
			entity = new Agent();
		}
		return entity;
	}
	
/*	@RequestMapping(value = {"list", ""})
	public String list(Agent agent, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Agent> page = agentService.findPage(new Page<Agent>(request, response), agent); 
		model.addAttribute("page", page);
		return "modules/agent/agentList";
	}*/

	@RequestMapping(value = "agentTypeSelect")
	public String agentTypeSelect(Agent agent,Office office, Model model) {
		/*model.addAttribute("agent", agent);
		List<Office> officeList = officeService.getCompanyList(office);
		List<Office> officeRes = new ArrayList<Office>();
		for (int i=0; i<officeList.size(); i++){
			Office e = officeList.get(i);
			if(!e.getName().equals("保险公司")){
				officeRes.add(e);
			}
		
		}
		model.addAttribute("office", officeRes);*/
		return "modules/agent/agentTypeSelect";
	}
	@RequestMapping(value = "formv")
	public String formv(Agent agent,Office office, Model model) {
		model.addAttribute("agent", agent);
		List<Office> officeList = officeService.getCompanyList(office);
		List<Office> officeRes = new ArrayList<Office>();
		for (int i=0; i<officeList.size(); i++){
			Office e = officeList.get(i);
			if(!e.getName().equals("保险公司")){
				officeRes.add(e);
			}
		
		}
		model.addAttribute("office", officeRes);
		return "modules/agent/agentFormv";
	}

	
	@RequestMapping(value = "socialformv")
	public String socialformv(Agent agent,Office office, Model model) {
		model.addAttribute("agent", agent);
		List<Office> officeList = officeService.getCompanyList(office);
		List<Office> officeRes = new ArrayList<Office>();
		for (int i=0; i<officeList.size(); i++){
			Office e = officeList.get(i);
			if(!e.getName().equals("保险公司")){
				officeRes.add(e);
			}
		
		}
		//model.addAttribute("office", officeRes);
		return "modules/agent/socialAgentFormv";
	}
	@RequestMapping(value = "form")
	public String form(Agent agent, Model model) {
		model.addAttribute("agent", agent);
		return "modules/agent/agentFormv";
	}
	@RequestMapping(value = "save")
	public String save(Agent agent, User user,Model model,HttpServletRequest request, HttpServletResponse response, RedirectAttributes redirectAttributes) {
		
		if (StringUtils.isNotBlank(user.getNewPassword())) {
			user.setPassword(SystemService.entryptPassword(user.getNewPassword()));
		}
		if (systemService.getByLoginName(user.getLoginName())!=null){
			addMessage(redirectAttributes, "保存"+user.getLoginName() + "'失败，登录名已存在,请重新注册" );
			return "redirect:/agent/agent/formv";
		}
		user.setDelFlag("2");
		user.setLoginFlag("0");
		if(request.getParameter("officeId")==null){
			user.setCompany(new Office("5a6bfb69f2b64c2ab84d1a9b6c899d80"));
			user.setOffice(new Office("5a6bfb69f2b64c2ab84d1a9b6c899d80"));
			agent.setOfficeId("5a6bfb69f2b64c2ab84d1a9b6c899d80");
		}else{
			user.setCompany(new Office(request.getParameter("officeId")));
			user.setOffice(new Office(request.getParameter("officeId")));
			agent.setOfficeId(request.getParameter("officeId"));
		}
		
		user.setMobile(request.getParameter("umobile"));
		user.setCreateDate(new Date());
		user.preInsert();
		agent.preInsert();
		agent.setDelFlag("2");
		agent.setCreateTime(new Date());
		agent.setUpdateTime(new Date());
		System.out.println(user.getLoginName()+"==="+user.getNewPassword());
		agentService.saveAgentUserAndAccount(agent,user);
	/*	agentService.saveAgentUserAndAccount(agent,user);
		user.setId("123");
		System.out.println(request.getParameter("newPassword"));
		agent.setUserId("123");
		
		agentService.save(agent);*/
		addMessage(redirectAttributes, "注册代理人申请成功，待审核人员审核");
		return "redirect:/agent/agent/formv";
	}
	@ResponseBody
	@RequestMapping(value = "checkLoginName")
	public String checkLoginName(String oldLoginName, String loginName) {
		if (loginName !=null && loginName.equals(oldLoginName)) {
			return "true";
		} else if (loginName !=null && systemService.getUserByLoginName(loginName) == null) {
			return "true";
		}
		return "false";
	}
	@RequiresPermissions("agent:agent:edit")
	@RequestMapping(value = "delete")
	public String delete(Agent agent, RedirectAttributes redirectAttributes) {
		agentService.delete(agent);
		addMessage(redirectAttributes, "删除保存代理人成功成功");
		return "redirect:"+Global.getAdminPath()+"/agent/agent/?repage";
	}
	/**
	 * 上传证件图片
	 * @param request
	 * @param dir
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "/uploadPics/{dir}", method = {RequestMethod.POST,RequestMethod.GET})
    public void ajaxUploadPics(HttpServletRequest request, HttpServletResponse response,@PathVariable String dir) throws IOException {
		String strUrl = "";
		
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
        Map<String, MultipartFile> fileMap = multipartRequest.getFileMap();
        for (Map.Entry<String, MultipartFile> entity : fileMap.entrySet()) {
            MultipartFile image = entity.getValue();
            strUrl = FileUtil.uploadImg(image, "/"+dir+"/",realPath);
        }
        response.setContentType("text/html;charset=UTF-8");  
        response.getWriter().write(strUrl);
		//return strUrl;
	}

}