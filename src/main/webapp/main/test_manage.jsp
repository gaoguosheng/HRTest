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
                                <span class="separator"></span>
                                <a class="ggs-button" iconCls="icon-save" onclick="saveData()" plain="true">保存</a>
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
         url="test!getTestPageList.action"  idField="testid"
         sizeList="[10,20,30,50]" pageSize="20"
         allowCellEdit="true" allowCellSelect="true" >
        <div property="columns">
            <div field="ordernum" width="10" align="center" headerAlign="center">序号
                <input property="editor" class="ggs-spinner" style="width:100%;" vtype="required"/>
            </div>
            <div field="title"width="50">试卷名称
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
    grid.sortBy("ordernum", "asc");
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
            url: "test!saveTest.action",
            data: { data: json },
            type: "post",
            success: function (text) {
                grid.reload();
            }
        });
    }
    function gridReload(){
        grid.reload();
    }
</script>
</body>
