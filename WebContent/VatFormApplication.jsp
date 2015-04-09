<%@page import="com.bhanu.Bean.VatRegistraFormBean"%>
<%@page import="com.bhanu.helperss.VatFormHelper"%>
<%@page import="com.bhanu.helperss.BhanuUserEntryHelper"%>
<%@page import="com.bhanu.helperss.ConnectionHelper"%>
<%@page import="com.bhanu.helperss.BhanuSessionCheckerHelper"%>
<%@page import="com.bhanu.Bean.BhanuUserDetailsBean"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page language="java" import="java.util.List"	import="java.sql.*" import="java.text.SimpleDateFormat" import="java.util.Calendar"%>
 <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
BhanuSessionCheckerHelper help=new BhanuSessionCheckerHelper();
	if (!help.login(request, null))
	{ 
		help.forwardToAnyPage(null, response);
	}
			
	else 
	{
	%>
		<%
		int addIsNull=0;
		Statement statement = null;
		Statement Tablestatement = null;
		Statement Tablestatement1 = null;
		Statement Tablestatement2 = null;
		Statement Tablestatement3 = null;
		
		ResultSet resultset = null;
		ResultSet Tableresultset = null;
		ResultSet Tableresultset1 = null;
		ResultSet Tableresultset2 = null;
		ResultSet Tableresultset3 = null;
		ResultSet VatUpdatedSet = null;
		ConnectionHelper connClass = new ConnectionHelper();
		Connection connect = connClass.connect();
		BhanuUserDetailsBean lRegistrationBean = new BhanuUserDetailsBean();
		BhanuUserEntryHelper userRegistrationHelper = new BhanuUserEntryHelper();
		VatFormHelper lVatBean=new VatFormHelper();
		VatRegistraFormBean lbean=new VatRegistraFormBean();
		ArrayList<VatFormHelper> editBean = new ArrayList<VatFormHelper>();
		//http://localhost:8080/IssueTracker/VatFormApplication.jsp?filter=+&Use	rPkey=11&uStatus=update
		//happens only for registration page so check id is null or not and perform.....
		String id = request.getParameter("UserPkey");//Gives User iD Which Helps to Update Page
		String action=request.getParameter("uStatus");//Decides its Update or Registration
		String MainUserId=request.getParameter("UserId");
		String Pkey=request.getParameter("VatPkey");
		String lSelectedVatValue=request.getParameter("action");//Select Value when User Double Clicks the table
		//value And Fill the Table 
		if(lSelectedVatValue!=null)
		{
			statement = connect.createStatement();
			//String QueryString = "select * from vatservice where vat_pkey="+lSelectedVatValue;
			String QueryString = "select * from vatservice where vat_pkey="+lSelectedVatValue;
			System.out.println(QueryString);
			VatUpdatedSet = statement.executeQuery(QueryString);
			while (VatUpdatedSet.next()) 
			{
				lVatBean.fill(VatUpdatedSet,lbean);
			}
		}
		else if (lSelectedVatValue == null) 
		{
				lVatBean.fillDurinNull(lbean);
		}
		    System.out.println("User UserPKey And uStatus Values------------------->>"+id+action+MainUserId);
			statement = connect.createStatement();
			String QueryString = "SELECT Ser_id,Ser_UserId,ism.Usr_CompanyName,ism.Usr_VatNo,ism.Usr_FileNo,ism.Usr_ComapnyAllocation,ism.Usr_vatAllocated,ism.Usr_ConsultancyAllocation,Ser_vatperiod,Ser_vatSelection,Ser_vatAudit,ser_yearSelect from serviceselector isr INNER JOIN usrdetails ism on isr.Ser_UserId=ism.Usr_Id where Ser_id='"+id+"'"; 		
			System.out.println(QueryString);
			resultset = statement.executeQuery(QueryString);
			while (resultset.next()) 
			{
				userRegistrationHelper.fillVatFiller(resultset,lRegistrationBean);
			}
			Tablestatement = connect.createStatement();
			String QueryStringTable = "SELECT Vat_Pkey,Vat_UserKey,Vat_Type,mst.Mst_Name,Vat_AmountPayable,(vat_amountPaid1+vat_amountPaid2+vat_amountPaid3+vat_amountPaid4) as total,Vat_AckNo,Vat_AckNoDate,Vat_Cform,Vat_Hform,Vat_Status	FROM vatservice vat	INNER JOIN serviceselector ser ON vat.Vat_SerKey=ser.Ser_Id	INNER JOIN masterperiodicity mst on vat.Vat_Period=mst.Mst_Pkey	WHERE Vat_UserKey='"+lRegistrationBean.getBagNo()+"' AND ser.Ser_YearSelect='"+lRegistrationBean.getWorkPhone()+"'and vat_type='Orignal'"; 		
			System.out.println(QueryStringTable);
			Tableresultset = Tablestatement.executeQuery(QueryStringTable);
			ArrayList<ArrayList> Product = new ArrayList<ArrayList>();
			ArrayList nProduct;
			int cnt = 0;
			while(Tableresultset .next())
			{
				nProduct=new ArrayList();
			    cnt+=1;
			    nProduct.add(String.valueOf(cnt));
			    for(int i=1;i<=11;i++) //replace 3 with the length of the columns
			    {
			    	nProduct.add(Tableresultset.getObject(i));
			    }
			    Product.add(nProduct);
			}
			
			Tablestatement1 = connect.createStatement();
			String QueryStringTable1 = "SELECT Vat_Pkey,Vat_UserKey,Vat_Type,mst.Mst_Name,Vat_AmountPayable,(vat_amountPaid1+vat_amountPaid2+vat_amountPaid3+vat_amountPaid4) as total,Vat_AckNo,Vat_AckNoDate,Vat_Cform,Vat_Hform,Vat_Status	FROM vatservice vat	INNER JOIN serviceselector ser ON vat.Vat_SerKey=ser.Ser_Id	INNER JOIN masterperiodicity mst on vat.Vat_Period=mst.Mst_Pkey	WHERE Vat_UserKey='"+lRegistrationBean.getBagNo()+"' AND ser.Ser_YearSelect='"+lRegistrationBean.getWorkPhone()+"' and vat_type='Revised'"; 		
			System.out.println(QueryStringTable1);
			Tableresultset1 = Tablestatement1.executeQuery(QueryStringTable1);
			ArrayList<ArrayList> Product1 = new ArrayList<ArrayList>();
			ArrayList nProduct1;
			int cnt1 = 0;
			while(Tableresultset1.next())
			{
				nProduct1=new ArrayList();
			    cnt1+=1;
			    nProduct1.add(String.valueOf(cnt1));
			    for(int i=1;i<=11;i++) //replace 3 with the length of the columns
			    {
			    	nProduct1.add(Tableresultset1.getObject(i));
			    }
			    Product1.add(nProduct1);
			}
			Tablestatement2 = connect.createStatement();
			String QueryStringTable2 = "SELECT Ser_id,Ser_UserId,isr.Usr_CompanyName FROM serviceselector ser	INNER join usrdetails isr on Ser_userId=isr.Usr_Id	WHERE ser_VatSelection='Yes' and ser_YearSelect='"+lRegistrationBean.getWorkPhone()+"'" ;
			System.out.println(QueryStringTable2);
			Tableresultset2 = Tablestatement2.executeQuery(QueryStringTable2);
			ArrayList<ArrayList> Product2 = new ArrayList<ArrayList>();
			ArrayList nProduct2;
			int cnt2 = 0;
			while(Tableresultset2.next())
			{
				nProduct2=new ArrayList();
			    cnt2+=1;
			    nProduct2.add(String.valueOf(cnt2));
			    for(int i=1;i<=3;i++) //replace 3 with the length of the columns
			    {
			    	nProduct2.add(Tableresultset2.getObject(i));
			    }
			    Product2.add(nProduct2);
			}
			Tablestatement3 = connect.createStatement();
			String QueryStringTable3 = "select * from masterperiodicity where Mst_type='"+lRegistrationBean.getVatService()+"'";
			System.out.println(QueryStringTable3);
			Tableresultset3 = Tablestatement3.executeQuery(QueryStringTable3);
			ArrayList<ArrayList> Product3 = new ArrayList<ArrayList>();
			ArrayList nProduct3;
			int cnt3 = 0;
			while(Tableresultset3.next())
			{
				nProduct3=new ArrayList();
			    cnt3+=1;
			    nProduct3.add(String.valueOf(cnt3));
			    for(int i=1;i<=3;i++) //replace 3 with the length of the columns
			    {
			    	nProduct3.add(Tableresultset3.getObject(i));
			    }
			    Product3.add(nProduct3);
			}
			
		   if (statement != null) try { statement.close(); } catch (SQLException ignore) {}
		   if (Tablestatement != null) try { Tablestatement.close(); } catch (SQLException ignore) {}
		   if (Tablestatement1 != null) try { Tablestatement1.close(); } catch (SQLException ignore) {}
		   if (Tablestatement2 != null) try { Tablestatement2.close(); } catch (SQLException ignore) {}
		   if (Tablestatement3 != null) try { Tablestatement3.close(); } catch (SQLException ignore) {}
	       if (resultset != null) try { resultset.close(); } catch (SQLException ignore) {}
		   if (Tableresultset != null) try { Tableresultset.close(); } catch (SQLException ignore) {}
		   if (Tableresultset1 != null) try { Tableresultset1.close(); } catch (SQLException ignore) {}
		   if (Tableresultset2 != null) try { Tableresultset2.close(); } catch (SQLException ignore) {}
		   if (Tableresultset3 != null) try { Tableresultset3.close(); } catch (SQLException ignore) {}
		   if (VatUpdatedSet != null) try { VatUpdatedSet.close(); } catch (SQLException ignore) {}
		   if (connect != null) try { connect.close(); } catch (SQLException ignore) {}
			%>
<head>
  <script src="<%=request.getContextPath()%>/jqueryandcss/jquery.min.js"></script>
  <link href="<%=request.getContextPath()%>/jqueryandcss/ScreenWithMenuCss.css"rel="stylesheet" type="text/css"/>
  <link href="<%=request.getContextPath()%>/jqueryandcss/TablenewCss.css"rel="stylesheet" type="text/css" />
  <link href="<%=request.getContextPath()%>/jqueryandcss/JqueryDate.css"rel="stylesheet" type="text/css" />
  <script src="<%=request.getContextPath()%>/jqueryandcss/Tabletogle.js"></script>
  <script src="<%=request.getContextPath()%>/jqueryandcss/PagingOfTable.js"></script>
  <script src="<%=request.getContextPath()%>/jqueryandcss/Aajx.Google.js"></script>
  <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
  <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script>
$(document).ready(function(){
	$("#AmountPaidDate1").datepicker({ dateFormat: 'dd/mm/yy' }).val();
	$("#AmountPaidDate2").datepicker({ dateFormat: 'dd/mm/yy' }).val();
	$("#AmountPaidDate3").datepicker({ dateFormat: 'dd/mm/yy' }).val();
	$("#AmountPaidDate4").datepicker({ dateFormat: 'dd/mm/yy' }).val();
	$("#AckNoDate").datepicker({ dateFormat: 'dd/mm/yy' }).val();
	  $("#panel12").slideDown(2000);{
	  $("#flip12").click(function(){
	    $("#panel12").slideToggle(1000);
	  });
	};
});
$(document).ready(function() {
$('input.qty').change(function() {
	var totalamount=document.getElementById('AmountPayable').value;
    var total = 0;
    var AmouuntRem=0;
    $('input.qty').each(function()
    {
        total += parseInt(this.value);
        alert(total);
        AmouuntRem =parseInt(totalamount - total);
        if(AmouuntRem <=0)
        {
        	alert("Over Paid,Please Check Value");
        }
    });
    $("#totalRemaining").html(AmouuntRem);
    $("#totalPaid").html(total);
});
});
function DropDownMenu()
{
	var lService="<%=lRegistrationBean.getVatService()%>";
	if(lService=="Monthly")
	{
		  $('.Half-Yr').remove();
		  $('.Yearly').remove();
		  $('.Quarter').remove();
	}
	if(lService=="HalfYearly")
	{
		  $('.Yearly').remove();
		  $('.Quarter').remove();
		  $('.Monthly').remove();
		  
	}
	if(lService=="Yearly")
	{
		  $('.Quarter').remove();
		  $('.Monthly').remove();
		  $('.Half-Yr').remove();
	}
	if(lService=="Quaterly")
	{
		  $('.Half-Yr').remove();
		  $('.Yearly').remove();
		  $('.Monthly').remove();
	}

}
function validateFormOnSubmit()
{
		var reason="";
		reason += validateEmpty(VatForm.VatRemarks);
		reason += validateEmpty(VatForm.VatStatus);
		reason += validateEmpty(VatForm.HFromAppl);
		reason += validateEmpty(VatForm.CFromAppl);
		reason += validateEmpty(VatForm.AckNoDate);
		reason += validateEmpty(VatForm.AckNo);
		reason += validateEmpty(VatForm.AmountPayable);
		reason += validateEmpty(VatForm.VatPeriod);
		reason += validateEmpty(VatForm.VatType);
		reason += validateEmpty(VatForm.AckNo);
		reason += validateEmpty(VatForm.AckNoDate);
		reason += validateCheckDate(VatForm.pre_AmountPaid1,VatForm.AmountPaidDate1);
		reason += validateCheckDate(VatForm.pre_AmountPaid2,VatForm.AmountPaidDate2);
		reason += validateCheckDate(VatForm.pre_AmountPaid3,VatForm.AmountPaidDate3);
		reason += validateCheckDate(VatForm.pre_AmountPaid4,VatForm.AmountPaidDate4);
		reason += validateCheckDate(VatForm.AckNo,VatForm.AckNoDate);
		if (reason != "") 
		{
		alert("Some fields need correction:\n" + reason);
			return false;
		} else {
			document.VatForm.submit();
			return true;
		}
	}
	function validateEmpty(fld) {
		var error = "";
		if (fld.value.length == 0) {
			fld.style.background = 'Yellow';
			error = "Please Fill" + fld.name + "\n";
		} else {
			fld.style.background = 'White';
		}
		return error;
	}
	function validateCheckDate(fld1,fld2) 
	{
		var error = "";
		if (fld1.value.length >1 && fld2.value=="") 
		{
			fld1.style.background = 'Yellow';
			fld2.style.background = 'Yellow';
			error = "Please Fill" + fld1.name + "along with date\n";
		}
		else if(fld1.value.length >= 1 && fld2.value.length >=2)
		{
		var lvalue=!fld2.value.match(/^(0[1-9]|[12][0-9]|3[01])[\- \/.](?:(0[1-9]|1[012])[\- \/.](201)[2-9]{1})$/);
		if(lvalue)
		{
			fld1.style.background = 'White';
			fld2.style.background = 'Yellow';
			error = "Please Fill" + fld2.name + "Proper Formate\n";
		}else
		{
			fld2.style.background = 'white';
		}
		}
		else {
			fld1.style.background = 'White';
			fld2.style.background = 'White';
		}
		return error;
	}
	
	function setSelectedIndex(s, valsearch) {
		// Loop through all the items in drop down list
		for (i = 0; i < s.options.length; i++) {
			if (s.options[i].value == valsearch) {
				// Item is found. Set its property and exit
				s.options[i].selected = true;
				break;
			}
		}
		return;
	}

	function DropDownChange()
	{
		var lSelectedValue1 = document.getElementById('DuplicateComplain').value;
		var next1_page = "<%=request.getContextPath()%>/VatFormApplication.jsp?UserPkey="+lSelectedValue1+"&uStatus=Add&UserId=<%=MainUserId%>";
		window.location = next1_page;
	}
function start()
{
	setSelectedIndex(document.getElementById("VatType"),"<%=lbean.getlVatType()%>");
	setSelectedIndex(document.getElementById("VatPeriod"),"<%=lbean.getlVatPeriod()%>");
	setSelectedIndex(document.getElementById("CFromAppl"),"<%=lbean.getlCFromAppl()%>");
	setSelectedIndex(document.getElementById("HFromAppl"),"<%=lbean.getlHFromAppl()%>");
	setSelectedIndex(document.getElementById("VatStatus"),"<%=lbean.getlVatStatus()%>");
	setSelectedIndex(document.getElementById("DuplicateComplain"),"<%=id%>");
	document.getElementById("VatPkey").value=<%=lSelectedVatValue%>;
	DropDownMenu();
}
	</script>
	<!-- 
<style type="text/css">
body
{
	font: 1.364em/1.867em 'Roadgeek2005OldParksRegular', Georgia, sans-serif;
	font-family: verdana, arial, sans-serif;
	font-size: 10pt;
	margin: 0px;
	color: #fffff;
}
#totalRemaining,#totalPaid
{	
	font: 1.064em/1.267em 'Roadgeek2005OldParksRegular', Georgia, sans-serif;
	font-family: verdana, arial, sans-serif;
}
#UserFrom,#UserServiceFrom,#ServiceSelectiontable,#yrselection,#DropDownSelection{
	border: 1px solid red;
	background-color: white;
		}
