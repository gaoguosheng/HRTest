package com.ggs.hrtest.dao;

import com.ggs.hrtest.bean.*;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: ggs
 * Date: 12-12-7
 * Time: 下午2:13
 * To change this template use File | Settings | File Templates.
 */
public interface ITestDao {

    /**
     * 获取试卷题目
     * @param testid 试卷id
     * */
    public List getTopics(Integer testid);

    /**
     * 获取试卷题目所有备选答案
     * @param testid 试卷id
     * */
    public List getOptionAnswers(Integer testid);

    /**
     * 获取试卷题目的备选答案
     * @param topicid 题目id
     * */
    public List getOptionAnswersByTopic(Integer topicid);

    /***
     * 批量保存答案
     * */
    public void saveAnswers(UserTest userTest, UserAnswer[] answers);

    /**
     * 获取测试结果列表
     * */
    public PageBean getUserTestList(PageParam param);


    /**
     * 获取测试结果明细列表
     * */
    public List getUserTestDetailList(int utestid);


    /**
     * 获取测试解析
     * */
    public TestResult getTestResult(int testid,int score);


}
