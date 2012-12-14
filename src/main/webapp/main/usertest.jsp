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
                                    <a class="ggs-button" iconCls="icon-tip" onclick="showDetail()" plain="true">查看明细</a>
                                </td>
                            </tr>
                        </table>


                </td>
                <td style="white-space:nowrap;">
                    <input id="username" class="ggs-textbox" emptyText="请输入姓名" style="width:150px;" onenter="onKeyEnter"/>
                    <a class="ggs-button" onclick="search()">查询</a>
                </td>
            </tr>
        </table>
    </div>
    <!--撑满页面-->
    <div class="ggs-fit" >

        <div id="datagrid1" class="ggs-datagrid" style="width:100%;height:100%;"
             url="test!getUserTestList.action"  idField="utestid"
             sizeList="[10,20,30,50]" pageSize="20" >
            <div property="columns">
                <div type="indexcolumn"></div>
                <div field="creattime" allowSort="true" align="center"  headerAlign="center">测试日期</div>
                <div field="title">测试试卷</div>
                <div field="username">测试用户</div>
                <div field="score"  allowSort="true">测试得分</div>
            </div>
        </div>
    </div>
    <input type="hidden" id="classid">
    <input type="hidden" id="classname">
    <script type="text/javascript">
        var mywindow;
        ggs.parse();
        var grid = ggs.get("datagrid1");
        grid.load();
        //排序
        grid.sortBy("utestid", "desc");
        function search() {
            var username = ggs.get("username").getValue();
            grid.load({ username: username });
        }
        function onKeyEnter(e) {
            search();
        }


        function show(utestid,title,testid){
            mywindow=ggs.open({
                url:  "test!getUserTestDetailList.action?utestid="+utestid+"&testid="+testid,
                title: title, width: 800, height: 600
            });
        }

        function showDetail(){
            var row = grid.getSelected();
            if (row) {
                show(row.utestid,row.title,row.testid);
            } else {
                ggs.alert("请选中一条记录");
            }
        }
    </script>
</body>
