package com.ggs.hrtest.dao.impl;

import com.ggs.hrtest.model.PageModel;
import com.ggs.hrtest.model.BaseModel;
import com.ggs.util.HibernateUtil;
import com.ggs.util.NullUtil;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: ggs
 * Date: 12-12-11
 * Time: 上午10:08
 * To change this template use File | Settings | File Templates.
 */
public class BaseDAO {
    protected HibernateUtil hibernateUtil = new HibernateUtil();

    protected PageModel getPageBean(String sql,BaseModel baseModel){
        PageModel pageModel = new PageModel();
        StringBuilder orderSql = new StringBuilder();
        if(NullUtil.isNotNull(baseModel.getSortField())){
            orderSql.append(" order by ");
            orderSql.append(baseModel.getSortField());
            orderSql.append(" ");
            orderSql.append(baseModel.getSortOrder());
        }
        String pageSql=sql+orderSql;
        int total = hibernateUtil.countForInt(pageSql);
        List data = hibernateUtil.sqlQuery(pageSql, baseModel.getPageIndex(), baseModel.getPageSize());
        pageModel.setTotal(total);
        pageModel.setData(data);
        return pageModel;
    }
}
