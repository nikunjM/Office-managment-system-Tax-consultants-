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
		ResultSet resultset = null;
		ResultSet Tableresultset = null;
		ResultSet Tableresultset1 = null;
		ConnectionHelper connClass = new ConnectionHelper();
		Connection connect = connClass.connect();
		BhanuUserDetailsBean lRegistrationBean = new BhanuUserDetailsBean();
		BhanuUserEntryHelper userRegistrationHelper = new BhanuUserEntryHelper();
		VatFormHelper lVatBean=new VatFormHelper();
		ArrayList<VatFormHelper> editBean = new ArrayList<VatFormHelper>();
		//http://localhost:8080/IssueTracker/VatFormApplication.jsp?filter=+&Use	rPkey=11&uStatus=update
		//happens only for registration page so check id is null or not and perform.....
		String id = request.getParameter("UserPkey");//Gives User iD Which Helps to Update Page
		String action=request.getParameter("uStatus");//Decides its Update or Registration
		String MainUserId=request.getParameter("UserId");
		String Pkey=request.getParameter("VatPkey");
		System.out.println("User UserPKey And uStatus Values------------------->>"+id+action+MainUserId);
		if(id!=null)
		{
			statement = connect.createStatement();
			String QueryString = "SELECT Ser_id,Ser_UserId,ism.Usr_CompanyName,ism.Usr_VatNo,ism.Usr_FileNo,ism.Usr_ComapnyAllocation,ism.Usr_vatAllocated,ism.Usr_ConsultancyAllocation,Ser_vatperiod,Ser_vatSelection,Ser_vatAudit,ser_yearSelect from serviceselector isr INNER JOIN usrdetails ism on isr.Ser_UserId=ism.Usr_Id where Ser_id='"+id+"'";
			System.out.println(QueryString);
			resultset = statement.executeQuery(QueryString);
			while (resultset.next()) 
			{
				userRegistrationHelper.fillVatFiller(resultset,lRegistrationBean);
			}
		}
		else if (id == null) 
		{
		addIsNull=1;
		userRegistrationHelper.fillDurinNull(lRegistrationBean);
		}

			Tablestatement = connect.createStatement();
			String QueryStringTable = "SELECT Cst_Pkey,Cst_UserKey,Cst_Type,Cst_Period,Cst_AmountPayable,(Cst_amountPaid1+Cst_amountPaid2+Cst_amountPaid3+Cst_amountPaid4) as total,Cst_AckNo,Cst_AckNoDate,Cst_E1E2Form,Cst_Fform,Cst_Status	FROM cstservice vat	INNER JOIN serviceselector ser ON vat.Cst_SerKey=ser.Ser_Id	WHERE Cst_UserKey='"+lRegistrationBean.getBagNo()+"' AND ser.Ser_YearSelect='"+lRegistrationBean.getWorkPhone()+"'and Cst_type='Orignal'"; 		
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
			String QueryStringTable1 = "SELECT Cst_Pkey,Cst_UserKey,Cst_Type,Cst_Period,Cst_AmountPayable,(Cst_amountPaid1+Cst_amountPaid2+Cst_amountPaid3+Cst_amountPaid4) as total,Cst_AckNo,Cst_AckNoDate,Cst_E1E2Form,Cst_Fform,Cst_Status	FROM cstservice vat	INNER JOIN serviceselector ser ON vat.Cst_SerKey=ser.Ser_Id	WHERE Cst_UserKey='"+lRegistrationBean.getBagNo()+"' AND ser.Ser_YearSelect='"+lRegistrationBean.getWorkPhone()+"' and Cst_type='Revised'"; 		
			System.out.println(QueryStringTable1);
			Tableresultset1 = Tablestatement1.executeQuery(QueryStringTable1);
			ArrayList<ArrayList> Product1 = new ArrayList<ArrayList>();
			ArrayList nProduct1;
			int cnt1 = 0;
			while(Tableresultset1.next())
			{
				nProduct1=new ArrayList();
			    cnt1+=1;
			    nProduct1.add(String.valueOf(cnt));
			    for(int i=1;i<=11;i++) //replace 3 with the length of the columns
			    {
			    	nProduct1.add(Tableresultset1.getObject(i));
			    }
			    Product1.add(nProduct1);
			}
			   if (statement != null) try { statement.close(); } catch (SQLException ignore) {}
			   if (Tablestatement != null) try { Tablestatement.close(); } catch (SQLException ignore) {}
			   if (Tablestatement1 != null) try { Tablestatement1.close(); } catch (SQLException ignore) {}
		       if (resultset != null) try { resultset.close(); } catch (SQLException ignore) {}
			   if (Tableresultset != null) try { Tableresultset.close(); } catch (SQLException ignore) {}
			   if (Tableresultset1 != null) try { Tableresultset1.close(); } catch (SQLException ignore) {}
			   if (connect != null) try { connect.close(); } catch (SQLException ignore) {}
			%>
