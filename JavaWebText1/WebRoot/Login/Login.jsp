<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
<title>Insert title here</title>
<style type="text/css">
<!--
body {
	background-image: url(1475999797108.jpg);
	background-size:cover;?
}

img{
	border:0;
	}
.lg{width:468px; height:468px; margin:100px auto; background:url(login_bg.png) no-repeat;}
.lg_top{ height:200px; width:468px;}
.lg_main{width:400px; height:180px; margin:0 25px;}
.lg_m_1{
	width:290px;
	height:100px;
	padding:60px 55px 20px 55px;
}
.ur{
	height:37px;
	border:0;
	color:#666;
	width:236px;
	margin:4px 28px;
	background:url(user.png) no-repeat;
	padding-left:10px;
	font-size:16pt;
	font-family:Arial, Helvetica, sans-serif;
}
.pw{
	height:37px;
	border:0;
	color:#666;
	width:236px;
	margin:4px 28px;
	background:url(password.png) no-repeat;
	padding-left:10px;
	font-size:16pt;
	font-family:Arial, Helvetica, sans-serif;
}
.bn{width:330px; height:72px; background:url(images/enter.png) no-repeat; border:0; display:block; font-size:18px; color:#5f5858; font-family:Arial, Helvetica, sans-serif; font-weight:bolder;}
.lg_foot{
	height:80px;
	width:330px;
	padding: 6px 68px 0 68px;
}
-->
</style>
</head>

<body class="b">
<div class="lg">
<form action="#" method="POST">
    <div class="lg_top"></div>
    <div class="lg_main">
        <div class="lg_m_1">
        
        <input type="text" name="Name" value="username" class="ur"  />

        <input type="password" name="Password" value="password" class="pw" />
        
        </div>
    </div>
    <div class="lg_foot">
    <input type="submit" value="Submit" class="bn" /></div>
</form>
</div>


	<%
	String Name = request.getParameter("Name");
	String Password = request.getParameter("Password");
		if (Name != null && Name!=""&& Password != null&& Password!="") {
			if (Name.equals("baixingyue") && Password.equals("2014011417")) {
				session.setAttribute("Login", "OK");
				session.setAttribute("username", Name);
				response.sendRedirect("Member.jsp");
				
			} else {
				out.println("登录失败，请输入正确名称");
				response.sendRedirect("Member.jsp");
			}
		}
		else{
		out.println("登录失败，请输入正确名称");
		}
	%>

</body>
</html>
