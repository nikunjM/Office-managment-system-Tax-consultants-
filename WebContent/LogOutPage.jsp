<%@page import="com.bhanu.helperss.BhanuSessionCheckerHelper"%>
<%@page import="com.bhanu.helperss.ConnectionHelper"%>
<%@page import="com.bhanu.Bean.BhanuUserDetailsBean"%>
<%@page language="java" import="java.util.List"	import="java.sql.*" import="com.IssueHelper.*" import="java.text.*" import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>

<HEAD>
<TITLE>Fetching Data From a Database</TITLE>
</HEAD>
<BODY>
		<%
				String lUserSession=(String)session.getAttribute("username");
				DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
				Calendar cal = Calendar.getInstance();
				String Datetime = dateFormat.format(cal.getTime());
				ConnectionHelper connClass=new ConnectionHelper();
				Connection connect = connClass.connect();
				Statement statement = null;
				ResultSet resultset = null;
				try{
				statement = connect.createStatement();
				//String LogoutTime = "UPDATE Loginlog SET LL_LogOutTime='"+Datetime +"'WHERE LL_UserId ='"+USer+"'AND LL_SessionKey='"+Session+"'";
				String LogoutTime = "UPDATE Loginlog SET LL_LogOutTime='"+Datetime +"'WHERE LL_UserId ='"+lUserSession+"'";
				System.out.println(LogoutTime );
				statement.execute(LogoutTime);
			}catch(Exception e)
			{
				out.println("Exception is ;"+e);
			}finally {
		         if (resultset != null) try { resultset.close(); } catch (SQLException ignore) {}
		         if (statement != null) try { statement.close(); } catch (SQLException ignore) {}
		         if (connect != null) try { connect.close(); } catch (SQLException ignore) {}
		     }
		    	request.getSession(true).removeAttribute("username");
				session.invalidate();
				response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
				response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
				response.setDateHeader("Expires", 0); // Proxies.
				BhanuSessionCheckerHelper help=new BhanuSessionCheckerHelper();
				if (!help.login(request, null)) 
				{
					help.forwardToAnyPage(null, response);
				} 
			%>
	</BODY>
</HTML>
