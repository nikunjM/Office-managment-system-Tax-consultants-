<%@page import="com.bhanu.Bean.ServiceSelector"%>
<%@page import="com.bhanu.helperss.ServiceSelectoreHelper"%>
<%@page import="org.apache.el.lang.ELSupport"%>
<%@page import="com.bhanu.helperss.ConnectionHelper"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"    pageEncoding="ISO-8859-1"%>

<%@page language="java" import="java.util.*" import="java.sql.*" import="com.IssueHelper.*" import="java.text.*" import="java.util.Calendar" import="java.util.Collection;"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
String InnerJoin="";
String ServiceSelected=request.getParameter("SerSelected");//Select Yes Or No Service Selection;ServiceSelected
String lSelect="yes";
String ServicePeriod=request.getParameter("SerPeriod");//Select 1 to 4;
String ServiceYear=request.getParameter("YrSelect");//Select Year;
String PersonAllocation=request.getParameter("Person");//PersonAllocation

String Condition1="";
String QUerAdd="";
String Query1=" SELECT Ser_id,Ser_UserId,ism.Usr_CompanyName,Ser_YearSelect";
String FinalCondition=" from serviceselector isr INNER JOIN usrdetails ism on isr.Ser_UserId=ism.Usr_Id ";
//String Condition1="where Ser_vatselection="yes" and ser_Vatperiod='1' and ser_yearSelect='"+ServiceYear+"'";
if (ServiceSelected.equalsIgnoreCase("1"))
{
	QUerAdd=",Ser_VatSelection,Ser_Vatperiod,Ser_VatAudit ";
	Condition1="WHERE Ser_VatSelection='"+lSelect+"' and ser_Vatperiod='"+ServicePeriod+"' and ser_yearSelect='"+ServiceYear+"' and ism.Usr_VatAllocated='"+PersonAllocation+"'";
}
else if(ServiceSelected.equalsIgnoreCase("2"))
{
	QUerAdd=",Ser_PTECSelection,Ser_PTECperiod,Ser_PTECAudit ";
	Condition1="WHERE Ser_PTECSelection='"+lSelect+"' and Ser_PTECperiod='"+ServicePeriod+"' and Ser_YearSelect='"+ServiceYear+"' and ism.Usr_VatAllocated='"+PersonAllocation+"'";
}
else if(ServiceSelected.equalsIgnoreCase("3"))
{
	QUerAdd=",Ser_PtrcSelection,Ser_Ptrcperiod,Ser_PtrcAudit ";
	Condition1="WHERE Ser_PtrcSelection='"+lSelect+"' and Ser_Ptrcperiod='"+ServicePeriod+"' and Ser_YearSelect='"+ServiceYear+"'and ism.Usr_VatAllocated='"+PersonAllocation+"'";
}
if (ServiceSelected.equalsIgnoreCase("4"))
{
	QUerAdd=",Ser_ExciseSelection,Ser_Exciseperiod ,Ser_ExciseAudit ";
	Condition1="WHERE Ser_ExciseSelection='"+lSelect+"' and Ser_Exciseperiod ='"+ServicePeriod+"' and Ser_YearSelect='"+ServiceYear+"'and ism.Usr_VatAllocated='"+PersonAllocation+"'";
}
else if(ServiceSelected.equalsIgnoreCase("5"))
{
	QUerAdd=",Ser_ServiceTaxSelection,Ser_ServiceTaxperiod ,Ser_ServiceAudit ";
	Condition1="WHERE Ser_ServiceTaxSelection='"+lSelect+"' and Ser_ServiceTaxperiod  ='"+ServicePeriod+"' and Ser_YearSelect='"+ServiceYear+"'and ism.Usr_VatAllocated='"+PersonAllocation+"'";
}
else if(ServiceSelected.equalsIgnoreCase("6"))
{
	QUerAdd=",Ser_TDSSelection,Ser_Tdsperiod,Ser_TdsAudit ";
	Condition1="WHERE Ser_TDSSelection='"+lSelect+"' and Ser_Tdsperiod ='"+ServicePeriod+"' and Ser_YearSelect='"+ServiceYear+"'and ism.Usr_VatAllocated='"+PersonAllocation+"'";
}
if (ServiceSelected.equalsIgnoreCase("7"))
{
	QUerAdd=",Ser_IncometaxSelection,Ser_IncomeTaxperiod,Ser_IncomeTaxAudit ";
	Condition1="WHERE Ser_IncometaxSelection='"+lSelect+"' and Ser_IncomeTaxperiod='"+ServicePeriod+"' and Ser_YearSelect='"+ServiceYear+"'and ism.Usr_VatAllocated='"+PersonAllocation+"'";
}
if (ServiceSelected.equalsIgnoreCase("8"))
{
	QUerAdd=",Ser_VatSelection,Ser_Vatperiod,Ser_VatAudit ";
	Condition1="WHERE Ser_VatSelection='"+lSelect+"' and ser_Vatperiod='"+ServicePeriod+"' and ser_yearSelect='"+ServiceYear+"'and ism.Usr_VatAllocated='"+PersonAllocation+"'";
}
String FinalQuery=Query1+QUerAdd+FinalCondition+Condition1;
System.out.println("Final Query"+FinalQuery);
ServiceSelector lUserDetailsBean= new ServiceSelector();
ArrayList<ServiceSelector> editBean = new ArrayList<ServiceSelector>();
ConnectionHelper connClass=new ConnectionHelper();
Connection connect = connClass.connect();
Statement statement = null;
ResultSet resultset = null;	
statement = connect.createStatement();
String issueReportQuery=Query1+QUerAdd+FinalCondition+Condition1;
System.out.println(issueReportQuery);
resultset = statement.executeQuery(issueReportQuery);
if (!resultset.next())
{%>
	<div style="font-size:24pt;font-family:times new roman;font-weight:bold;font-style:italic;color:red;">Sorry, could not find the data for this query... </div>
<%}
else{
try{
	do
	{
	ServiceSelectoreHelper lUserEntryHelper= new ServiceSelectoreHelper();
	ServiceSelector lUserDetailsBean1= new ServiceSelector();
	lUserEntryHelper.fillServiceCommon(resultset,lUserDetailsBean1);
	editBean.add(lUserDetailsBean1);
	resultset.next();
	}
	while (resultset.isAfterLast() != true);
}
catch (Exception ex)
{
	ex.printStackTrace();
}finally 
{
     if (resultset != null) try { resultset.close(); } catch (SQLException ignore) {}
     if (statement != null) try { statement.close(); } catch (SQLException ignore) {}
     if (connect != null) try { connect.close(); } catch (SQLException ignore) {}
}
%>
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
<body>
<br>
		<table>
			<tr>
				<td style="text-align: right; font-size: 12px;"><b>Company Name</b></td>
				<td><input type="text" name="filter" value=" " id="filter"height="10px" /></td>
				 
			</tr>
		</table>
<input type="hidden" id="UserPkey" name="UserPkey" />
<input type="hidden" id="uStatus" name="uStatus" /><!-- UserPkey Is Service allocated address -->
<input type="hidden" id="UserId" name="UserId" />
<BR>
  	<TABLE id ="customers" class="sortable" cellpadding="0" cellspacing="0" border="0">
	<thead>
	<tr>
	<th class="sort-alpha"><h3>ID</h3></th>
	<th class="sort-alpha"><h3>Company Name</h3></th>
	<th class="sort-alpha"><h3>Selected Year</h3></th>
	<th class="sort-alpha"><h3>Selection</h3></th><!-- not required -->
	<th class="sort-alpha"><h3>Periodicity</h3></th>
	<th class="sort-alpha"><h3>Audit</h3></th>
	<th class="sort-alpha"><h3>Add Chalan Entries</h3></th>
		</tr>
	</thead>
			<tbody>
			<% int i=1;
				for (ServiceSelector temp : editBean)
						{
					%>
				<tr class="alt">
				<td><%=i%></td>
				<TD><%=temp.getFirstName()%></td>
				<TD><%=temp.getYrSelect()%></td>
				<TD><%=temp.getVatSelect()%></td>
				<TD><%=temp.getVatType()%></td>
				<TD><%=temp.getVatAudit()%></td>
				<TD id ="UserPkey" style="display: none"><%=temp.getPKey()%></td>
				<TD id ="UserId" style="display: none"><%=temp.getUserId()%></td>
				
				<td><input type="button" name="edit" value="Add Chalan Entries" onclick="updateRecord('<%=temp.getPKey()%>','update')"></td>
				</tr>
				<%i++;
				}%>
			</tbody>
		</TABLE>
		<div id="pageNavPosition" style="padding-top: 20px" align="center"></div>
	<%}%> 
	<div></div>	  
</body>
</html>