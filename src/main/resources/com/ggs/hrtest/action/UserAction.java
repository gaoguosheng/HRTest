package com.ggs.hrtest.action;

import com.ggs.hrtest.model.PageModel;
import com.ggs.hrtest.model.UserModel;
import com.ggs.hrtest.po.User;
import com.ggs.hrtest.dao.IUserDao;
import com.ggs.hrtest.dao.impl.UserDaoImpl;
import com.ggs.util.MD5;
import com.opensymphony.xwork2.ModelDriven;


/**
 * Created with IntelliJ IDEA.
 * User: ggs
 * Date: 12-11-26
 * Time: 下午12:22
 * To change this template use File | Settings | File Templates.
 */
public class UserAction extends BaseAction {
    private UserModel model = new UserModel();
    private IUserDao userDao = new UserDaoImpl();
    @Override
    public UserModel getModel() {
        return this.model;
    }
    /**
     * 修改密码
     * */
    public void updatePwd(){
        User user = (User) this.getJsonObject(User.class);
        user.setPwd(MD5.getMD5(user.getPwd()));
        user.setUserid(this.getAdmin().getUserid());
        this.userDao.updatePwd(user);
    }

    /**
     * 添加用户
     * */
    public void saveUser(){
        User user = (User) this.getJsonObject(User.class);
        if(user.getUserid()==-1){
            user.setUserid(null);
            user.setPwd(MD5.getMD5("123456"));
        }
        this.userDao.saveUser(user);
    }

    /**
     * 获取用户列表
     * */
    public void getUserList(){
        PageModel pageModel = userDao.getUserList(this.getModel());
        this.outJson(pageModel);
    }

    /**
     * 重置密码
     * */
    public void resetPwd(){
        this.userDao.resetPwd(this.getModel().getUserid());
    }

}
