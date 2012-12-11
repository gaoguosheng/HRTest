package com.ggs.hrtest.dao.impl;

import com.ggs.hrtest.bean.PageBean;
import com.ggs.hrtest.bean.PageParam;
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
    protected PageBean getPageBean(String sql,PageParam param){
        PageBean pageBean = new PageBean();
        StringBuilder orderSql = new StringBuilder();
        if(NullUtil.isNotNull(param.getSortField())){
            orderSql.append(" order by ");
            orderSql.append(param.getSortField());
            orderSql.append(" ");
            orderSql.append(param.getSortOrder());
        }
        String pageSql=sql+orderSql;
        int total = HibernateUtil.countForInt(pageSql);
        List data = HibernateUtil.sqlQuery(pageSql, param.getPageIndex(), param.getPageSize());
        pageBean.setTotal(total);
        pageBean.setData(data);
        return pageBean;
    }
}
