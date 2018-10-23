package com.key.report.entity;

import com.key.common.base.entity.IdEntity;

import javax.persistence.Entity;
import javax.persistence.Table;
import java.util.Date;

/**
 * Created by keyuan on 17/11/8.
 */
@Entity
@Table(name="t_city_answer_stat")
public class CityAnswerStat extends IdEntity {

    private String parentId;
    private String cityId;
    private String cityName;

    //用户数
    private Integer totalUser;
    private Integer totalUserStu11;
    private Integer totalUserTea13;
    private Integer totalUserXz14;

    private Integer totalUserStu21;
    private Integer totalUserTea23;
    private Integer totalUserXz24;

    //参与人数
    private Integer joinUser;

    private Integer joinUserStu11;
    private Integer joinUserJz12;
    private Integer joinUserTea13;
    private Integer joinUserXz14;

    private Integer joinUserStu21;
    private Integer joinUserJz22;
    private Integer joinUserTea23;
    private Integer joinUserXz24;

    //答卷数


    private Integer answerSumTotle;
    private Integer answerSumStu11;
    private Integer answerSumJz12;
    private Integer answerSumTea13;
    private Integer answerSumXz14;

    private Integer answerSumStu21;
    private Integer answerSumJz22;
    private Integer answerSumTea23;
    private Integer answerSumXz24;


    public String getParentId() {
        return parentId;
    }

    public void setParentId(String parentId) {
        this.parentId = parentId;
    }

    public String getCityId() {
        return cityId;
    }

    public void setCityId(String cityId) {
        this.cityId = cityId;
    }

    public String getCityName() {
        return cityName;
    }

    public void setCityName(String cityName) {
        this.cityName = cityName;
    }

    public Integer getTotalUser() {
        return totalUser;
    }

    public void setTotalUser(Integer totalUser) {
        this.totalUser = totalUser;
    }

    public Integer getTotalUserStu11() {
        return totalUserStu11;
    }

    public void setTotalUserStu11(Integer totalUserStu11) {
        this.totalUserStu11 = totalUserStu11;
    }

    public Integer getTotalUserTea13() {
        return totalUserTea13;
    }

    public void setTotalUserTea13(Integer totalUserTea13) {
        this.totalUserTea13 = totalUserTea13;
    }

    public Integer getTotalUserXz14() {
        return totalUserXz14;
    }

    public void setTotalUserXz14(Integer totalUserXz14) {
        this.totalUserXz14 = totalUserXz14;
    }

    public Integer getTotalUserStu21() {
        return totalUserStu21;
    }

    public void setTotalUserStu21(Integer totalUserStu21) {
        this.totalUserStu21 = totalUserStu21;
    }

    public Integer getTotalUserTea23() {
        return totalUserTea23;
    }

    public void setTotalUserTea23(Integer totalUserTea23) {
        this.totalUserTea23 = totalUserTea23;
    }

    public Integer getTotalUserXz24() {
        return totalUserXz24;
    }

    public void setTotalUserXz24(Integer totalUserXz24) {
        this.totalUserXz24 = totalUserXz24;
    }

    public Integer getJoinUser() {
        return joinUser;
    }

    public void setJoinUser(Integer joinUser) {
        this.joinUser = joinUser;
    }

    public Integer getJoinUserStu11() {
        return joinUserStu11;
    }

    public void setJoinUserStu11(Integer joinUserStu11) {
        this.joinUserStu11 = joinUserStu11;
    }

    public Integer getJoinUserJz12() {
        return joinUserJz12;
    }

    public void setJoinUserJz12(Integer joinUserJz12) {
        this.joinUserJz12 = joinUserJz12;
    }

    public Integer getJoinUserTea13() {
        return joinUserTea13;
    }

    public void setJoinUserTea13(Integer joinUserTea13) {
        this.joinUserTea13 = joinUserTea13;
    }

    public Integer getJoinUserXz14() {
        return joinUserXz14;
    }

    public void setJoinUserXz14(Integer joinUserXz14) {
        this.joinUserXz14 = joinUserXz14;
    }

    public Integer getJoinUserStu21() {
        return joinUserStu21;
    }

    public void setJoinUserStu21(Integer joinUserStu21) {
        this.joinUserStu21 = joinUserStu21;
    }

    public Integer getJoinUserJz22() {
        return joinUserJz22;
    }

    public void setJoinUserJz22(Integer joinUserJz22) {
        this.joinUserJz22 = joinUserJz22;
    }

    public Integer getJoinUserTea23() {
        return joinUserTea23;
    }

    public void setJoinUserTea23(Integer joinUserTea23) {
        this.joinUserTea23 = joinUserTea23;
    }

    public Integer getJoinUserXz24() {
        return joinUserXz24;
    }

    public void setJoinUserXz24(Integer joinUserXz24) {
        this.joinUserXz24 = joinUserXz24;
    }

    public Integer getAnswerSumTotle() {
        return answerSumTotle;
    }

    public void setAnswerSumTotle(Integer answerSumTotle) {
        this.answerSumTotle = answerSumTotle;
    }

    public Integer getAnswerSumStu11() {
        return answerSumStu11;
    }

    public void setAnswerSumStu11(Integer answerSumStu11) {
        this.answerSumStu11 = answerSumStu11;
    }

    public Integer getAnswerSumJz12() {
        return answerSumJz12;
    }

    public void setAnswerSumJz12(Integer answerSumJz12) {
        this.answerSumJz12 = answerSumJz12;
    }

    public Integer getAnswerSumTea13() {
        return answerSumTea13;
    }

    public void setAnswerSumTea13(Integer answerSumTea13) {
        this.answerSumTea13 = answerSumTea13;
    }

    public Integer getAnswerSumXz14() {
        return answerSumXz14;
    }

    public void setAnswerSumXz14(Integer answerSumXz14) {
        this.answerSumXz14 = answerSumXz14;
    }

    public Integer getAnswerSumStu21() {
        return answerSumStu21;
    }

    public void setAnswerSumStu21(Integer answerSumStu21) {
        this.answerSumStu21 = answerSumStu21;
    }

    public Integer getAnswerSumJz22() {
        return answerSumJz22;
    }

    public void setAnswerSumJz22(Integer answerSumJz22) {
        this.answerSumJz22 = answerSumJz22;
    }

    public Integer getAnswerSumTea23() {
        return answerSumTea23;
    }

    public void setAnswerSumTea23(Integer answerSumTea23) {
        this.answerSumTea23 = answerSumTea23;
    }

    public Integer getAnswerSumXz24() {
        return answerSumXz24;
    }

    public void setAnswerSumXz24(Integer answerSumXz24) {
        this.answerSumXz24 = answerSumXz24;
    }
}
