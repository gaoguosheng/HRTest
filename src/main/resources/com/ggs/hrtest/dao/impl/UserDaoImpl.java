package com.ggs.hrtest.dao.impl;

import java.util.List;

import com.ggs.hrtest.bean.User;
import com.ggs.hrtest.dao.IUserDao;
import com.ggs.util.HibernateUtil;


public class UserDaoImpl implements IUserDao {

	@Override
	public User checkUserExist(User user) {
        User result  = null;
        List<User> list = HibernateUtil.query("from User where username=? and pwd=?",new Object[]{user.getUsername(),user.getPwd()});
        if(list.size()>0){
            result=list.get(0);
        }
        return result;
	}

    public void updatePwd(User user){
        User u = (User)HibernateUtil.get(User.class,user.getUserid());
        u.setPwd(user.getPwd());
        HibernateUtil.update(u);
    }

}
