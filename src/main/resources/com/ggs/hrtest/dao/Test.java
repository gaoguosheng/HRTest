package com.ggs.hrtest.dao;

import com.ggs.hrtest.bean.User;
import com.ggs.hrtest.dao.impl.TestDaoImpl;
import com.ggs.util.HibernateUtil;
import org.hibernate.Session;

import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: ggs
 * Date: 12-12-7
 * Time: 上午11:53
 * To change this template use File | Settings | File Templates.
 */
public class Test {


    public static void main(String[]args){
        User user = new User();
        user.setUsername("aaa");
        user.setPwd("123456");
        //HibernateUtil.save(user);
        //System.out.println(HibernateUtil.query("from User"));
        //System.out.println(HibernateUtil.sqlQuery("select count(*)counter from t_user"));
        //System.out.println(HibernateUtil.query("from Test"));
        /*List<Map<String,Object>> list = HibernateUtil.sqlQuery("select * from  t_test");
        for(Map<String,Object> map:list){
            Integer testid = (Integer) map.get("testid");
            System.out.println(map.get("title"));
            System.out.println(testid);
        }*/

        //System.out.println(new TestDaoImpl().getOptionAnswers(1));
        //System.out.println(new      TestDaoImpl().getUserTestList());
        System.out.println(HibernateUtil.countForInt("select count(*)counter from t_user"));
    }
}
