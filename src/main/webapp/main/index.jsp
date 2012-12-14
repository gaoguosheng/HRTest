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
            <a class="ggs-button ggs-button-iconTop" iconCls="icon-user" plain="true">${sessionScope.admin.realname}</a>
            <a class="ggs-button ggs-button-iconTop" iconCls="icon-edit" onclick="showPwdWindow();"  plain="true" >设置密码</a>
            <a class="ggs-button ggs-button-iconTop" iconCls="icon-close"  plain="true" onclick="f_exit();">退出平台</a>
        </div>
    </div>
</div>
<ul id="menu1" class="ggs-menubar" style="width:100%;"
    url="menu!list.action" onitemclick="onItemClick"
    textField="menuname" idField="menuid" parentField="upid">
</ul>
<div class="ggs-fit" style="padding-top:5px;">
    <!--Tabs-->
    <div id="mainTabs" class="ggs-tabs" activeIndex="0" style="width:100%;height:100%;"
            >
        <div title="首页" url="">
            <div align="center">
                <div style="height: 100px;"></div>
                <div>
                    <a href="#" onclick="f_startTest();return false;" title="开始测试"><img border="0" src="<%=path%>/images/play.png"><div>开始测试</div></a>
                </div>

            </div>
        </div>
    </div>
</div>
<div style="line-height:28px;text-align:center;cursor:default"><%=Const.COPY%></div>


<div id="pwdWindow" class="ggs-window" title="设置密码" style="width:380px;height:200px;"
     showModal="true" showCloseButton="false"
        >
    <div id="pwdForm" style="padding:15px;padding-top:10px;">
        <table >
            <tr>
                <td style="width:80px;">旧密码：</td>
                <td>
                    <input id="oldpwd" name="oldpwd" class="ggs-password" required="true"  style="width:150px;"/>
                </td>
            </tr>
            <tr>
                <td style="width:80px;">新密码：</td>
                <td>
                    <input id="pwd" name="pwd" class="ggs-password" required="true"  style="width:150px;"/>
                </td>
            </tr>
            <tr>
                <td style="width:80px;">密码确认：</td>
                <td>
                    <input id="pwd2" name="pwd2" class="ggs-password"  required="true" style="width:150px;" onenter="onpwdClick" />
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

        var id = "tab$" + node.menuid;
        var tab = tabs.getTab(id);
        if (!tab) {
            tab = {};
            tab.name = id;
            tab.title = node.menuname;
            tab.showCloseButton = true;

            //这里拼接了url，实际项目，应该从后台直接获得完整的url地址
            tab.url = "<%=path%>/"+ node.url;

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

        //验证旧密码
        if(hex_md5(data.oldpwd)!="${sessionScope.admin.pwd}"){
            ggs.alert("旧密码不正确!");
            return false;
        }


        //验证密码
        if(data.pwd!=data.pwd2){
            ggs.alert("您输入两次密码不一样！");
            return false;
        }

        var json = ggs.encode(data);
        var t = $GGS.getJSON("user!updatePwd.action",{data:json});
        ggs.alert("密码更新成功！");
        form.setData({});
        closePwdWindow();
    }

    function f_startTest(){
        var tabs = ggs.get("mainTabs");
        var id = "tab$1";
        var tab = tabs.getTab(id);
        if (!tab) {
            tab = {};
            tab.name = id;
            tab.title = "开始测试";
            tab.showCloseButton = true;

            //这里拼接了url，实际项目，应该从后台直接获得完整的url地址
            tab.url =  "test.jsp";

            tabs.addTab(tab);
        }
        tabs.activeTab(tab);
    }

</script>
</body>
