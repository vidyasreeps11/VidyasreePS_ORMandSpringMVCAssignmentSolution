<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Relationship Management</title>
<style>
tr:nth-child(odd) {background-color:silver;}
</style>
</head>
<body>
<div align="center" style="background-color: lime;">
	<h1><font color="blue">
	CUSTOMER RELATIONSHIP MANAGEMENT
	</font></h1>
</div>
<br>
<div align="center"><form action="addCustomer" method="get"><input type="submit" value="Add New Customer"></form></div>
<br><br>
<div align="center"><b>List Of All Customers</b></div><br>
<div align="center">
<table border="2">
	<tr><th >First Name</th><th>Last Name</th><th>Email Address</th><th colspan="2">Action</th></tr>
	
	<c:forEach var="tempCustomer" items="${customers}">
	
	<c:url var="updateLink" value="updateCustomer">
	<c:param name="customerId" value="${tempCustomer.custId}" />
	</c:url>
	
	<c:url var="deleteLink" value="deleteCustomer">
	<c:param name="customerId" value="${tempCustomer.custId}" />
	</c:url>
	<tr>
		<td style="text-align:center">${tempCustomer.firstName}</td>
		<td style="text-align:center">${tempCustomer.lastName}</td>
		<td style="text-align:center">${tempCustomer.email}</td>
		<td style="text-align:center"><a href="${updateLink}">Update</a></td>
		<td style="text-align:center"><a href="${deleteLink}" onclick="if(!(confirm('Are you sure you want to delete this record?'))) return false">
			Delete</a></td>
	</tr>
	</c:forEach>
	
</table>
</div>
</body>
</html>