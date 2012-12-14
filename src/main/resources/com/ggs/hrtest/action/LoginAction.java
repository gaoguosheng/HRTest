package com.ggs.hrtest.action;

import com.ggs.hrtest.po.User;
import com.ggs.hrtest.dao.IUserDao;
import com.ggs.hrtest.dao.impl.UserDaoImpl;
import com.ggs.util.MD5;

import java.util.HashMap;
import java.util.Map;





public class LoginAction extends BaseAction {

	private IUserDao userDao = new UserDaoImpl();

	public void checkLogin(){
        User user= (User) this.getJsonObject(User.class);
        user.setPwd(MD5.getMD5(user.getPwd()));
		User userBean = this.userDao.checkUserExist(user);
		Map json = new HashMap();
		if(userBean!=null){
            //登录成功
            session.setAttribute("admin",userBean);
            json.put("status","1");
		}else{
            json.put("status","0");
		}
		this.outJson(json);
	}
	
}
