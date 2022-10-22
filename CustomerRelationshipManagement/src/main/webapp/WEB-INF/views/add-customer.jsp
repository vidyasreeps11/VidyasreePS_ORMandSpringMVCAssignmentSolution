<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Relationship Management</title>
</head>
<body>
<div align="center" style="background-color: lime;">
	<h1><font color="blue">
	CUSTOMER RELATIONSHIP MANAGEMENT
	</font></h1>
</div>
<br>
<div style="font-weight: bold;">Add New Customer</div><br>
<form:form action="saveCustomer" modelAttribute="customer">
<form:hidden path="custId"/>
<table>
		<tr><td>First Name:</td><td><form:input path="firstName" required='true'/></td></tr>
		
		<tr><td>Last Name:</td><td><form:input path="lastName" required='true'/></td></tr>
		
		<tr><td>Email Address:</td><td><form:input path="email" required='true' /></td></tr>
		
		<tr><td colspan="2" align="center"><input type="submit" value="Save" style="width: 30 px;"/></td></tr>
	</table>
	</form:form>
</body>
</html>