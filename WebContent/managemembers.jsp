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
<title>Manage Members</title><%
String ss=(String)session.getAttribute("admin");
	System.out.println("membersuccess.jsp "+ss);%>
<center><font color="blue"><h3>Manage Users</h3>
Please enter Customer Id to be updated</font><br/><br/>
<form action="<%=request.getContextPath()%>/DvdController" method="post" onsubmit="return validation()">
<input type="text" name="custid" placeholder="customer Id" id="did"><br/><br/>
<input type="submit" name="viewuser" value="View"> &nbsp;
<input type="submit" name="updateuser" value="Update"> <br/> <br/>
<input type="submit" name="deleteuser" value="Delete"><br/><br/>
<center><a href="adminsuccess.jsp">Admin Home</a> &nbsp;
	<a href="adminlogout.jsp">Logout</a></center> <br/>
</form>
</head>
<body>

</body>
</html>