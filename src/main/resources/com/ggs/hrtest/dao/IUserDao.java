package com.ggs.hrtest.dao;


import com.ggs.hrtest.model.PageModel;
import com.ggs.hrtest.model.BaseModel;
import com.ggs.hrtest.model.UserModel;
import com.ggs.hrtest.po.User;

public interface IUserDao {

	public User checkUserExist(User user);

    public void updatePwd(User user);

    public void saveUser(User user);

    public PageModel getUserList(UserModel userModel);

    public void resetPwd(int userid);
}
