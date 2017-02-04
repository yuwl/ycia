<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<div class="control-group">
	<label class="control-label">企业类别:</label>
	<div class="controls">
		<form:select path="proZyMba.enterpriseType" style="width: 250px;">
            <option value="专业设备制造业">专业设备制造业</option>
            <option value="交通运输设备制造业">交通运输设备制造业</option>
            <option value="武器弹药制造业">武器弹药制造业</option>
            <option value="电气机械及器材制造业">电气机械及器材制造业</option>
            <option value="电子及通讯设备制造业">电子及通讯设备制造业</option>
            <option value="广播器材制造业">广播器材制造业</option>
            <option value="仪器仪表及文化、办公用机械制造业">仪器仪表及文化、办公用机械制造业</option>
            <option value="其它制造业">其它制造业</option>
            <option value="电力、蒸汽、热水的生产和供应业">电力、蒸汽、热水的生产和供应业</option>
            <option value="煤气生产和供应业">煤气生产和供应业</option>
            <option value="自来水的生产和供应业">自来水的生产和供应业</option>
            <option value="土木工程建筑业">土木工程建筑业</option>
            <option value="线路、管道和设备安装业">线路、管道和设备安装业</option>
            <option value="装修装饰业">装修装饰业</option>
            <option value="建筑材料业">建筑材料业</option>
            <option value="地质勘查业">地质勘查业</option>
            <option value="水利管理业">水利管理业</option>
            <option value="铁路运输业">铁路运输业</option>
            <option value="公路运输业">公路运输业</option>
            <option value="管道运输业">管道运输业</option>
            <option value="水上运输业">水上运输业</option>
            <option value="航空运输业">航空运输业</option>
            <option value="交通运输辅助业">交通运输辅助业</option>
            <option value="港口业">港口业</option>
            <option value="交通运输业">交通运输业</option>
            <option value="仓储业">仓储业</option>
            <option value="邮电通信业">邮电通信业</option>
            <option value="食品、饮料、烟草和家庭用品批发业">食品、饮料、烟草和家庭用品批发业</option>
            <option value="能源材料和机械电子设备批发业">能源材料和机械电子设备批发业</option>
            <option value="其他批发业">其他批发业</option>
            <option value="零售业">零售业</option>
            <option value="商业经纪与代理业">商业经纪与代理业</option>
            <option value="餐饮业">餐饮业</option>
            <option value="金融业">金融业</option>
            <option value="保险业">保险业</option>
            <option value="房地产开发与经营业">房地产开发与经营业</option>
            <option value="物业管理">物业管理</option>
            <option value="房地产经纪与代理业">房地产经纪与代理业</option>
            <option value="公共设施服务业">公共设施服务业</option>
            <option value="居民服务业">居民服务业</option>
            <option value="旅馆业">旅馆业</option>
            <option value="租赁服务业">租赁服务业</option>
            <option value="旅游业">旅游业</option>
            <option value="娱乐服务业">娱乐服务业</option>
            <option value="信息、咨询服务业">信息、咨询服务业</option>
            <option value="计算机应用服务业">计算机应用服务业</option>
            <option value="其他社会服务业">其他社会服务业</option>
            <option value="卫生">卫生</option>
            <option value="体育">体育</option>
            <option value="社会福利保障业">社会福利保障业</option>
            <option value="教育">教育</option>
            <option value="文化艺术业">文化艺术业</option>
            <option value="广播电影电视业">广播电影电视业</option>
            <option value="科学研究业">科学研究业</option>
            <option value="综合技术服务业">综合技术服务业</option>
            <option value="国家机关">国家机关</option>
            <option value="党政机关">党政机关</option>
            <option value="社会团体">社会团体</option>
            <option value="基层群众自治组织">基层群众自治组织</option>
            <option value="其他行业">其他行业</option>
            <option value="服务行业">服务行业</option>
            <option value="农业">农业</option>
            <option value="林业">林业</option>
            <option value="畜牧业">畜牧业</option>
            <option value="渔业">渔业</option>
            <option value="农、林、牧、渔服务业">农、林、牧、渔服务业</option>
            <option value="煤炭采选业">煤炭采选业</option>
            <option value="石油和天然气开采业">石油和天然气开采业</option>
            <option value="黑色金属矿采选业">黑色金属矿采选业</option>
            <option value="有色金属采选业">有色金属采选业</option>
            <option value="非金属矿采选业">非金属矿采选业</option>
            <option value="其他矿采选业">其他矿采选业</option>
            <option value="木材及竹材采选业">木材及竹材采选业</option>
            <option value="食品加工业">食品加工业</option>
            <option value="食品制造业">食品制造业</option>
            <option value="饮料制造业">饮料制造业</option>
            <option value="烟草加工业">烟草加工业</option>
            <option value="纺织业">纺织业</option>
            <option value="服装及其他纤维品制造业">服装及其他纤维品制造业</option>
            <option value="皮革、毛皮、羽绒及其制品业">皮革、毛皮、羽绒及其制品业</option>
            <option value="木材加工及竹、藤、棕、草制品业">木材加工及竹、藤、棕、草制品业</option>
            <option value="家具制造业">家具制造业</option>
            <option value="造纸及纸制品业">造纸及纸制品业</option>
            <option value="印刷业、记录媒介的复制业">印刷业、记录媒介的复制业</option>
            <option value="文教、体育用品制造业">文教、体育用品制造业</option>
            <option value="石油加工及炼焦业">石油加工及炼焦业</option>
            <option value="化学原料及化学制品制造业">化学原料及化学制品制造业</option>
            <option value="医药制造业">医药制造业</option>
            <option value="化学纤维制造业">化学纤维制造业</option>
            <option value="橡胶制品业">橡胶制品业</option>
            <option value="塑料制品业">塑料制品业</option>
            <option value="非金属矿物制品业">非金属矿物制品业</option>
            <option value="黑色金属冶炼及压延加工业">黑色金属冶炼及压延加工业</option>
            <option value="有色金属冶炼及压延加工业">有色金属冶炼及压延加工业</option>
            <option value="金属制品业">金属制品业</option>
            <option value="普通机械制造业">普通机械制造业</option>
        </form:select>
		<span class="help-inline"><font color="red">*</font> </span>
	</div>
