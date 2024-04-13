<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<%@ include file="customertabs.html" %>
<title>Untitled Document</title>
<style type="text/css">
<!--
.style1 {font-size: 24px}
body,td,th {
	color: #E5E5E5;
}
.style2 {color: #000033}
-->
</style>
</head>

<body>
  <%@ include file="db.jsp" %>
<div align="center" class="style1">View Arts</div>
<table width="200" border="1" align="center" bgcolor="#006600">
  <tr bgcolor="#C6F8C0">
    <td><span class="style2">About Arts </span></td>
    <td><span class="style2">Images</span></td>
  </tr>

<% 

rst=stmt.executeQuery("select * from arts");
while(rst.next()){

 %>
  <tr>
    <td><p>Name:<%= rst.getString(1) %></p>
    <p>Art Type:<%= rst.getString(3) %></p>
    <p>Price:<%= rst.getString(4) %></p>
    <p>ID:<%= rst.getString(6) %></p>
    <p>Description:<%= rst.getString(2) %> </p>
	  <p><a href="buyarts.jsp?p=<%= rst.getString(1) %>" >Buy</a></p>
	</td>
    <td><img src="images/<%= rst.getString(5) %>" width="400" height="400" /></td>
  </tr>
  <% } %>
</table>
</body>
</html>