<head>
  <script src="<%=request.getContextPath()%>/jqueryandcss/jquery.min.js"></script>
  <link href="<%=request.getContextPath()%>/jqueryandcss/ScreenWithMenuCss.css"rel="stylesheet" type="text/css"/>
  <link href="<%=request.getContextPath()%>/jqueryandcss/TablenewCss.css"rel="stylesheet" type="text/css" />
  <script	src="<%=request.getContextPath()%>/jqueryandcss/Tabletogle.js"></script>
<script	src="<%=request.getContextPath()%>/jqueryandcss/PagingOfTable.js"></script>
<script src="<%=request.getContextPath()%>/jqueryandcss/Aajx.Google.js"></script>
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
$(document).ready(function(){
	$(".menu a").hover(function() 
	{
	  $(this).next("em").animate({opacity: "show",top: "-75"},50);
	}, function() {
	  $(this).next("em").animate({opacity: "hide",top: "-85"}, 10);
	});
});

$(document).ready(function() {
$('input.qty').change(function() {
	var totalamount=document.getElementById('AmountPayable').value;
    // Loop through all input's and re-calculate the total
    var total = 0;
    var AmouuntRem=0;
    $('input.qty').each(function()
    {
        total += parseInt(this.value);
        AmouuntRem =totalamount - total;
        if(AmouuntRem <=0)
        {
        	alert("Over Paid,Please Check Value");
        }
    });
    $("#totalRemaining").html(AmouuntRem);
    $("#totalPaid").html(total);
});
});
$(document).ready(function() {
	if("<%=lRegistrationBean.getVatService()%>"=="Monthly")
	{
		  $('.Half-Yr').remove();
		  $('.Yearly').remove();
		  $('.Quarter').remove();
	}
	if("<%=lRegistrationBean.getVatService()%>"=="HalfYearly")
	{
		  $('.Yearly').remove();
		  $('.Quarter').remove();
		  $('.Monthly').remove();
		  
	}
	if("<%=lRegistrationBean.getVatService()%>"=="Yearly")
	{
		  $('.Quarter').remove();
		  $('.Monthly').remove();
		  $('.Half-Yr').remove();
	}
	if("<%=lRegistrationBean.getVatService()%>"=="Quarterly")
	{
		  $('.Half-Yr').remove();
		  $('.Yearly').remove();
		  $('.Quarter').remove();
	}

});
function validateFormOnSubmit()
{
		var reason="";	
		reason += validateEmpty(CstForm.VatRemarks);
		reason += validateEmpty(CstForm.VatStatus);
		reason += validateEmpty(CstForm.HFromAppl);
		reason += validateEmpty(CstForm.CFromAppl);
		reason += validateEmpty(CstForm.AckNoDate);
		reason += validateEmpty(CstForm.AckNo);
		reason += validateEmpty(CstForm.AmountPayable);
		reason += validateEmpty(CstForm.VatPeriod);
		reason += validateEmpty(CstForm.VatType);
		reason += validateEmpty(CstForm.AckNo);
		reason += validateEmpty(CstForm.AckNoDate);
		reason += validateCheckDate(CstForm.pre_AmountPaid1,CstForm.AmountPaidDate1);
		reason += validateCheckDate(CstForm.pre_AmountPaid2,CstForm.AmountPaidDate2);
		reason += validateCheckDate(CstForm.pre_AmountPaid3,CstForm.AmountPaidDate3);
		reason += validateCheckDate(CstForm.pre_AmountPaid4,CstForm.AmountPaidDate4);
		reason += validateCheckDate(CstForm.AckNo,CstForm.AckNoDate);
		if (reason != "") 
		{
		alert("Some fields need correction:\n" + reason);
			return false;
		} else {
			document.CstForm.submit();
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
</script>
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
#UserFrom,#UserServiceFrom,#ServiceSelectiontable,#yrselection{
	border: 1px solid red;
	background-color: white;
		}
table td.Title {
	text-align: left;
	padding: 3px 7px 2px 7px;
	vertical-align: bottom;
	width: 200px;
	background-color: orange;
	}
	
table td.Title1 {
	text-align: left;
	padding: 3px 7px 2px 7px;
	vertical-align: bottom;
	width: 150px;
	background-color: orange;
	}
table input[type=text],input[type=password] {
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
select {
	width: 190px;
	text-align: left;
	padding: 3px 7px 2px 7px;
}
.opt1{
	text-align: center;
	vertical-align: middle;
}
	div#hide {
	visibility: hidden;
			}
*{
text-transform: capitalize;
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
	background: #dbe8bf url(<%=request.getContextPath()%>/images/images/add_row.png) 6px 4px no-repeat;
	padding: 3px 4px 3px 25px;
	border: 1px solid #a3c261;
}
input[type=radio]{ display:inline !important; }
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Service Selection Page</title>
</head>
<body >
 <div id="mainarea">
 <br>
 <div id="clean"></div>
 <form name="CstForm" id="CstForm" style="padding-top: 0px; margin-top: 0px;"action="<%=request.getContextPath()%>/CstformRegistration" method="post"onsubmit="javascript:return false;">
			<table id="UserFrom" cellspacing="5" cellpadding="0" width="90%">
			<tr>
			<td class="Title">Company Name </td>
			<td><b><%=lRegistrationBean.getCompanyName() %></b>
			<input name="PKey" type="hidden" id="PKey" value="<%=lRegistrationBean.getBagNo()%>" />
			<input name="SerKey" type="hidden" id="SerKey" value="<%=lRegistrationBean.getpKey()%>" />
			<input type="Hidden" id="EntryMAdeBy" name="EntryMAdeBy" value="<%=(String)session.getAttribute("username")%>"/></td>
			</tr>
			<tr>
			<td class="Title">Cst NO</td>
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
			<td class="Title">Cst Person Allocation   </td>
			<td><%=lRegistrationBean.getConsultancyAllocation()%><input name="PeriodCity" type="hidden" id="PeriodCity" value="<%=lRegistrationBean.getVatService()%>" /></td>
			<td class="Title">Cst Periodicity   </td>
			<td><%=lRegistrationBean.getVatService()%><input name="PeriodCity" type="hidden" id="PeriodCity" value="<%=lRegistrationBean.getVatService()%>" /></td>
			</tr>
			<tr>
			<td class="Title">Cst audit </td>
			<td><%=lRegistrationBean.getTitle()%></td>
			<td class="Title">Assestment Year</td>
			<td><%=lRegistrationBean.getWorkPhone()%><input name="AssYr" type="hidden" id="AssYr" value="<%=lRegistrationBean.getTitle()%>" /></td>
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
				<option value="" class="Monthly">select</option>
				<option value="M1"  class="Monthly">1st Apr-30th April</option>
				<option value="M2"  class="Monthly">1st May-31th May</option>
				<option value="M3"  class="Monthly">1st June-30th June</option>
				<option value="M4"  class="Monthly">1st July-31st July</option>
				<option value="M5"  class="Monthly">1st Aug-31st Aug</option>
				<option value="M6"  class="Monthly">1st Sep-30th Sep</option>
				<option value="M7"  class="Monthly">1st Oct-31st Oct</option>
				<option value="M8"  class="Monthly">1st Nov-30th Nov</option>
				<option value="M9"  class="Monthly">1st Dec-31th Dec</option>
				<option value="M10" class="Monthly">1st Jan-301st Jan</option>
				<option value="M11" class="Monthly">1st Feb-28th Dec</option>
				<option value="M12" class="Monthly">1st Mar-31th Mar</option>
				<option value="Q1"  class="Quarter">1st Apr-30th June</option>
				<option value="Q2"  class="Quarter">1st July-31th Sep</option>
				<option value="Q3"  class="Quarter">1st Oct-30th Dec</option>
				<option value="Q4"  class="Quarter">1st Jan-31st March</option>
				<option value="H1"  class="Half-Yr">1st Apr-30th Sep</option>
				<option value="H2"  class="Half-Yr">1st Oct-31th Mar</option>
				<option value="Y1"  class="Yearly">1st April-31th Mar</option>
			</select>
			</td>
			</tr>
			<tr>
			<td class="Title">Amount Payable</td>
			<td><input name="AmountPayable" maxlength="20" type="text" id="AmountPayable" value="" />
			</td>
			</tr>
			<tr>
			<td class="Title">Amount Paid 1</td>
			<td>
			<input name="pre_AmountPaid1" class="qty" maxlength="20" type="text" id="pre_AmountPaid1" value="0" />
			</td>
			<td class="Title">Amount Paid Date</td>
			<td>
			<input name="AmountPaidDate1" maxlength="20" type="text" id="AmountPaidDate1" value="" />
			</td>
			</tr>
			<tr>
			<td class="Title">Amount Paid 2</td>
			<td>
			<input name="pre_AmountPaid2" class="qty" maxlength="20" type="text" id="pre_AmountPaid2" value="0" />
			<td class="Title">Amount Paid Date</td>
			<td>
			<input name="AmountPaidDate2" maxlength="20" type="text" id="AmountPaidDate2" value="" />
			</td>
			</tr>
			<tr>
			<td class="Title">Amount Paid 3</td>
			<td>
			<input name="pre_AmountPaid3" class="qty" maxlength="20" type="text" id="pre_AmountPaid3" value="0" />
			<td class="Title">Amount Paid Date</td>
			<td>
			<input name="AmountPaidDate3" maxlength="20" type="text" id="AmountPaidDate3" value="" />
			</td>
			</tr>
			<tr>
			<td class="Title">Amount Paid 4</td>
			<td>
			<input name="pre_AmountPaid4" class="qty" maxlength="20" type="text" id="pre_AmountPaid4" value="0" />
			<td class="Title">Amount Paid Date</td>
			<td>
			<input name="AmountPaidDate4" maxlength="20" type="text" id="AmountPaidDate4" value="" />
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
			<input type="text" id="AckNo" Name="AckNo" value=" " maxlength="15"/>
			</td>
			<td class="Title">Acknowledge No Date</td>
			<td>
			<input type="text" id="AckNoDate" Name="AckNoDate" value=" " maxlength="15"/>
			</td>
			</tr>
			<tr>
			<td class="Title">E1/E2 Form</td>
			<td>
			<select id="E1FromAppl" name="CFromAppl">
				<option value="">select</option>
				<option value="Yes">Yes</option>
				<option value="No">No</option>
				</select>
			</td>
			<td class="Title">F Form</td>
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
			<td colspan="4"><textarea id="VatRemarks" rows="2" cols="80"></textarea>
			</tr>
			<tr>
			<td></td>
			<td><button onclick="validateFormOnSubmit();">Add</button></td>
			<td><button onclick="resetform();">Clear</button></td>
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
<div id="flip12">Menu</div>
<br>
<div id="panel12">
<ul class="menu">
	<li><a href="<%=request.getContextPath()%>/MainFrame.jsp" target="_self"><b>Home page</b>
		</a> <em style="width: 100px">Goes To Home Page</em><br />
		</li>
		<ul>
			<li><a href="<%=request.getContextPath()%>/ClientRegistrationPage.jsp" target="_self"><b>Registrationpage</b></a>
			 <em style="width: 100px">Admin Can Add New User Data</em>
			</li>
			<br/>
		</ul>
		<li><a href="<%=request.getContextPath()%>/IssueRegisterPage.jsp" target="_self"><b>ComplainForm</b>
		</a> <em style="width: 100px">User Can RegisterIts Complain </em><br />
		</li>
		<li><a href="<%=request.getContextPath()%>/ReportsPages/ServiceSelectoreReport.jsp" target="_self"><b>Issue Reports</b>
		</a> <em>The Technical team Can Review the Reoprts</em><br />
		</li>
		<li><a href="<%=request.getContextPath()%>/ReportsPages/UserDetailsReport.jsp" target="_self">User Reports<b></b>
		</a> <em>Admin Can View User Details </em><br />
		</li>
	</ul>
</div>
</div>
</body>
<%}%>

  
</html>