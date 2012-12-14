package com.ggs.hrtest.dao.impl;

import com.ggs.hrtest.dao.IMenuDao;
import com.ggs.hrtest.model.MenuModel;
import com.ggs.hrtest.model.PageModel;
import com.ggs.util.HibernateUtil;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: ggs
 * Date: 12-12-14
 * Time: 上午9:37
 * To change this template use File | Settings | File Templates.
 */
public class MenuDaoImpl extends BaseDAO implements IMenuDao {
    @Override
    public List list(MenuModel menuModel) {
        return HibernateUtil.sqlQuery("select * from t_menu where menuid in (select menuid from t_rolemenu where roleid=?) order by ordernum",new Object[]{menuModel.getAdmin().getRoleid()});
    }
}
