<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" import="java.util.List"	import="java.sql.*" import="com.IssueHelper.*" import="java.text.*" import="java.util.Calendar"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Validation</title>
</head>
<body>
<%
try {
String UserID=request.getParameter("id");
ConnectionHelper connClass=new ConnectionHelper();
Connection connect = connClass.connection();
// Get a Connection to the database
//Add the data into the database
String sql= "SELECT master_Names  FROM Issue_Masters  WHERE Master_Names='"+UserID+"'AND Master_Status ='1'";

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
else if(count==0)
{
%>
Done
<%
}else{ 
%> 
<font color="red" ><strong>Already Exist</strong></font>
<%
 }
%>
<%
}
catch(Exception e){
out.println("Exception is ;"+e);
}
%>

</body>
</html>