<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Logged out</title>
<style type="text/css">
body
{
background:url("http://1-background.com/images/silk/white-silk-fabric-website-background.jpg") repeat 0 0;
}
</style>
</head>
<body>
<h3><center><font color="blue">Logged out Successfully</font></center></h3>
<%String s=(String)session.getAttribute("customer");
System.out.println("studentlogout.jsp before session closing"+s);
session.invalidate();
System.out.println("studentlogout.jsp after session closing"+s);%>
<h3><center>Please <a href="memberlogin.jsp">Login</a></center></h3>
<h3><center>Go to <a href="index.jsp">Homepage</a></center></h3>

</body>
</html>