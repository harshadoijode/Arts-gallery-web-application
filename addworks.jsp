<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
  <%@ include file="artisttabs.html" %>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Untitled Document</title>
<style type="text/css">
<!--

td,th {
	color: white;
	font-family: Courier New, Courier, monospace;
	font-weight: bold;
	font-size: 12px;
	
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

<div align="center" class="style1">Add art work </div>

<form id="form1" name="form1" method="post" action="">
  <table style="background:#666666; color:white; border-radius:20px;" width="auto" border="0" align="center">
    <tr >
      <td width="285">Enter Art name </td>
      <td width="212"><input name="s1" type="text"  /></td>
    </tr>
    <tr>
      <td>About art </td>
      <td><textarea name="s2" cols="auto" rows="5"></textarea></td>
    </tr>
    <tr>
      <td>Art type  </td>
      <td><input name="s3" type="text"   required /></td>
    </tr>
    <tr>
      <td>price</td>
      <td><input name="s4" input type="text" required></td>
    </tr>
    <tr>
	 <td>Add image</td>
      <td><input name="s5"  type="file" required></td>
      
    </tr>
	
  </table>
 <center> <input type="submit" name="Submit" value="Add Art" /></center>
</form>
</div>


<% 
if(request.getParameter("Submit")!=null){

String s1=request.getParameter("s1");
String s2=request.getParameter("s2");
String s3=request.getParameter("s3");
String s4=request.getParameter("s4");
String s5=request.getParameter("s5");

try{
int x=stmt.executeUpdate("insert into artswork(name,about,arttype,price,image) values('"+s1+"','"+s2+"','"+s3+"','"+s4+"','"+s5+"')");
if(x!=0){
%>
<script>
alert("art  added Successfully");
</script>

<%

}

}catch(Exception e){
out.println("this art already exist");
}
}
 %>



<p align="center">  Art Details details</p>
  <table style="background:#666666; color:white; border-radius:10px;" width="auto" border="0" align="center">
  <tr bgcolor="#999999">
    <td ><strong>Name</strong></td>
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
