package com.key.common.base.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 * 
 *
 *
 *
 */
@Entity
@Table(name = "T_USER")
public class User extends IdEntity {
	private String loginName;//学号
	private String shaPassword;
	//用户名
	private String name;//姓名
	private Date lastLoginTime;

	private Integer roleType=0;
	private String city1;//名称
	private String city1_id;//id
	private String city2;//
	private String city2_id;//
	private String city3;//
	private String city3_id;//

	private String xxId;//学校ID
	private String xxName;//学校名称

	@Column(nullable = false, unique = true)
	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getShaPassword() {
		return shaPassword;
	}

	public void setShaPassword(String shaPassword) {
		this.shaPassword = shaPassword;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	

	public Date getLastLoginTime() {
		return lastLoginTime;
	}

	public void setLastLoginTime(Date lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}

	
	public Integer getRoleType() {
		return roleType;
	}

	public void setRoleType(Integer roleType) {
		this.roleType = roleType;
	}

	public String getCity1() {
		return city1;
	}

	public void setCity1(String city1) {
		this.city1 = city1;
	}

	public String getCity1_id() {
		return city1_id;
	}

	public void setCity1_id(String city1_id) {
		this.city1_id = city1_id;
	}

	public String getCity2() {
		return city2;
	}

	public void setCity2(String city2) {
		this.city2 = city2;
	}

	public String getCity2_id() {
		return city2_id;
	}

	public void setCity2_id(String city2_id) {
		this.city2_id = city2_id;
	}

	public String getCity3() {
		return city3;
	}

	public void setCity3(String city3) {
		this.city3 = city3;
	}

	public String getCity3_id() {
		return city3_id;
	}

	public void setCity3_id(String city3_id) {
		this.city3_id = city3_id;
	}

	public String getXxId() {
		return xxId;
	}

	public void setXxId(String xxId) {
		this.xxId = xxId;
	}

	public String getXxName() {
		return xxName;
	}

	public void setXxName(String xxName) {
		this.xxName = xxName;
	}


	private String plainPassword;
	@Transient
	public String getPlainPassword() {
		return plainPassword;
	}

	public void setPlainPassword(String plainPassword) {
		this.plainPassword = plainPassword;
	}

	private String pwd;
	@Transient
	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	
}