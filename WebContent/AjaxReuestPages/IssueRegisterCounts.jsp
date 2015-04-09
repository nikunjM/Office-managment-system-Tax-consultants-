<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page language="java" import="java.util.List"	import="java.sql.*" import="com.IssueHelper.*" import="java.text.*" import="java.util.Calendar" import="com.issueBean.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>HHHHHAAAAAAAA</title>
</head>
<body>
<%
UserDetailsBean lbean  =(UserDetailsBean)session.getAttribute("UserBean");
DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
Calendar cal = Calendar.getInstance();
String Datetime = dateFormat.format(cal.getTime());
String IssueNo=request.getParameter("IssueNo");

Statement stmVisistCount=null;
Statement stmVisitcheck=null;
Statement stm=null;
Statement stmcheck=null;
ResultSet rscheck=null;

ConnectionHelper connClass=new ConnectionHelper();
Connection connect = connClass.connection();
boolean login=false;
boolean VisitLogin=false;

try {
//value deta hai present hai ki nai...
String CheckBlock="SELECT iss_no,iss_assigendTo FROM IssueRegistration WHERE Iss_No='"+IssueNo+"' AND Iss_AssigendTo is NOT NULL";//Checks Where The Value Is Assigend Or Not....//Agar Value returm hui to already assigend nai to nai hui....
stmcheck=connect.createStatement();
rscheck= stmcheck.executeQuery(CheckBlock);
login = rscheck.next();//if true then not assigned ,to assigen karo //if login is fasle then
System.out.println("Login Ka Status 1st Main----------------->>>>>>>>>>>>>>>>>>>>>>>>>"+login);
if(login==false)
	{
	String AssigendWork="UPDATE dbo.IssueRegistration SET Iss_AssigendTo = '"+lbean.getEmployeeId()+"',Iss_AssigendPkey ='"+lbean.getpKey()+"',Iss_AssigendOn = '"+Datetime+"',iss_status='2' WHERE Iss_No ='"+IssueNo+"'";
	Statement stmAss=connect.createStatement();
	stmAss.execute(AssigendWork);
	System.out.println(AssigendWork);
	String VisitInsert="INSERT INTO dbo.VisitMaster(Visit_PersonName,Visit_Pkey,Visit_Time,Visit_NoOfTimes,Table_Visited,VisitThing,Status,PersoneAssgiend)VALUES('"+lbean.getEmployeeId()+"','"+lbean.getpKey()+"','"+Datetime+"','1','IssueRegister','"+IssueNo+"','Orignal','"+lbean.getFirstName()+"')";
	Statement stmVisitInsert=connect.createStatement();
	stmVisitInsert.execute(VisitInsert);
	System.out.println(VisitInsert);
	}
else
	{
	String VisitSelection="SELECT * FROM VisitMaster WHERE Visit_PersonName ='"+lbean.getEmployeeId()+"' AND VisitThing ='"+IssueNo+"'";
	System.out.println(VisitSelection);
	stmVisitcheck=connect.createStatement();
	rscheck= stmcheck.executeQuery(VisitSelection);
	VisitLogin= rscheck.next();
	if(VisitLogin)
	{
	String VisitInsert="UPDATE VisitMaster SET Visit_NoOfTimes=Visit_NoOfTimes+1,Visit_Time='"+Datetime+"' WHERE VisitThing ='"+IssueNo+"' AND Visit_PersonName ='"+lbean.getEmployeeId()+"'";
	System.out.println(VisitInsert);
	stmVisistCount=connect.createStatement();
	stmVisistCount.executeUpdate(VisitInsert);	
	}else
	{
		String VisitInsert="INSERT INTO dbo.VisitMaster(Visit_PersonName,Visit_Pkey,Visit_Time,Visit_NoOfTimes,Table_Visited,VisitThing,Status)VALUES('"+lbean.getEmployeeId()+"','"+lbean.getpKey()+"','"+Datetime+"','1','IssueRegister','"+IssueNo+"','AlreadyEnterd')";
		System.out.println(VisitInsert);
		stmVisistCount=connect.createStatement();
		stmVisistCount.execute(VisitInsert);	
	}
}}catch(Exception e){
out.println("Exception is ;"+e);
}
finally {
    if (stm!= null) try { stm.close(); } catch (SQLException ignore) {}
    if (stmVisistCount!= null) try {stmVisistCount.close(); } catch (SQLException ignore) {}
    if (connect != null) try { connect.close(); } catch (SQLException ignore) {}
}if (login) {
	request.setAttribute("errorMessage", "Try To Resolve As Soon as Possible");  
    request.getRequestDispatcher("/IssueRegisterPage.jsp").forward(request, response);
 } else {
	 request.setAttribute("errorMessage", "Error While Allocating task");  
     request.getRequestDispatcher("/IssueRegisterPage.jsp").forward(request, response); 
 }
%>
</body>
</html>