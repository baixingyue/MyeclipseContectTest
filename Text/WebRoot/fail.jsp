<%@ page language="java" contentType="text/html;charset=gb2312" pageEncoding ="utf-8"%>
<html>
 <head>
  <title>登陆失败</title>
 </head>
 <body>
  <%
   String userName = (String)session.getAttribute("username") ;
   String msg  = (String)session.getAttribute("message") ;
  %>
  <div align="center">
   <%=userName %>
   对不起，登陆失败！<br />
   <font color="red">原因： </font>
   <%=msg %>
   <br/>
   <br/>
   5秒后将返回登陆界面。
  </div>
   
   <%
     response.setHeader("Refresh","5;URL=/Text/login.jsp");   
    %>
 </body>
</html>
