package com.ggs.hrtest.dao;

import com.ggs.hrtest.model.*;
import com.ggs.hrtest.po.*;

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
    public PageModel getUserTestList(TestModel testModel);


    /**
     * 获取测试结果明细列表
     * */
    public List getUserTestDetailList(int utestid);


    /**
     * 获取测试解析
     * */
    public TestResult getTestResult(TestModel testModel);

    /**
     * 获取试卷列表
     * */
    public List getTestList();

    /**
     * 获取题目列表
     * */
    public PageModel getTopicList(TestModel testModel);
    /**
     * 获取题目信息
     * */
    public Topic getATopic(int topicid);

    /**
     * 保存题目信息
     * */
    public void saveTopic(Topic topic,OptionAnswer[]answers);

    /**
     * 删除题目
     * */
    public void delTopic(int topicid);

    /**
     * 删除答案选项
     * */
    public void delOptionAnswer(int optansid);

    /**
     * 获取答案选项列表
     * */
    public PageModel getOptionAnswerList(TestModel testModel);

    /**
     * 获取试卷列表
     * */
    public PageModel getTestList(TestModel testModel);


    /**
     * 保存试卷
     * */
    public void saveTest(Test[]tests);

    /**
     * 获取测试结果列表
     * */
    public PageModel getTestResultList(TestModel testModel);

    /**
     * 保存测试结果
     * */
    public void saveTestResult(TestResult[]results);

    /**
     * 删除测试结果
     * */
    public void delTestResult(int resultid);
 }
