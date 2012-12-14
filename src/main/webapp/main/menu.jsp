<%--
  Created by IntelliJ IDEA.
  User: ggs
  Date: 12-12-14
  Time: 上午9:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../inc/top.jsp"%>
<div id="treegrid1" class="ggs-treegrid" style="width:100%;height:100%;"
     url="menu!list.action" showTreeIcon="true"
     treeColumn="menuname" idField="menuid" parentField="upid" resultAsTree="false"
     allowResize="true"
        >
    <div property="columns">
        <div type="indexcolumn"></div>
        <div name="menuname" field="menuname" width="200">菜单名称</div>
        <div field="url" width="100">地址</div>
    </div>
</div>

