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
<title>Update Dvd</title><%
String ss=(String)session.getAttribute("admin");
	System.out.println("updatedvd.jsp "+ss);%>
<center><font color="blue"><h3>Update Dvd</h3>
Please enter Dvd Id to be updated</font><br/><br/>
<form action="<%=request.getContextPath()%>/DvdController" method="post" onsubmit="return validation()">
<input type="text" name="dvdid" placeholder="Dvd Id" id="did"><br/><br/>
<input type="submit" name="update" value="Dvd Update"><br/><br/>
<center><a href="adminsuccess.jsp">Admin Home</a> <br/>
	<a href="adminlogout.jsp">Logout</a></center> <br/>
</form>
</head>
<body>

</body>
</html>