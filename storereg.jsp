<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<%@  include file="homeMenu.html" %>
<%@  include file="db.jsp" %>
<title>Untitled Document</title>
<style>
input[type=text], select {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}
input[type=password], select {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

input[type=submit] {
  width: 100%;
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}


input[type=button] {
  width: 100%;
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}
input[type=submit]:hover {
  background-color: #45a049;
}

.logindiv {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
  margin-left:80%;
  margin-right:0%;
}
.style1 {color: #FFFFFF}
.style2 {color: #000033; }
</style>
<body>

<div align="center" style="padding-left:10%; padding-right:10%; margin-left:5%; margin-right:5%;">

<h3 align="center" style="color:#CCCCCC">Store Login Page</h3>
  <form id="form1" name="form1" method="post" action="">
							  <table style="background:#CCCCCC; border-radius:20px;" width="auto" border="0" align="center">
								<tr>
								  <td width="177"><div align="right" class="style2">Username</div></td>
								  <td width="338"><input name="username" type="text" /></td>
								</tr>
								<tr>
								  <td><div align="right" class="style2">Password </div></td>
								  <td><input type="password" name="password" /></td>
								</tr>
								
								<tr>
								  <td><div align="right"><span class="style1"><span class="style2"></span></span></div></td>
								  <td><p>
								    <input type="submit" name="Submit" value="Login" onClick="return validateForm()"/>
							       <a href="register.jsp">Store Registration</a></p>
							      <p><a href="StoreForgotpassword.jsp">Forgot password</a></p></td>
								</tr>
							  </table>
							  <div align="center"></div>
  </form>            
</div>
<% 
if(request.getParameter("Submit")!=null){

String s1=request.getParameter("username");
String s2=request.getParameter("password");



rst=stmt.executeQuery("select * from stores where storemobileno='"+s1+"' and password='"+s2+"'");

if(rst.next()){
session.setAttribute("storephone",rst.getString(4));
%>
<script>

alert("login Successfull");
window.open("storehomepage.html","_self");
</script>
<%
}else{
%>
<script>

alert("login Failed");

</script>
<%
}





}
 %>
</body>

</html>
