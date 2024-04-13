<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
  <%@ include file="admintabs.html" %>
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

<div align="center" class="style1">Add New Events</div>

<form id="form1" name="form1" method="post" action="">
  <table style="background:#666666; color:white; border-radius:20px;" width="auto" border="0" align="center">
    <tr >
      <td width="285">Event name </td>
      <td width="212"><input name="s1" type="text"  /></td>
    </tr>
    <tr>
      <td>Address</td>
      <td><textarea name="s2" cols="auto" rows="5"></textarea></td>
    </tr>
    <tr>
      <td> mobile no. </td>
      <td><input name="s3" type="text" pattern="[0-9]{10}" title=" phone number or number"  required /></td>
    </tr>
    <tr>
      <td>Event Description </td>
      <td><textarea name="s4" cols="auto" rows="5"></textarea>
      </td>
    </tr>
	<tr>
      <td> Date </td>
      <td><input name="s5" type="date"   required /></td>
    </tr>
	<tr>
      <td> Add Image </td>
      <td><input name="s6" type="file"   required /></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="Add Event" /></td>
    </tr>
  </table>
</form>
</div>


<% 
if(request.getParameter("Submit")!=null){

String s1=request.getParameter("s1");
String s2=request.getParameter("s2");
String s3=request.getParameter("s3");
String s4=request.getParameter("s4");
String s5=request.getParameter("s5");
String s6=request.getParameter("s6");
try{
int x=stmt.executeUpdate("insert into events(name,address,phone,description,date,image) values('"+s1+"','"+s2+"','"+s3+"','"+s4+"','"+s5+"','"+s6+"')");
if(x!=0){
%>
<script>
alert("Event  added Successfully");
</script>

<%
//out.print("Artist  added Successfully");
}else{
out.println("this store already exist");
}

}catch(Exception e){
%>
<script>
alert("Event by this phone number is already exist");
</script>

<%
}
}
 %>

<div > 
 <p align="center" style="color:black">
 
Event Details  Details</p>
<table width="80%" border="0" align="center">
  <tr bgcolor="#999999">
    <td><strong>Name</strong></td>
   
    <td ><strong>Address</strong></td>
    <td ><strong>Phone</strong></td>
	 <td ><strong>Description</strong></td>
	  <td ><strong>Date</strong></td>
	   <td ><strong>ID</strong></td>
	   
  
  </tr>
  
  
  <% 
  
  rst=stmt.executeQuery("select * from events order by id desc ");
  while(rst.next()){
  
   %>
  
  <form action="" method="get">
  <tr bgcolor="white">
    <td><span class="style3 style1"><input name="e1" type="text"  value="<%= rst.getString(1) %>" size="15"/>
    </span></td>
    <td><span class="style3 style1"><input name="e2" type="text" value="<%= rst.getString(2) %>" size="15"/>
    </span></td>
    <td><span class="style3 style1"><input name="e3" type="text" value="<%= rst.getString(3) %>"/></span></td>
	 <td><span class="style3 style1"><input name="e4" type="text" value="<%= rst.getString(4) %>"/></span></td>
	 
   <td><span class="style3 style1"><input name="e5" type="text" value="<%= rst.getString(5) %>"/></span></td>
	<td><span class="style3 style1"><input name="e6" type="text" value="<%= rst.getString(6) %>" readonly="true" size="10"/>
    </span></td>
	
   
   
  </tr>
  </form>
  <% } %>
</table>

</div>
</body>
</html>