</div>
<div class="control-group">
	<label class="control-label">经营内容:</label>
	<div class="controls">
		<form:select path="proZyMba.businessContent" style="width: 250px;">
            <option value="办公室">办公室</option>
            <option value="零售">零售</option>
            <option value="餐饮（不含酒吧、夜总会）">餐饮（不含酒吧、夜总会）</option>
            <option value="少儿活动场所">少儿活动场所</option>
            <option value="培训机构">培训机构</option>
            <option value="美容美发">美容美发</option>
            <option value="修表">修表</option>
            <option value="改衣洗衣">改衣洗衣</option>
            <option value="皮具养护">皮具养护</option>
       	</form:select>
		<span class="help-inline"><font color="red">*</font> </span>
	</div>
</div>
<div class="control-group">
	<label class="control-label">营业/活动场所地区:</label>
	<div class="controls">
		<form:input path="proZyMba.openAddress" htmlEscape="false" maxlength="50" class="required"/>
		<span class="help-inline"><font color="red">*</font> </span>
	</div>
</div>
<div class="control-group">
	<label class="control-label">保险期间:</label>
	<div class="controls">
		<input name="proZyMba.startTime" type="text" maxlength="20" class="input-medium Wdate required"
					value="<fmt:formatDate value="${proZyMba.startTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>-
		<input name="proZyMba.endTime" type="text" maxlength="20" class="input-medium Wdate required"
					value="<fmt:formatDate value="${proZyMba.endTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
		<span class="help-inline"><font color="red">*</font> </span>
	</div>
</div>
<div class="control-group">
	<label class="control-label">累计赔偿限额及每次事故赔偿限额:</label>
	<div class="controls">
		<form:select id="totalClaim" path="proZyMba.totalClaim" style="width: 250px;">
            <option value="50万">50万</option>
            <option value="100万">100万</option>
            <option value="150万">150万</option>
            <option value="200万">200万</option>
            <option value="300万">300万</option>
            <option value="400万">400万</option>
            <option value="500万">500万</option>
            <option value="600万">600万</option>
            <option value="800万">800万</option>
            <option value="1000万">1000万</option>
        </form:select>
		<span class="help-inline"><font color="red">*</font> </span>
	</div>
</div>
<div class="control-group">
	<label class="control-label">每次事故财产损失赔偿限额:</label>
	<div class="controls">
		<form:input id="eachClaim" path="proZyMba.eachClaim" htmlEscape="false" maxlength="50" class="required" value="50万" readonly="true"/>
		<span class="help-inline"><font color="red">*</font> </span>
	</div>
</div>

<div class="control-group">
	<label class="control-label">特别条款</label>
	<label class="control-label">每次赔偿限额</label>
	<label class="control-label">累计赔偿限额</label>
</div>
<div class="control-group">
	<label class="control-label">火灾和爆炸责任条款</label>
	<label class="control-label">——</label>
	<label class="control-label">——</label>
</div>
<div class="control-group">
	<label class="control-label">食品、饮料责任保险</label>
	<label class="control-label">10万</label>
	<label class="control-label">50万</label>
</div>
<div class="control-group">
	<label class="control-label">急救费用条款</label>
	<label class="control-label">5千</label>
	<label class="control-label"></label>
</div>
<div class="control-group">
	<label class="control-label">社交和体育活动扩展条款</label>
	<label class="control-label">10万</label>
	<label class="control-label">50万</label>
</div>
<div class="control-group">
	<label class="control-label">广告及装饰装置责任条款</label>
	<label class="control-label">10万</label>
	<label class="control-label">50万</label>
</div>
<div class="control-group">
	<label class="control-label">承租人责任条款</label>
	<label class="control-label">——</label>
	<label class="control-label">——</label>
</div>
<div class="control-group">
	<label class="control-label">免赔额</label>
	<div class="controls">
		针对财产损失，每次事故RMB500元或损失金额的10%，以高者为准
	</div>
</div>
<div class="control-group">
	<label class="control-label">特别约定</label>
	<div class="controls">
		1. 投保场所面积不超过1000平方米。<br>
		2. 本保险计划不承保任何由被保险人保管之第三者财产的被盗/抢劫或因专业养护、维修、洗涤等造成的损失，我司对于由此产生的损失不负任何赔偿责任。
	</div>
</div>

<script type="text/javascript">
totalClaim 
eachClaim

</script>