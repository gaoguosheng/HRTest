<%--
  Created by IntelliJ IDEA.
  User: ggs
  Date: 12-12-7
  Time: 下午2:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" pageEncoding="UTF-8" %>
<%@include file="../inc/top.jsp"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<body>
<script type="text/javascript">
    $(function(){
        ggs.parse();

    }) ;


    function submitForm(){
        var answers = new Array();
        <s:iterator id="topic" value="#request.topicList" status="i">
        var rbl = ggs.get("answer_${topic.topicid}");
        var optansid =rbl.getValue();
        if( optansid && optansid!=""){
            answers[${i.index}]={topicid:${topic.topicid},optansid:optansid};
        }
        </s:iterator>
        /*
        for(var i=0;i<answers.length;i++){
            if(!answers[i].optansid || answers[i].optansid==""){
                ggs.alert("您还未填写的第"+(i+1)+"题！");
                return false;
            }
        }
        */
        var json =  ggs.encode(answers);
        $GGS.ajax("test!saveAnswers.action",{data:json,testid:${param.testid},userid:${sessionScope.admin.userid}});
        ggs.alert("提交成功！");
        $("#submitBtn").css("display","none");
        $("#resetBtn").css("display","none");
    }
    function resetForm(){
        var form = new ggs.Form("#form1");
        form.reset();
    }
</script>
<div id="layout1" class="ggs-layout" style="width:100%;height:100%;"  borderStyle="border:solid 1px #aaa;">
    <div title="center" region="center"  >
        <div id="form1" style="padding: 5px;">
            <input name="testid" class="ggs-hidden" value="${param.testid}"/>
            <s:iterator id="topic" value="#request.topicList">
                <div><strong>${topic.ordernum}：${topic.content}</strong></div>
                <div id="answer_${topic.topicid}" class="ggs-radiobuttonlist" repeatItems="2" repeatLayout="table" repeatDirection="vertical"
                     textField="content" valueField="optansid"  url="test!getOptionAnswersByTopic.action?topicid=${topic.topicid}">
                </div>
                <br/>
            </s:iterator>
        </div>
    </div>
    <div region="south" showSplit="false" showHeader="false" height="80"  >
        <div style="padding: 5px;color: red;">剩余时间：<script type="text/javascript">$GGS.downCount(${param.minutes},submitForm);</script></div>
        <div align="center" style="padding: 5px;">
            <a id="submitBtn" onclick="submitForm();" class="ggs-button" style="width:60px;">提交</a>
            <a id="resetBtn" onclick="resetForm();" class="ggs-button" style="width:60px;">重置</a>
        </div>
    </div>
</div>




</body>