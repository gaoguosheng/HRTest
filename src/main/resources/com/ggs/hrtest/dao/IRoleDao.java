package com.ggs.hrtest.dao;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: ggs
 * Date: 12-12-14
 * Time: 下午3:22
 * To change this template use File | Settings | File Templates.
 */
public interface IRoleDao {
    public List list();
    public List getMenuList(int roleid);
}
