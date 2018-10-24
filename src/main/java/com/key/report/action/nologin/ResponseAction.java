package com.key.report.action.nologin;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baidubce.util.DateUtils;
import com.key.report.service.ReportManager;
import com.key.report.service.UserManager;

import org.apache.commons.httpclient.util.DateUtil;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.apache.struts2.convention.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.util.WebUtils;

import com.key.common.base.action.CrudActionSupport;
import com.key.common.base.entity.User;
import com.key.common.base.service.AccountManager;
import com.key.common.plugs.aliyun.AliyunOSS;
import com.key.common.plugs.baiduyun.BaiduBOS;
import com.key.common.plugs.ipaddr.IPService;
import com.key.common.utils.CookieUtils;
import com.key.common.utils.Property;
import com.key.common.utils.HttpRequestDeviceUtils;
import com.key.common.utils.NumberUtils;
import com.key.common.utils.web.Struts2Utils;
import com.key.report.entity.Report;
import com.octo.captcha.service.image.ImageCaptchaService;
import com.opensymphony.xwork2.ActionSupport;


/**
 * 答卷 action
 *
 *
 *
 *
 *
 */

@Namespaces({ @Namespace("/") })
@InterceptorRefs({ @InterceptorRef(value = "paramsPrepareParamsStack") })
@Results({
		@Result(name = ResponseAction.RESULT_FREQUENCY, location = "/WEB-INF/page/reportdir/report/stats/response-frequency.jsp", type = Struts2Utils.DISPATCHER),
		@Result(name = CrudActionSupport.INPUT, location = "/WEB-INF/page/reportdir/report/response/response-report.jsp", type = Struts2Utils.DISPATCHER),
		@Result(name = ResponseAction.INPUT_IFRAME, location = "/WEB-INF/page/reportdir/report/response/response-answer-iframe.jsp", type = Struts2Utils.DISPATCHER),

		@Result(name = ResponseAction.ANSWER_SUCCESS, location = "/WEB-INF/page/content/diaowen-answer/response-success.jsp", type = Struts2Utils.DISPATCHER),
		@Result(name = ResponseAction.ANSWER_FAILURE, location = "/WEB-INF/page/content/diaowen-answer/response-failure.jsp", type = Struts2Utils.DISPATCHER),

		@Result(name = ResponseAction.ANSWER_SUCCESS_M, location = "/WEB-INF/page/content/diaowen-answer/response-success-m.jsp", type = Struts2Utils.DISPATCHER),
		@Result(name = ResponseAction.ANSWER_LOGIN, location = "/WEB-INF/page/content/diaowen-answer/response-input-login.jsp", type = Struts2Utils.DISPATCHER),

		@Result(name = ResponseAction.ANSWER_INPUT_RULE, location = "/WEB-INF/page/content/diaowen-answer/response-input-rule.jsp", type = Struts2Utils.DISPATCHER),
		@Result(name = ResponseAction.ANSWER_ERROR, location = "/WEB-INF/page/content/diaowen-answer/response-input-error.jsp", type = Struts2Utils.DISPATCHER),
		@Result(name = ResponseAction.ANSWER_ERROR_M, location = "/WEB-INF/page/content/diaowen-answer/response-input-error-m.jsp", type = Struts2Utils.DISPATCHER),
		@Result(name = ResponseAction.ANSWER_CODE_ERROR, location = "/wenjuan/${sid}.html?errorcode=3", type = Struts2Utils.REDIRECT),
		@Result(name = ResponseAction.ANSWER_CODE_ERROR_M, location = "/report!answerSurveryMobile.action?reportId=${reportId}&errorcode=3", type = Struts2Utils.REDIRECT),
		@Result(name = ResponseAction.RELOAD_ANSWER_SUCCESS, location = "response!answerSuccess.action?sid=${sid}", type = Struts2Utils.REDIRECT),
		@Result(name = ResponseAction.RELOAD_ANSWER_FAILURE, location = "response!answerFailure.action?reportId=${reportId}", type = Struts2Utils.REDIRECT),
		@Result(name = ResponseAction.RELOAD_ANSER_ERROR, location = "response!answerError.action?reportId=${reportId}", type = Struts2Utils.REDIRECT),
		@Result(name = ResponseAction.RELOAD_ANSER_ERROR_M, location = "response!answerErrorM.action?reportId=${reportId}", type = Struts2Utils.REDIRECT),
		@Result(name = ResponseAction.ANSWER_FAILURE_NOLOGIN, location = "response!answerFailureNoLogin.action", type = Struts2Utils.REDIRECT),
		@Result(name = "nologinMsg", location = "/WEB-INF/page/content/diaowen-answer/response-nologin.jsp", type = Struts2Utils.DISPATCHER),

		@Result(name = ResponseAction.RESPONSE_MSG, location = "/WEB-INF/page/content/diaowen-answer/response-msg.jsp", type = Struts2Utils.DISPATCHER),
		@Result(name = ResponseAction.RELOAD_ANSWER_SUCCESS_M, location = "response!answerSuccessM.action?reportId=${reportId}", type = Struts2Utils.REDIRECT),
		@Result(name = ResponseAction.RESPONSE_MOBILE, location = "response!answerMobile.action?reportId=${reportId}", type = Struts2Utils.REDIRECT) })

@AllowedMethods({"saveMobile","answerSuccess","answerMobile","answerFailure","answerError","answerSuccessM","ajaxCheckReport","answerFailureNoLogin"})
public class ResponseAction extends ActionSupport {
	private static final long serialVersionUID = -2289729314160067840L;

