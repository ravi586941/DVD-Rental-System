<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript"> 
function validation()
{            
	
	if(document.getElementById("uname").value=="")
	{
		alert("Please enter Username");
			return false;
	}
	else if(document.getElementById("pwd").value=="")
	{
		alert("Please enter Password");
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
<title>Login</title>
</head>
<body>
<h2 align="center"><font color="blue">Member Login</font></h2>
<form action="<%=request.getContextPath()%>/DvdController" method="post" onsubmit="return validation()">
<table align="center">				
<tr><td><input type="text" class="text"  name="username" placeholder="Username" id="uname"></tr></td>			
<tr><td><input type="password"  name="password" placeholder="Password" id="pwd"></tr></td>
</table>&nbsp;		
<center><input type="submit" name="memberlogin" value="Login" > <a href="#" class=" icon arrow"></a></center>                                                                                                                                                                                                                       </h4>
</form>
</body>
</html>