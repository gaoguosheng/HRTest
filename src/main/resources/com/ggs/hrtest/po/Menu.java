package com.ggs.hrtest.po;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Created with IntelliJ IDEA.
 * User: ggs
 * Date: 12-12-14
 * Time: 上午9:30
 * To change this template use File | Settings | File Templates.
 */
@Entity
@Table(name="t_menu")
public class Menu {
    @GenericGenerator(name = "generator", strategy = "increment")
    @Id
    @GeneratedValue(generator = "generator")
    private Integer menuid;
    private String menuname;
    private Integer ordernum;
    private Integer upid;
    private String url;

    public Integer getMenuid() {
        return menuid;
    }

    public void setMenuid(Integer menuid) {
        this.menuid = menuid;
    }

    public String getMenuname() {
        return menuname;
    }

    public void setMenuname(String menuname) {
        this.menuname = menuname;
    }

    public Integer getOrdernum() {
        return ordernum;
    }

    public void setOrdernum(Integer ordernum) {
        this.ordernum = ordernum;
    }

    public Integer getUpid() {
        return upid;
    }

    public void setUpid(Integer upid) {
        this.upid = upid;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
}
