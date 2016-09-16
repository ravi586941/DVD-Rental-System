<%@page import="bean.DvdBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript"> 
function validation()
{            
	//var el=document.getElementById('cn');
	//var e2=document.getElementById('dn');
	//var e3=document.getElementById('bc');
	//var re=/^[A-z]+$/; 
	
	if(document.getElementById("did").value=="")
	{
		alert("Please enter DvdId");
			return false;
	}
	else if(document.getElementById("dn").value=="")
	{
		alert("Please enter Dvd Name");
			return false;
	}
	else if(document.getElementById("dur").value=="")
	{
		alert("Please enter the Duration");
			return false;
	}
	else if(document.getElementById("gn").value=="")
	{
		alert("Please enter the Genre");
			return false;
	}
	else if(document.getElementById("rat").value=="")
	{
		alert("Please enter Rating");
			return false;
	}
	else if(document.getElementById("qn").value=="")
	{
		alert("Please enter Quantity");
			return false;
	}
	
}
</script>
<head>
<style type="text/css">
body
{
background:url("http://1-background.com/images/silk/white-silk-fabric-website-background.jpg") repeat 0 0;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add DVD</title>
</head>
<body>
<%String s=(String)session.getAttribute("admin");
System.out.println("adddvd.jsp"+s);%>
<%DvdBean a=(DvdBean)request.getAttribute("dvdadded");
if(a!=null){%>
<center><h3><font color="blue">The <%=a.getDvdName()%> DVD is successfully added.<br/><br/></h3>
<a href="adddvd.jsp">Click here</a> to add one more Dvd.<br/><br/>
<a href="adminsuccess.jsp">Click here</a> to go to Admin home<br/><br/>
<a href="adminlogout.jsp">Logout</a>
</font></center>
<%}
else {%>

<center><h2><font color="blue">Add DVD</font></h2></center>

<form name="form" action="<%=request.getContextPath()%>/DvdController" method="post" onsubmit="return validation()">
<table align="center">
    <tr><td>DvdId</td><td><input type="text" name="dvdid" id="did"></tr>
	<tr><td>DvdName</td><td><input type="text" name="dvdname" id="dn"></tr>
	<tr><td>Artist</td><td><input type="text" name="artist" id="artist"></tr>
	<tr><td>Duration</td><td><input type="text" name="duration" id="dur"></tr>
    <tr><td>Genre</td><td><input type="text" name="genre" id="gn"></tr>
    <tr><td>Year</td><td><input type="text" name="year" id="yr"></tr>
    <tr><td>Quantity</td><td><input type="text" name="quantity" id="qn"></tr>
    <tr><td>Rating</td><td><input type="text" name="rating" id="rat"></tr>
    <tr><td>Price</td><td><input type="text" name="price" id="pri"></tr>
        </table>
        &nbsp;
        <center><input type="submit" name="adddvd" value="Add DVD"></center>
        </form><br/>
        <center><h3><a href="adminlogout.jsp">Logout</a></h3></center>
        <%} %>
</body>
</html>