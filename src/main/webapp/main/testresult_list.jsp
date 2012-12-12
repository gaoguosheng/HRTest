<%--
  Created by IntelliJ IDEA.
  User: ggs
  Date: 12-11-9
  Time: 上午9:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" pageEncoding="UTF-8" %>
<%@ include file="../inc/top.jsp"%>

<body >
<div class="ggs-toolbar" style="padding:2px;border-bottom:0;">
    <table style="width:100%;">
        <tr>
            <td style="width: 100%;">
                    <table cellpadding="0" cellspacing="0">
                        <tr>
                            <td>
                                <a class="ggs-button" iconCls="icon-add" onclick="addRow()" plain="true">增加</a>
                                <a class="ggs-button" iconCls="icon-save" onclick="saveData()" plain="true">保存</a>
                                <span class="separator"></span>
                                <a class="ggs-button" iconCls="icon-remove" onclick="delRow()" plain="true">删除</a>
                            </td>
                        </tr>
                    </table>
            </td>
            <td style="white-space:nowrap;">
                <input id="title" class="ggs-textbox" emptyText="请输入关键字" style="width:150px;" onenter="onKeyEnter"/>
                <a class="ggs-button" onclick="search()">查询</a>
            </td>
        </tr>
    </table>
</div>
<!--撑满页面-->
<div class="ggs-fit" >
    <div id="datagrid1" class="ggs-datagrid" style="width:100%;height:100%;"
         url="test!getTestResultList.action?testid=${param.testid}"  idField="resultid"
         sizeList="[10,20,30,50]" pageSize="20"
         allowCellEdit="true" allowCellSelect="true" >
        <div property="columns">
            <div field="stscore" width="20" align="center" headerAlign="center">起始分数
                <input property="editor" class="ggs-spinner" style="width:100%;" vtype="required" minValue="0" maxValue="999"/>
            </div>
            <div field="edscore" width="20" align="center" headerAlign="center">结束分数
                <input property="editor" class="ggs-spinner" style="width:100%;" vtype="required" minValue="0" maxValue="999"/>
            </div>
            <div field="content"width="50">测试结果
                <input property="editor" class="ggs-textbox" style="width:100%;" vtype="required"/>
            </div>
            <div field="memo" >备注
                <input property="editor" class="ggs-textbox" style="width:100%;" vtype="required"/>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    ggs.parse();
    var grid = ggs.get("datagrid1");
    grid.load();
    //排序
    grid.sortBy("stscore", "asc");
    function search() {
        var title = ggs.get("title").getValue();
        grid.load({ title: title });
    }
    function onKeyEnter(e) {
        search();
    }
    function addRow() {
        var newRow = { name: "New Row" };
        grid.addRow(newRow, 0);
    }
    function saveData() {
        var data = grid.getChanges();
        var json = ggs.encode(data);
        grid.loading("保存中，请稍后......");
        $.ajax({
            url: "test!saveTestResult.action",
            data: { data: json,testid:${param.testid} },
            type: "post",
            success: function (text) {
                grid.reload();
            }
        });
    }
    function gridReload(){
        grid.reload();
    }

    function delRow(){
        var row = grid.getSelected();
        if (row) {
            ggs.confirm("确定删除记录？", "确定？",
                    function (action) {
                        if (action == "ok") {
                            $GGS.ajax("test!delTestResult.action",{resultid:row.resultid});
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
