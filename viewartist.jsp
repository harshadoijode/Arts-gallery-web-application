<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<%@ include file="customertabs.html" %>
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
<div align="center" class="style4">All Artists </div>
<%@ include file="db.jsp" %>
<% 
String cid=(String)session.getAttribute("cid");
rst=stmt.executeQuery("select * from artist where status='Accept'");

 %>
<table width="1176" border="1" align="center">
  <tr bgcolor="#FFFFFF">
    <td width="91"><span class="style3">Name</span></td>
    <td width="102"><span class="style3">Address</span></td>
    <td width="73"><span class="style3">Phone</span></td>
    <td width="94"><span class="style3">Art Type </span></td>
    <td width="111"><span class="style3">Email</span></td>
	  <td width="111"><span class="style3">id</span></td>
   
  
  </tr>
  <% while(rst.next()){ %>
  <tr bgcolor="#CCFF99">
    <td><span class="style5"><%= rst.getString(1) %></span></td>
    <td><span class="style5"><%= rst.getString(2) %></span></td>
    <td><span class="style5"><%= rst.getString(3) %></span></td>
    <td><span class="style5"><%= rst.getString(4) %></span></td>
    <td><span class="style5"><%= rst.getString(5) %></span></td>
     <td><span class="style5"><%= rst.getString(7) %></span></td>
   
  </tr>
  <% } %>
</table>



<p align="center">  Art Details details</p>
  <table style="background:#666666; color:white; border-radius:10px;" width="auto" border="0" align="center">
  <tr bgcolor="#999999">
    <td ><strong>Art Name</strong></td>
    <td ><strong>About  </strong></td>
    <td ><strong>Art type</strong></td>
    
    <td ><strong>Price </strong></td>
   
    <td ><strong>image</strong></td>
	  <td ><strong>id</strong></td>
	
    
  </tr>
  
  <% 
  
  rst=stmt.executeQuery("select * from artswork");
  while(rst.next()){
  
   %>
  
  <form action="" method="get">
  <tr bgcolor="#003399">
    <td><span class="style3 style1"><input name="e1" type="text"  value="<%= rst.getString(1) %>" readonly="true"/></span></td>
    <td><span class="style3 style1"><input name="e2" type="text" value="<%= rst.getString(2) %>"/></span></td>
    <td><span class="style3 style1"><input name="e3" type="text" value="<%= rst.getString(3) %>"/></span></td>
    <td><span class="style3 style1"><input name="e4" type="text" value="<%= rst.getString(4) %>"/></span></td>
    <td><span class="style3 style1"><img src="images/<%= rst.getString(5) %>" height="100" width="100" /></span></td>
	 <td><span class="style3 style1"><input name="e5" type="text"  value="<%= rst.getString(6) %>"/></span></td>
	
  </tr>
  </form>
  <% } %>
</table>
</body>
</html>
