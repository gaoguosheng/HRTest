package com.ggs.hrtest.dao;


import com.ggs.hrtest.bean.PageBean;
import com.ggs.hrtest.bean.PageParam;
import com.ggs.hrtest.bean.User;

public interface IUserDao {

	public User checkUserExist(User user);

    public void updatePwd(User user);

    public void saveUser(User user);

    public void saveUsers(User[]users);

    public PageBean getUserList(User user,PageParam param);
}
