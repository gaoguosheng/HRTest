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
     * 获取试卷
     * */
    public void test(){
        List topicList = testDao.getTopics(model.getTestid());
        request.setAttribute("topicList",topicList);
        this.forward("/main/test.jsp");
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
     * 获取测试解析
     * */
    public void getTestResult(){
        int testid = this.getIntParam("testid");
        int score = this.getIntParam("score");
        TestResult testResult = testDao.getTestResult(testid,score);
        this.outJson(testResult);
    }


}
