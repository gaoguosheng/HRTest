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
                                <a class="ggs-button" iconCls="icon-add" onclick="f_add();" plain="true">增加</a>
                                <a class="ggs-button" iconCls="icon-edit" onclick="f_edit();" plain="true">修改</a>
                                <span class="separator"></span>
                                <a class="ggs-button" iconCls="icon-lock" onclick="f_resetPwd()" plain="true">重置密码</a>
                                <span class="separator"></span>
                                <span>注：初始密码为123456</span>
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
         url="user!getUserList.action"  idField="userid"
         sizeList="[10,20,30,50]" pageSize="20">
        <div property="columns">
            <div type="indexcolumn" width="20"></div>
            <div field="username" >用户名</div>
            <div field="realname" >姓名</div>
            <div field="rolename" >角色</div>
            <div field="tel" >电话</div>
            <div field="qq" >QQ</div>
            <div field="email" >邮箱</div>
            <div field="memo" >备注</div>
        </div>
    </div>
</div>


<div id="userWindow" class="ggs-window" title="用户管理" style="width:600px;height:400px;"
     showModal="true" showCloseButton="false">
    <div id="userForm" style="padding:15px;padding-top:10px;">
        <input id="userid" name="userid" class="ggs-hidden" />
        <input id="pwd" name="pwd" class="ggs-hidden" />
        <table cellpadding="5">
            <tr>
                <td style="width:60px;">用户名：</td>
                <td>
                    <input id="username" name="username" class="ggs-textbox" required="true" style="width:150px;"  />
                </td>
            </tr>
            <tr>
                <td style="width:60px;">姓名：</td>
                <td>
                    <input id="realname" name="realname" class="ggs-textbox" required="true" style="width:150px;" />
                </td>
            </tr>
            <tr>
                <td style="width:60px;">角色：</td>
                <td>
                    <input name="roleid" id="roleid" class="ggs-combobox" style="width:150px;"
                           data="[{id:1,text:'普通用户'},{id:2,text:'管理员'}]"  required="true" allowInput="false" />
                </td>
            </tr>
            <tr>
                <td style="width:60px;">电话：</td>
                <td>
                    <input id="tel" name="tel" class="ggs-textbox" style="width:150px;" />
                </td>
            </tr>
            <tr>
                <td style="width:60px;">QQ：</td>
                <td>
                    <input id="qq" name="qq" class="ggs-textbox" style="width:150px;" />
                </td>
            </tr>
            <tr>
                <td style="width:60px;">邮箱：</td>
                <td>
                    <input id="email" name="email" class="ggs-textbox" style="width:150px;" />
                </td>
            </tr>
            <tr>
                <td style="width:60px;">备注：</td>
                <td>
                    <input id="memo" name="memo" class="ggs-textarea" style="width:200px;" />
                </td>
            </tr>
        </table>
    </div>
    <div  align="center">
        <a onclick="f_save();" class="ggs-button" style="width:60px;">确定</a>
        <a onclick="f_close();" class="ggs-button" style="width:60px;">取消</a>
    </div>
</div>



<script type="text/javascript">
    ggs.parse();

    var userWindow = ggs.get("userWindow");


    var form = new ggs.Form("userForm");


    var grid = ggs.get("datagrid1");
    grid.load();
    //排序
    grid.sortBy("userid", "desc");
    function search() {
        var username = ggs.get("username").getValue();
        grid.load({ username: username });
    }
    function onKeyEnter(e) {
        search();
    }

    function gridReload(){
        grid.reload();
    }

    /**
     * 重置密码
     * */
    function f_resetPwd(){
        var row = grid.getSelected();
        if (row) {
            ggs.confirm("是否确定重置密码？", "确定？",
                    function (action) {
                        if (action == "ok") {
                            $GGS.ajax("user!resetPwd.action",{userid:row.userid});
                            ggs.alert("重置密码成功！");
                        }
                    }
            );

        } else {
            ggs.alert("请选中一条记录");
        }
    }


    function f_add(){
        form.setData({userid:-1,roleid:1});
        userWindow.show();
    }

    function f_edit(){
        var row = grid.getSelected();
        if(row){
            form.setData(row);
            userWindow.show();
        }else{
            ggs.alert("请选中一条记录");
        }
    }

    function f_close(){
        userWindow.hide();
    }

    function f_save(){
        var o = form.getData();
        form.validate();
        if (form.isValid() == false) return;
        var json = ggs.encode(o);
        $GGS.ajax("user!saveUser.action",{ data: json });
        f_close();
        gridReload();
    }
</script>
</body>
