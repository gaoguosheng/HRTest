package com.ggs.hrtest.po;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Created with IntelliJ IDEA.
 * User: ggs
 * Date: 12-12-10
 * Time: 下午4:16
 * To change this template use File | Settings | File Templates.
 */
@Entity
@Table(name="t_testresult")
public class TestResult {
    @GenericGenerator(name = "generator", strategy = "increment")
    @Id
    @GeneratedValue(generator = "generator")
    private Integer resultid;
    private Integer testid;
    private Integer stscore;
    private Integer edscore;
    private String content;
    private String memo;

    public Integer getResultid() {
        return resultid;
    }

    public void setResultid(Integer resultid) {
        this.resultid = resultid;
    }

    public Integer getTestid() {
        return testid;
    }

    public void setTestid(Integer testid) {
        this.testid = testid;
    }

    public Integer getStscore() {
        return stscore;
    }

    public void setStscore(Integer stscore) {
        this.stscore = stscore;
    }

    public Integer getEdscore() {
        return edscore;
    }

    public void setEdscore(Integer edscore) {
        this.edscore = edscore;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo;
    }
}
