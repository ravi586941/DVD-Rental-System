<%@page import="bean.LoginBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">

body
{
background:url("http://1-background.com/images/silk/white-silk-fabric-website-background.jpg") repeat 0 0;
}


</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome Admin</title>
</head>
<body>
<%System.out.println("Entered admin success JSP");
LoginBean a=(LoginBean)request.getAttribute("adminoperations");
if(a!=null){%>
<%String uname=a.getUsername(); 
System.out.println("Admin success jsp"+uname);
session.setAttribute("admin", uname);%>
<h2 align="center"><font color="blue">Welcome <%=a.getUsername() %></font></h2>
<center><a href="searchdvd.jsp">Search a DVD</a> <br/><br/>
<a href="adddvd.jsp">Add a DVD</a> <br/><br/>
<a href="updatedvd.jsp">Update a DVD</a><br/><br/>
<a href="deletedvd.jsp">Delete a DVD</a><br/><br/>
<a href="managemembers.jsp">Manage Users</a><br/><br/>
<a href="adminlogout.jsp">Logout</a></center>
<%} else {
	String s=(String)session.getAttribute("admin");
	System.out.println("adminsuccess.jsp "+s);
%>
<h2 align="center"><font color="blue">Welcome admin</font></h2>
<center><a href="searchdvd.jsp">Search a DVD</a> <br/><br/>
<a href="adddvd.jsp">Add a DVD</a> <br/><br/>
<a href="updatedvd.jsp">Update a DVD</a><br/><br/>
<a href="deletedvd.jsp">Delete a DVD</a><br/><br/>
<a href="managemembers.jsp">Manage Users</a><br/><br/>
<a href="adminlogout.jsp">Logout</a></center>
<%} %>
</body>
</html>