#yrselection td.Title {
	text-align: left;
	padding: 3px 7px 2px 7px;
	vertical-align: bottom;
	width: 200px;
	background-color: orange;
	}
	
#yrselection td.Title1 {
	text-align: left;
	padding: 3px 7px 2px 7px;
	vertical-align: bottom;
	width: 150px;
	background-color: orange;
	}
	
	
	
#yrselection input[type=text],input[type=password] {
	text-align: left;
	padding: 3px 7px 2px 7px;
	vertical-align: bottom;
	width: 176px;
	border: solid 1px #c3c3c3;
}
th {
	text-align: left;
	padding: 3px 7px 2px 7px;
	vertical-align: bottom;
	width: 50px;
	background-color: #086FA1;
}
#yrselection select {
	width: 190px;
	text-align: left;
	padding: 3px 7px 2px 7px;
}
div.header
{
	padding: 5px;
	text-align: center;
	background-color: #086FA1;
	color: #FFFFFF;
	border: solid 1px #000080;
	text-transform: uppercase;
	font-weight: bold; 
}			
button {
	cursor: pointer;
	background: #dbe8bf url(IssueTracker/images/images/add_row.png) 6px 4px no-repeat;
	padding: 3px 4px 3px 25px;
	border: 1px solid #a3c261;
}
input[type=radio]{ display:inline !important; }
</style>
 -->
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Service Selection Page</title>
</head>
<body onload="start();" >
 <div id="mainarea">
 <br>
 <div id="clean"></div>
 
 <form name="VatForm" id="VatForm" style="padding-top: 0px; margin-top: 0px;"action="<%=request.getContextPath()%>/VatformRegistration" method="post"onsubmit="javascript:return false;">
 			<table id="DropDownSelection" cellspacing="5" cellpadding="0" width="90%">
 			<tr>
 			<td class="Title">Select Company</td>
 			<td>
 			<select name="DuplicateComplain" id="DuplicateComplain" onchange="DropDownChange();">
			<% int i2=0;
			for (ArrayList temp : Product2){%>
			<option value="<%=temp.get(1)%>"><%=temp.get(3)%></option>
			<%i2++;}%>
			</select>
			</td>
			</tr>
			</table>			 
			<br>
			<table id="UserFrom" cellspacing="5" cellpadding="0" width="90%">
			<tr>
			<td class="Title">Company Name </td>
			<td><b><%=lRegistrationBean.getCompanyName() %></b>
			<input name="PKey"  	 type="hidden" id="PKey" 			value="<%=lRegistrationBean.getBagNo()%>" />
			<input name="SerKey" 	 type="hidden" id="SerKey" 			value="<%=lRegistrationBean.getpKey()%>" />
			<input name="VatPkey" 	 type="hidden" id="VatPkey" 		value=""/>
			<input  id="EntryMAdeBy" type="hidden" name="EntryMAdeBy"   value="<%=(String)session.getAttribute("username")%>"/></td>
			</tr>
			<tr>
			<td class="Title">Vat NO</td>
			<td><%=lRegistrationBean.getPANNo()%></td>
			<td class="Title">File No</td>
			<td><%=lRegistrationBean.getFileNo()%></td>
			</tr>
			<tr>
			<td class="Title">Main Person Allocated</td>
			<td><%=lRegistrationBean.getComapnyAllocation()%></td>
			<td class="Title">Consultancy allocation </td>
			<td><%=lRegistrationBean.getVatAllocated()%></td>
			</tr>
			<tr>
			<td class="Title">Vat Person Allocation   </td>
			<td><%=lRegistrationBean.getConsultancyAllocation()%><input name="PeriodCity" type="hidden" id="PeriodCity" value="<%=lRegistrationBean.getVatService()%>" /></td>
			<td class="Title">Vat Periodicity   </td>
			<td><%=lRegistrationBean.getVatService()%><input name="PeriodCity" type="hidden" id="PeriodCity" value="<%=lRegistrationBean.getVatService()%>" /></td>
			</tr>
			<tr>
			<td class="Title">Vat audit </td>
			<td><%=lRegistrationBean.getTitle()%></td>
			<td class="Title">Assestment Year</td>
			<td><%=lRegistrationBean.getWorkPhone()%><input name="AssYr" type="hidden" id="AssYr" value="<%=lRegistrationBean.getWorkPhone()%>" /></td>
			</tr>
			<tr><td><div id="lblValues"></div></td></tr>
		</table>
		<br>
	<TABLE id ="customers" class="sortable" cellpadding="0" cellspacing="0" border="0">
	<thead >
	<tr class="headercell">
	<th class="sort-alpha"><h3>ID</h3></th>
	<th class="sort-alpha"><h3>Type</h3></th>
	<th class="sort-alpha"><h3>Period</h3></th>
	<th class="sort-alpha"><h3>AmountPayable</h3></th><!-- not required -->
	<th class="sort-alpha"><h3>AmountPaid</h3></th>
	<th class="sort-alpha"><h3>AckNo</h3></th>
	<th class="sort-alpha"><h3>Ack Date</h3></th><!-- not required -->
	<th class="sort-alpha"><h3>C-Form</h3></th>
	<th class="sort-alpha"><h3>H-Form</h3></th>
	<th class="sort-alpha"><h3>Status</h3></th><!-- not required -->
		</tr>
			</thead>
			<tbody>
			<% int i=1;
			for (ArrayList temp : Product){ 
					%>
				<tr class="alt">
				<td><%=i%></td>
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
				</tr>
				<%i++;				
				}%>
			</tbody>
		</TABLE>
