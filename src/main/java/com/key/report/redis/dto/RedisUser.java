package com.key.report.redis.dto;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by keyuan on 17/10/24.
 */
public class RedisUser implements Serializable {
    private String id;
    private String loginName;//学号
    private String name;//姓名
    //2激活 1未激活 0不可用
    private Integer status=1;// 账号状态
    private Integer version = 1;//1 默认 2测试  3 正式考试账号
    private Integer roleType=0;//1学生，2家长，3老师，4校长
    private String city2;//
    private String city2_id;//
    private String city3;//
    private String city3_id;//

    private String xxId;//学校ID
    private String xxName;//学校名称
    private String ngId;//年级ID
    private String ngName;//年级Name
    private String bgId;//班级ID
    private String bgName;//班级name
    private String teaCourse;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getVersion() {
        return version;
    }

    public void setVersion(Integer version) {
        this.version = version;
    }

    public Integer getRoleType() {
        return roleType;
    }

    public void setRoleType(Integer roleType) {
        this.roleType = roleType;
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

    public String getNgId() {
        return ngId;
    }

    public void setNgId(String ngId) {
        this.ngId = ngId;
    }

    public String getNgName() {
        return ngName;
    }

    public void setNgName(String ngName) {
        this.ngName = ngName;
    }

    public String getBgId() {
        return bgId;
    }

    public void setBgId(String bgId) {
        this.bgId = bgId;
    }

    public String getBgName() {
        return bgName;
    }

    public void setBgName(String bgName) {
        this.bgName = bgName;
    }

    public String getTeaCourse() {
        return teaCourse;
    }

    public void setTeaCourse(String teaCourse) {
        this.teaCourse = teaCourse;
    }
}
