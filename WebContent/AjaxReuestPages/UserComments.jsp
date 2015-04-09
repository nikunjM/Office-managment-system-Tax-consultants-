<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page language="java" import="java.util.List"	import="java.sql.*" import="com.IssueHelper.*" import="java.text.*" import="java.util.Calendar" import="com.issueBean.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Comments Added</title>
</head>
<%
ConnectionHelper connClass=new ConnectionHelper();
Connection connect = connClass.connection();
UserDetailsBean lbean=(UserDetailsBean)session.getAttribute("UserBean");
ResultSet rs=null;
Statement lSt=null;
Statement lstmMsg=null;
String lComment=request.getParameter("content");
System.out.println("lComment------->"+lComment);
String IssueNo=request.getParameter("IssueNo");
System.out.println("IssueNo------->"+IssueNo);
String Resol=request.getParameter("lRes");
System.out.println("IssueNo------->"+Resol);
try {
	DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
	Calendar cal = Calendar.getInstance();
	String Datetime = dateFormat.format(cal.getTime());

	String lMsgId="UPDATE dbo.IssueRegistration SET Iss_Comments = '"+Resol+"' WHERE Iss_No='"+IssueNo+"'";
	lstmMsg = connect.createStatement();
	lstmMsg.executeUpdate(lMsgId);
	
	StringBuilder lSql = new StringBuilder();
	lSql.append("INSERT INTO dbo.comments(com_comment,uid_fk,created,uid_UserName,msh_IssueNo)");
	lSql.append(" VALUES (");
	lSql.append("'").append(lComment).append("',");
	lSql.append("'").append(lbean.getpKey()).append("',");
	lSql.append("'").append(Datetime).append("',");
	lSql.append("'").append(lbean.getEmployeeId()).append("',");
	lSql.append("'").append(IssueNo).append("');");
	lSt= connect.createStatement();
	System.out.println("insert comments-------------->>>>>> "+lSql.toString());
	lSt.executeQuery(lSql.toString());
	}
	catch(Exception e)
	{
		out.println("Exception is ;"+e);
	}
%>
<body>

</body>
</html>