<br>		
	<TABLE id ="customers" class="sortable" cellpadding="0" cellspacing="0" border="0">
	<thead >
	<tr class="headercell">
	<th class="sort-alpha"><h3>ID</h3></th>
	<th class="sort-alpha"><h3>Type</h3></th>
	<th class="sort-alpha"><h3>Period</h3></th>
	<th class="sort-alpha"><h3>AmountPayable</h3></th><!-- not required -->
	<th class="sort-alpha"><h3>AmountPaid</h3></th>
	<th class="sort-alpha"><h3>AckNo</h3></th>
	<th class="sort-alpha"><h3>Ack Date</h3></th><!-- not required -->
	<th class="sort-alpha"><h3>C-Form</h3></th>
	<th class="sort-alpha"><h3>H-Form</h3></th>
	<th class="sort-alpha"><h3>Status</h3></th><!-- not required -->
		</tr>
			</thead>
			<tbody>
			<% int i1=1;
			for (ArrayList temp : Product1){ 
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
				</tr>
				<%i++;				
				}%>
			</tbody>
		</TABLE>
		<br>
		<table id="yrselection" cellspacing="5" cellpadding="0" width="90%">
			<tr>
			<td class="Title">Type</td>
			<td>
			<select id="VatType" name="VatType">
				<option value="">select</option>
				<option value="Revised">Revised</option>
				<option value="Orignal">Orignal</option>
			</select>
			</td>
			<td class="Title">Period</td>
			<td>
			<select id="VatPeriod" name="VatPeriod">
			<!-- 
				<option value="" class="Monthly">select</option>
				<option value="M1"  class="Monthly">1St Apr-30th April</option>
				<option value="M2"  class="Monthly">1St May-31th May</option>
				<option value="M3"  class="Monthly">1St June-30th June</option>
				<option value="M4"  class="Monthly">1St July-31st July</option>
				<option value="M5"  class="Monthly">1St Aug-31st Aug</option>
				<option value="M6"  class="Monthly">1St Sep-30th Sep</option>
				<option value="M7"  class="Monthly">1St Oct-31st Oct</option>
				<option value="M8"  class="Monthly">1St Nov-30th Nov</option>
				<option value="M9"  class="Monthly">1St Dec-31th Dec</option>
				<option value="M10" class="Monthly">1St Jan-301st Jan</option>
				<option value="M11" class="Monthly">1St Feb-28th Dec</option>
				<option value="M12" class="Monthly">1St Mar-31th Mar</option>
				<option value="Q1"  class="Quarter">1St Apr-30th June</option>
				<option value="Q2"  class="Quarter">1St July-31th Sep</option>
				<option value="Q3"  class="Quarter">1St Oct-30th Dec</option>
				<option value="Q4"  class="Quarter">1St Jan-31st March</option>
				<option value="H1"  class="Half-Yr">1St Apr-30th Sep</option>
				<option value="H2"  class="Half-Yr">1St Oct-31th Mar</option>
				<option value="Y1"  class="Yearly">1St Oct-31th Mar</option>
				-->
			<% int i3=0;
			for (ArrayList temp : Product3){%>
			<option value="<%=temp.get(1)%>"><%=temp.get(2)%></option>
			<%i3++;}%>
			</select>
			</td>
			</tr>
			<tr>
			<td class="Title">Amount Payable</td>
			<td><input name="AmountPayable" maxlength="20" type="text" id="AmountPayable" value="<%=lbean.getlAmountPayable() %>" />
			</td>
			</tr>
			<tr>
			<td class="Title">Amount Paid 1</td>
			<td>
			<input name="pre_AmountPaid1" class="qty" maxlength="20" type="text" id="pre_AmountPaid1" value="<%=lbean.getLpre_AmountPaid1()%>" />
			</td>
			<td class="Title">Amount Paid Date</td>
			<td>
			<input name="AmountPaidDate1" maxlength="20" type="text" id="AmountPaidDate1" value="<%=lbean.getlAmountPaidDate1()%>" />
			</td>
			</tr>
			<tr>
			<td class="Title">Amount Paid 2</td>
			<td>
			<input name="pre_AmountPaid2" class="qty" maxlength="20" type="text" id="pre_AmountPaid2" value="<%=lbean.getLpre_AmountPaid2()%>" />
			<td class="Title">Amount Paid Date</td>
			<td>
			<input name="AmountPaidDate2" maxlength="20" type="text" id="AmountPaidDate2" value="<%=lbean.getlAmountPaidDate2()%>" />
			</td>
			</tr>
			<tr>
			<td class="Title">Amount Paid 3</td>
			<td>
			<input name="pre_AmountPaid3" class="qty" maxlength="20" type="text" id="pre_AmountPaid3" value="<%=lbean.getLpre_AmountPaid3()%>" />
			<td class="Title">Amount Paid Date</td>
			<td>
			<input name="AmountPaidDate3" maxlength="20" type="text" id="AmountPaidDate3" value="<%=lbean.getlAmountPaidDate3()%>" />
			</td>
			</tr>
			<tr>
			<td class="Title">Amount Paid 4</td>
			<td>
			<input name="pre_AmountPaid4" class="qty" maxlength="20" type="text" id="pre_AmountPaid4" value="<%=lbean.getLpre_AmountPaid4()%>" />
			<td class="Title">Amount Paid Date</td>
			<td>
			<input name="AmountPaidDate4" maxlength="20" type="text" id="AmountPaidDate4" value="<%=lbean.getlAmountPaidDate4()%>" />
			</td>
			</tr>
			<tr>
			<td class="Title">Total Amount Paid</td>
			<td>
			<!--<input type="text" id="totalPaid" value="0" size="5"/>-->
			<span id="totalPaid"> </span>
			</td>
			<td class="Title">Remaining</td>
			<td>
			<!--<input type="text" id="totalPaid" value="0" size="5"/>-->
			<span id="totalRemaining"> </span>
			</td>
			<tr>
			<td class="Title">Acknowledge No</td>
			<td>
			<input type="text" id="AckNo" Name="AckNo" value="<%=lbean.getlAckNo()%>" maxlength="15"/>
			</td>
			<td class="Title">Acknowledge No Date</td>
			<td>
			<input type="text" id="AckNoDate" Name="AckNoDate" value="<%=lbean.getlAckNoDate()%>" maxlength="15"/>
			</td>
			</tr>
			<tr>
			<td class="Title">C Form Application</td>
			<td>
			<select id="CFromAppl" name="CFromAppl">
				<option value="">select</option>
				<option value="Yes">Yes</option>
				<option value="No">No</option>
				</select>
			</td>
			<td class="Title">H Form Application</td>
			<td>
			<select id="HFromAppl" name="HFromAppl">
				<option value="">select</option>
				<option value="Yes">Yes</option>
				<option value="No">No</option>
				</select>
			</td>
			</tr>
			<tr>
			<td class="Title">Status</td>
			<td>
			<select id="VatStatus" name="VatStatus">
				<option value="">select</option>
				<option value="Final">Final</option>
				<option value="Revised">Revised</option>
				</select>
			</td>
			<tr>
			<td class="Title">Remarks</td>
			<td colspan="4">
			<input type="text" id="VatRemarks" Name="VatRemarks" value="<%=lbean.getRemarks()%>" maxlength="150"/>
			</td>
			</tr>
			<tr>
			<td></td>
			<td><button id="ButtonName" onclick="validateFormOnSubmit();">Add</button></td>
			<td><button onclick="resetform();">Clear</button></td>
			<td><button onclick="Redirect();">Add New Form</button></td>
			
			</tr>
		</table>
