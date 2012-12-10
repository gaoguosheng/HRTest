package com.ggs.hrtest.bean;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Created with IntelliJ IDEA.
 * User: ggs
 * Date: 12-12-7
 * Time: 下午4:56
 * To change this template use File | Settings | File Templates.
 */
@Entity
@Table(name="t_usertest")
public class UserTest {
    @GenericGenerator(name = "generator", strategy = "increment")
    @Id
    @GeneratedValue(generator = "generator")
    private  Integer utestid;
    private Integer userid;
    private Integer testid;
    private String creattime;

    public Integer getUtestid() {
        return utestid;
    }

    public void setUtestid(Integer utestid) {
        this.utestid = utestid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Integer getTestid() {
        return testid;
    }

    public void setTestid(Integer testid) {
        this.testid = testid;
    }

    public String getCreattime() {
        return creattime;
    }

    public void setCreattime(String creattime) {
        this.creattime = creattime;
    }
}
