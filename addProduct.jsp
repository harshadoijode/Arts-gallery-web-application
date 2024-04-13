<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<%@  include file="storestabs.html" %>
<%@  include file="db.jsp" %>
<title>Untitled Document</title>
<style type="text/css">
<!--

.style1 {
	font-size: 24px;
	font-weight: bold;
}
.style2 {color: #CCCCCC}
.style3 {font-size: 24px; font-weight: bold; color: #CCCCCC; }
-->
</style>


<script>
function validateCat(){
var x=document.forms["form3"]["category"].value;

if(x==""){
alert("category name  cannot be blank");
return false;
}else{
return true;
}

}


function validateAdd(){
var x=document.forms["form2"]["productname"].value;
var y=document.forms["form2"]["productprice"].value;
var z=document.forms["form2"]["quantity"].value;
var a=document.forms["form2"]["desc"].value;

if(x==""){
alert("product name  cannot be blank");
return false;
}if(y==""){
alert("Product Price  cannot be blank");
return false;
}if(z==""){
alert("Quantity  cannot be blank");
return false;
}if(a==""){
alert("Description  cannot be blank");
return false;
}else{
return true;
}

}

</script>
</head>

<body>

<div align="center" class="style3">Add Product</div>
<form action="" method="post">
  <div align="center">
    <input name="addCat" type="submit" id="addCat" value="Add Catagory" />
    <input name="addprod" type="submit" id="addprod" value="Add Product" />
  </div>
</form>
<% if(request.getParameter("addprod")!=null){ 

%>
<form  method="post" action="" name="form2" id="form2">
  <table width="auto" border="1" align="center">
    <tr>
      <td><span class="style2">Select Category </span></td>
      <td><select name="category">
	  <% rst=stmt.executeQuery("select * from category");
	  while(rst.next()){ %>
        <option><%= rst.getString(1) %></option>
		<% } %>
      </select>      </td>
    </tr>
    <tr>
      <td ><div align="right" class="style2">Enter  Product Name </div></td>
      <td ><input type="text" name="productname" /></td>
    </tr>
    <tr>
      <td><div align="right" class="style2">Enter product Cast </div></td>
      <td><input type="text" name="productprice" /></td>
    </tr>
	 <tr>
      <td><div align="right" class="style2">Quantity</div></td>
      <td><input type="text" name="quantity" /></td>
    </tr>
    <tr>
      <td><div align="right" class="style2">Add produt Image </div></td>
      <td><input type="file" name="image" /></td>
    </tr>
    <tr>
      <td><div align="right" class="style2">Description</div></td>
      <td><textarea name="desc" cols="50" rows="5" id="desc"></textarea></td>
    </tr>
    <tr>
      <td><span class="style2"></span></td>
      <td><input type="submit" name="addnewProduct" value="Add"  />
        <input type="reset" name="Submit2" value="Reset" /></td>
    </tr>
  </table>
  <div align="center"></div>
</form>
<% } %>


<% 
if(request.getParameter("addnewProduct")!=null){
try
{
String path="images/";
String category=request.getParameter("category");
String productname=request.getParameter("productname");
String productprice=request.getParameter("productprice");
String quantity=request.getParameter("quantity");
String image=path+request.getParameter("image");
String desc=request.getParameter("desc");

String sphone=(String)session.getAttribute("storephone");
int x=stmt.executeUpdate("insert into product(category,productname,productprice,quantity,image,description,storephone) values('"+category +"','"+productname +"','"+productprice +"','"+quantity +"','"+image+"','"+desc+"','"+sphone+"')");

if(x!=0){
%>
<script>

alert("New Product Added Successfull");
window.open("addProduct.jsp","_self");
</script>
<%
}
			
}catch(Exception e){
out.println(e);
}
}

 %>
 
 <% if(request.getParameter("addCat")!=null){

 %>
 <form action="" method="get" name="form3" id="form3">
 <p align="center" class="style1 style2">Add Category </p>
 <table width="auto" border="1" align="center">
  <tr>
    <td ><span class="style2">Enter Category name </span></td>
    <td ><input type="text" name="category" /></td>
  </tr>
  <tr>
    <td><span class="style2"></span></td>
    <td><input type="submit" name="cat" value="Submit"  onclick="return validateCat()"/></td>
  </tr>
</table>
</form>

 <% } %>
 
  
 <% if(request.getParameter("cat")!=null){

String cat=request.getParameter("category");
int x=stmt.executeUpdate("insert into category (categoryname) values('"+cat+"')");
if(x!=0){
%>
<script>

alert("New Category Successfull");
window.open("addProduct.jsp","_self");
</script>
<%
}
}
 %>
 
</body>
</html>
