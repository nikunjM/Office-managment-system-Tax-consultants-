<%@page import="java.sql.Connection"%>
<%@page import="com.bhanu.helperss.ConnectionHelper"%>
<%@page language="java" import="java.util.List"	import="java.sql.*" import="java.text.SimpleDateFormat" import="java.util.Calendar"%>
<%@ page language="java" import="java.sql.*" %>
<% response.setContentType("text/html");%>
<head>
<style type="text/css">
</style>
</head>
<%
String ipAddress=request.getParameter("ipAdd");
// 
//String ipAddress="0:0:0:0:0:0:0:1";
// String userID="nikunj625";
String userID=request.getParameter("UserID");
String USer=userID.trim();
System.out.println("------------------------------------------->>>>>>>>"+userID);
// this is used when we are using leave form to varify its user id and approval id is correct ....
try {
//ConnectionHelper connClass=new ConnectionHelper();
//Connection connect = connClass.connect();

String sql = "SELECT * FROM LOGINLOG WHERE LL_UserId='"+USer+"'AND LL_IPAddress= '"+ ipAddress +"' AND LL_Status='false' AND LL_LogoutTime IS NULL";
		ConnectionHelper conn=new ConnectionHelper();
        Connection con= conn.connect();
        Statement statement= con.createStatement();
        String dbtime;
        System.out.println ("Database connection established");
        System.out.println("capturing from database");
        ResultSet rs=statement.executeQuery(sql);
System.out.println(sql);
System.out.println("Inside Login Block***********************__________________+++++++++++++");
int count = 0;
while (rs.next ())
{
count++;
System.out.println("No Of Count------>"+count);
}
int remain=5-count;
if(count>5)
{
%>
<font color="Red" ><strong>Your Account IS Blocked</strong></font>
<%
}
else if (count<5){
%> 
<table>
<tr>
<td><button onclick="validateFormOnSubmit();">Log In</button></td>
<td><font color="green" ><strong>Only <%=remain%> Counts Left </strong></font></td>
</tr>
</table>
<%}
}
catch(Exception e){
out.println("Exception is ;"+e);
}
%>
