<%--
  Created by IntelliJ IDEA.
  User: ggs
  Date: 12-11-9
  Time: 上午9:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" pageEncoding="UTF-8" %>
<%@page import="com.ggs.comm.Const"%>
<%@include file="inc/top.jsp"%>
<style type="text/css">
    body
    {
        width:100%;height:100%;margin:0;overflow:hidden;
    }
</style>

 <body>
<div id="loginWindow" class="ggs-window" title="用户登录" style="width:550px;height:260px;"
     showModal="true" showCloseButton="false">
    <div id="loginForm" style="padding:15px;padding-top:10px;">
        <table cellpadding="0" cellspacing="0" align="center">
            <tr>                
                <td><span style="font-size: 18pt;font-weight: bold;padding: 5px;"><%=Const.SOFT_NAME %></span></td>
            </tr>
        </table>
        <table cellpadding="5">
            <tr>
                <td rowspan="4" valign="top">
                    <img src="images/add-card.png">
                </td>
                <td style="width:60px;"><label for="username$text">帐号：</label></td>
                <td>
                    <input id="username" name="username" class="ggs-textbox" required="true" requiredErrorText="帐号不能为空" style="width:150px;"  />
                </td>
            </tr>
            <tr>
                <td style="width:60px;"><label for="pwd$text">密码：</label></td>
                <td>
                    <input id="pwd" name="pwd" class="ggs-password" requiredErrorText="密码不能为空" required="true" style="width:150px;" onenter="onLoginClick" />
                </td>
            </tr>
            <tr>
                <td></td>
                <td style="padding-top:5px;">
                    <a onclick="onLoginClick" class="ggs-button" style="width:60px;">登录</a>
                    <a onclick="onResetClick" class="ggs-button" style="width:60px;">重置</a>
                </td>
            </tr>
        </table>
        <table cellpadding="0" cellspacing="0" align="center">
            <tr>
                <td><%=Const.COPY%></td>
            </tr>
        </table>
    </div>
</div>





<script type="text/javascript">

   //初始化
    $("#username").val("test");
   $("#pwd").val("123456");

    ggs.parse();

    var loginWindow = ggs.get("loginWindow");
    loginWindow.show();

    window.onresize = function () {

        loginWindow.show();
    }

    function onLoginClick(e) {

        var form = new ggs.Form("#loginWindow");
        form.validate();
        if (form.isValid() == false) return;

        //提交数据
        var data = form.getData();
        var json = ggs.encode(data);
        var t = $GGS.getJSON("login!checkLogin.action",{data:json});
        if(t.status==1){
            loginWindow.hide();
            ggs.loading("登录成功，马上进入<%=Const.SOFT_NAME%>...", "登录成功");
            setTimeout(function () {
                window.location = "main/index.jsp";
            }, 1500);
        }else{
            ggs.alert("用户名或者密码不正确！");
        }

    }
    function onResetClick(e) {
        var form = new ggs.Form("#loginWindow");
        form.clear();
    }
    
 
   
</script>
 </body>
