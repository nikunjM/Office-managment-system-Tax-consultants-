<%@ page language="java" contentType="text/html; charset=ISO-8859-1"   pageEncoding="ISO-8859-1"%>
<%@page import="com.issueBean.UserDetailsBean"%>
<%@page language="java" import="java.util.List"	import="java.sql.*" import="com.IssueHelper.*" import="java.util.ArrayList"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
#in{    
    display: inline-table;
    width: 300px;
    }
    td
    {
    width: 250px;
    }
</style>
</head>
<%UserDetailsBean bean  =(UserDetailsBean)session.getAttribute("UserBean");%>

 <body>
<h3>Your Issue(reference <%=bean.getEmployeeId().toUpperCase()%> - #AD1232154563) has been Registered with us</h3>
Thank you <b><u><%=bean.getTitle()%>.<%=bean.getLastName()%>,</u></b>
your Issue has been Registerd and In process.
Your Issue  reference number is - (<b><u>#AD1232154563</u></b>)
Please quote this number in any correspondence.
<br>
<br><b>
<table border=1>
<tr>
<td class="Title">Name</td>
<td colspan="3"><%=bean.getTitle().toUpperCase()%>    <%=bean.getFirstName().toUpperCase()%>      <%=bean.getMiddleName().toUpperCase()%>  <%=bean.getLastName().toUpperCase()%></td>
</tr>
<tr>
<td>Location</td>
<td><%=bean.getLocation()%></td>
<td>Department</td>
<td><%=bean.getDepartMent()%></td>
</tr>
<tr>
<td>Ext No</td>
<td><%=bean.getExtNo()%></td>
<td>Moblie No</td>
<td><%=bean.getMobileNo1()%></td>
</tr>
<tr>
<td>Emp Id</td>
<td><%=bean.getEmployeeId()%></td>
<td>Email ID</td>
<td><%=bean.getEmailId()%></td>
</tr>
</table>
<BR><BR>
<table border="1">
<tr>
<td >Issue NO</td>
<td colspan="3">#AD123455668</td>
</tr>
<tr>
<td>Product</td>
<td>TWS</td>
<td>Problem Type</td>
<td>Network Error</td>
</tr>
<tr>
<td rowspan="3">Description</td>
<td colspan="3" rowspan="3"><pre>Due to Network Failur theer are some type of distrbance in product</pre></td>
</tr>
</table>
 </body>
</html>
