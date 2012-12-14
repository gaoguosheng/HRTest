package com.ggs.hrtest.dao.impl;

import java.util.List;

import com.ggs.comm.Const;
import com.ggs.hrtest.model.PageModel;
import com.ggs.hrtest.model.BaseModel;
import com.ggs.hrtest.model.UserModel;
import com.ggs.hrtest.po.User;
import com.ggs.hrtest.dao.IUserDao;
import com.ggs.util.HibernateUtil;
import com.ggs.util.NullUtil;


public class UserDaoImpl extends BaseDAO implements IUserDao {

	@Override
	public User checkUserExist(User user) {
        User result  = null;
        List<User> list = hibernateUtil.query("from User where username=? and pwd=?",new Object[]{user.getUsername(),user.getPwd()});
        if(list.size()>0){
            result=list.get(0);
        }
        return result;
	}

    public void updatePwd(User user){
        User u = (User)hibernateUtil.get(User.class,user.getUserid());
        u.setPwd(user.getPwd());
        hibernateUtil.update(u);
    }

    public void saveUser(User user){
        hibernateUtil.saveOrUpdate(user);
    }

    public PageModel getUserList(UserModel userModel){
        StringBuilder sql = new StringBuilder();
        sql.append(" select * from v_user where 1=1 and username<>'"+ Const.ADMIN_USER+"'");
        if(NullUtil.isNotNull(userModel.getUsername())){
            sql.append(" and username like '%"+userModel.getUsername()+"%'");
        }
        PageModel pageModel =this.getPageBean(sql.toString(),userModel);
        return pageModel;
    }



    public void resetPwd(int userid){
        User user   = (User) hibernateUtil.get(User.class, userid);
        user.setPwd("e10adc3949ba59abbe56e057f20f883e");
        hibernateUtil.update(user);
    }


}
