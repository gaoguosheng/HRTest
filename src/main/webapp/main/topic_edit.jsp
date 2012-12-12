<%--
  Created by IntelliJ IDEA.
  User: ggs
  Date: 12-12-11
  Time: 下午1:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../inc/top.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<body>
    <form id="form1" method="post">
        <input id="topicid" name="topicid" class="ggs-hidden" value="${param.topicid}" />
        <input id="testid" name="testid" class="ggs-hidden" value="${param.testid}"/>
        <div style="padding-left:11px;padding-bottom:5px;">
            <fieldset style="border:solid 1px #aaa;padding:3px;">
                <legend >题目信息</legend>
                <div style="padding:5px;">
                    <table>
                        <tr>
                            <td style="width:70px;">题号：</td>
                            <td style="width:50px;" colspan="3">
                                <input name="ordernum" class="ggs-spinner"  minValue="1" maxValue="500" style="width: 50px;"/>
                            </td>
                        </tr>
                        <tr>
                            <td style="width:70px;">题目：</td>
                            <td style="width:150px;" colspan="3">
                                <input name="content" class="ggs-textarea" required="true" style="width:650px;height: 80px;" emptyText="请输入内容"/>
                            </td>
                        </tr>
                    </table>
                </div>
            </fieldset>


            <fieldset style="border:solid 1px #aaa;padding:3px;">
                <legend >备选答案管理</legend>
                <div style="padding:5px;">
                <div>
                    <a class="ggs-button" iconCls="icon-add" onclick="addRow()" plain="true">增加</a>
                    <a class="ggs-button" iconCls="icon-remove" onclick="delRow()" plain="true">删除</a>
                </div>
                <div id="datagrid1" class="ggs-datagrid" style="width:100%;height:250px;"
                     url="test!getOptionAnswerList.action?topicid=${param.topicid}"
                       idField="optansid"   sizeList="[5,10,20,30,50]" pageSize="10"
                     allowCellEdit="true" allowCellSelect="true" >
                    <div property="columns">
                        <div field="ordernum"  width="20" align="center" headerAlign="center" >序号
                            <input property="editor" class="ggs-spinner"  minValue="1" maxValue="100" style="width: 100%;"/>
                        </div>
                        <div field="content" >答案内容
                            <input property="editor" class="ggs-textbox" style="width:100%;" vtype="required"/>
                        </div>
                        <div field="score" width="20" align="center" headerAlign="center" >分值
                            <input property="editor" class="ggs-spinner"  minValue="0" maxValue="100" style="width: 100%;"/>
                        </div>
                    </div>
                    </div>
                </div>
            </fieldset>

        </div>
        <div style="text-align:center;padding:10px;">
            <a class="ggs-button" onclick="f_save();" style="width:60px;">确定</a>
            <a class="ggs-button" onclick="f_close();" style="width:60px;">取消</a>
        </div>
    </form>
<script type="text/javascript">
    ggs.parse();
    var form = new ggs.Form("form1");
    var data = $GGS.getJSON("test!getATopic.action",{topicid:${param.topicid}});
    if(data){
        form.setData(data);
    }

    var grid = ggs.get("datagrid1");
    grid.load();
    grid.sortBy("ordernum", "asc");


    function addRow() {
        var newRow = { name: "New Row" };
        grid.addRow(newRow, 0);
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
                             $GGS.ajax("test!delOptionAnswer.action",{optansid:row.optansid});
                            grid.removeRow (row,true);
                        }
                    }
            );

        } else {
            ggs.alert("请选中一条记录");
        }
    }
    function f_close(){
        window.CloseOwnerWindow('cancel');
    }

    function f_save(){
        var formdata = form.getData();
        form.validate();
        if (form.isValid() == false) return;
        var formjson = ggs.encode(formdata);

        var griddata = grid.getChanges();
        var gridjson = ggs.encode(griddata);

        $GGS.ajax("test!saveTopic.action",{ formdata: formjson,griddata: gridjson});
        f_close();

    }

</script>
</body>
