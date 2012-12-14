package com.ggs.hrtest.interceptor;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ggs.hrtest.action.BaseAction;
import com.ggs.hrtest.model.BaseModel;
import com.ggs.hrtest.po.User;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;
/**
 * 验证是否登陆拦截器
 * @author GGS
 * @version 20110916
 * */
public class AdminInterceptor implements Interceptor {
	
	private static final long serialVersionUID = 1L;


	
	

	public String intercept(ActionInvocation ai) throws Exception {

		
		HttpServletRequest request =  ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		HttpServletResponse response = ServletActionContext.getResponse();
		//清理缓存
		response.setHeader("progma","no-cache");
		response.setHeader("Cache-Control","no-cache");
		response.setDateHeader("Expires",0);

        if(session.getAttribute("admin")!=null){
            User admin = (User) session.getAttribute("admin");
            //回调Action
            BaseAction baseAction = (BaseAction) ai.getAction();
            //取出model
            BaseModel model =  baseAction.getModel();
            //设置admin
            model.setAdmin(admin);
        }

		return ai.invoke();
	}

	public void destroy() {
		
	}
	public void init() {		
		
	}
}

