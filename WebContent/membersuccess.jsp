<%@page import="bean.RegistrationBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style type="text/css">

body
{
background:url("http://1-background.com/images/silk/white-silk-fabric-website-background.jpg") repeat 0 0;
}


</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome</title>
</head>
<body>
<%System.out.println("Entered Member success JSP");
RegistrationBean a=(RegistrationBean)request.getAttribute("memberoperations");
if(a!=null){%>
<%String uname=a.getFirstName(); 
System.out.println("Member success jsp"+uname);
session.setAttribute("customer", uname);%>
<h2 align="center"><font color="blue">Welcome <%=a.getFirstName() %></font></h2>
<center><a href="searchdvd.jsp">Search a DVD</a> <br/><br/>
<a href="rentdvd.jsp">Rent a DVD</a><br/><br/>
<a href="manageprofile.jsp">Manage Profile</a><br/><br/>
<a href="logout.jsp">Logout</a></center>
<%} else {
	String ss=(String)session.getAttribute("customer");
	System.out.println("membersuccess.jsp "+ss);
%>
<h2 align="center"><font color="blue">Welcome <%=ss %></font></h2>
<center><a href="searchdvd.jsp">Search a DVD</a> <br/><br/>
<a href="rentdvd.jsp">Rent a DVD</a><br/><br/>
<a href="manageprofile.jsp">Manage Profile</a><br/><br/>
<a href="logout.jsp">Logout</a></center>
<%} %>
</body>
</html>