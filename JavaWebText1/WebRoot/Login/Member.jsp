<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
<!--
body {
	background-image: url(1475999780728.jpg);
	background-size:cover;?
}
-->
</style>
</head>
<body>
	<%	
	String Login = (String)session.getAttribute("Login");
	String userId=(String)session.getAttribute("username");
    out.print(userId);
	if (Login != null && Login.equals("OK")) {		
		out.println("欢迎您的到来!");
		out.println("即将进入答题系统");
		session.invalidate();
			response.setHeader("Refresh","2;URL=answer.jsp");
		
	}	
	else {		
		out.println("登录不成功，请您先登陆，谢谢")	;
		out.println("<br>经过5秒之后，将自动返回Login.jsp");
		
		response.setHeader("Refresh","5;URL=Login.jsp");	
	}
%>
</body>
</html>