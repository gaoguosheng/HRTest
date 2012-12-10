package com.ggs.hrtest.dao;


import com.ggs.hrtest.bean.User;

public interface IUserDao {

	public User checkUserExist(User user);

    public void updatePwd(User user);
}
