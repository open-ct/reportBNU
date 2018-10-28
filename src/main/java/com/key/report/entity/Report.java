package com.key.report.entity;

import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.Formula;

import com.key.common.base.entity.IdEntity;

/**
 * 
 */
@Entity
@Table(name="t_report")
public class Report extends IdEntity{
	
	//用于短链接的ID
	private String sid;
	private String parentId="";
	private String reportName;
	//创建者ID
	private String userId;
	//创建时间
	private Date createDate=new Date();
	//报告状态  0默认设计状态  1执行中 2结束 
	private Integer reportState=0;
	
	//问卷标识 默认 0待审核  1审核通过  2审核未通过
	private Integer reportTag=1;

	//报告所属分类
	private Integer reportType;//1 学生 2家长 3老师 4校长
	
	//报告所属层级
	private Integer reportLevel;//1 学生 2家长 3老师 4校长
	//报告所属区域ID
	private Integer areaId;//1 学生 2家长 3老师 4校长
	
	//静态HTML保存路径
	private String htmlPath;
	private Integer visibility;
	private Integer orderbyNum;
	
	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	public String getReportName() {
		return reportName;
	}

	public void setReportName(String reportName) {
		this.reportName = reportName;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Integer getReportState() {
		return reportState;
	}

	public void setReportState(Integer reportState) {
		this.reportState = reportState;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Integer getReportTag() {
		return reportTag;
	}

	public void setReportTag(Integer reportTag) {
		this.reportTag = reportTag;
	}

	public String getHtmlPath() {
		return htmlPath;
	}

	public void setHtmlPath(String htmlPath) {
		this.htmlPath = htmlPath;
	}


	public String getSid() {
		return sid;
	}

	public void setSid(String sid) {
		this.sid = sid;
	}

	public Integer getReportType() {
		return reportType;
	}

	public void setReportType(Integer reportType) {
		this.reportType = reportType;
	}

	public String groupName;
	@Transient
	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	public Integer getOrderbyNum() {
		return orderbyNum;
	}

	public void setOrderbyNum(Integer orderbyNum) {
		this.orderbyNum = orderbyNum;
	}

	//用户名
	private String userName;
	@Formula("(select o.name from t_user o where o.id = user_id)")
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Integer getReportLevel() {
		return reportLevel;
	}

	public void setReportLevel(Integer reportLevel) {
		this.reportLevel = reportLevel;
	}

	public Integer getAreaId() {
		return areaId;
	}

	public void setAreaId(Integer areaId) {
		this.areaId = areaId;
	}

	public Integer getVisibility() {
		return visibility;
	}

	public void setVisibility(Integer visibility) {
		this.visibility = visibility;
	}
	
}
