<%@page import="bean.RegistrationBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Managing Users</title>
<style type="text/css">

body
{
background:url("http://1-background.com/images/silk/white-silk-fabric-website-background.jpg") repeat 0 0;
}


</style>

</head>
<body>
<%RegistrationBean a=(RegistrationBean)request.getAttribute("view");
String ss=(String)session.getAttribute("admin");
System.out.println("managingmembers.jsp "+ss);%>
<center><h2><font color="blue">The user details are as below</font></h2></center><br/>
<table align="center">
<tr><td><font color="blue">UserName:</font></td><td> <%=a.getUserName() %></td></tr>
<tr><td><font color="blue">Password:</font></td><td> <%=a.getPassword() %></td></tr>
<tr><td><font color="blue">FirstName:</font></td><td> <%=a.getFirstName() %></td></tr>
<tr><td><font color="blue">LastName:</font></td><td> <%=a.getLastName() %></td></tr>
<tr><td><font color="blue">Gender:</font></td><td> <%=a.getGender() %></td></tr>
<tr><td><font color="blue">DateOfBirth:</font></td><td> <%=a.getDateOfBirth() %></td></tr>
<tr><td><font color="blue">EmailId:</font></td><td> <%=a.getEmailId() %></td></tr>
<tr><td><font color="blue">Address:</font></td><td> <%=a.getAddress() %></td></tr>
</table>
<center><br/><br/>
<a href="adminsuccess.jsp">Admin Home</a> &nbsp;
	<a href="adminlogout.jsp">Logout</a></center> <br/>
</body>
</html>