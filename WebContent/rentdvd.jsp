<%@page import="bean.DvdBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Rent DVD</title>
<style type="text/css">
body
{
background:url("http://1-background.com/images/silk/white-silk-fabric-website-background.jpg") repeat 0 0;
}
</style>
</head>
<body>
<%System.out.println("Entered rent dvd");
DvdBean a=(DvdBean)request.getAttribute("rented");

if(a!=null){
	String ss=(String)session.getAttribute("customer");
	System.out.println("manageprofile.jsp "+ss);
	int temp;
	temp=a.getFlag();
	if(temp==1){%>
	<font color="blue"><center><h2>You have Successfully rented Dvd :)</h2>
	You will be charged $<%=a.getRent()%> for renting.<br/>
	Please come and pick your Dvd in your nearest store</center></font><br/>
	<%
	}
	if(temp==0){%>
		<center><font color="blue">There are no more <%=a.getDvdName()%> Dvd's left. Please try again later </font></center>
		<%
	}
	if(temp==2){%>
		<center><font color="blue">The DvdId <%=a.getDvdId()%> doesn't exist. Please enter proper DvdId </font></center>
		<%
	}%>
	
	<center><a href="membersuccess.jsp">Member Home</a> <br/>
	<a href="logout.jsp">Logout</a></center> <br/>
	<%
}

else{
	 %>
<center><font color="blue"><h3>Rent a Dvd</h3>
Please enter Dvd Id to be rented</font><br/><br/>
<form action="<%=request.getContextPath()%>/DvdController" method="post" onsubmit="return validation()">
<table align="center">
<tr><td><input type="text" name="dvdid" placeholder="Dvd Id" id="did"></td></tr>
<tr><td><input type="text" name="fromdate" id="datepicker" placeholder="From Date (dd/mm/yyy)" id="fdate"></td></tr>
<tr><td><input type="text" name="todate" id="datepicker1" placeholder="To Date (dd/mm/yyy)" id="tdate"></td></tr>
</table><br/>
<input type="submit" name="rent" value="Rent Dvd"><br/><br/>
<center><a href="membersuccess.jsp">Member Home</a> <br/>
	<a href="logout.jsp">Logout</a></center> <br/>
</form>
<%}%>
<center><font color="red">Note: Dvd rent is $5 per day</font></center>
</body>
</html>