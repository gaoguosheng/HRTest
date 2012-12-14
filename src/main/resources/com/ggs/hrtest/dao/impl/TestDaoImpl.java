package com.ggs.hrtest.dao.impl;

import com.ggs.hrtest.model.*;
import com.ggs.hrtest.dao.ITestDao;
import com.ggs.hrtest.po.*;
import com.ggs.util.DateUtil;
import com.ggs.util.HibernateUtil;

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
    public PageModel getUserTestList(TestModel testModel){
        StringBuilder sql = new StringBuilder();
        sql.append(" select * from v_usertest where 1=1");
        PageModel pageModel = this.getPageBean(sql.toString(),testModel);
        return pageModel;
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
    public TestResult getTestResult(TestModel testModel){
        return (TestResult)HibernateUtil.queryOneObject("from TestResult where testid=? and stscore<=? and edscore>=?",new Object[]{
                testModel.getTestid(),
                testModel.getScore(),
                testModel.getScore()
        });
    }

    /**
     * 获取试卷列表
     * */
    public List getTestList(){
        return HibernateUtil.query("from Test order by ordernum asc");
    }

    /**
     * 获取题目列表
     * */
    public PageModel getTopicList(TestModel testModel){
        StringBuilder sql = new StringBuilder();
        sql.append("select * from t_topic where testid="+testModel.getTestid());
        return this.getPageBean(sql.toString(),testModel);
    }

    /**
     * 获取题目信息
     * */
    public Topic getATopic(int topicid){
        return (Topic)HibernateUtil.get(Topic.class,topicid);
    }

    /**
     * 保存题目信息
     * */
    public void saveTopic(Topic topic,OptionAnswer[]answers){
        if(topic.getTopicid()==-1)
            topic.setTopicid(null);
        HibernateUtil.saveOrUpdate(topic);
        for(OptionAnswer answer:answers){
            answer.setTopicid(topic.getTopicid());
        }
        HibernateUtil.batchSaveOrUpdate(answers);
    }

    /**
     * 删除题目
     * */
    public void delTopic(int topicid){
        HibernateUtil.executeUpdate("delete from UserAnswer where topicid=?",new Object[]{topicid});
        HibernateUtil.executeUpdate("delete from OptionAnswer where topicid=?",new Object[]{topicid});
        HibernateUtil.executeUpdate("delete from Topic where topicid=?",new Object[]{topicid});
    }

    /**
     * 删除答案选项
     * */
    public void delOptionAnswer(int optansid){
        HibernateUtil.executeUpdate("delete from UserAnswer where optansid=?",new Object[]{optansid});
        HibernateUtil.executeUpdate("delete from OptionAnswer where optansid=?",new Object[]{optansid});
    }

    /**
     * 获取答案选项列表
     * */
    public PageModel getOptionAnswerList(TestModel testModel){
        StringBuilder sql = new StringBuilder();
        sql.append("select * from t_optionanswer where topicid="+testModel.getTopicid());
        PageModel pageModel =this.getPageBean(sql.toString(),testModel);
        return pageModel;
    }

    /**
     * 获取试卷列表
     * */
    public PageModel getTestList(TestModel testModel){
        StringBuilder sql = new StringBuilder();
        sql.append("select * from t_test");
        PageModel pageModel = this.getPageBean(sql.toString(),testModel);
        return pageModel;
    }

    /**
     * 保存试卷
     * */
    public void saveTest(Test[]tests){
        HibernateUtil.batchSaveOrUpdate(tests);
    }

    /**
     * 获取测试结果列表
     * */
    public PageModel getTestResultList(TestModel testModel){
        StringBuilder sql = new StringBuilder();
        sql.append("select * from t_testresult where testid="+testModel.getTestid());
        PageModel pageModel = this.getPageBean(sql.toString(),testModel);
        return pageModel;
    }

    /**
     * 保存测试结果
     * */
    public void saveTestResult(TestResult[]results){
        HibernateUtil.batchSaveOrUpdate(results);
    }

    /**
     * 删除测试结果
     * */
    public void delTestResult(int resultid){
        HibernateUtil.executeUpdate("delete from TestResult where resultid=?",new Object[]{resultid});
    }
}
