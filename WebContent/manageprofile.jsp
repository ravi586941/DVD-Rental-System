<%@page import="bean.RegistrationBean"%><%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Manage Profile</title>
<style type="text/css">
body
{
background:url("http://1-background.com/images/silk/white-silk-fabric-website-background.jpg") repeat 0 0;
}
</style>
</head>
<body>
<%String s=(String)session.getAttribute("admin");
System.out.println("manageprofile.jsp "+s);
String ss=(String)session.getAttribute("customer");
System.out.println("manageprofile.jsp "+ss);%>
<center><h2><font color="blue">Manage Profile</font></h2>
<form name="form" action="<%=request.getContextPath()%>/DvdController" method="post">
<input type="hidden" value="<%=ss%>" name="username">
<input type="submit" name="viewprofile" value="View Profile"><br/><br/>
</form>
<form name="form" action="<%=request.getContextPath()%>/DvdController" method="post">
<input type="hidden" value="<%=ss%>" name="username">
<input type="submit" name="updateprofile" value="Update Profile"><br/><br/>
<center><a href="membersuccess.jsp">Member Home</a> <br/>
	<a href="logout.jsp">Logout</a></center> <br/>
</form>
</body>
</html>