package com.ggs.hrtest.action;

import com.ggs.hrtest.bean.User;
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
public class UserAction extends BaseAction implements ModelDriven<User>{
    private User model = new User();
    private IUserDao userDao = new UserDaoImpl();
    @Override
    public User getModel() {
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


}
