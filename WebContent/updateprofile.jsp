<%@page import="bean.RegistrationBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Profile</title>
</head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style type="text/css">

body
{
background:url("http://1-background.com/images/silk/white-silk-fabric-website-background.jpg") repeat 0 0;
}


</style>
<body>
<%RegistrationBean aa=(RegistrationBean)request.getAttribute("update");
if(aa!=null){%>
<center><h2><font color="blue">You have Successfully updated your details :)</font></h2></center>

<table align="center">
<tr><td><font color="blue">UserName</font></td><td><%=aa.getUserName()%></td></tr>
<tr><td><font color="blue">Password</font></td><td><%=aa.getPassword()%></td></tr>
<tr><td><font color="blue">FirstName</font></td><td><%=aa.getFirstName()%></td></tr>
<tr><td><font color="blue">LastName</font></td><td><%=aa.getLastName()%></td></tr>
<tr><td><font color="blue">Gender</font></td><td><%=aa.getGender()%></td></tr>
<tr><td><font color="blue">DateOfBirth</font></td><td><%=aa.getDateOfBirth()%></td></tr>
<tr><td><font color="blue">EmailId</font></td><td><%=aa.getEmailId()%></td></tr>
<tr><td><font color="blue">Address</font></td><td><%=aa.getAddress()%></td></tr>
</table>
<center><a href="membersuccess.jsp">Member Home</a> <br/>
	<a href="logout.jsp">Logout</a></center> <br/>
<%}else{
RegistrationBean a=(RegistrationBean)request.getAttribute("view");%>
<h2 align="center"><font color="blue">Update Form</font></h2>
<form action="<%=request.getContextPath()%>/DvdController" method="post" onsubmit="return validation()">
<table align="center">
<tr><td>UserName</td><td><input type="text" name="username" placeholder="<%=a.getUserName()%>" value="<%=a.getUserName()%>" id="uname" readonly></td></tr>
<tr><td>Password</td><td><input type="text" name="password" placeholder="<%=a.getPassword()%>" value="<%=a.getPassword()%>" id="password"></td></tr>
<tr><td>FirstName</td><td><input type="text" name="firstname" placeholder="<%=a.getFirstName()%>" value="<%=a.getFirstName()%>" id="fn"></td></tr>
<tr><td>LastName</td><td><input type="text" name="lastname" placeholder="<%=a.getLastName()%>" value="<%=a.getLastName()%>" id="ln"></td></tr>
<tr><td>Gender</td><td><input type="text" name="gender" placeholder="<%=a.getGender()%>" value="<%=a.getGender()%>" id="gender"></td></tr>
<tr><td>DateOfBirth</td><td><input type="text" name="dob" id="datepicker" placeholder="<%=a.getDateOfBirth()%>" value="<%=a.getDateOfBirth()%>" id="dob"></td></tr>
<tr><td>EmailId</td><td><input type="text" name="emailid" placeholder="<%=a.getEmailId()%>" value="<%=a.getEmailId()%>" id="eid"></td></tr>
<tr><td>Address</td><td><input type="text" name="address" placeholder="<%=a.getAddress()%>" value="<%=a.getAddress()%>" id="addr"></td></tr>
</table>
&nbsp;
<center><input type="submit" name="updateform" value="Update"></center>
</form>
<center><a href="membersuccess.jsp">Member Home</a> <br/>
	<a href="logout.jsp">Logout</a></center> <br/>
<%} %>

</body>
</html>