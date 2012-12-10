<%--
  Created by IntelliJ IDEA.
  User: ggs
  Date: 12-11-9
  Time: 上午9:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" pageEncoding="UTF-8" %>
<%@ include file="../inc/top.jsp"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<style type="text/css">
    body,div{margin: 5px;}
</style>
<body >
    <div style="font-weight:bold;">评测结果：</div>
    <div style="margin-left: 20px;" id="contentDiv"></div>
    <div style="font-weight:bold;" >测试明细：</div>
    <s:set id="allscore" value="0"></s:set>
    <s:iterator id="item" value="#request.detailList">
        <div style="font-weight: bold;">${item.topicnum}：${item.topicname}</div>
        <div style="margin-left: 20px;">
            <div>答题：${item.answername}</div>
            <div>得分：${item.score}</div>
        </div>
        <s:set id="allscore" value="#allscore+#item.score"></s:set>
    </s:iterator>
    <div style="font-weight: bold;color: red">合计得分：${allscore}</div>
    <div style="text-align:center;padding:10px;">
        <a class="ggs-button" onclick="window.CloseOwnerWindow('cancel');" style="width:60px;">关闭</a>
    </div>
    <script type="text/javascript">
        $("#contentDiv").html("暂无信息");
        var json  = $GGS.getJSON("test!getTestResult.action",{testid:${param.testid},score:${allscore}});
        if(json.content){
            var content="";
            content += json.content;
            if(json.memo)
            content+="<br/>"+json.memo;
            $("#contentDiv").html(content);
        }
    </script>
</body>
