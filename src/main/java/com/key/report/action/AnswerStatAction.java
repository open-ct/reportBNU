package com.key.report.action;

import com.key.common.base.action.CrudActionSupport;
import com.key.common.base.dao.UserDao;
import com.key.common.base.entity.User;
import com.key.common.base.service.AccountManager;
import com.key.common.plugs.page.Page;
import com.key.common.utils.RandomUtils;
import com.key.common.utils.web.Struts2Utils;
import com.key.report.entity.CityAnswerStat;
import com.key.report.service.CityAnswerStatManager;
import com.key.report.service.UserManager;
import com.key.report.stat.ExportUserAnswer;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.poi.util.SystemOutLogger;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.struts2.convention.annotation.*;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;

/**
 *
 */
@Namespaces({@Namespace("/ans")})
@InterceptorRefs({ @InterceptorRef("paramsPrepareParamsStack") })
@Results({
        @Result(name= "answerData",location="/WEB-INF/page/content/diaowen-systat/list.jsp",type= Struts2Utils.DISPATCHER),
        //@Result(name= ActionSupport.SUCCESS,location="/WEB-INF/page/content/diaowen-systat/surveys_stat.jsp",type= Struts2Utils.DISPATCHER),
        @Result(name= ActionSupport.SUCCESS,location="/WEB-INF/page/content/diaowen-systat/school_stat.jsp",type= Struts2Utils.DISPATCHER),
        @Result(name= "city2Page",location="/WEB-INF/page/content/diaowen-systat/city2_stat.jsp",type= Struts2Utils.DISPATCHER),
        @Result(name= "city3Page",location="/WEB-INF/page/content/diaowen-systat/city2_stat.jsp",type= Struts2Utils.DISPATCHER),
        @Result(name= "city3list",location="/WEB-INF/page/content/diaowen-systat/city3_list.jsp",type= Struts2Utils.DISPATCHER)
})
@AllowedMethods({"refUserAnswer","buildAnAcc","surveys","answerData","exportNoAnswerUser","answerList","refresh","refreshAll","updateAll"})
public class AnswerStatAction extends ActionSupport {

    @Autowired
    private UserManager userManager;
    @Autowired
    private AccountManager accountManager;
    @Autowired
    private CityAnswerStatManager cityAnswerStatManager;
//    private Page<Object[]> page = new Page<Object[]>();
    private Page<User> page = new Page<User>();
    private Integer roleType=11;
    private Integer isAnswer=0;

    @Override
    public String execute() throws Exception {
        HttpServletRequest req = Struts2Utils.getRequest();
        User user = accountManager.getCurUser();
		return super.execute();
    }

    public String surveys() throws Exception {
        HttpServletRequest request = Struts2Utils.getRequest();
        User user = accountManager.getCurUser();
        return "surveys";
    }



    /*public String nojoin() throws Exception {
        //1完成，2，未完成，3未开始
        HttpServletRequest request = Struts2Utils.getRequest();
        HttpServletResponse response = Struts2Utils.getResponse();
        String roleType = request.getParameter("roleType");
//        String answerState = request.getParameter("answerState");
        //String schoolCode = request.getParameter("schoolCode")
        User user = accountManager.getCurUser();
        if(user!=null){
//            page = userManager.findAnswerUser(page,user.getXxId(),user.getBgId(),roleType,answerState);
                //未答家长
              if("10".equals(answerState) && user.getRoleType()!=null){
                  if (user.getRoleType().intValue() == 91){
                      //小学未答家长
                      page = userManager.findNoAnswerBySurveyId(page, user.getXxId(),"8a077ed45e90900f015ec3a1614c119e");
                  }else if(user.getRoleType().intValue() == 92){
                      //中学未答家长
                      page = userManager.findNoAnswerBySurveyId(page, user.getXxId(),"8a077ed45e90900f015ec0fe3ad30078");
                  }
              }else if("20".equals(answerState) && user.getRoleType()!=null){
                  if (user.getRoleType().intValue() == 91){
                      //小学未答家长
                      page = userManager.findNoAnswerBySurveyId_s(page, user.getXxId(),"1");
                  }else if(user.getRoleType().intValue() == 92){
                      //中学未答家长
                      page = userManager.findNoAnswerBySurveyId_s(page, user.getXxId(),"2");
                  }
              }
              System.out.println("page.getResult().size():"+page.getResult().size());
            for (Object[] objs:page.getResult()) {
                System.out.println(":www"+objs[0]);
            }
            request.setAttribute("xxname",user.getXxName());
        }
        return "nojoin";
    }*/

    public Page<User> getPage() {
        return page;
    }

    public void setPage(Page<User> page) {
        this.page = page;
    }

    public Integer getRoleType() {
        return roleType;
    }

    public void setRoleType(Integer roleType) {
        this.roleType = roleType;
    }

    public Integer getIsAnswer() {
        return isAnswer;
    }

    public void setIsAnswer(Integer isAnswer) {
        this.isAnswer = isAnswer;
    }
    //生成学校管理账号





}
