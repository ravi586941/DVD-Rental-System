<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete Dvd</title><%
String ss=(String)session.getAttribute("admin");
	System.out.println("deletedvd.jsp "+ss);%>
<center><font color="blue"><h3>Delete Dvd</h3>
Please enter Dvd Id to be deleted</font><br/><br/>
<form action="<%=request.getContextPath()%>/DvdController" method="post" onsubmit="return validation()">
<input type="text" name="dvdid" placeholder="Dvd Id" id="did"><br/><br/>
<input type="submit" name="delete" value="Dvd Delete"><br/><br/>
<center><a href="adminsuccess.jsp">Admin Home</a> <br/>
	<a href="adminlogout.jsp">Logout</a></center> <br/>
</form>
</head>
<body>

</body>
</html>