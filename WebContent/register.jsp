<%@page import="bean.RegistrationBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript"> 
function validation()
{            
	
	
	if(document.getElementById("fn").value=="")
	{
		alert("Please enter the First Name");
			return false;
	}
	else if(document.getElementById("ln").value=="")
	{
		alert("Please enter the Last Name");
			return false;
	}
	else if(document.getElementById("gender").value=="")
	{
		alert("Please enter the Gender");
			return false;
	}
	else if(document.getElementById("dob").value=="")
	{
		alert("Please enter the Date Of Birth");
			return false;
	}
	else if(document.getElementById("addr").value=="")
	{
		alert("Please enter your address");
			return false;
	}
	else if(document.getElementById("eid").value=="")
	{
		alert("Please enter your Email");
			return false;
	}

}
</script>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style type="text/css">

body
{
background:url("http://1-background.com/images/silk/white-silk-fabric-website-background.jpg") repeat 0 0;
}


</style>
<title>Register</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script>
  $(function() {
    $( "#datepicker" ).datepicker(
    {
    	
    	changeYear:true,
        changeMonth:true,
        yearRange:"1970:2000"
    	
    })
  });
  </script>
</head>
<body>
<%RegistrationBean a=(RegistrationBean)request.getAttribute("newcustomer");
if(a!=null){%>
<center><h2><font color="blue">You have Successfully registered :)</font></h2></center>
<center>Your Credentials are as below. Please use these to Login in to your account</center></br>
<center>User ID is: <%=a.getUserName() %></center>
<center>Password is: <%=a.getPassword() %></center>
<%
}
else{
	 %>
<h2 align="center"><font color="blue">Register Form</font></h2>
<form action="<%=request.getContextPath()%>/DvdController" method="post" onsubmit="return validation()">
<table align="center">
<tr><td><input type="text" name="firstname" placeholder="First Name" id="fn"></td></tr>
<tr><td><input type="text" name="lastname" placeholder="Last Name" id="ln"></td></tr>
<tr><td><input type="text" name="gender" placeholder="Gender" id="gender"></td></tr>
<tr><td><input type="text" name="dob" id="datepicker" placeholder="Date of Birth" id="dob"></td></tr>
<tr><td><input type="text" name="address" placeholder="Address" id="addr"></td></tr>
<tr><td><input type="text" name="emailid" placeholder="EmailID" id="eid"></td></tr>


</table>
&nbsp;
<center><input type="submit" name="registerform" value="Submit"></center>
</form>
<%} %>
</body>
</html>