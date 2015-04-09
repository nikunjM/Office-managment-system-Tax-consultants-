<%@ page language="java" contentType="text/html; charset=ISO-8859-1"   pageEncoding="ISO-8859-1"%>
<%@page import="com.issueBean.UserDetailsBean"%>    
<%@page language="java" import="java.util.List"	import="java.sql.*" import="com.IssueHelper.*" import="java.text.*" import="java.util.Calendar"%>
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
String HeadDepart=request.getParameter("Department");
String Head_Email=request.getParameter("hEmail");
String Head_EmpId=request.getParameter("hEmpId");
String Head_Exsists=request.getParameter("hExsists");
String Head_Name=request.getParameter("hName");
String CreatedBy=lbean.getEntryPersone();
String CreatedOn=Datetime;
String UpdatedBy=lbean.getEntryPersone();
String UpdatedOn=Datetime;
//String HeadPk=request.getParameter("Pkey");
System.out.println("HEADHOD KE REquerst Wale---------------->"+lStatus);
System.out.println("HeadDepartment"+HeadDepart);
System.out.println("Email"+Head_Email);
lStatus.trim();
String InsertValues=request.getParameter("Department");//gives department
Statement stm =null;
ConnectionHelper connClass=new ConnectionHelper();
Connection connect = connClass.connection();
String InsertQuery;

//if(lStatus=="Insert")
	if(lStatus.equalsIgnoreCase("Insert"))
	{
	InsertQuery="INSERT INTO dbo.Head_Masters(Head_Deaprtment,Head_EmailId,Head_EmpId,Head_Name,Head_CreatedBy,Head_CreatedOn,Head_UpdatedBy,Head_UpdatedOn,Head_Version,Head_Active)VALUES('"+HeadDepart+"','"+Head_Email+"','"+Head_EmpId+"','"+Head_Name+"','"+CreatedBy+"','"+CreatedOn+"','"+CreatedBy+"','"+CreatedOn+"','1','1')";
	System.out.println("Insertquery---->"+InsertQuery);
	}
else
	{
	ResultSet resultSet=null;
	StringBuilder lSql = new StringBuilder();
	lSql.append("UPDATE dbo.Head_Masters");
    lSql.append(" SET Head_Deaprtment='").append(HeadDepart).append("'");
	lSql.append(" ,Head_EmailId ='").append(Head_Email).append("'");
	lSql.append(" ,Head_EmpId='").append(Head_EmpId).append("'");
	lSql.append(" ,Head_Name='").append(Head_EmpId).append("'");
	lSql.append(" ,Head_UpdatedBy ='").append(UpdatedBy).append("'");
	lSql.append(" ,Head_UpdatedOn ='").append(UpdatedOn).append("'");
	//lsql.append(" ,
	lSql.append(" WHERE Head_Id='").append("1").append("'");
	InsertQuery=lSql.toString();
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
%>
<%if(lStatus.equalsIgnoreCase("Insert")){%>
<font color="green" ><strong><%=InsertValues%>Added....</strong></font>
<%}else{ %>
<font color="red" ><strong><%=InsertValues%>Deleted....</strong></font>
<%}%>
</body>

</html>