<%@page import="com.bhanu.helperss.BhanuUserEntryHelper"%>
<%@page import="com.bhanu.Bean.BhanuUserDetailsBean"%>
<%@page import="com.bhanu.helperss.ConnectionHelper"%>
<%@page language="java" import="java.util.List"	import="java.sql.*" import="com.IssueHelper.*" import="java.text.*" import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@page language="java" import="java.util.List"	import="java.sql.*" import="java.text.SimpleDateFormat" import="java.util.Calendar"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
/*
		BhanuUserDetailsBean lusDetailsBean=new BhanuUserDetailsBean();
		BhanuUserEntryHelper lheEntryHelper=new BhanuUserEntryHelper();
*/
%>
<%
			//happens only for registration page so check id is null or not and perform.....
			
			//BhanuUserDetailsBean bean=(BhanuUserDetailsBean)session.getAttribute("username");
			//String userID=bean.getEmployeeId();
			String userid =(String)session.getAttribute("username");
			//String userid=(String)request.getAttribute("username");
			//String lsessionKey=request.getParameter("Sessionkey");
			//session.getAttribute("username");
			Statement statement = null;
			ResultSet resultset = null;
			ConnectionHelper connClass=new ConnectionHelper();
			Connection connect = connClass.connect();
			String USer=userid.trim();
			DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
			Calendar cal = Calendar.getInstance();
			String Datetime = dateFormat.format(cal.getTime());
			try{
			statement = connect.createStatement();
			String LogoutTime = "UPDATE Loginlog SET LL_LogOutTime='"+Datetime +"'WHERE LL_UserId ='"+USer+"'";
			System.out.println("inSessionSet Page----------------->>>>>>"+LogoutTime );
			statement.execute(LogoutTime);
		}catch(Exception e)
		{
			out.println("Exception is ;"+e);
		}finally {
	         if (resultset != null) try { resultset.close(); } catch (SQLException ignore) {}
	         if (statement != null) try { statement.close(); } catch (SQLException ignore) {}
	         if (connect != null) try { connect.close(); } catch (SQLException ignore) {}
	     }
			response.sendRedirect(request.getContextPath()+"/MainFrame.jsp"); // Redirect to home page.
%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Session setting page</title>
</head>
<body>
</body>
</html>