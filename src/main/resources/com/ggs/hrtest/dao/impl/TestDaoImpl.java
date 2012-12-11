package com.ggs.hrtest.dao.impl;

import com.ggs.hrtest.bean.*;
import com.ggs.hrtest.dao.ITestDao;
import com.ggs.util.DateUtil;
import com.ggs.util.HibernateUtil;
import com.ggs.util.NullUtil;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: ggs
 * Date: 12-12-7
 * Time: 下午2:16
 * To change this template use File | Settings | File Templates.
 */
public class TestDaoImpl extends BaseDAO implements ITestDao {

    /**
     * 获取试卷题目
     * @param testid 试卷id
     * */
    public List getTopics(Integer testid){
        return HibernateUtil.query("from Topic where testid=?",new Object[]{testid});
    }

    /**
     * 获取试卷题目所有备选答案
     * @param testid 试卷id
     * */
    public List getOptionAnswers(Integer testid){
        StringBuilder hql = new StringBuilder();
        hql.append(" select a from OptionAnswer a where a.topicid in ");
        hql.append("(select b.topicid from Topic b where b.testid=?)");
        return HibernateUtil.query(hql.toString(), new Object[]{testid});
    }

    /**
     * 获取试卷题目的备选答案
     * @param topicid 题目id
     * */
    public List getOptionAnswersByTopic(Integer topicid){
        StringBuilder hql = new StringBuilder();
        hql.append(" select a from OptionAnswer a where a.topicid =?)");
        return HibernateUtil.query(hql.toString(),new Object[]{topicid});
    }

    /***
     * 批量保存答案
     * */
    public void saveAnswers(UserTest userTest,UserAnswer[] answers){
        userTest.setCreattime(DateUtil.getDate());
        HibernateUtil.save(userTest);
        for(UserAnswer answer:answers){
            answer.setUtestid(userTest.getUtestid());
        }
        HibernateUtil.batchSave(answers);
    }

    /**
     * 获取测试结果列表
     * */
    public PageBean getUserTestList(PageParam param){
        StringBuilder sql = new StringBuilder();
        sql.append(" select * from v_usertest where 1=1");
        PageBean pageBean = this.getPageBean(sql.toString(),param);
        return pageBean;
    }

    /**
     * 获取测试结果明细列表
     * */
    public List getUserTestDetailList(int utestid){
        return HibernateUtil.sqlQuery("select * from v_usertestdetail where utestid=? order by topicnum",new Object[]{utestid});
    }

    /**
     * 获取测试解析
     * */
    public TestResult getTestResult(int testid,int score){
        return (TestResult)HibernateUtil.queryOneObject("from TestResult where testid=? and stscore<=? and edscore>=?",new Object[]{
                testid,
                score,
                score
        });
    }
}
