package com.ggs.hrtest.model;

/**
 * Created with IntelliJ IDEA.
 * User: ggs
 * Date: 12-12-13
 * Time: 下午4:40
 * To change this template use File | Settings | File Templates.
 */
public class UserModel extends BaseModel {

    private Integer userid;
    private String username;
    private String pwd="e10adc3949ba59abbe56e057f20f883e";
    private Integer roleid;

    public Integer getRoleid() {
        return roleid;
    }

    public void setRoleid(Integer roleid) {
        this.roleid = roleid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }
}
