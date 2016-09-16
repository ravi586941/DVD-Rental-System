<%@page import="bean.RegistrationBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User delete</title>
<style type="text/css">

body
{
background:url("http://1-background.com/images/silk/white-silk-fabric-website-background.jpg") repeat 0 0;
}


</style>
</head>
<body>
<%
String ss=(String)session.getAttribute("admin");
	System.out.println("updateuser.jsp "+ss);
RegistrationBean aa=(RegistrationBean)request.getAttribute("deleted");
if(aa!=null){%>
<center><h2><font color="blue">You have Successfully deleted the user.</font></h2></center>
<%} %>
<center><a href="adminsuccess.jsp">Admin Home</a> <br/>
	<a href="adminlogout.jsp">Logout</a></center> <br/>
</body>
</html>