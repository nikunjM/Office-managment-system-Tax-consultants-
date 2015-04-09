<%@ page language="java" contentType="text/html; charset=ISO-8859-1"    pageEncoding="ISO-8859-1"%>

<%@page language="java" import="java.util.*" import="java.sql.*" import="com.IssueHelper.*" import="java.text.*" import="java.util.Calendar" import="java.util.Collection;"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Table Is Created By Query Values</title>
<script src="<%=request.getContextPath()%>/jqueryandcss/jquery.min.js"></script>
<script	src="<%=request.getContextPath()%>/jqueryandcss/Tabletogle.js"></script>
<script	src="<%=request.getContextPath()%>/jqueryandcss/PagingOfTable.js"></script>
<script src="<%=request.getContextPath()%>/jqueryandcss/DateFormatter.js"></script>
<link href="<%=request.getContextPath()%>/jqueryandcss/TablenewCss.css"rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/jqueryandcss/ScreenWithMenuCss.css"rel="stylesheet" type="text/css" />
</head>
<%
//String TableName="IssueReg";
//String ColumnName="IssueNo,ProblemType,IssueDate,IssuseStatus,IssuseEmpId,IssuseAssigendTo,IssuseSeverity,Issusepriority,IssusePrioScale,IssuseDescription,IssuseUploaded,IssuseResponse,IssuseProduct";
String TableName=request.getParameter("Table");
String ColumnName=request.getParameter("ColName");
String ColName=ColumnName;
String Conditions=request.getParameter("Condition");
String InnerJoin="";
ArrayList<String> items = new  ArrayList<String>(Arrays.asList(ColName.split(",")));
int ColumnNos=items.size();
System.out.println("--------------------------------------------.............>>>>>>>>>>>>>>>>>"+ColumnNos);
//Arrays.asList(ColName.split("\\s*,\\s*"));

if(TableName.equalsIgnoreCase("IssueReg"))
	{
	InnerJoin=" isr INNER JOIN Issue_Masters ism  ON isr.Iss_problmtype=ism.Dep_No INNER JOIN Issue_Masters ism1 ON isr.Iss_Product=ism1.Dep_No";
	}else
	{
		InnerJoin="";	
	}
Map<String, String> companies = new HashMap<String, String>();
//put(key, value) is used to insert object into map
companies.put("IssueNo","Iss_No");
companies.put("ProblemType","ism.master_names");//Inner JOin With Master Table Probleam Type
companies.put("IssueDate","Iss_Time");
companies.put("IssuseStatus","Iss_Status");
companies.put("IssuseEmpId","Iss_EmpId");
companies.put("IssuseAssigendTo","Iss_AssigendTo");
companies.put("IssuseSeverity","Iss_Severity");
companies.put("Issusepriority","Iss_priority");
companies.put("IssusePrioScale","Iss_PrioScale");
companies.put("IssuseDescription","Iss_Description");
companies.put("IssuseUploaded","Iss_UploadedFile");
companies.put("IssuseResponse","Iss_Comments");
companies.put("IssuseProduct","ism1.master_names");//For Inner Join With Master Table
companies.put("IssueReg"," From IssueRegistration");//add here more columns name if u want to add .......

for(Map.Entry<String, String> entry : companies.entrySet()){
	ColumnName = ColumnName.replace(entry.getKey(),entry.getValue());
	Conditions=Conditions.replace(entry.getKey(),entry.getValue());
	TableName=TableName.replace(entry.getKey(),entry.getValue());
}
System.out.println("Column Name Changed--->>>>>>>"+ColumnName);
System.out.println("Conditions Name Changed--->>>>>>>"+Conditions);
System.out.println("Table Name Changed--->>>>>>>"+TableName);
StringBuilder lSql = new StringBuilder();
lSql.append("Select ");
lSql.append(ColumnName).append(TableName);
lSql.append(InnerJoin);
if(Conditions.length()>=4)
{
	lSql.append(" Where ").append(Conditions);	
}
System.out.println("query"+lSql.toString());
String FinalQuery=lSql.toString();
System.out.println(FinalQuery);

Statement statementQueryBuilder= null;
ResultSet resultsetQueryBuilder= null;


ConnectionHelper connClass=new ConnectionHelper();
Connection connect = connClass.connection();

statementQueryBuilder = connect.createStatement();
resultsetQueryBuilder = statementQueryBuilder.executeQuery(FinalQuery);

ArrayList<ArrayList> editBean = new ArrayList<ArrayList>();
ArrayList nTable;
int cnt = 0;
while(resultsetQueryBuilder.next())
{
	nTable=new ArrayList();
    cnt+=1;
    nTable.add(String.valueOf(cnt));
    for(int i=1;i<=ColumnNos;i++) //replace ColumnNos Is Size Of ArrayList with the length of the columns
    {
    	nTable.add(resultsetQueryBuilder.getObject(i));
    }
    editBean.add(nTable);
}
%>
<body>
<div id="ReportViewer">
<br>
<table>
<tr>
<td style="text-align: right;font-size: 19px;"><b>Filter on Issue No</b></td><td><input type="text" name="filter" value="" id="filter" height="10px" /></td>
<td><a href="<%=request.getContextPath()%>/AjaxReuestPages/IssueReportXls.jsp">Export To Xls</a></td>
</tr>
</table>
<BR>
  <form method="GET" name="IssueReprotForm">
  <input type="hidden" id="IssueNo" name="IssueNo" />
  <input type="hidden" id="lStatus" name="lStatus" />
        <div id="search">     </div>
		<TABLE id ="customers" class="sortable" cellpadding="0" cellspacing="0" border="0">
		<thead>
			<tr>
			<% int i=1;
			for (String temp : items)
						{
			%>
			<th class="sort-alpha"><h3><%=temp%></h3></th>
			<%}%>
			</TR>
			</thead>
			<tbody>
			<%for (ArrayList temp : editBean){ %>
			<tr>
			<%for(int Col=1;Col<=ColumnNos;Col++){%>
	    	<td><%=temp.get(Col)%></td>
    		<%}%>
    		</tr>
    		<%} %>
		</TABLE>
		<div id="pageNavPosition" style="padding-top: 20px" align="center"></div>
		</form>
	  </div>
</body>
</html>