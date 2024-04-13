<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
<style type="text/css">
<!--
body {
	background-color: #C9D7E5;
}
.style1 {
	font-size: 36px;
	font-weight: bold;
}
-->
</style></head>

<body>
  <%@ include file="hometabs.html" %>
<%@ include file="db.jsp" %>

<div align="center">
  <p>Fergot Password </p>
</div>
<form  method="get" action="">
  <table width="480" border="1" align="center">
    <tr>
      <td align="right" width="199">enter your ID number </td>
      <td width="265"><input name="regno" type="text"  required/></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="check" value="check" /></td>
    </tr>
  </table>
</form>
<% 

if(request.getParameter("check")!=null){

rst=stmt.executeQuery("select phone from customer where customerid='"+request.getParameter("regno")+"' ");
if(rst.next()){
%>
<form id="form1" name="form1" method="get" action="">
<input name="regno" type="hidden" value="<%= request.getParameter("regno") %>" />
  <table width="480" border="1" align="center">
  
    <tr>
      <td>Enter phone no</td>
      <td><input name="answer" type="text" id="answer" /></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="verify" value="verify" /></td>
    </tr>
  </table>
</form>

<%
}else{
  %>
<script>alert("No such Customer exist");</script>
<%
}




}
 %>





<% 

if(request.getParameter("verify")!=null){

rst=stmt.executeQuery("select password from customer where customerid='"+request.getParameter("regno")+"' and phone='"+request.getParameter("answer")+"' ");
if(rst.next()){
  %>
  <h2>Password is :<%= rst.getString(1) %> </h2>
  
  <%
}else{
  %>
<script>alert("Incorrect answer");</script>
<%
}




}
 %>




</body>
</html>
