package com.key.report.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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
}
