<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<%@ include file="storestabs.html" %>
<title>Untitled Document</title>
<style type="text/css">
<!--
body {
	background-color: #C9D7E5;
}
.style3 {color: #0000FF; font-weight: bold; }
.style4 {
	font-size: 36px;
	font-weight: bold;
	color: #0000FF;
}
.style5 {color: #000099}
-->
</style></head>

<body>
<div align="center" class="style4">Show Orders </div>
<%@ include file="db.jsp" %>
<% 
String sid=(String)session.getAttribute("storephone");
out.print(sid);
rst=stmt.executeQuery("select * from orderlist where storephone='"+sid +"'");

 %>
<table width="1176" border="1" align="center">
  <tr bgcolor="#FFFFFF">
    <td width="91"><span class="style3">Productname</span></td>
    <td width="102"><span class="style3">product cost </span></td>
    <td width="73"><span class="style3">Quantity</span></td>
    <td width="94"><span class="style3">Total amount </span></td>
    <td width="111"><span class="style3">Address</span></td>
    <td width="162"><span class="style3">Card Holder name </span></td>
    <td width="113"><span class="style3">Card Type </span></td>
    <td width="200"><span class="style3">Card Number </span></td>
    <td width="97"><span class="style3">CVV</span></td>
    <td width="69"><span class="style3">OrderID</span></td>
	 <td width="69"><span class="style3">storephone</span></td>
  </tr>
  <% while(rst.next()){ %>
  <tr bgcolor="#CCFF99">
    <td><span class="style5"><%= rst.getString(1) %></span></td>
    <td><span class="style5"><%= rst.getString(2) %></span></td>
    <td><span class="style5"><%= rst.getString(3) %></span></td>
    <td><span class="style5"><%= rst.getString(4) %></span></td>
    <td><span class="style5"><%= rst.getString(5) %></span></td>
    <td><span class="style5"><%= rst.getString(6) %></span></td>
    <td><span class="style5"><%= rst.getString(7) %></span></td>
    <td><span class="style5"><%= rst.getString(8) %></span></td>
    <td><span class="style5"><%= rst.getString(9) %></span></td>
    <td><span class="style5"><%= rst.getString(11) %></span></td>
	  <td><span class="style5"><%= rst.getString(12) %></span></td>
  </tr>
  <% } %>
</table>
</body>
</html>
