<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page language="java" import="com.issueBean.UserDetailsBean" import="java.util.List"	import="java.sql.*" import="com.IssueHelper.*" import="java.text.*" import="java.util.Calendar"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>DropDown value</title>
</head>
<body>
<%
String ProductVal=request.getParameter("ProVal");
System.out.println("Productvalue==============================.>>>>>>>"+ProductVal);
Statement stm =null;
ResultSet resultset=null;
ConnectionHelper connClass=new ConnectionHelper();
Connection connect = connClass.connection();
String InsertQuery="SELECT iss_Id,Iss_No FROM IssueRegistration WHERE Iss_Product='"+ProductVal+"'";
try {
	stm= connect.createStatement();
	resultset= stm.executeQuery(InsertQuery);
	
%>
<select name="DuplicateComplain" id="DuplicateComplain">
<option Selected="" value="">[Select]</option>
<%while(resultset.next()){ %>
		<option value="<%=resultset.getString(1)%>"><%=resultset.getString(2)%></option>
		
<%}%>
</select>
<%
}catch(Exception e){
	out.println("Exception is ;"+e);
	}finally {
        if (stm!= null) try { stm.close(); } catch (SQLException ignore) {}
        if (resultset!= null) try {resultset.close(); } catch (SQLException ignore) {}
        if (connect!= null) try { connect.close(); } catch (SQLException ignore) {}
    }
%> 
</body>
</html>
