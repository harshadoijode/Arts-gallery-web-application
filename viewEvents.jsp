<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
  <%@ include file="customertabs.html" %>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Untitled Document</title>
<style type="text/css">
<!--

td,th {
	color: white;
	font-family: Courier New, Courier, monospace;
	font-weight: bold;
	font-size: 24px;
	
}
.style1 {
	color: #CCCCCC;
	font-weight: bold;
}

-->
</style>
</head>

<body>
<%@ include file="db.jsp" %><br />
<br />
<br />
<br />





 <p align="center" style="color:white">
 
Event Details  Details</p>
<table width="80%" border="0" align="center">
  <tr bgcolor="#999999">
    <td><strong>Name</strong></td>
   
    <td ><strong>Address</strong></td>
    <td ><strong>Phone</strong></td>
	 <td ><strong>Description</strong></td>
	  <td ><strong>Date</strong></td>
	   <td ><strong>ID</strong></td>
	    <td ></td>
  
  </tr>
  
  
  <% 
  
  rst=stmt.executeQuery("select * from events order by id desc ");
  while(rst.next()){
  
   %>
  
 
  <tr bgcolor="blue">
    <td><%= rst.getString(1) %>    </td>
	 <td><%= rst.getString(2) %>    </td>
	  <td><%= rst.getString(3) %>    </td>
	   <td><%= rst.getString(4) %>    </td>
	    <td><%= rst.getString(5) %>    </td>
		 <td><%= rst.getString(7) %>    </td>
		 <td><img src="images/<%= rst.getString(6) %> " height="80" width="80" />   </td>
   
	
   
   
  </tr>
  </form>
  <% } %>
</table>

</div>
</body>
</html>