</form>
</div>
<div id="topbar">
<table>
<tr>
<td><div><img style="width: 100%;max-height:70%"src="<%=request.getContextPath()%>/images/images/Bhanu.jpg"/></div></td>
<td><div id ="clocks"><h2 id="clock"></h2></div></td>
</tr>
</table>
</div>    
<div id="left">
<div id="Header">
<h3> Hello,<%=(String)session.getAttribute("username")%></h3>
</div>
<div class="content">
  <ul>
    <li class="home"><a href="<%=request.getContextPath()%>/MainFrame.jsp" target="_self">Home</a></li>
    <li class="about"><a href="#" target="_self">User Registration</a>
      <ul>
      <li class="about1"><a href="<%=request.getContextPath()%>/ClientRegistrationPage.jsp" target="_self">Add Client</a></li>
      <li class="about1"><a href="<%=request.getContextPath()%>/ReportsPages/ServiceSelectoreReport.jsp" target="_self">Select Service</a></li>
      <li class="about1"><a href="<%=request.getContextPath()%>/ReportsPages/UserDetailsReport.jsp" target="_self">Edit Client Details</a></li>
      </ul>
	</li>
    <li class="services"><a href="#">Vat </a>
      <ul>
      <li class="services1"><a href="<%=request.getContextPath()%>/ReportsPages/CommonQuerySelector.jsp" target="_self">Add Records</a></li>
      <li class="services1"><a href="<%=request.getContextPath()%>/ReportsPages/VatReport.jsp" target="_self">Vat Report</a></li>
      <li class="services1"><a href="<%=request.getContextPath()%>/ReportsPages/VatCommonReport.jsp" target="_self">Vat Services</a></li>
      <li class="services1"><a href="<%=request.getContextPath()%>/ReportsPages/VatAmountPending.jsp" target="_self">Pending Amount</a></li>
      </ul>
    </li>
    <li class="services"><a href="#">Party Wise report</a>
    <ul>
    <li class="services1"><a href="<%=request.getContextPath()%>/ReportsPages/CommonQuerySelector.jsp" target="_self">All Services</a></li>
     </ul>
    </li>
    <li class="contact"><a href="#">Contact</a>
      <ul>
      </ul>
	</li>
  </ul>
</div>
</div>
<script src="<%=request.getContextPath()%>/jqueryandcss/Aajx.Google.js"></script>
<script>
$("#customers tbody tr").live('dblclick', function() {	
	var curr_page = "<%=request.getContextPath()%>/VatFormApplication.jsp?UserPkey=<%=id%>&uStatus=update&UserId=<%=MainUserId%>";
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
	var next_page = "<%=request.getContextPath()%>/VatFormApplication.jsp?UserPkey=<%=id%>&uStatus=update&UserId=<%=MainUserId%>";
	window.location = next_page;	
}
</script>
</body>
<%}%>
</html>