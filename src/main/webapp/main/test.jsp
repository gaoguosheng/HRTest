<%--
  Created by IntelliJ IDEA.
  User: ggs
  Date: 12-12-7
  Time: 下午2:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" pageEncoding="UTF-8" %>
<%@include file="../inc/top.jsp"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<style type="text/css">
    body,div{margin: 5px;}
</style>
<div id="form1">
    <input name="testid" class="ggs-hidden" value="${param.testid}"/>
    <s:iterator id="topic" value="#request.topicList">
             <div><strong>${topic.ordernum}：${topic.content}</strong></div>
            <div id="answer_${topic.topicid}" class="ggs-radiobuttonlist" repeatItems="2" repeatLayout="table" repeatDirection="vertical"
                 textField="content" valueField="optansid"  url="test!getOptionAnswersByTopic.action?topicid=${topic.topicid}">
            </div>
    </s:iterator>
    <div>
        <a onclick="submitForm();" class="ggs-button" style="width:60px;">提交</a>
        <a onclick="resetForm();" class="ggs-button" style="width:60px;">重置</a>
    </div>
</div>
<script type="text/javascript">
    ggs.parse();
    function submitForm(){
        var answers = new Array();
        <s:iterator id="topic" value="#request.topicList" status="i">
            var rbl = ggs.get("answer_${topic.topicid}");
            var optansid =rbl.getValue();
            answers[${i.index}]={topicid:${topic.topicid},optansid:optansid};
        </s:iterator>
        var json =  ggs.encode(answers);
        $GGS.ajax("test!saveAnswers.action",{data:json,testid:${param.testid},userid:${sessionScope.admin.userid}});
        ggs.alert("提交成功！");
    }
    function resetForm(){
        var form = new ggs.Form("#form1");
        form.reset();
    }
</script>
