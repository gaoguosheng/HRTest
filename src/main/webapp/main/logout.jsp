<%--
  Created by IntelliJ IDEA.
  User: ggs
  Date: 12-11-24
  Time: 上午11:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  pageEncoding="UTF-8" %>
<%
    session.invalidate();
    response.sendRedirect(request.getContextPath()+"/login.jsp");
%>