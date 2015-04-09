<%@page import="com.bhanu.helperss.BhanuUserEntryHelper"%>
<%@page import="com.bhanu.helperss.ConnectionHelper"%>
<%@page import="com.bhanu.helperss.BhanuSessionCheckerHelper"%>
<%@page import="com.bhanu.Bean.BhanuUserDetailsBean"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
		ResultSet resultset = null;
		Statement Tablestatement = null;
		ResultSet Tableresultset = null;
		ConnectionHelper connClass = new ConnectionHelper();
		Connection connect = connClass.connect();
		BhanuUserDetailsBean lRegistrationBean = new BhanuUserDetailsBean();
		BhanuUserEntryHelper userRegistrationHelper = new BhanuUserEntryHelper();
		
		//happens only for registration page so check id is null or not and perform.....
		String id = request.getParameter("UserPkey");//Gives User iD Which Helps to Update Page
		String action=request.getParameter("uStatus");//Decides its Update or Registration
		System.out.println("User UserPKey And uStatus Values------------------->>"+id+action);
		if(id!=null)
		{
			statement = connect.createStatement();
			//select * from usrdetails where Usr_Id='1'
			String QueryString = "SELECT * from usrdetails where Usr_Id="+id;
			System.out.println(QueryString);
			resultset = statement.executeQuery(QueryString);
			while (resultset.next()) 
			{
				userRegistrationHelper.fill(resultset,lRegistrationBean);
			}
		}
		else if (id == null) 
		{
		addIsNull=1;
		userRegistrationHelper.fillDurinNull(lRegistrationBean);
		}
		Tablestatement = connect.createStatement();
		String QueryStringTable = "select * from serviceselector where Ser_UserId='"+id+"'"; 		
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
		    for(int i=1;i<=26;i++) //replace 3 with the length of the columns
		    {
		    	nProduct.add(Tableresultset.getObject(i));
		    }
		    Product.add(nProduct);
		}
		   if (statement != null) try { statement.close(); } catch (SQLException ignore) {}
		   if (Tablestatement != null) try { Tablestatement.close(); } catch (SQLException ignore) {}
	       if (resultset != null) try { resultset.close(); } catch (SQLException ignore) {}
		   if (Tableresultset != null) try { Tableresultset.close(); } catch (SQLException ignore) {}
		   if (connect != null) try { connect.close(); } catch (SQLException ignore) {}
		%>
<head>
<script src="<%=request.getContextPath()%>/jqueryandcss/jquery.min.js"></script>
  <link href="<%=request.getContextPath()%>/jqueryandcss/ScreenWithMenuCss.css"rel="stylesheet" type="text/css"/>
  <link href="<%=request.getContextPath()%>/jqueryandcss/TablenewCss.css"rel="stylesheet" type="text/css" />
  <script	src="<%=request.getContextPath()%>/jqueryandcss/Tabletogle.js"></script>
