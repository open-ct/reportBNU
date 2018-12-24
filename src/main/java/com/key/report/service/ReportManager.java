package com.key.report.service;

import java.io.IOException;
import java.util.List;

import com.key.common.plugs.page.Page;
import com.key.common.service.BaseService;
import com.key.report.entity.Report;

/**
 * 问卷处理
 * 
 *
 * 
 * 
 */
public interface ReportManager extends BaseService<Report, String>{

	/**
	 * 根据 最底层对象，得到此对象所在的目录结构
	 * @param Report
	 * @return
	 */
	public List<Report> findPath(Report Report);
	
	public Report getReport(String id);
	
	public Report getReportBySid(String sId);

	public Report getReportByUser(String id,String userId); 

	public void closeReport(Report entity);

	public Report findByNameUn(String id,String parentId, String reportName);

	public void backDesign(Report entity);

//	public void save(Report entity, String[] surGroupIds);

//	public void saveUserReport(Report entity, String[] surGroupIds);
	
	public void saveUser(Report t);
	
	public void saveUserReport(Report entity);

	public Report findByNameUserUn(String id, String reportName);

	public Page<Report> findPage(Page<Report> page,
			Report entity);

	public List<Report> newReportList();

	public void upSuveyText(Report entity);

	public void checkUp(Report Report);

	public Report findNext(Report directory);
	
	public void saveAll(Report directory);

	public Page<Report> findByUser(Page<Report> page,Report Report);
	
	public Page<Report> findByGroup(String groupId1,String groupId2,Page<Report> page);

	public List<Report> findByIndex();
	
	public List<Report> findByT1();
	
	public void saveByAdmin(Report t);

	public Page<Report> findModel(Page<Report> page,
			Report entity);

	public Report createByReport(String fromBankId, String reportName,
										  String tag);

	public String readData(String reportId) throws IOException;

	public void saveData(String data, String reportId) throws IOException;

	public void saveFile(String data, String fileName, String filePath) throws IOException;

	public void saveHtml(String data, String fileName, String filePath) throws IOException;

	public void buildData(String data, String areaCode, String areaLevel) throws IOException;
}
