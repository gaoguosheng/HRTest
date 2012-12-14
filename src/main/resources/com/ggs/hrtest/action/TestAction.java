package com.ggs.hrtest.action;

import com.ggs.hrtest.model.*;
import com.ggs.hrtest.dao.ITestDao;
import com.ggs.hrtest.dao.impl.TestDaoImpl;
import com.ggs.hrtest.po.*;
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
public class TestAction extends BaseAction{

    private ITestDao testDao = new TestDaoImpl();
    private TestModel model = new TestModel();
    @Override
    public TestModel getModel() {
        return model;
    }

    /**
     * 试卷测试
     * */
    public void test(){
        List topicList = testDao.getTopics(this.getModel().getTestid());
        request.setAttribute("topicList",topicList);
        this.forward("/main/test_detail.jsp");
    }

    /**
     * 获取该题的备选答案
     * */
    public void getOptionAnswersByTopic(){
        List optionList = testDao.getOptionAnswersByTopic(this.getModel().getTopicid());
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
        PageModel pageModel = testDao.getUserTestList(this.getModel());
        this.outJson(pageModel);
    }


    /**
     * 获取测试结果明细列表
     * */
    public void getUserTestDetailList(){
        List detailList = testDao.getUserTestDetailList(this.getModel().getUtestid());
        request.setAttribute("detailList",detailList);
        this.forward("/main/usertest_detail.jsp");
    }

    /**
     * 获取测试答题解析
     * */
    public void getTestResult(){
        TestResult testResult = testDao.getTestResult(this.getModel());
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
        PageModel pageModel = this.testDao.getTopicList(this.getModel());
        this.outJson(pageModel);
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
        PageModel pageModel = this.testDao.getOptionAnswerList(this.getModel());
        this.outJson(pageModel);
    }

    /***
     * 获取测试试卷列表（分页）
     * */
    public void getTestPageList(){
        PageModel pageModel =  this.testDao.getTestList(this.getModel());
        this.outJson(pageModel);
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
        PageModel pageModel = this.testDao.getTestResultList(this.getModel());
        this.outJson(pageModel);
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
