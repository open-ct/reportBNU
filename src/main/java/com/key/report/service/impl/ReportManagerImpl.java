package com.key.report.service.impl;

import java.io.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import net.sf.json.JSONObject;
import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.key.common.base.entity.User;
import com.key.common.base.service.AccountManager;
import com.key.common.plugs.page.Page;
import com.key.common.service.BaseServiceImpl;
import com.key.common.utils.RandomUtils;
import com.key.report.dao.ReportDao;
import com.key.report.entity.Report;
import com.key.report.service.ReportManager;
import com.key.report.service.UserManager;

import javax.servlet.ServletContext;


/**
 * 问卷
 * 
 *
 * 
 * 
 */
@Service("ReportManager")
public class ReportManagerImpl extends BaseServiceImpl<Report, String> implements ReportManager {

	@Autowired
	private ReportDao ReportDao;
	@Autowired
	private AccountManager accountManager;
	@Autowired
	private UserManager userManager;
	
	@Override
	public void setBaseDao() {
		this.baseDao=ReportDao;
	}
	
	@Transactional
	@Override
	public void save(Report t) {
		User user = accountManager.getCurUser();
		String userId=t.getUserId();
		String id=t.getId();
		if(id==null){
			t.setUserId(user.getId());
			userId=t.getUserId();
		}
		if(userId!=null && userId.equals(user.getId())){
			String sId=t.getSid();
			if(sId==null || "".equals(sId)){
				sId=RandomUtils.randomStr(6, 12);
				t.setSid(sId);
			}
			ReportDao.save(t);
			
		}
	}
	
	@Transactional
	public void saveByAdmin(Report t){
		String sId=t.getSid();
		if(sId==null || "".equals(sId)){
			sId=RandomUtils.randomStr(6, 12);
			t.setSid(sId);
		}
		ReportDao.save(t);
	}
	
	/**
	 * 得到当前目录所在的目录位置
	 */
	public List<Report> findPath(Report Report) {
		List<Report> resultList=new ArrayList<Report>();
		if(Report!=null){
			List<Report> dirPathList=new ArrayList<Report>();
			dirPathList.add(Report);
			String parentUuid=Report.getParentId();
			while(parentUuid!=null && !"".equals(parentUuid)){
				Report Report2=get(parentUuid);
				parentUuid=Report2.getParentId();
				dirPathList.add(Report2);
			}
			for (int i = dirPathList.size()-1; i >=0; i--) {
				resultList.add(dirPathList.get(i));
			}
		}
		return resultList;
	}

	@Override
	public Report getReportBySid(String sid) {
		Criterion criterion=Restrictions.eq("sid", sid);
		Report Report = ReportDao.findUnique(criterion);
		return Report;
	}
	
	@Override
	public Report getReport(String id) {
		if(id==null || "".equals(id)){
			return new Report();
		}
		Report directory=get(id);
		return directory;
	}
	
	public Report getReportByUser(String id,String userId) {
		Report directory=get(id);
		if(userId.equals(directory.getUserId())){
		    return directory;
		}
		return null;
	}
	


	@Override
	@Transactional
	public void closeReport(Report entity) {
		entity.setReportState(2);
		//计算可以回答的题量
		super.save(entity);
		//生成全局统计结果记录表
	}
	
	@Override
	@Transactional
	public void delete(String id) {
		//设为不可见
		Report parentDirectory=get(id);
		parentDirectory.setVisibility(0);
		ReportDao.save(parentDirectory);
		Criterion criterion=Restrictions.eq("parentId", parentDirectory.getId());
		List<Report> directories=findList(criterion);
		if(directories!=null){
			for (Report Report : directories) {
				delete(Report);
			}
		}
	}
	
	@Transactional
	public void delete(Report parentDirectory) {
		String id=parentDirectory.getId();
		//目录ID，为1的为系统默认注册用户目录不能删除
		if(!"1".equals(id)){
			//设为不可见
			parentDirectory.setVisibility(0);
			Criterion criterion=Restrictions.eq("parentId", parentDirectory.getId());
			List<Report> directories=findList(criterion);
			if(directories!=null){
				for (Report Report : directories) {
					delete(Report);
				}
			}
		}
	}

	@Override
	public Report findByNameUn(String id,String parentId, String reportName) {
		List<Criterion> criterions=new ArrayList<Criterion>();
		Criterion eqName=Restrictions.eq("reportName", reportName);
		Criterion eqParentId=Restrictions.eq("parentId", parentId);
		criterions.add(eqName);
		criterions.add(eqParentId);
		
		if(id!=null && !"".equals(id)){
			Criterion eqId=Restrictions.ne("id", id);	
			criterions.add(eqId);
		}
		return ReportDao.findFirst(criterions);
	}
	@Override
	public Report findByNameUserUn(String id, String reportName) {
		User user=accountManager.getCurUser();
		if(user!=null){
			List<Criterion> criterions=new ArrayList<Criterion>();
			Criterion eqName=Restrictions.eq("reportName", reportName);
			Criterion eqUserId=Restrictions.eq("userId", user.getId());
			criterions.add(eqName);
			criterions.add(eqUserId);
			
			if(id!=null && !"".equals(id)){
				Criterion eqId=Restrictions.ne("id", id);	
				criterions.add(eqId);
			}
			return ReportDao.findFirst(criterions);
		}
		return null;
	}

