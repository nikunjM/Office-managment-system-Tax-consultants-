<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page language="java" import="java.util.List"	import="java.sql.*" import="com.IssueHelper.*" import="java.text.*" import="java.util.Calendar" import="com.issueBean.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Work Assigend</title>
</head>
<body>
<%
UserDetailsBean lbean=(UserDetailsBean)session.getAttribute("UserBean");
DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
Calendar cal = Calendar.getInstance();
String Datetime = dateFormat.format(cal.getTime());
String IssueNo=request.getParameter("IssueNo");

Statement stm=null;
Statement stmVisistCount=null;

ConnectionHelper connClass=new ConnectionHelper();
Connection connect = connClass.connection();
int login=0;
try {
String AssigendWork="UPDATE dbo.IssueRegistration SET Iss_AssigendTo = '"+lbean.getEmployeeId()+"',Iss_AssigendPkey ='"+lbean.getpKey()+"',Iss_AssigendOn = '"+Datetime+"',iss_status='2' WHERE Iss_No ='"+IssueNo+"'";
String VisitInsert="INSERT INTO dbo.VisitMaster(Visit_PersonName,Visit_Pkey,Visit_Time,Visit_NoOfTimes,Table_Visited,VisitThing,Status,PersoneAssgiend)VALUES('"+lbean.getEmployeeId()+"','"+lbean.getpKey()+"','"+Datetime+"','1','IssueRegister','"+IssueNo+"','Orignal','"+lbean.getFirstName()+"')";

stm = connect.createStatement();
login = stm.executeUpdate(AssigendWork);
stmVisistCount=connect.createStatement();
stmVisistCount.execute(VisitInsert);
}catch(Exception e){
out.println("Exception is ;"+e);
}
finally {
    if (stm!= null) try { stm.close(); } catch (SQLException ignore) {}
    if (stmVisistCount!= null) try {stmVisistCount.close(); } catch (SQLException ignore) {}
    if (connect != null) try { connect.close(); } catch (SQLException ignore) {}
}if (login==1) {
	request.setAttribute("errorMessage", "This task Is assigend To You");  
    request.getRequestDispatcher("/IssueRegisterPage.jsp").forward(request, response);
 } else {
	 request.setAttribute("errorMessage", "Error While Allocating task");  
     request.getRequestDispatcher("/IssueRegisterPage.jsp").forward(request, response); 
   }
%>
</body>
</html>