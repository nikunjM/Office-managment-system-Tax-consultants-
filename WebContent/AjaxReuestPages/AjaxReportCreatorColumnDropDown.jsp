<%@page import="com.IssueHelper.UserEntryHelper"%>
<%@page language="java" import="java.util.List"	import="java.sql.*" import="com.IssueHelper.*" import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Drop Down</title>
</head>
<body>
<%
String TableName=request.getParameter("id");
%>

<%if(TableName.equalsIgnoreCase("IssueReg")){ %>

					<select id="TableColumns1" name="TableColumns1" style="width:100px;" class="QueryVal">
					<option value="">- Select -</option>
					<option value="IssueNo">Issue No</option>
					<option value="IssueDate">Issue Time</option>
					<option value="IssuseEmpId">Issue Registered</option>
					<option value="IssuseProduct">Issue Product</option>
					<option value="Iss_ProblmType">Issue ProblmType</option>
					<option value="IssuseStatus">Issue Status</option>
					<option value="IssuseAssigendTo">Issue AssigendTo</option>
			</select>
			<%}else if(TableName.equalsIgnoreCase("IssueUserDetails")){ %>
					<select id="TableColumns1" name="TableColumns1" style="width:100px;" class="QueryVal">
					<option value="">- Select -</option>
			</select>
			<%}%>
</body>
</html>