	protected static final String RESULT_FREQUENCY = "resultFrequency";
	protected final static String INPUT_IFRAME = "input_iframe";
	protected final static String ANSWER_SUCCESS = "answerSuccess";
	protected final static String ANSWER_FAILURE = "answerFailure";
	protected final static String ANSWER_ERROR = "answerError";
	protected final static String ANSWER_ERROR_M = "answerErrorM";

	protected final static String ANSWER_SUCCESS_M = "answerSuccessM";

	protected final static String RELOAD_ANSWER_SUCCESS = "reloadAnswerSuccess";
	protected final static String RELOAD_ANSWER_FAILURE = "reloadAnswerFailure";
	protected final static String RELOAD_ANSER_ERROR = "reloadAnserError";// 已经答过，在间隔时间内
	protected final static String RELOAD_ANSER_ERROR_M = "reloadAnserErrorM";// 已经答过，在间隔时间内
	protected final static String ANSWER_FAILURE_NOLOGIN = "reloadAnserNoLogin";// 未登录提交

	protected final static String ANSWER_CODE_ERROR = "answerCodeError";// 验证码不正确
	protected final static String ANSWER_CODE_ERROR_M = "answerCodeErrorM";// 验证码不正确
	protected final static String ANSWER_INPUT_RULE = "answer_input_rule";// 令牌

	protected final static String RELOAD_ANSWER_SUCCESS_M = "reloadAnswerSuccessM";//

	protected final static String SURVEY_RESULT = "reportResult";

	protected final static String RESPONSE_MSG = "responseMsg";

	protected final static String RESPONSE_MOBILE = "responseMobile";
	protected final static String ANSWER_LOGIN = "answer_login";

	private String sid;
	private String reportId;
	@Autowired
	private ReportManager directoryManager;
	@Autowired
	private IPService ipService;
	@Autowired
	private AccountManager accountManager;
	@Autowired
	private UserManager userManager;
	// @Autowired
	// private GenericManageableCaptchaService captchaService;
	@Autowired
	private ImageCaptchaService imageCaptchaService;

	/**
	 * 进入答卷页面
	 */
	public String execute() throws Exception {
		HttpServletRequest request = Struts2Utils.getRequest();
		HttpServletResponse response = Struts2Utils.getResponse();
		Report directory = directoryManager.getReportBySid(sid);
		if (directory != null) {
			reportId = directory.getId();
			if (HttpRequestDeviceUtils.isMobileDevice(request)) {
				//请在电脑上作答
				return RESPONSE_MOBILE;
			} else {
				String htmlPath = directory.getHtmlPath();
				request.getRequestDispatcher("/" + htmlPath).forward(request,
						response);
			}
		}

		return NONE;
	}

	public String answerSuccess() throws Exception {
		HttpServletRequest request = Struts2Utils.getRequest();
		Report directory = directoryManager.getReportBySid(sid);
		request.setAttribute("reportName", directory.getReportName());
		request.setAttribute("sid", directory.getSid());
		return ANSWER_SUCCESS;
	}

	public String answerFailureNoLogin() throws Exception {
		return "nologinMsg";
	}

	public String answerFailure() throws Exception {
		HttpServletRequest request = Struts2Utils.getRequest();
		Report directory = directoryManager.get(reportId);
		request.setAttribute("reportName", directory.getReportName());
		request.setAttribute("sId", directory.getSid());
		return ANSWER_FAILURE;
	}

	public String answerError() throws Exception {
		HttpServletRequest request = Struts2Utils.getRequest();
		Report directory = directoryManager.get(reportId);
		request.setAttribute("reportName", directory.getReportName());
		request.setAttribute("sId", directory.getSid());
		String ipAddr = ipService.getIp(request);
		request.setAttribute("ip", ipAddr);
		return ANSWER_ERROR;
	}

	public String answerErrorM() throws Exception {
		HttpServletRequest request = Struts2Utils.getRequest();
		Report directory = directoryManager.get(reportId);
		request.setAttribute("reportName", directory.getReportName());
		request.setAttribute("sId", directory.getSid());
		String ipAddr = ipService.getIp(request);
		request.setAttribute("ip", ipAddr);
		return ANSWER_ERROR_M;
	}

	public String answerSuccessM() throws Exception {
		HttpServletRequest request = Struts2Utils.getRequest();
		Report directory = directoryManager.get(reportId);
		request.setAttribute("directory", directory);
		return ANSWER_SUCCESS_M;
	}

	/**
	 * 异步有效性验证
	 *
	 * @return
	 */
	public String ajaxCheckReport() throws Exception {
		HttpServletRequest request = Struts2Utils.getRequest();
		HttpServletResponse response = Struts2Utils.getResponse();
		// 0 1 2
		String ajaxResult = "0";
		try {
			Report directory = directoryManager.getReport(reportId);
			User user = accountManager.getCurUser();
			request.setAttribute("directory", directory);
			// 调查规则
			String reportStatus = "0";
			String isCheckCode = "0";
			ajaxResult = "{reportStatus:\"" + reportStatus
					+ "\",isCheckCode:\"" + isCheckCode
					+ "\",userId:\"" + user.getId()
					+ "\"}";
		} catch (Exception e) {
			e.printStackTrace();
		}
		response.getWriter().write(ajaxResult);
		return null;
	}

	public String getSid() {
		return sid;
	}

	public void setSid(String sid) {
		this.sid = sid;
	}

	public String getReportId() {
		return reportId;
	}

	public void setReportId(String reportId) {
		this.reportId = reportId;
	}

}