	@Override
	@Transactional
	public void backDesign(Report entity) {
		entity.setReportState(0);
		//计算可以回答的题量
		super.save(entity);
	}
	
	@Transactional
	public void checkUp(Report entity) {
		//计算可以回答的题量
		super.save(entity);
	}
	
	
	@Transactional
	public void upSuveyText(Report t){
		String id=t.getId();
		if(id!=null&&id.length()>0){
			super.save(t);
		}
	}
	
	@Transactional
	public void saveUser(Report t) {
		super.save(t);
	}
	
	public void saveUserReport(Report entity) {
		User user = accountManager.getCurUser();
		if(user!=null){
			String enId = entity.getId();
			String userId=user.getId();
			if(enId==null || "".equals(enId)){
				entity.setParentId(userId);
				entity.setUserId(userId);
				saveUser(entity);
			}else{
				//判断当前人有无权限修改
				String enUserId=entity.getUserId();
				if(userId.equals(enUserId)){
					entity.setUserId(userId);
					saveUser(entity);
				}
			}
		}
	}

	@Override
	public Page<Report> findPage(Page<Report> page,
			Report entity) {
		page.setOrderBy("reportType,orderbyNum");
		page.setOrderDir("asc,asc");
		
		List<Criterion> criterions=new ArrayList<Criterion>();
		
		Integer reportType = entity.getReportType();
		if(reportType!=null && reportType>0){
			Criterion criterionsType = Restrictions.eq("reportType", reportType);
			Integer chooseType = entity.getOrderbyNum();
			if(chooseType != null && reportType>0)
			{
				criterionsType = Restrictions.or(criterionsType, 
						Restrictions.and(Restrictions.eq("reportType", 25),
								Restrictions.or(
										Restrictions.eq("orderbyNum", chooseType/10),
										Restrictions.eq("orderbyNum", chooseType%10)
								)
						)
				);
			}
			
			criterions.add(criterionsType);
		}
		
		criterions.add(Restrictions.eq("visibility", 1));
		criterions.add(Restrictions.eq("reportState", 1));
		
		
		Page<Report> reportPage = ReportDao.findPageList(page, criterions);
		
		return reportPage;
	}
	

