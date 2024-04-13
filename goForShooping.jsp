<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<%@ include file="customertabs.html" %>
<%@  include file="db.jsp" %>
<link rel="stylesheet" href="mystyles.css" type="text/css" />
<title>Untitled Document</title>
<style type="text/css">
<!--
.style1 {
	color: #FF0000;
	font-weight: bold;
}
body,td,th {
	color: #CCCCCC;
	font-weight: bold;
}
-->
</style></head>

<body>



<div align="center">View Products </div>



<%
rst=stmt.executeQuery("select productname,productprice,image,description,productid from product   ");
while(rst.next()){

 %>

<table width="537" border="1" align="center">
  <tr>
    <td width="85"><img src="<%=rst.getString(3) %>" width="346" height="161" /></td>
    <td width="375" rowspan="2"><p><%=rst.getString(4) %></p>
      <form id="form1" name="form1" method="post" action="">
	  
	  <input name="pname" type="text" value="<%= rst.getString(1)  %>">
        <p>Rating out of 5
          <select name="rate">
            <option>0</option>
            <option>1</option>
            <option>2</option>
            <option>3</option>
            <option>4</option>
            <option>5</option>
          </select><input type="submit" name="rating" value="ok" />
</p>
      </form>      
     </td>
  </tr>
  <tr>
    <td><div align="center">
	
      <p ><%=rst.getString(1) %><br /><%=rst.getString(2) %><br />
	   <a href="buy.jsp?p=<%= rst.getString(1) %>" >Buy</a>
    
        </p>
    </div> </td>
  </tr>
</table>
<%
}



%>

<% 
if(request.getParameter("rating")!=null){

try{
String pname=request.getParameter("pname");
int rate=Integer.parseInt(request.getParameter("rate"));
int x=stmt.executeUpdate("insert into rating values( '"+pname+"',"+rate+" ) ");
if(x!=0){
%>
<script>alert("rating is done successfully");
window.open("viewshoppingproducts.jsp","_self");
</script>


<%

}
}catch(Exception e){
%>
<script>alert("error is :"+<%= e %>);</script>

<%
}
}

 %>





<% 
if(request.getParameter("Remove")!=null){

try{
String pid=request.getParameter("pid");

int x=stmt.executeUpdate("delete from product where productid='"+pid+"' ");
if(x!=0){
%>
<script>alert("Product Removed successfully");</script>

<%

}
}catch(Exception e){
%>
<script>alert("error is :"+<%= e %>);</script>

<%
}
}

 %>


</body>
</html>
