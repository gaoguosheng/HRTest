package com.ggs.hrtest.dao.impl;

import com.ggs.hrtest.dao.IRoleDao;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: ggs
 * Date: 12-12-14
 * Time: 下午3:23
 * To change this template use File | Settings | File Templates.
 */
public class RoleDaoImpl extends BaseDAO implements IRoleDao {

    public List list(){
        return this.hibernateUtil.query("from Role");
    }

    public List getMenuList(int roleid){
        StringBuilder sql = new StringBuilder();
        sql.append(" select * from t_menu ");
        sql.append(" where menuid in (select menuid from t_rolemenu where roleid=?) ");
        sql.append(" order by ordernum");
        return hibernateUtil.sqlQuery(sql.toString(),new Object[]{roleid});
    }
}
