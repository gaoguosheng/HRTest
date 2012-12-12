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
<body >


<div id="layout1" class="ggs-layout" style="width:100%;height:100%;"  borderStyle="border:solid 1px #aaa;">
    <div title="center" region="center" style="padding: 5px;" >
        <div style="font-weight:bold;">评测结果：</div>
        <div style="margin-left: 20px;" id="contentDiv"></div>
        <br/>
        <s:set id="allscore" value="0"></s:set>
        <s:iterator id="item" value="#request.detailList">
            <div style="font-weight: bold;">${item.topicnum}：${item.topicname}</div>
            <div style="margin-left: 20px;">
                <div>答题：${item.answername}</div>
                <div>得分：${item.score}</div>
            </div>
            <br/>
            <s:set id="allscore" value="#allscore+#item.score"></s:set>
        </s:iterator>
    </div>
    <div  region="south" showSplit="false" showHeader="false" height="80" style="padding: 5px;" >
        <div style="font-weight: bold;color: red">合计得分：${allscore}</div>
        <div style="text-align:center;padding:10px;">
            <a class="ggs-button" onclick="window.CloseOwnerWindow('cancel');" style="width:60px;">关闭</a>
        </div>
    </div>
</div>





    <script type="text/javascript">
        ggs.parse();
        $("#contentDiv").html("对不起，暂无评测信息");
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
