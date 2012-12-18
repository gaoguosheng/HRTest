<%--
  Created by IntelliJ IDEA.
  User: ggs
  Date: 12-12-7
  Time: 下午2:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" pageEncoding="UTF-8" %>
<%@include file="../inc/top.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<body>
<script type="text/javascript">
    $(function(){
        ggs.parse();
    }) ;

    function submitForm(){
        var answers = new Array();
        $("input").each(function(i){
            if(this.checked){
                answers[i]={topicid:$(this).attr("topicid"),optansid:this.value};
            }
        });
        var json =  ggs.encode(answers);
        $GGS.ajax("test!saveAnswers.action",{data:json,testid:${param.testid}});
        ggs.alert("提交成功！");
        $("#submitBtn").css("display","none");
        $("#resetBtn").css("display","none");
    }
    function resetForm(){
        document.all.form1.reset();
    }
</script>
<div id="layout1" class="ggs-layout" style="width:100%;height:100%;"  borderStyle="border:solid 1px #aaa;">
    <div title="center" region="center"  >
        <form id="form1" style="padding: 5px;">
            <c:forEach var="topic" items="${requestScope.topicList}">
                <div><strong>${topic.ordernum}：${topic.content}</strong></div>
             <c:set var="i" value="1"></c:set>
            <c:forEach var="ans" items="${requestScope.answerList}">
                    <c:if test="${topic.topicid==ans.topicid}">
                        <span style="margin-left: 10px;">
                            <input type="radio" name="answer_${topic.topicid}" value="${ans.optansid}" topicid="${ans.topicid}">${ans.content}
                        </span>
                        <c:if test="${i % 2==0}"><br/></c:if>
                        <c:set var="i" value="${i+1}"></c:set>
                    </c:if>
            </c:forEach>
                <br/>
            </c:forEach>
        </form>
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