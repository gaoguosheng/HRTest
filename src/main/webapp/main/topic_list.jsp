<%--
  Created by IntelliJ IDEA.
  User: ggs
  Date: 12-11-9
  Time: 上午9:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" pageEncoding="UTF-8" %>
<%@ include file="../inc/top.jsp"%>
<style type="text/css">
    body{
        margin:0;padding:0;border:0;width:100%;height:100%;overflow:visible;
    }
</style>
<body >
<div class="ggs-toolbar" style="padding:2px;border-bottom:0;">
    <table style="width:100%;">
        <tr>
            <td style="width: 100%;">
                    <table cellpadding="0" cellspacing="0">
                        <tr>
                            <td>
                                <a class="ggs-button" iconCls="icon-reload" onclick="gridReload();" plain="true">刷新</a>
                                <span class="separator"></span>
                                <a class="ggs-button" iconCls="icon-add" onclick="f_add();" plain="true">增加</a>
                                <a class="ggs-button" iconCls="icon-edit" onclick="f_edit()" plain="true">修改</a>
                                <span class="separator"></span>
                                <a class="ggs-button" iconCls="icon-remove" onclick="delRow();" plain="true">删除</a>
                            </td>
                        </tr>
                    </table>
            </td>
            <td style="white-space:nowrap;">
            </td>
        </tr>
    </table>
</div>
<!--撑满页面-->
<div class="ggs-fit" >
    <div id="datagrid1" class="ggs-datagrid" style="width:100%;height:100%;"
         url="test!getTopicList.action?testid=${param.testid}"  idField="topicid"
         sizeList="[10,20,30,50]" pageSize="20">
        <div property="columns">
            <div field="ordernum"  width="10" align="center" headerAlign="center" allowSort="true">题号</div>
            <div field="content" >题目</div>
        </div>
    </div>
</div>
<script type="text/javascript">
    ggs.parse();
    var grid = ggs.get("datagrid1");
    grid.load();
    //排序
    grid.sortBy("ordernum", "asc");
    function search() {
        var username = ggs.get("username").getValue();
        grid.load({ username: username });
    }
    function onKeyEnter(e) {
        search();
    }
    function gridReload(){
        grid.reload();
    }

    function f_add(){
        f_openWindow(${param.testid},-1);
    }

    function f_edit(){
        var row = grid.getSelected();
        if (row) {
            f_openWindow(${param.testid},row.topicid);
        } else {
            ggs.alert("请选中一条记录");
        }
    }

    function f_openWindow(testid,topicid){
        ggs.open({
            url:  "topic_edit.jsp?testid="+testid+"&topicid="+topicid,
            title: "题目管理",
            width: 800,
            height: 600
        });
    }

    function delRow(){
        var row = grid.getSelected();
        if (row) {
            ggs.confirm("确定删除记录？", "确定？",
                    function (action) {
                        if (action == "ok") {
                            $GGS.ajax("test!delTopic.action",{topicid:row.topicid});
                            grid.removeRow (row,true);
                        }
                    }
            );

        } else {
            ggs.alert("请选中一条记录");
        }
    }

</script>
</body>
