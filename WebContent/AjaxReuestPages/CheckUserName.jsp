<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page language="java" import="java.util.List"	import="java.sql.*" import="com.IssueHelper.*" import="java.text.*" import="java.util.Calendar"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Department</title>
</head>
<body>
<%
try {
String UserID=request.getParameter("id");
System.out.println("Id Ki Value--------------------->>>>>>>"+UserID);
ConnectionHelper connClass=new ConnectionHelper();
Connection connect = connClass.connection();
// Get a Connection to the database
//Add the data into the database
String sql= "SELECT * FROM UsrDetails WHERE usr_EmpId='"+UserID+"'";
Statement stm = connect.createStatement();
stm.executeQuery(sql);
ResultSet rs= stm.getResultSet();
int count = 0;
while (rs.next ())
{
count++;
}
System.out.println("User ID ki Value Kya hai"+UserID);
if (UserID.equalsIgnoreCase(""))
	{
	%>
	<font color="red" ><strong>Please Enter Some Value</strong></font>
	<%
	}
else if(UserID.length()!=6)
	{
	%>
	<font color="red" ><strong>Please Enter 6 Letter Emp ID</strong></font>
	<%
	}
else if(count==0)
{
%>
Done
<%
}else{ 
%> 
<font color="red" ><strong>Emp ID Already Exist</strong></font>
<%
 }
%>
<%
}
catch(Exception e){
out.println("Exception is ;"+e);
}
%>
