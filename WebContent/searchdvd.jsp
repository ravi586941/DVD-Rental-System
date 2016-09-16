<%@page import="bean.DvdBean"%>
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
<title>Search DVD</title>
</head>
<body>
<%DvdBean a=(DvdBean)request.getAttribute("searched");
if(a!=null){%>
<center><h2><font color="blue">The following are the Dvd details</font></h2>

Dvd ID : <%=a.getDvdId() %><br/>
Dvd Name: <%=a.getDvdName() %><br/>
Artist: <%=a.getArtist() %><br/>
Duration: <%=a.getDuration() %><br/>
Genre: <%=a.getGenre()%><br/>
Year: <%=a.getYear()%><br/>
Rating: <%=a.getRating()%><br/>
Price: <%=a.getPrice()%><br/><br/>
<a href="index.jsp">Home</a></center><%
}
else{
	 %>

<center><h3><font color="blue">Search a DVD</font></h3>
<form name="form" action="<%=request.getContextPath()%>/DvdController" method="post" onsubmit="return validation()">
<select name="selected">
  <option value="select" name="sel">Please select..</option>
  <option value="name" name="nam">Name</option>
  <option value="artist" name="art">Artist</option>
  <option value="year" name="yea">Year</option>
</select><br/><br/>
Enter Search Key <input type="text" name="entered" id="entered"><br/><br/>
<input type="submit" name="search" value="Submit"><br/><br/>
</form><a href="index.jsp">Home</a>
</center>
<%} %>
</body>
</html>