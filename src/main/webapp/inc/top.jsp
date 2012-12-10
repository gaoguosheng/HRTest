<%--
  Created by IntelliJ IDEA.
  User: ggs
  Date: 12-11-9
  Time: 上午9:09
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" pageEncoding="UTF-8" %>
<%@page import="com.ggs.comm.Const"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title><%=Const.SOFT_NAME %></title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link rel = "Shortcut Icon" href="<%=path%>/images/ggsx.ico">
    <script type="text/javascript" src="<%=path%>/scripts/jquery-1.6.2.min.js"></script>
    <script type="text/javascript" src="<%=path%>/scripts/ggsui/ggsui.js"></script>
    <link href="<%=path%>/scripts/ggsui/themes/default/ggsui.css"  rel="stylesheet" type="text/css" />
    <link href="<%=path%>/scripts/ggsui/themes/icons.css"  rel="stylesheet" type="text/css" />
    <link href="<%=path%>/scripts/ggsui/themes/blue/skin.css"  rel="stylesheet" type="text/css" />
    <style type="text/css">
        body,label,p,div,table,span{font-size: 10pt;}
    </style>
	<script type="text/javascript" src="<%=path%>/scripts/ggs.js"></script>
</head>

