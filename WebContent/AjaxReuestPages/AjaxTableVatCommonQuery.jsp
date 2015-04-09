<%@page import="com.bhanu.Bean.ServiceSelector"%>
<%@page import="com.bhanu.helperss.ServiceSelectoreHelper"%>
<%@page import="org.apache.el.lang.ELSupport"%>
<%@page import="com.bhanu.helperss.ConnectionHelper"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"    pageEncoding="ISO-8859-1"%>

<%@page language="java" import="java.util.*" import="java.sql.*" import="com.IssueHelper.*" import="java.text.*" import="java.util.Calendar" import="java.util.Collection;"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
String ServiceSelected=request.getParameter("SerSelected");//1,2,3,4,5
String ServiceYear=request.getParameter("YrSelect");//Select Year;
String ServiceSelection=request.getParameter("SerVatselect");//Service Selection
String PersonSelection=request.getParameter("SerVatPerson");
String ComapnyWise=request.getParameter("UserComapny");

System.out.println("Serviceaselected Kya Hai Bhai------------->>>>>>>"+ServiceSelected);
System.out.println("Query Kya AAya "+ServiceSelected+ServiceYear+ServiceSelection+PersonSelection);
//int NoOfCol=0;
String Query1=" ";
ArrayList<ArrayList> Product = new ArrayList<ArrayList>();
if (ServiceSelected.equalsIgnoreCase("1"))
{
	System.out.println("One Main Gaya ");
	Query1="select Vat_Pkey,vat_UserKey,Vat_SerKey,Ser11.Usr_CompanyName,Serv1.Ser_YearSelect,vat.Vat_Period,vat.Vat_AckNo,vat.Vat_Type	from vatservice vat" 
			+" INNER JOIN usrdetails Ser11 on vat.Vat_UserKey=Ser11.Usr_Id INNER JOIN serviceselector Serv1 on vat.Vat_SerKey=Serv1.Ser_Id"
			+" where vat.Vat_CForm='"+ServiceSelection+ "' and Serv1.Ser_YearSelect='"+ServiceYear+"'and Vat_UserKey='"+ComapnyWise+"'";
	System.out.println("----------------->>>"+Query1);
   // NoOfCol=7;
}
else if(ServiceSelected.equalsIgnoreCase("2"))
{
	Query1="select Vat_Pkey,vat_UserKey,Vat_SerKey,Ser11.Usr_CompanyName,Serv1.Ser_YearSelect,vat.Vat_Type,vat.Vat_AckNo,vat.Vat_Period	from vatservice vat" 
			+" INNER JOIN usrdetails Ser11 on vat.Vat_UserKey=Ser11.Usr_Id INNER JOIN serviceselector Serv1 on vat.Vat_SerKey=Serv1.Ser_Id"
			+" where vat.Vat_HForm='"+ServiceSelection+ "' and Serv1.Ser_YearSelect='"+ServiceYear+"'and Vat_UserKey='"+ComapnyWise+"'";
	//NoOfCol=8;
}
else if(ServiceSelected.equalsIgnoreCase("3"))
{
	Query1="select Vat_Pkey,Vat_UserKey,Vat_SerKey,Ser11.Usr_CompanyName,Serv1.Ser_YearSelect,vat.Vat_Type,vat.Vat_AckNo,vat.Vat_Period,vat.Vat_AckNoDate,"
			   +" vat.Vat_Status,Ser11.Usr_VatAllocated,Serv1.Ser_VatSelection from vatservice vat	INNER JOIN usrdetails Ser11 on vat.Vat_UserKey=Ser11.Usr_Id"
	           +" INNER JOIN serviceselector Serv1 on vat.Vat_SerKey=Serv1.Ser_Id	where Ser11.Usr_VatAllocated='"+PersonSelection+"'" 
	           +" and Serv1.Ser_YearSelect='"+ServiceYear+"'and Serv1.Ser_VatSelection='"+ServiceSelection+ "'";
//	NoOfCol=8;
}
else if (ServiceSelected.equalsIgnoreCase("4"))
{
	Query1="SELECT Ser_Id,ser1.Usr_CompanyName,ser_yearSelect,SUM(Vat_AmountPayable) AS totalPayable,"
	+" SUM(vat_amountPaid1+vat_amountPaid2+vat_amountPaid3+vat_amountPaid4) AS total,"
	+" COUNT(*) AS ReturnNos,Vat_Type,Vat_UserKey FROM vatservice vat "
	+" INNER JOIN usrdetails ser1 ON vat.Vat_UserKey=ser1.Usr_Id INNER JOIN serviceselector isr ON vat.Vat_SerKey=isr.Ser_Id" 
	+" WHERE vat_Type='Orignal' AND isr.Ser_YearSelect='"+ServiceYear+"' GROUP BY Vat_UserKey";
	//NoOfCol=8;
}
else if(ServiceSelected.equalsIgnoreCase("5"))
{
	//Still Not Sure Hoow to do it 
	//NoOfCol=8;
}
Statement Tablestatement = null;
ResultSet Tableresultset = null;
ConnectionHelper connClass = new ConnectionHelper();
Connection connect = connClass.connect();
Tablestatement = connect.createStatement();
System.out.println(Query1);
Tableresultset = Tablestatement.executeQuery(Query1);
if (!Tableresultset.next())
{%>
	<div style="font-size:24pt;font-family:times new roman;font-weight:bold;font-style:italic;color:red;">Sorry, could not find the data for this query... </div>
<%}
else{
try{
		Tableresultset = Tablestatement.executeQuery(Query1);
		ArrayList nProduct;
		int cnt = 0;
		while(Tableresultset.next())
		{
			nProduct=new ArrayList();
		    cnt+=1;
		    nProduct.add(String.valueOf(cnt));
		    for(int i=1;i<=8;i++) //replace 3 with the length of the columns
		    {
		    	nProduct.add(Tableresultset.getObject(i));
		    }
		    Product.add(nProduct);
		}
	}
catch (Exception ex)
{
	ex.printStackTrace();
}finally 
{
     if (Tableresultset != null) try { Tableresultset.close(); } catch (SQLException ignore) {}
     if (Tablestatement != null) try { Tablestatement.close(); } catch (SQLException ignore) {}
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
		</tr>
	</thead>
			<tbody>
			<% int i=1;
				for (ArrayList temp : Product)
						{
					%>
				<tr class="alt">
				<td><input type="checkbox" id="SelectCheck" name="SelectCheck" /></td>
				<td><%=i%></td>
				<TD id ="UserPkey" style="display: inline-block;"><%=temp.get(1)%></td><!-- Primary Key -->
				<TD><%=temp.get(2)%></td>
				<TD><%=temp.get(3)%></td>
				<TD><%=temp.get(4)%></td>
				<TD><%=temp.get(5)%></td>
				<TD><%=temp.get(6)%></td>
				<TD id ="uStatus" ><%=temp.get(7)%></td><!-- Vat Type -->
				<TD id ="UserId" style="display: none"><%=temp.get(8)%></td><!-- Vat User Key -->
				</tr>
				<%i++;
				}
				%>
			</tbody>
		</TABLE>
		<div id="pageNavPosition" style="padding-top: 20px" align="center"></div>
	<div></div>	  
	<%}%>
</body>
</html>



<%
//String Condition1="where Ser_vatselection="yes" and ser_Vatperiod='1' and ser_yearSelect='"+ServiceYear+"'";

/*

//C-Form And H Form Query 


select Vat_Pkey,vat_UserKey,Vat_SerKey,Ser11.Usr_CompanyName,Serv1.Ser_YearSelect,vat.Vat_Type
,vat.Vat_AckNo,vat.Vat_Period
from vatservice vat 
INNER JOIN usrdetails Ser11 on vat.Vat_UserKey=Ser11.Usr_Id
INNER JOIN serviceselector Serv1 on vat.Vat_SerKey=Serv1.Ser_Id
where vat.Vat_CForm="Yes" and Serv1.Ser_YearSelect="2008-09"

*/


/*

Person Allocation Of Vat

select Vat_Pkey,Vat_UserKey,Vat_SerKey,Ser11.Usr_CompanyName,Serv1.Ser_YearSelect,vat.Vat_Type
,vat.Vat_AckNo,vat.Vat_Period,vat.Vat_AckNoDate,vat.Vat_Status,Ser11.Usr_VatAllocated,Serv1.Ser_VatSelection
from vatservice vat 
INNER JOIN usrdetails Ser11 on vat.Vat_UserKey=Ser11.Usr_Id
INNER JOIN serviceselector Serv1 on vat.Vat_SerKey=Serv1.Ser_Id
where Ser11.Usr_VatAllocated='Mary' and Serv1.Ser_YearSelect="2008-09" and Serv1.Ser_VatSelection="Yes"

*/




/*
Most important remaining Also Shows Here //Hide Revised Row ,Show On Period Wise 

select lSer123.Ser_Id,lSer123.Ser_VatSelection,lSer123.Ser_YearSelect,lVat.Vat_SerKey,
lVat.Vat_Period,lVat.Vat_UserKey,lSer123.Ser_YearSelect,lVat.Vat_Type,Usr123.Usr_CompanyName
from serviceselector as lSer123
Left JOIN vatservice as lVat on lSer123.Ser_UserId =lVat.Vat_UserKey
INNER join usrdetails as Usr123 on  lSer123.Ser_UserId=Usr123.Usr_Id
where  lSer123.Ser_VatSelection='Yes' and lSer123.Ser_YearSelect='2008-09'
ORDER by lVat.Vat_SerKey

*/
//C Form 1
//H Form 2
//Person Allocation 3
//Vat Report 4
//audit report 5
%>