package com.ggs.hrtest.action;

import com.ggs.hrtest.bean.*;
import com.ggs.hrtest.dao.ITestDao;
import com.ggs.hrtest.dao.impl.TestDaoImpl;
import com.ggs.util.DateUtil;
import com.opensymphony.xwork2.ModelDriven;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: ggs
 * Date: 12-12-7
 * Time: 下午2:12
 * To change this template use File | Settings | File Templates.
 */
public class TestAction extends BaseAction implements ModelDriven<Test>{

    private ITestDao testDao = new TestDaoImpl();
    private Test model = new Test();
    @Override
    public Test getModel() {
        return model;
    }

    /**
     * 试卷测试
     * */
    public void test(){
        List topicList = testDao.getTopics(model.getTestid());
        request.setAttribute("topicList",topicList);
        this.forward("/main/test_detail.jsp");
    }

    /**
     * 获取该题的备选答案
     * */
    public void getOptionAnswersByTopic(){
        Integer topicid = this.getIntParam("topicid");
        List optionList = testDao.getOptionAnswersByTopic(topicid);
        this.outJson(optionList);
    }


    /***
     * 保存提交答案
     * */
    public void saveAnswers(){
        UserAnswer[]answers = (UserAnswer[]) this.getJsonObject(UserAnswer[].class);
        UserTest userTest = new UserTest();
        userTest.setTestid(this.getIntParam("testid"));
        userTest.setUserid(this.getIntParam("userid"));
        userTest.setCreattime(DateUtil.getDate());
        testDao.saveAnswers(userTest,answers);
    }

    /**
     * 获取测试结果列表
     * */
    public void getUserTestList(){
        PageBean pageBean = testDao.getUserTestList(this.getPageParam());
        this.outJson(pageBean);
    }


    /**
     * 获取测试结果明细列表
     * */
    public void getUserTestDetailList(){
        int utestid = this.getIntParam("utestid");
        List detailList = testDao.getUserTestDetailList(utestid);
        request.setAttribute("detailList",detailList);
        this.forward("/main/usertest_detail.jsp");
    }

    /**
     * 获取测试答题解析
     * */
    public void getTestResult(){
        int testid = this.getIntParam("testid");
        int score = this.getIntParam("score");
        TestResult testResult = testDao.getTestResult(testid,score);
        this.outJson(testResult);
    }

    /**
     * 获取试卷列表
     * */
    public void getTestList(){
        List testList = this.testDao.getTestList();
        this.outJson(testList);
    }

    /**
     * 获取题目列表
     * */
    public void getTopicList(){
        PageBean pageBean = this.testDao.getTopicList(this.getModel().getTestid(),this.getPageParam());
        this.outJson(pageBean);
    }

    /**
     * 获取题目信息
     * */
    public void getATopic(){
        Topic topic = this.testDao.getATopic(this.getIntParam("topicid"));
        this.outJson(topic);
    }



    /**
     * 保存题目
     * */
    public void saveTopic(){
        Topic topic = (Topic) this.getJsonObject("formdata",Topic.class);
        OptionAnswer[] answers = (OptionAnswer[])this.getJsonObject("griddata",OptionAnswer[].class);
        this.testDao.saveTopic(topic,answers);
    }

    /**
     * 删除题目
     * */
    public void delTopic(){
        this.testDao.delTopic(this.getIntParam("topicid"));
    }

    /**
     * 删除答案选项
     * */
    public void delOptionAnswer(){
        this.testDao.delOptionAnswer(this.getIntParam("optansid"));
    }

    /**
     * 获取答案选项列表
     * */
    public void getOptionAnswerList(){
        PageBean pageBean = this.testDao.getOptionAnswerList(this.getIntParam("topicid"),this.getPageParam());
        this.outJson(pageBean);
    }

    /***
     * 获取测试试卷列表（分页）
     * */
    public void getTestPageList(){
        PageBean pageBean =  this.testDao.getTestList(this.getPageParam());
        this.outJson(pageBean);
    }

    /**
     * 保存试卷
     * */
    public void saveTest(){
        Test[]tests = (Test[]) this.getJsonObject(Test[].class);
        this.testDao.saveTest(tests);
    }

    /**
     * 获取测试结果列表
     * */
    public void getTestResultList(){
        PageBean pageBean = this.testDao.getTestResultList(this.getModel().getTestid(),this.getPageParam());
        this.outJson(pageBean);
    }

    /**
     * 保存测试结果
     * */
    public void saveTestResult(){
        TestResult []results = (TestResult[]) this.getJsonObject(TestResult[].class);
        for(TestResult result:results){
            result.setTestid(this.getModel().getTestid());
        }
        this.testDao.saveTestResult(results);
    }

    /**
     * 删除测试结果
     * */
    public void delTestResult(){
        this.testDao.delTestResult(this.getIntParam("resultid"));
    }

 }