<script	src="<%=request.getContextPath()%>/jqueryandcss/PagingOfTable.js"></script>
<script src="<%=request.getContextPath()%>/jqueryandcss/Aajx.Google.js"></script>
<script type="text/javascript">
function validateFormOnSubmit()
{
		var reason="";	
		reason += validateEmpty(ServiceSelection.YrSelect);
		reason += validateEmpty(ServiceSelection.VatSelect);
		reason += validateEmpty(ServiceSelection.YrSelectPTEC);
		reason += validateEmpty(ServiceSelection.PTRCYrSelect);
		reason += validateEmpty(ServiceSelection.ExciseYrSelect);
		reason += validateEmpty(ServiceSelection.SerTaxYrSelect);
		reason += validateEmpty(ServiceSelection.TDSYrSelect);
		reason += validateEmpty(ServiceSelection.IncomTaxYrSelect);
		
		if (reason != "") {
			alert("Some fields need correction:\n" + reason);
			return false;
		} else {
			document.ServiceSelection.submit();
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
	function setSelectedIndex(s, valsearch) 
	{
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
	function CheckDropDownSelection(HeadValue,hide1,hide2)
	{
		var element=HeadValue.value;
		if(element=="No")
		{
			hide1.style.display = 'none';
			hide2.style.display = 'none';
		}
		else
		{
			hide1.style.display = 'show';
			hide2.style.display = 'show';
		}
	}
	function Start() {
		var f = document.getElementById('ServiceSelection');
		for ( var i = 0; i < f.elements.length; i++) {
			alert(f.elements[i].id);
			document.getElementById('clean').innerHTML;
		}
	}
	function redirect()
	{
		var ValueId=<%=id%>;
		if(ValueId== null)
		{
			var next_page = "<%=request.getContextPath()%>/ReportsPages/ServiceSelectoreReport.jsp";
			window.location = next_page;
		}
	}
	
	$(document).ready(function() 
	{
		redirect();
	});
	
</script>
<style type="text/css">
body {
	font: 1.364em/1.867em 'Roadgeek2005OldParksRegular', Georgia, sans-serif;
	font-family: verdana, arial, sans-serif;
	font-size: 10pt;
	margin: 0px;
	color: #fffff;
}
#UserFrom,#UserServiceFrom,#ServiceSelectiontable{
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
	width: 270px;
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
input[type=radio]{ display:inline !important; }

.activeHide
{
background-color: #ff0000;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Service Selection Page</title>
</head>
<body>
<span id=sessioncheck></span>
 <div id="mainarea">
 <br>
  <form name="ServiceSelection" id="ServiceSelection" style="padding-top: 0px; margin-top: 0px;"action="<%=request.getContextPath()%>/ServiceSelectoreServlet" method="post"onsubmit="javascript:return false;">
			<table id="UserFrom" cellspacing="5" cellpadding="0">
			<tr>
			<td class="Title">Company Name</td>
			<td><b><%=lRegistrationBean.getCompanyName() %></b></td>
			</tr>
			<tr>
			<td class="Title">VAT NO</td>
			<td><%=lRegistrationBean.getVatNo()%></td>
			<td class="Title">PTEC NO</td>
			<td><%=lRegistrationBean.getPTECNO()%></td>
			<td class="Title">PTRC NO</td>
			<td><%=lRegistrationBean.getPTRCNO()%></td>
			</tr>
			<tr>
			<td class="Title">Excise NO</td>
			<td><%=lRegistrationBean.getExciseNo()%></td>
			<td class="Title">Service Tax NO</td>
			<td><%=lRegistrationBean.getSerTaxNo()%></td>
			<td class="Title">Tds NO</td>
			<td><%=lRegistrationBean.getTdsNo()%></td>
			</tr>
			<tr>
			<td class="Title">Income Tax NO</td>
			<td><%=lRegistrationBean.getIncomeTaxNo()%></td>
			</tr>
			<tr><td><div id="lblValues"></div></td></tr>
		</table>
		<br><br>
		<TABLE id ="customers" class="sortable" cellpadding="0" cellspacing="0" border="0">
	<thead >
	<tr class="headercell">
	<th class="sort-alpha"><h3>ID</h3></th>
	<th class="sort-alpha"><h3>Service Selected</h3></th>
	<th class="sort-alpha"><h3>Vat Selection</h3></th>
	<th class="sort-alpha"><h3>Vat Periodicity</h3></th>
	<th class="sort-alpha"><h3>Vat Audit</h3></th>
	
	<th class="sort-alpha"><h3>PTEC Selection</h3></th>
	<th class="sort-alpha"><h3>PTEC Periodicity</h3></th>
	<th class="sort-alpha"><h3>PTEC Audit</h3></th>
	
	<th class="sort-alpha"><h3>PTRC Selection</h3></th>
	<th class="sort-alpha"><h3>PTRC Periodicity</h3></th>
	<th class="sort-alpha"><h3>PTRC Audit</h3></th>
	
	
	<th class="sort-alpha"><h3>Excise Selection</h3></th>
	<th class="sort-alpha"><h3>Excise Periodicity</h3></th>
	<th class="sort-alpha"><h3>Excise Audit</h3></th>
	
	
	<th class="sort-alpha"><h3>ServiceTax Selection</h3></th>
	<th class="sort-alpha"><h3>ServiceTax Periodicity</h3></th>
	<th class="sort-alpha"><h3>ServiceTax Audit</h3></th>
	
	<th class="sort-alpha"><h3>TDS Selection</h3></th>
	<th class="sort-alpha"><h3>TDS Periodicity</h3></th>
	<th class="sort-alpha"><h3>TDS Audit</h3></th>
	
	<th class="sort-alpha"><h3>IncomeTax Selection</h3></th>
	<th class="sort-alpha"><h3>IncomeTax Periodicity</h3></th>
	<th class="sort-alpha"><h3>IncomeTax Audit</h3></th>
	<th class="sort-alpha"><h3>Person Allocated</h3></th>
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
				<TD><%=temp.get(12)%></td>
				<TD><%=temp.get(13)%></td>
				<TD><%=temp.get(14)%></td>
				<TD><%=temp.get(15)%></td>
				<TD><%=temp.get(16)%></td>
				<TD><%=temp.get(17)%></td>
				<TD><%=temp.get(18)%></td>
				<TD><%=temp.get(19)%></td>
				<TD><%=temp.get(20)%></td>
				<TD><%=temp.get(21)%></td>
				<TD><%=temp.get(22)%></td>
				<TD><%=temp.get(23)%></td>
				<TD><%=temp.get(24)%></td>
				<TD><%=temp.get(25)%></td>
				</tr>
				<%i++;				
				}%>
			</tbody>
		</TABLE>
		<br>
		<Div>
		<table id="yrselection" cellspacing="5" cellpadding="0">
		<tr><td colspan="3"><%if (request.getAttribute("messageSer") != null) {%>
			<div id='result' style="font-size:24pt;font-family:times new roman;font-weight:bold;font-style:italic;color:red;">
			<%=request.getAttribute("messageSer")%></div>
			<%} else {%><div id='result'><b></b></div><%}%></td>
			</tr>
		<tr>
			<td class="Title">Select Year</td>
			<td>	<select id="YrSelect" name="YrSelect">
					<option value="" >Select</option>
					<option value="2008-09">2008-09</option>
					<option value="2009-10">2009-10</option>
					<option value="2010-11">2010-11</option>
					<option value="2011-12">2011-12</option>
					<option value="2012-13">2012-13</option>
					<option value="2013-14">2013-14</option>
					<option value="2014-15">2014-15</option>
					<option value="2015-16">2015-16</option>
					<option value="2016-17">2016-17</option>
					<option value="2017-18">2017-18</option>
					<option value="2018-19">2018-19</option>
					<option value="2019-20">2019-20</option>
					<option value="2020-21">2020-21</option>
			</select>
			</td>
			<td><input name="UserPkey" maxlength="6" type="hidden" id="UserPkey" value="<%=lRegistrationBean.getpKey() %>" readonly="readonly"/></td>
			<td><input name="ServicecPkey" maxlength="6" type="hidden" id="ServicecPkey" value="<%=lRegistrationBean.getpKey() %>" readonly="readonly"/>
			<input type="Hidden" id="EntryMAdeBy" name="EntryMAdeBy" value="<%=(String)session.getAttribute("username")%>"/></td><!-- Use for update or insert process -->
			</tr>
		</table>
		</Div>
		<table id="ServiceSelectiontable" cellspacing="5" cellpadding="0">
			<tr>
			<td class="Title1">Vat/Cst</td>
			<td>	
			<select id="VatSelect" name="VatSelect" onchange="CheckDropDownSelection(VatSelect,VatType,VatAudit)">
			<option value="">Select</option>
			<option value="Yes">Yes</option>
			<option value="No">No</option>
			</select>
			</td>
			<td class="Title1">Period</td>
			<td>	
			<select id="VatType" name="VatType">
			<option value="" >Select</option>
			<option value="Monthly">Monthly</option>
			<option value="Quarterly">Quarterly</option>
			<option value="HalfYearly">Half Yearly</option>
			<option value="Yearly">Yearly</option>
			</select>
			</td>
			<td class="Title1">Audit</td>
			<td>	
			<select id="VatAudit" name="VatAudit">
			<option value="" >Select</option>
			<option value="Yes">Yes</option>
			<option value="No">No</option>
			</select>
			</td>
			</tr>
			<tr>
			<td class="Title1">PTEC</td>
			<td>	
			<select id="YrSelectPTEC" name="YrSelectPTEC" onchange="CheckDropDownSelection(YrSelectPTEC,PTECType,PTECAudit)">
			<option value="" >Select</option>
			<option value="Yes">Yes</option>
			<option value="No">No</option>
			</select>
			</td>
			<td class="Title1">Period</td>
			<td>	
			<select id="PTECType" name="PTECType">
			<option value="Yearly">Yearly</option>
			</select>
			</td>
			<td class="Title1">Audit</td>
			<td>	
			<select id="PTECAudit" name="PTECAudit">
			<option value="No">No</option>
			</select>
			</td>
			</tr>
			<tr>
			<td class="Title1">PTRC</td>
			<td>	
			<select id="PTRCYrSelect" name="PTRCYrSelect" onchange="CheckDropDownSelection(PTRCYrSelect,PTRCType,PTRCAudit)">
			<option value="" >Select</option>
			<option value="Yes">Yes</option>
			<option value="No">No</option>
			</select>
			</td>
			<td class="Title1">Period</td>
			<td>	
			<select id="PTRCType" name="PTRCType">
			<option value="" >Select</option>
			<option value="Monthly">Monthly</option>
			<option value="Quarterly">Quarterly</option>
			<option value="HalfYearly">Half Yearly</option>
			<option value="Yearly">Yearly</option>
			</select>
			</td>
			<td class="Title1">Audit</td>
			<td>	
			<select id="PTRCAudit" name="PTRCAudit">
			<option value="No">No</option>
			</select>
			</td>
			</tr>
			<tr>
			<td class="Title1">Excise</td>
			<td>	
			<select id="ExciseYrSelect" name="ExciseYrSelect" onchange="CheckDropDownSelection(ExciseYrSelect,ExciseType,ExciseAudit)">
			<option value="" >Select</option>
			<option value="Yes">Yes</option>
			<option value="No">No</option>
			</select>
			</td>
			<td class="Title1">Period</td>
			<td>	
			<select id="ExciseType" name="ExciseType">
			<option value="" >Select</option>
			<option value="Monthly">Monthly</option>
			<option value="Quarterly">Quarterly</option>
			<option value="HalfYearly">Half Yearly</option>
			<option value="Yearly">Yearly</option>
			</select>
			</td>
			<td class="Title1">Audit</td>
			<td>	
			<select id="ExciseAudit" name="ExciseAudit">
			<option value="" >Select</option>
			<option value="Yes">Yes</option>
			<option value="No">No</option>
			</select>
			</td>
			</tr>
			<tr>
			<td class="Title1">Service Tax</td>
			<td>	
			<select id="SerTaxYrSelect" name="SerTaxYrSelect" onchange="CheckDropDownSelection(SerTaxYrSelect,SerTaxType,ServiceAudit)">
			<option value="" >Select</option>
			<option value="Yes">Yes</option>
			<option value="No">No</option>
			</select>
			</td>
			<td class="Title1">Period</td>
			<td>	
			<select id="SerTaxType" name="SerTaxType">
			<option value="" >Select</option>
			<option value="Monthly">Monthly</option>
			<option value="Quarterly">Quarterly</option>
			<option value="HalfYearly">Half Yearly</option>
			<option value="Yearly">Yearly</option>
						</select>
			</td>
			<td class="Title1">Audit</td>
			<td>	
			<select id="ServiceAudit" name="ServiceAudit">
			<option value="" >Select</option>
			<option value="Yes">Yes</option>
			<option value="No">No</option>
			</select>
			</td>
			</tr>
			<tr>
			<td class="Title1">TDS</td>
			<td>	
			<select id="TDSYrSelect" name="TDSYrSelect" onchange="CheckDropDownSelection(TDSYrSelect,TDSType,TDSAudit)">
			<option value="" >Select</option>
			<option value="Yes">Yes</option>
			<option value="No">No</option>
			</select>
			</td>
			<td class="Title1">Period</td>
			<td>	
			<select id="TDSType" name="TDSType">
			<option value="" >Select</option>
			<option value="Quarterly">Quarterly</option>
			</select>
			</td>
			<td class="Title1">Audit</td>
			<td>	
			<select id="TDSAudit" name="TDSAudit">
			<option value="No">No</option>
			</select>
			</td>
			</tr>
			<tr>
			<td class="Title1">Income Tax</td>
			<td>	
			<select id="IncomTaxYrSelect" name="IncomTaxYrSelect" onchange="CheckDropDownSelection(IncomTaxYrSelect,IncomTaxType,InocmeTaxAudit)">
			<option value="" >Select</option>
			<option value="Yes">Yes</option>
			<option value="No">No</option>
			</select>
			</td>
			<td class="Title1">Period</td>
			<td>	
			<select id="IncomTaxType" name="IncomTaxType">
			<option value="Yearly">Yearly</option>
			</select>
			</td>
			<td class="Title1">Audit</td>
			<td>	
			<select id="InocmeTaxAudit" name="InocmeTaxAudit">
			<option value="" >Select</option>
			<option value="Yes">Yes</option>
			<option value="No">No</option>
			</select>
			</td>
			</tr>
			<tr>
			<td><button onclick="validateFormOnSubmit();">Register</button></td>
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
</body>
<%}%>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js">
</script>
<script>
$(document).ready(function(){
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
</script>
</html>