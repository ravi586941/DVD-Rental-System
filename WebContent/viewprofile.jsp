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
<title>View Profile</title>
</head>
<body>
<%RegistrationBean a=(RegistrationBean)request.getAttribute("view");
String ss=(String)session.getAttribute("customer");
System.out.println("viewprofile.jsp "+ss);%>
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
<center><a href="membersuccess.jsp">Member Home</a> <br/>
	<a href="logout.jsp">Logout</a></center> <br/>
</body>
</html>