<%@page import="com.bhanu.helperss.BhanuUserEntryHelper"%>
<%@page import="com.bhanu.Bean.BhanuUserDetailsBean"%>
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
String Dep=request.getParameter("id");
System.out.println("valll------>>>"+Dep);
BhanuUserEntryHelper lHelper=new BhanuUserEntryHelper();
//lHelper.getApprovalIdDrop(Dep);
ArrayList<ArrayList>editBean =lHelper.getApprovalIdDrop(Dep); ;
%>
			<td><select name="EmpManager" id="EmpManager" onchange="copy_DropDown();">
					<option Selected=" " value="">[Select]</option> 
					<%for (ArrayList temp : editBean){ %>
					<option value="<%=temp.get(1)%>"><%=temp.get(4)%>,<%=temp.get(3)%></option>
					<%}%>
				</select>
			</td>
</body>
</html>