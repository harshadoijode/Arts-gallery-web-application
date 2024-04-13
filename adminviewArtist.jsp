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

td,tr,th {
	color: black;
	font-family: Courier New, Courier, monospace;
	
	font-size: 12px;
	
}
.style1 {
	color: white;
	font-weight: bold;
}
.style2 {color: #000000}

-->
</style>
</head>

<body>
<%@ include file="db.jsp" %><br />
<br />
<br />
<br />

<div align="center" class="style1">Artist Details  Details</div>


<div > 

<table width="auto" border="0" align="center">
  <tr bgcolor="#999999">
    <td><strong>Name</strong></td>
   
    <td ><strong>Address</strong></td>
    <td ><strong>Phone</strong></td>
	 <td ><strong>Art Type</strong></td>
	  <td ><strong>Email</strong></td>
	   <td ><strong>Status</strong></td>
	   <td ><strong>ID</strong></td>
	      <td ></td>
  </tr>
  
  
  <% 
  
  rst=stmt.executeQuery("select * from artist ");
  while(rst.next()){
  
   %>
  
  <form action="" method="get">
  <tr bgcolor="white" >
    <td><span class="style3 style1"><input name="e1" type="text"  value="<%= rst.getString(1) %>" size="15"/>
    </span></td>
    <td><span class="style3 style1"><input name="e2" type="text" value="<%= rst.getString(2) %>" size="15"/>
    </span></td>
    <td><span class="style3 style1"><input name="e3" type="text" value="<%= rst.getString(3) %>"/></span></td>
	 <td><span class="style3 style1"><input name="e4" type="text" value="<%= rst.getString(4) %>"/></span></td>
	 
   <td><span class="style3 style1"><input name="e5" type="text" value="<%= rst.getString(5) %>"/></span></td>
	<td><span class="style3 style1">
	 
	  <span class="style2"><%= rst.getString(6) %></span> </span>	<span class="style3 style1">
	  <td><input name="e7" type="text" value="<%= rst.getString(7) %>"/></td>
	</span></td>
	 <td><input name="Accept" type="submit" value="Accept" />
	 <input name="Reject" type="submit" value="Reject" />
	 <input name="Delete" type="submit" value="Delete" />
	</span></td>
  </tr>
  </form>
  <% } %>
</table>

</div>

<% 
if(request.getParameter("Accept")!=null){
try{
int x=stmt.executeUpdate("update artist set status='Accept' where id='"+request.getParameter("e7")+"' ");
if(x!=0)
{
%>
<script>
alert("Date Updated");
window.open("adminviewArtist.jsp","_self");
</script>
<%
//response.sendRedirect("viewstores.jsp");


}

}catch(Exception e){
out.print("error"+e);
}
}
%>


<% 
if(request.getParameter("Delete")!=null){
try{
int x=stmt.executeUpdate("delete from artist where id='"+request.getParameter("e7")+"' ");
if(x!=0)
{
%>
<script>
alert("Date Deleted Successfully");
window.open("adminviewArtist.jsp","_self");
</script>
<%
//response.sendRedirect("viewstores.jsp");


}

}catch(Exception e){
out.print("error"+e);
}
}
%>






<% 
if(request.getParameter("Reject")!=null){
try{
int x=stmt.executeUpdate("update artist set status='Reject' where id='"+request.getParameter("e7")+"' ");
if(x!=0)
{
%>
<script>
alert("Date Updated");
window.open("adminviewArtist.jsp","_self");
</script>
<%
//response.sendRedirect("viewstores.jsp");


}

}catch(Exception e){
out.print("error"+e);
}
}
%>

</body>
</html>