	public List<Report> newReportList() {
		List<Report> result=new ArrayList<Report>();
		try{
			Report entity=new Report();
			Page<Report> page=new Page<Report>();
			page.setPageSize(25);
			page=findPage(page,entity);
			result=page.getResult();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}


	@Transactional
	public void saveAll(Report directory) {
		directory.setParentId("402880e5428a2dca01428a2f1f290000");
		directory.setReportTag(0);
		ReportDao.save(directory);
		String reportId=directory.getId();
	}

	@Override
	public Report findNext(Report directory) {
		Date date=directory.getCreateDate();
		Criterion criterion=Restrictions.gt("createDate", date);
		return ReportDao.findFirst(criterion);
	}
	
	@Override
	public Page<Report> findByUser(Page<Report> page,
											Report entity) {
	    User user=accountManager.getCurUser();
	    if(user!=null){
	    	List<Criterion> criterions=new ArrayList<Criterion>();
	    	if(user.getRoleType() == 2){
	    		criterions.add(Restrictions.eq("userId", user.getId()));
	    	}
			criterions.add(Restrictions.eq("visibility", 1));
			Integer reportState = null;
			if(entity!=null){
				reportState = entity.getReportState();
				if(reportState!=null && !"".equals(reportState)){
					criterions.add(Restrictions.eq("reportState", reportState));
				}
				String reportName = entity.getReportName();
				if(reportName!=null && !"".equals(reportName)){
					criterions.add(Restrictions.like("reportName", "%"+reportName+"%"));
				}
			}
			if(reportState == null){
				if(user.getRoleType() == 1){
					criterions.add(Restrictions.or(Restrictions.eq("reportState", 1), Restrictions.eq("reportState", 3)));
				}
			}

			page.setOrderBy("createDate");
			page.setOrderDir("desc");
			page=ReportDao.findPageList(page,criterions);
	    }
	    return page;
	}
	
	public Page<Report> findByGroup(String groupId1,String groupId2,Page<Report> page) {
		
		
		List<Criterion> criterions = new ArrayList<Criterion>();
		if(groupId1!=null && !"".equals(groupId1)){
			Criterion cri1=Restrictions.eq("groupId1", groupId1);
			criterions.add(cri1);
		}
		if(groupId2!=null && !"".equals(groupId2)){
			Criterion cri1_2=Restrictions.eq("groupId2", groupId2);
			criterions.add(cri1_2);
		}
	    
	    Criterion cri2=Restrictions.eq("visibility", 1);
	    Criterion cri4=Restrictions.eq("reportModel", 4);

	    criterions.add(cri2);
	    criterions.add(cri4);
	    page.setOrderBy("createDate");
		page.setOrderDir("desc");
		
	    return ReportDao.findPage(page,criterions.toArray(new Criterion[criterions.size()]) );
	}

	
	@Override
	public Page<Report> findModel(Page<Report> page,
			Report entity) {
		Integer reportState=entity.getReportState();
		String reportName=entity.getReportName();
		List<Criterion> criterions=new ArrayList<Criterion>();
		
		if(reportState!=null && reportState.intValue()!=100){
			Criterion cri1=Restrictions.eq("reportState", reportState);
			criterions.add(cri1);
		}
		if(reportName!=null && !"".equals(reportName)){
			Criterion cri1=Restrictions.like("reportName", "%" + reportName + "%");
			criterions.add(cri1);
		}
	    Criterion cri2=Restrictions.eq("visibility", 1);
	    criterions.add(cri2);
	    Criterion cri4=Restrictions.eq("reportModel", 4);
	    criterions.add(cri4);
	    page.setOrderBy("createDate");
		page.setOrderDir("desc");
	    return ReportDao.findPageList(page, criterions);
	}
	
	@Override
	public List<Report> findByIndex() {
	    Criterion cri1=Restrictions.eq("visibility", 1);
	    Criterion cri2=Restrictions.eq("parentId", "402880e5428a2dca01428a2f1f290000");
	    Criterion cri3=Restrictions.eq("reportTag", 1);
	    Criterion cri4=Restrictions.isNull("sid");
	    Page<Report> page=new Page<Report>();
	    page.setOrderBy("createDate");
		page.setOrderDir("desc");
		page.setPageSize(10);
	    List<Report> reports = ReportDao.findPage(page, cri1,cri2,cri3,cri4).getResult();
	    return reports;
	}
	
	@Override
	public List<Report> findByT1() {
	    Criterion cri1=Restrictions.eq("visibility", 1);
	    Criterion cri2=Restrictions.eq("parentId", "402880e5428a2dca01428a2f1f290000");
	    Criterion cri3=Restrictions.eq("reportTag", 1);
	    Criterion cri4=Restrictions.isNull("sid");
	    Page<Report> page=new Page<Report>();
	    page.setOrderBy("createDate");
		page.setOrderDir("desc");
		page.setPageSize(10);
	    List<Report> reports = ReportDao.findPage(page, cri1,cri2,cri3,cri4).getResult();
	    return reports;
	}

	@Override
	public Report createByReport(String fromBankId, String reportName,
										  String tag) {//new
		Report Report = buildCopyObj(fromBankId, reportName,
				tag);

		saveUserReport(Report);
		return Report;
	}

	private Report buildCopyObj(String fromBankId, String reportName,String tag) {
		Report Report=new Report();
		Report.setReportName(reportName);
		Report directory=getReport(fromBankId);
		super.save(directory);
		return Report;
	}

	public String readData(String reportId) throws IOException {
		String filePath = "files/reportHtml/";
		filePath = filePath.replace("/", File.separator);
		filePath = filePath.replace("\\", File.separator);
		String fileName = reportId + ".data";
		ServletContext sc = ServletActionContext.getServletContext();
		filePath = sc.getRealPath("/") + filePath;
		File file2 = new File(filePath);
		if (!file2.exists() || !file2.isDirectory()) return null;
		File file = new File(filePath + fileName);
		if (!file.exists()) return null;
		BufferedReader in=new BufferedReader(new FileReader(file));
		String data = in.readLine();
		in.close();
		return data;
	}

	public void saveData(String data, String reportId) throws IOException{
		String filePath = "files/reportHtml/";
		filePath = filePath.replace("/", File.separator);
		filePath = filePath.replace("\\", File.separator);
		ServletContext sc = ServletActionContext.getServletContext();
		String fileRealPath = sc.getRealPath("/") + filePath;
		saveFile(data, reportId + ".data", fileRealPath);
		saveHtml(data, reportId + ".html", fileRealPath);
	}

	public void saveFile(String data, String fileName, String filePath) throws IOException {
		File file2 = new File(filePath);
		if (!file2.exists() || !file2.isDirectory()) file2.mkdirs();
		File file = new File(filePath + fileName);
		if (!file.exists()) file.createNewFile();
		BufferedWriter out = new BufferedWriter (new OutputStreamWriter (new FileOutputStream (file, false),"UTF-8"));
		out.write(data);
		out.close();
	}

	public void saveHtml(String data, String fileName, String filePath) throws IOException {
		String htmlData = "<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">"
				+ "<html><head><meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">"
				+ "<meta charset=\"utf-8\" /><meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\" /><meta name=viewport content=\"width=device-width, initial-scale=1\" />"
				+ "<link href=\"/report/semantic/dist/semantic.min.css\" rel=\"stylesheet\" /><link href=\"/report/css/main.css\" rel=\"stylesheet\" /><link href=\"/report/css/predisplay.css\" rel=\"stylesheet\" />"
				+ "<style id=\"tablesort\">table.sortEnabled tr.firstRow th,table.sortEnabled tr.firstRow td{padding-right:20px;background-repeat: no-repeat;background-position: center right;   background-image:url(https://ueditor.baidu.com/ueditor/themes/default/images/sortable.png);}</style><style id=\"table\">.selectTdClass{background-color:#edf5fa !important}table.noBorderTable td,table.noBorderTable th,table.noBorderTable caption{border:1px dashed #ddd !important}table{margin-bottom:10px;border-collapse:collapse;display:table;}td,th{padding: 5px 10px;border: 1px solid #DDD;}caption{border:1px dashed #DDD;border-bottom:0;padding:3px;text-align:center;}th{border-top:1px solid #BBB;background-color:#F7F7F7;}table tr.firstRow th{border-top-width:2px;}.ue-table-interlace-color-single{ background-color: #fcfcfc; } .ue-table-interlace-color-double{ background-color: #f7faff; }td p{margin:0;padding:0;}</style>"
				+ "<style>@font-face {font-family: 'Fang';src: url(../../file/Fonts/simfang.ttf) format('truetype');}td { font-family: '华文仿宋'; }</style>"
				+ "</head><body><div class=\"ui segments\"  id=\"paper\" style=\"border:0; width:790px\"><div class=\"ui segment\" id=\"father\" style=\"word-wrap:break-word\">";
		StringBuilder sb=new StringBuilder();
		for(String s:data.split(","))
			sb.append((char)Integer.parseInt(s));
		data=sb.toString();
		JSONObject jsonData = JSONObject.fromObject(data);
		Iterator iterator = jsonData.keys();
		while(iterator.hasNext()){
			String key = (String) iterator.next();
			JSONObject value = jsonData.getJSONObject(key);
			String type = value.getString("type");
			String text = value.getString("text");
			if(type.equals("graph")){
				htmlData += "<p class=\"" + type + "\" style=\"text-align: center;\">\n";
				htmlData +=	"<img src=\"../" + text + "\">\n</p>\n";
			}
			else if(type.equals("table")){
				htmlData += "<table class=\"" + type + "\" style=\"margin: 0 auto;\">\n";
				htmlData += text.substring(7);
			}
			else if(type.equals("paging")){
				htmlData += "<div style=\"page-break-before:left\"></div>";
			}
			else{
				String style = "";
				if(type.equals("texttitle1")) style="text-align: center; font-family: SimHei; font-size: 18pt;";
				else if(type.equals("texttitle2")) style="text-align: left; font-family: SimHei; font-size: 16pt;";
				else if(type.equals("texttitle3")) style="text-align: left; font-family: SimHei; font-size: 14pt;";
				else if(type.equals("texttitle4")) style="text-align: left; font-family: SimHei; font-size: 12pt;";
				else if(type.equals("textbody")) style="text-indent: 24pt; text-align: left; font-family: 华文仿宋; font-size: 12pt;";
				else if(type.equals("textnote")) style="text-align: left; font-family: KaiTi; font-size: 10.5pt;";
				else if(type.equals("imagetitle")) style="text-align: center; font-family: STXinwei; font-size: 12pt;";
				htmlData += "<p class=\"" + type + "\" style=\"" + style + "\">" + text + "</p>\n";
			}
		}
		htmlData += "</div>\n</div>\n</body>\n</html>\n";
		saveFile(htmlData, fileName, filePath);
	}

	public void buildData(String data, String areaCode, String areaLevel) throws IOException {
		StringBuilder sb=new StringBuilder();
		for(String s:data.split(","))
			sb.append((char)Integer.parseInt(s));
		data=sb.toString();
		JSONObject jsonData = JSONObject.fromObject(data);
		Iterator iterator = jsonData.keys();
		while(iterator.hasNext()) {
			String key = (String) iterator.next();
			JSONObject value = jsonData.getJSONObject(key);
			String type = value.getString("type");
			String text = value.getString("text");
			//todo
		}
	}
}
