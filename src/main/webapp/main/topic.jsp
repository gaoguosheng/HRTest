<%--
  Created by IntelliJ IDEA.
  User: ggs
  Date: 12-12-11
  Time: 上午11:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" pageEncoding="UTF-8" %>
<%@include file="../inc/top.jsp"%>
<body>
<div class="ggs-splitter" style="width:100%;height:100%;" borderStyle="border:0;">
    <div size="250" maxSize="300" minSize="100" showCollapseButton="true" style="border-width:1px;">
        <!--Tree-->
        <ul id="leftTree" class="ggs-tree" url="test!getTestList.action" style="width:100%;height:100%;"
            showTreeIcon="true" textField="title" idField="testid" resultAsTree="false"
            onnodeselect="onNodeSelect"
                >
        </ul>
    </div>
    <div showCollapseButton="false" style="border:0px;" >
        <!--Tabs-->
        <div id="mainTabs" class="ggs-tabs bg-toolbar" activeIndex="0" style="width:100%;height:100%;">

        </div>
    </div>
</div>

<script type="text/javascript">
    function onNodeSelect(e) {

        var node = e.node;
        var isLeaf = e.isLeaf;

        if (isLeaf) {
            showTab(node);
        }
    }

    function showTab(node) {
        var tabs = ggs.get("mainTabs")

        var id = "tab$" + node.testid;
        var tab = tabs.getTab(id);
        if (!tab) {
            tab = {};
            tab.name = id;
            tab.title = node.title;
            tab.showCloseButton = true;

            //这里拼接了url，实际项目，应该从后台直接获得完整的url地址
            tab.url ="topic_list.jsp?testid="+node.testid ;

            tabs.addTab(tab);
        }
        tabs.activeTab(tab);
    }


</script>

</body>
