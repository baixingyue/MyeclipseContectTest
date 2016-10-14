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
	background-image: url(5-120601095138.jpg);
	background-size:cover;?
}
-->
</style>
</head>
<body>
	<%
		int num = 0;
		String s1 = request.getParameter("no1");
		String s2 = request.getParameter("no2");
		String s3 = request.getParameter("no3");
		String s4 = request.getParameter("no4");
		String s5 = request.getParameter("nos1");
		String s1tip="wrong";
		String s2tip="wrong";
		String s3tip="wrong";
		String s4tip="wrong";
		String s5tip="wrong";
		if (s1 == null)
			s1 = "";
		if (s2 == null)
			s2 = "";
		if (s3== null)
			s3 = "";
		if (s4 == null)
			s4 = "";
		if (s5 == null)
			s5 = "";
		if (s1.equals("A"))
		s1tip="true";
		   num=num+1;
		if (s2.equals("C"))
		s2tip="true";
			num=num+1;
	    if (s3.equals("A"))
		s3tip="true";
			num=num+1;
		if (s4.equals("A"))
		s2tip="true";
			num=num+1;
		if(!s5.equals("D")||!s5.equals("E")||!s5.equals("F")){
		if((s5.equals("A")&&!s5.equals("B")&&!s5.equals("C")&&!s5.equals("D")&&!s5.equals("E")&&!s5.equals("F"))
		||(s5.equals("B")&&!s5.equals("A")&&!s5.equals("C")&&!s5.equals("D")&&!s5.equals("E")&&!s5.equals("F"))
		||(s5.equals("C")&&!s5.equals("B")&&!s5.equals("A")&&!s5.equals("D")&&!s5.equals("E")&&!s5.equals("F"))){
		    num=num+1;
		    s5tip="您漏选了两个选项，正确选项为ABC";
		}
		else if((s5.equals("A")&&s5.equals("B")&&!s5.equals("C")&&!s5.equals("D")&&!s5.equals("E")&&!s5.equals("F"))
		||(s5.equals("A")&&s5.equals("C")&&!s5.equals("B")&&!s5.equals("D")&&!s5.equals("E")&&!s5.equals("F"))
		||(s5.equals("B")&&s5.equals("C")&&!s5.equals("A")&&!s5.equals("D")&&!s5.equals("E")&&!s5.equals("F"))){
		num=num+2;
		s5tip="您漏选了一个选项，正确选项为ABC";
		}
		else if(s5.equals("A")&&s5.equals("B")&&s5.equals("C")&&!s5.equals("D")&&!s5.equals("E")&&!s5.equals("F")){
		num=num+3;
		s5tip="恭喜您全部选对，正确选项为ABC";
		}
		else{
		s5tip="很遗憾您一个选项都没选对";
	 }
	}
	%>
	<p>您得了<%=num%>分
	<p>错误总结</p>
	<p>本试卷满分7分</p>
	<p>第一道题<%=s1tip%></p>
	<p>第二道题<%=s2tip%></p>
	<p>第三道题<%=s3tip%></p>
	<p>第四道题<%=s4tip%></p>
	<p>第五道题<%=s5tip%></p>
</body>
</html>