package com.ggs.hrtest.model;

/**
 * Created with IntelliJ IDEA.
 * User: ggs
 * Date: 12-12-13
 * Time: 下午4:39
 * To change this template use File | Settings | File Templates.
 */
public class TestModel extends BaseModel {
    private Integer testid;
    private String title;
    private String memo;
    private Integer ordernum;
    private Integer topicid;
    private Integer utestid;
    private Integer score;
    private Integer minutes;

    public Integer getMinutes() {
        return minutes;
    }

    public void setMinutes(Integer minutes) {
        this.minutes = minutes;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    public Integer getUtestid() {
        return utestid;
    }

    public void setUtestid(Integer utestid) {
        this.utestid = utestid;
    }

    public Integer getTopicid() {
        return topicid;
    }

    public void setTopicid(Integer topicid) {
        this.topicid = topicid;
    }

    public Integer getOrdernum() {
        return ordernum;
    }

    public void setOrdernum(Integer ordernum) {
        this.ordernum = ordernum;
    }

    public Integer getTestid() {
        return testid;
    }

    public void setTestid(Integer testid) {
        this.testid = testid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo;
    }
}
