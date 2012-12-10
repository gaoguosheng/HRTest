package com.ggs.hrtest.action;

import java.io.IOException;
import java.io.Serializable;
import java.io.UnsupportedEncodingException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ggs.hrtest.bean.PageParam;
import com.ggs.hrtest.bean.User;
import com.ggs.util.NullUtil;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;

import com.google.gson.GsonBuilder;
import com.opensymphony.xwork2.ActionSupport;


/**
 * Action 基类
 * 
 * @author GGS
 * @version 20110915
 */

public  class BaseAction extends ActionSupport implements
		ServletRequestAware, ServletResponseAware, Serializable {

	protected HttpServletRequest request;
	protected HttpServletResponse response;
	protected HttpSession session;
	protected ServletContext servletContext;


	/**
	 * 设置request、session、servletcontext
	 */
	public void setServletRequest(HttpServletRequest req) {
		this.request = req;
		this.session = this.request.getSession();
		this.servletContext = this.session.getServletContext();		
		try {
			this.request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 设置response
	 */
	public void setServletResponse(HttpServletResponse res) {
		this.response = res;		
		this.response.setCharacterEncoding("UTF-8");
	}

	/**
	 * 请求转发
	 * 
	 * @param url
	 *            转发地址
	 */
	public void forward(String url) {
		try {
			this.request.getRequestDispatcher(url).forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 重定向
	 * 
	 * @param url
	 *            重定向地址
	 */
	public void redirect(String url) {
		try {
			response.sendRedirect(request.getContextPath() + url);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 输出js脚本
	 *
	 */
	public void out(String html) {
		try {
			response.getWriter().print(html);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 得到json
	 * */
	public String getJson(Object o){		
			return new GsonBuilder().create().toJson(o);	
	}
	
	
	/**
	 * 输出json
	 * */
	public void outJson(Object o){
		try {
			response.getWriter().print(getJson(o));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * json转Object
	 * */
	public Object jsonToObject(String json,Class c){		
		return  new GsonBuilder().create().fromJson(json, c);		
	}
    /**
     * 自动获取json参数转Object
     * */
    public Object getJsonObject(String jsonParam,Class c){
        String json = request.getParameter(jsonParam);
        return  new GsonBuilder().create().fromJson(json, c);
    }
    /**
     * 自动获取json参数转Object  默认json参数为data
     * */
    public Object getJsonObject(Class c){
        String json = request.getParameter("data");
        return  new GsonBuilder().create().fromJson(json, c);
    }
	
	/**
	 * 获取分页参数
	 * */
	public PageParam getPageParam(){
		PageParam pageParam = new PageParam();
		pageParam.setSortField(request.getParameter("sortField"));
		pageParam.setSortOrder(request.getParameter("sortOrder"));
		pageParam.setPageIndex(request.getParameter("pageIndex")!=null?Integer.parseInt(request.getParameter("pageIndex")):0);
		pageParam.setPageSize(request.getParameter("pageSize")!=null?Integer.parseInt(request.getParameter("pageSize")):10);
		return pageParam;
	}

    public User getAdmin(){
        return (User)session.getAttribute("admin");
    }

    public int getIntParam(String param){
        if(NullUtil.isNotNull(request.getParameter(param))){
            return Integer.parseInt(request.getParameter(param));
        }else{
            return -1;
        }

    }
	

}

