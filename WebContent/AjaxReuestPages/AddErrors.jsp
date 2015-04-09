<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page language="java" import="java.util.List"	import="java.sql.*" import="com.IssueHelper.*" import="java.text.*" import="java.util.Calendar"%>
<%@page import="com.issueBean.UserDetailsBean"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Department</title>
</head>
<body>
<%
UserDetailsBean lbean=(UserDetailsBean)session.getAttribute("UserBean");
DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
Calendar cal = Calendar.getInstance();
String Datetime = dateFormat.format(cal.getTime());
String lStatus=request.getParameter("Status");//Is it delete or insert
lStatus.trim();
String Key=request.getParameter("Key");
String InsertValues=request.getParameter("Department");//gives department
Statement stm =null;
ConnectionHelper connClass=new ConnectionHelper();
Connection connect = connClass.connection();
String InsertQuery;

//if(lStatus=="Insert")
	if(lStatus.equalsIgnoreCase("Insert"))
	{
	InsertQuery="INSERT INTO dbo.Issue_Masters(Master_Names,Master_Type,Master_Status,Master_CreatedBy,Master_CreatedOn,Master_UpdatedBy,Master_UpdatedOn,Head_Version)VALUES('"+InsertValues+"','CallError','1','"+lbean.getUserName()+"','"+Datetime+"','"+lbean.getUserName()+"','"+Datetime+"','1')";
	System.out.println("Error ki query"+InsertQuery);
	}
	else if(lStatus.equalsIgnoreCase("Update"))
	{
	InsertQuery="UPDATE Issue_Masters SET  Master_Names ='"+InsertValues+"',Master_Type='CallError',Master_UpdatedBy ='"+lbean.getUserName()+"',Master_UpdatedOn = '"+Datetime+"',Head_Version = Head_Version+1 WHERE Dep_No ='"+Key+"'";
	System.out.println("Update name"+InsertQuery);
	}
	else
	{
	InsertQuery="UPDATE Issue_Masters SET Master_Status='0',Master_UpdatedBy='"+lbean.getUserName()+"',Master_UpdatedOn='"+Datetime+"' WHERE dep_No='"+InsertValues+"'";
	}
try {
	stm= connect.createStatement();
	stm.execute(InsertQuery);
	}
	catch(Exception e){
	out.println("Exception is ;"+e);
	}finally {
        if (stm!= null) try { stm.close(); } catch (SQLException ignore) {}
        if (connect!= null) try { connect.close(); } catch (SQLException ignore) {}
    }
//String sql = "SELECT * FROM Users WHERE usr_userid='"+userID+"' AND usr_aprovalid="+approvalID;
%>
<%if(lStatus.equalsIgnoreCase("Insert")){%>
<font color="green" ><strong><%=InsertValues%>Added....</strong></font>
<%}else if(lStatus.equalsIgnoreCase("Update")){ %>
<font color="Green" ><strong><%=InsertValues%>Changed....</strong></font>
<%}else{%>
<font color="red" ><strong><%=InsertValues%>Deleted....</strong></font>
<%} %>
</body>

</html>