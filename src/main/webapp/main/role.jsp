<%--
  Created by IntelliJ IDEA.
  User: ggs
  Date: 12-12-14
  Time: 下午3:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../inc/top.jsp"%>
<div id="role_grid" class="ggs-datagrid" style="width:100%;height:100%;" allowResize="true"
     url="role!list.action"  idField="roleid"
     onshowrowdetail="onShowRowDetail"
     showFooter="false">
    <div property="columns" >
        <div type="expandcolumn"></div>
        <div field="rolename" width="320" headerAlign="left" >角色名称</div>
    </div>
</div>

<div id="detailGrid_Form" style="display:none;">
    <div id="menu_grid" class="ggs-datagrid" style="width:100%;height:150px;"
         url="role!getMenuList.action" showFooter="false">
        <div property="columns">
            <div field="ordernum" width="100">序号</div>
            <div field="menuname" width="100">菜单</div>
            <div field="url" width="100">URL</div>

    </div>
    </div>
</div>


<script type="text/javascript">

    ggs.parse();

    var role_grid = ggs.get("role_grid");
    var menu_grid = ggs.get("menu_grid");
    var detailGrid_Form = document.getElementById("detailGrid_Form");

    role_grid.load();

    function onShowRowDetail(e) {
        var grid = e.sender;
        var row = e.record;

        var td = grid.getRowDetailCellEl(row);
        td.appendChild(detailGrid_Form);
        detailGrid_Form.style.display = "block";
        menu_grid.load({ roleid: row.roleid });
    }

</script>
