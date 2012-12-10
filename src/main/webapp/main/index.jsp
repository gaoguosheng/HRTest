<%@ page import="com.ggs.comm.Const" %>
<%@ page language="java" pageEncoding="UTF-8" %>
<%@include file="../inc/top.jsp"%>
<style type="text/css">
    body{
        margin:0;padding:0;border:0;width:100%;height:100%;overflow:visible;
    }
    .header
    {
        background:url(../images/header.gif) repeat-x 0 -1px;
        height:60px;
    }

</style>
<body>
<div class="header" style="height: 80px;">
    <div style="height:40px;line-height:40px;padding-left:15px;font-family:Tahoma;font-size:16px;font-weight:bold;">
        <div style="padding: 5px;">
            <table cellpadding="0" cellspacing="0">
                <tr>        
                	<td><img src="<%=path%>/images/add-card-s.png"></td>            
                    <td><span style="font-size: 18pt;font-weight: bold;padding: 5px;"><%=Const.SOFT_NAME %></span></td>
                </tr>
            </table>
        </div>
        <div style="position:absolute;top:18px;right:10px;">
            <span id="remainCountSpan"></span>&nbsp;&nbsp;&nbsp;&nbsp;
            <a class="ggs-button ggs-button-iconTop" iconCls="icon-user" plain="true">${sessionScope.admin.username}</a>
            <a class="ggs-button ggs-button-iconTop" iconCls="icon-edit" onclick="showPwdWindow();"  plain="true" >设置密码</a>
            <a class="ggs-button ggs-button-iconTop" iconCls="icon-close"  plain="true" onclick="f_exit();">退出平台</a>
        </div>
    </div>
</div>
<ul id="menu1" class="ggs-menubar" style="width:100%;"
    url="menu.txt" onitemclick="onItemClick"
    textField="text" idField="id" parentField="pid">
</ul>
<div class="ggs-fit" style="padding-top:5px;">
    <!--Tabs-->
    <div id="mainTabs" class="ggs-tabs" activeIndex="0" style="width:100%;height:100%;"
            >
        <div title="首页" url="" ></div>
    </div>
</div>
<div style="line-height:28px;text-align:center;cursor:default"><%=Const.COPY%></div>


<div id="pwdWindow" class="ggs-window" title="设置密码" style="width:350px;height:165px;"
     showModal="true" showCloseButton="false"
        >
    <div id="pwdForm" style="padding:15px;padding-top:10px;">
        <table >
            <tr>
                <td style="width:80px;"><label for="username$text">新密码：</label></td>
                <td>
                    <input id="pwd" name="pwd" class="ggs-password" required="true" requiredErrorText="新密码不能为空" style="width:150px;"/>
                </td>
            </tr>
            <tr>
                <td style="width:80px;"><label for="pwd2$text">密码确认：</label></td>
                <td>
                    <input id="pwd2" name="pwd2" class="ggs-password" requiredErrorText="密码确认不能为空" required="true" style="width:150px;" onenter="onpwdClick" />
                </td>
            </tr>
            <tr>
                <td></td>
                <td style="padding-top:5px;">
                    <a onclick="onPwdClick" class="ggs-button" style="width:60px;">确认</a>
                    <a onclick="closePwdWindow();" class="ggs-button" style="width:60px;" >关闭</a>
                </td>
            </tr>

        </table>
    </div>
</div>

<script type="text/javascript">
    ggs.parse();
    var pwdWindow = ggs.get("pwdWindow");


    /**
     * 打开密码框
     * */
    function showPwdWindow(){
        pwdWindow.show();
    }

    /**
     * 关闭密码框
     * */
    function closePwdWindow(){
        pwdWindow.hide();
    }

    function showTab(node) {
        var tabs = ggs.get("mainTabs");

        var id = "tab$" + node.id;
        var tab = tabs.getTab(id);
        if (!tab) {
            tab = {};
            tab.name = id;
            tab.title = node.text;
            tab.showCloseButton = true;

            //这里拼接了url，实际项目，应该从后台直接获得完整的url地址
            tab.url =  node.url;

            tabs.addTab(tab);
        }
        tabs.activeTab(tab);
    }
    function onItemClick(e) {
        var item = e.item;
        var isLeaf = e.isLeaf;

        if (isLeaf) {
            showTab(item);
        }
    }

    /**
     * 退出
     * */
    function f_exit() {
        ggs.confirm("是否确定退出<%=Const.SOFT_NAME%>？", "提示",
                function (action) {
                    if (action == "ok") {
                      window.location="logout.jsp";
                    }
                }
        );
    }


    /**
     * 修改密码提示
     * */
    function onPwdClick(e) {
        var form = new ggs.Form("#pwdWindow");
        form.validate();
        if (form.isValid() == false) return;
        //提交数据
        var data = form.getData();
        //验证密码
        if(data.pwd!=data.pwd2){
            ggs.alert("您输入两次密码不一样！");
            return false;
        }

        var json = ggs.encode(data);
        var t = $GGS.getJSON("user!updatePwd.action",{data:json});
        ggs.alert("密码更新成功！");
    }

</script>
</body>
