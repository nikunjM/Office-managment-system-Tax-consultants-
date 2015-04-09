<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.bhanu.helperss.ConnectionHelper"%>
    <%@page language="java" import="java.util.*" import="java.sql.*" import="com.IssueHelper.*" import="java.text.*" import="java.util.Calendar" import="java.util.Collection;"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
String ServiceYear=request.getParameter("YrSelect");//Select Year;
String lPeriodselected=request.getParameter("SerPeriod");//Select Period;
String lClientDeatils=request.getParameter("ClientDetail");//Select Period;
String lPageRecivedFrom=request.getParameter("Page");
String QueryStringTable="";

if(lPageRecivedFrom.equalsIgnoreCase("VatPending"))
	{
	QueryStringTable="SELECT Vat_Pkey,Vat_UserKey,usr.Usr_CompanyName,Vat_Type,mst.Mst_Name,Vat_AmountPayable,(vat_amountPaid1+vat_amountPaid2+vat_amountPaid3+vat_amountPaid4) as total,Vat_AckNo,Vat_AckNoDate,Vat_Cform,Vat_Hform,Vat_Status,Ser_Id,Vat_Remarks FROM vatservice vat INNER JOIN serviceselector ser ON vat.Vat_SerKey=ser.Ser_Id INNER JOIN usrdetails usr on vat.Vat_UserKey=usr.Usr_Id inner join masterperiodicity mst on vat.Vat_Period =mst.Mst_Pkey where Vat_AmountPayable<>(vat_amountPaid1+vat_amountPaid2+vat_amountPaid3+vat_amountPaid4) and vat_status='final' and ser.Ser_YearSelect='"+ServiceYear+"' and ser.Ser_Vatperiod='"+lPeriodselected+"' ORDER by usr.Usr_CompanyName";
	System.out.println("VatPending main gaya ");
	
	}else
	{
	QueryStringTable="SELECT Vat_Pkey,Vat_UserKey,usr.Usr_CompanyName,Vat_Type,mst.Mst_Name,Vat_AmountPayable,(vat_amountPaid1+vat_amountPaid2+vat_amountPaid3+vat_amountPaid4) as total,Vat_AckNo,Vat_AckNoDate,Vat_Cform,Vat_Hform,Vat_Status,Ser_Id,Vat_Remarks FROM vatservice vat INNER JOIN serviceselector ser ON vat.Vat_SerKey=ser.Ser_Id inner join usrdetails usr ON usr.Usr_Id=vat.Vat_UserKey INNER JOIN masterperiodicity mst on vat.Vat_Period=mst.Mst_Pkey WHERE Vat_UserKey='"+lClientDeatils+"'AND ser.Ser_YearSelect='"+ServiceYear+"'";		
	}
Statement Tablestatement = null;
ResultSet Tableresultset = null;
ConnectionHelper connClass = new ConnectionHelper();
Connection connect = connClass.connect();
Tablestatement = connect.createStatement();


System.out.println(QueryStringTable);
Tableresultset = Tablestatement.executeQuery(QueryStringTable);
ArrayList<ArrayList> Product = new ArrayList<ArrayList>();
ArrayList nProduct;
int cnt = 0;
while(Tableresultset.next())
{
	nProduct=new ArrayList();
    cnt+=1;
    nProduct.add(String.valueOf(cnt));
    for(int i=1;i<=14;i++) //replace 3 with the length of the columns
    {
    	nProduct.add(Tableresultset.getObject(i));
    }
    Product.add(nProduct);
}
   if (Tablestatement != null) try { Tablestatement.close(); } catch (SQLException ignore) {}
   if (Tableresultset != null) try { Tableresultset.close(); } catch (SQLException ignore) {}
   if (connect != null) try { connect.close(); } catch (SQLException ignore) {}
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="<%=request.getContextPath()%>/jqueryandcss/jquery.min.js"></script>
<script	src="<%=request.getContextPath()%>/jqueryandcss/Tabletogle.js"></script>
<script	src="<%=request.getContextPath()%>/jqueryandcss/PagingOfTable.js"></script>
<script src="<%=request.getContextPath()%>/jqueryandcss/DateFormatter.js"></script>
<link href="<%=request.getContextPath()%>/jqueryandcss/ScreenWithMenuCss.css"rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/jqueryandcss/TablenewCss.css"rel="stylesheet" type="text/css" />

<title>Insert title here</title>
</head>

<body>
<TABLE id ="customers" class="sortable" cellpadding="0" cellspacing="0" border="0">
	<thead >
	<tr class="headercell">
	<th class="sort-alpha"><h3>ID</h3></th>
	<th class="sort-alpha"><h3>Comapny Name</h3></th>
	<th class="sort-alpha"><h3>Type</h3></th>
	<th class="sort-alpha"><h3>Period</h3></th>
	<th class="sort-alpha"><h3>AmountPayable</h3></th><!-- not required -->
	<th class="sort-alpha"><h3>AmountPaid</h3></th>
	<th class="sort-alpha"><h3>AckNo</h3></th>
	<th class="sort-alpha"><h3>Ack Date</h3></th><!-- not required -->
	<th class="sort-alpha"><h3>C-Form</h3></th>
	<th class="sort-alpha"><h3>H-Form</h3></th>
	<th class="sort-alpha"><h3>Status</h3></th><!-- not required -->
	<th class="sort-alpha"><h3>Remarks</h3></th><!-- not required -->
		</tr>
			</thead>
			<tbody>
			<% int i1=1;
			for (ArrayList temp : Product){ 
					%>
				<tr class="alt">
				<td><%=i1%></td>
				<TD id="VatPkey" style="display: none"><%=temp.get(1)%></td><!-- Vat Primary Key -->
				<TD><%=temp.get(3)%></td>
				<TD><%=temp.get(4)%></td>
				<TD><%=temp.get(5)%></td>
				<TD><%=temp.get(6)%></td>
				<TD><%=temp.get(7)%></td>
				<TD><%=temp.get(8)%></td>
				<TD><%=temp.get(9)%></td>
				<TD><%=temp.get(10)%></td>
				<TD><%=temp.get(11)%></td>
				<TD ><%=temp.get(12)%></td><!-- Vat Ser Key -->
				<TD id="VatSerKey" style="display: none"><%=temp.get(13)%></td>
				<TD ><%=temp.get(14)%></td><!-- Vat Ser Key -->
				</tr>
				<%i1++;}%>
			</tbody>
		</TABLE>
			<div id="pageNavPosition" style="padding-top: 20px" align="center"></div>
			</body>
<script src="<%=request.getContextPath()%>/jqueryandcss/Aajx.Google.js"></script>
<script>
var pager = new Pager('customers',15);
pager.init();
pager.showPageNav('pager', 'pageNavPosition');
pager.showPage(1);
$("#customers tbody tr").live('dblclick', function() {
	var lSelectedSerValue = $(this).children('#VatSerKey').text();
	var curr_page = "<%=request.getContextPath()%>/VatFormApplication.jsp?UserPkey="+lSelectedSerValue+"&uStatus=update";
    next_page = "";
	var lSelectedValue = $(this).children('#VatPkey').text();
	
if(curr_page.indexOf("?") > -1) {
    next_page = curr_page+"&action="+lSelectedValue;
} else {
    next_page = curr_page+"&action="+lSelectedValue;
}
window.location = next_page;		
});
function Redirect()
{
	var lComapnyName=document.getElementById("VatClients").value;
	var next_page = "<%=request.getContextPath()%>/VatFormApplication.jsp?UserPkey='"+lComapnyName+"'&uStatus=update&UserId=update";
	window.location = next_page;	
}
</script>			
</html>