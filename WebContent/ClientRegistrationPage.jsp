	<%@page import="com.bhanu.helperss.BhanuUserEntryHelper"%>
<%@page import="com.bhanu.helperss.ConnectionHelper"%>
<%@page import="com.bhanu.helperss.BhanuSessionCheckerHelper"%>
<%@page import="com.bhanu.Bean.BhanuUserDetailsBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page language="java" import="java.util.List"	import="java.sql.*" import="com.IssueHelper.*" import="java.text.SimpleDateFormat" import="java.util.Calendar"%>
 <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
<title> Client Registration Form</title>
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
		if (statement != null) try { statement.close(); } catch (SQLException ignore) {}
	       if (resultset != null) try { resultset.close(); } catch (SQLException ignore) {}
		   if (connect != null) try { connect.close(); } catch (SQLException ignore) {}
%>
<link href="<%request.getContextPath();%>./jqueryandcss/jquery-ui.css"rel="stylesheet" type="text/css" />
<script src="<%request.getContextPath();%>./jqueryandcss/jquery.min.js"></script>
<script	src="<%request.getContextPath();%>./jqueryandcss/jquery-ui.min.js"></script>
<script src="<%=request.getContextPath()%>/jqueryandcss/DateFormatter.js"></script>
<link href="<%=request.getContextPath()%>/jqueryandcss/ScreenWithMenuCss.css"rel="stylesheet" type="text/css" />
<script type="text/javascript">
var peran = new Array("<%=lRegistrationBean.getVatService()%>", "<%=lRegistrationBean.getIncomeTaxService()%>", "<%=lRegistrationBean.getTDSService()%>", "<%=lRegistrationBean.getPTECService()%>", "<%=lRegistrationBean.getPTRCService()%>", "<%=lRegistrationBean.getSerTaxService()%>", "<%=lRegistrationBean.getExciseService()%>");
        $(document).ready(function() {
              $(".ceks").each(function(){
                var attrib = $(this).attr("value");
                for(var x=0; x<peran.length; x++){
                    if( peran[x] == attrib ){
                        $(this).attr("checked", "checked");
                    }
                }
              });
        });
function validateFormOnSubmit()
{
	var reason="";
	reason += validateEmpty(ClientRegForm.TitleDrop);
	reason += validateEmpty(ClientRegForm.ComapnyName);
	reason += validateEmpty(ClientRegForm.FileNo);
	reason += validateEmpty(ClientRegForm.BagNo);
	reason += validateEmpty(ClientRegForm.FirstName);
	reason += validateEmpty(ClientRegForm.MiddleName);
	reason += validateEmpty(ClientRegForm.LastName);
	reason += validateEmpty(ClientRegForm.EmailId);
	reason += validateEmpty(ClientRegForm.PhoneNo1);
	reason += validateEmpty(ClientRegForm.PhoneNo2);
	reason += validateEmpty(ClientRegForm.WorkPhone1);
	reason += validateEmpty(ClientRegForm.PersonAllocation);
	reason += validateEmpty(ClientRegForm.FirmAllocation);
	reason += validateEmpty(ClientRegForm.PanNo);
	reason += validateEmpty(ClientRegForm.TANNo);
	if (reason != "") {
		alert("Some fields need correction:\n" + reason);
		return false;
	}
	else
	{
	document.ClientRegForm.submit();
	return true;
	}
}
function validateEmpty(fld) {
	var error = "";
	if (fld.value.length == 0) {
		fld.style.background = 'Yellow';
		error = "Please Fill" + fld.name+"\n";
	} else {
		fld.style.background = 'White';
	}
	return error;
}

function setSelectedIndex(s,valsearch)
{
// Loop through all the items in drop down list
for (i = 0; i< s.options.length; i++)
{ 
if (s.options[i].value == valsearch)
{
// Item is found. Set its property and exit
s.options[i].selected = true;
break;
}
}
return;
}
function enableDisable(oChk)
{
var disable = !oChk.checked;
var arglen = arguments.length;
var obj, startIndex = 1;
var frm = oChk.form;
for (var i=startIndex;i<arglen;i++){
obj = frm.elements[arguments[i]];
if (typeof obj=="object"){
if (document.layers) {
if (disable){
obj.onfocus=new Function("this.blur()");
if (obj.type=="text") obj.onchange=new Function("this.value=this.defaultValue");
}
else {
obj.onfocus=new Function("return");
if (obj.type=="text") obj.onchange=new Function("return");
}
}
else obj.disabled=disable;
}
}
}
function resetform()
{
    var fm=document.getElementById('ClientRegForm');
    fm.reset();
}

function start()
{	
	setSelectedIndex(document.getElementById("TitleDrop"),"<%=lRegistrationBean.getTitle()%>");
	setSelectedIndex(document.getElementById("PersonAllocationVat"),"<%=lRegistrationBean.getVatAllocated()%>");
	setSelectedIndex(document.getElementById("PersonAllocationPTEC"),"<%=lRegistrationBean.getPTECAllocated()%>");
	setSelectedIndex(document.getElementById("PersonAllocationPTRC"),"<%=lRegistrationBean.getPTRCAllocated()%>");
	setSelectedIndex(document.getElementById("PersonAllocationExcise"),"<%=lRegistrationBean.getExciseAllocated()%>");
	setSelectedIndex(document.getElementById("PersonAllocationServiceTaxNo"),"<%=lRegistrationBean.getSerTaxAllocation()%>");
	setSelectedIndex(document.getElementById("PersonAllocationTDSSer"),"<%=lRegistrationBean.getTdsAllocation()%>");
	setSelectedIndex(document.getElementById("PersonAllocationIncomeTaxNo"),"<%=lRegistrationBean.getIncomeTaxAllocation()%>");
	setSelectedIndex(document.getElementById("PersonAllocation"),"<%=lRegistrationBean.getComapnyAllocation()%>");
	setSelectedIndex(document.getElementById("FirmAllocation"),"<%=lRegistrationBean.getConsultancyAllocation()%>");
}
</script>
<style type="text/css">
body {
	font: 1.364em/1.867em 'Roadgeek2005OldParksRegular', Georgia, sans-serif;
	font-family: verdana, arial, sans-serif;
	font-size: 10pt;
	margin: 0px;
	color: #fffff;
}
#UserFrom,#UserServiceFrom{
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
	width: 285px;
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
</style>
</head>
<body onload="start();">
<span id=sessioncheck></span>
 <div id="mainarea">
 <br>
 <form name="ClientRegForm" id="ClientRegForm" style="padding-top: 0px; margin-top: 0px;"action="<%=request.getContextPath()%>/BhanuRegistration" method="post"onsubmit="javascript:return false;">
	<table id="UserFrom" cellspacing="5" cellpadding="0">
		<tr>
			<td class="Title">Title</td>
				<td><select id="TitleDrop" name="TitleDrop">
					<option value="Mr">Mr.</option>
					<option value="Ms">Ms.</option>
					<option value="Mrs">Mrs.</option>
					<option value="Miss">Miss.</option>
			</select>
			</td>
			<td class="Title">Client Id</td>
			<td><input name="UserPkey" maxlength="6" type="text" id="UserPkey" value="<%=lRegistrationBean.getpKey() %>" readonly="readonly" />
			<input name="nullchecker" id="nullchecker" type="hidden" value="<%=addIsNull%>">
			<input type="Hidden" id="EntryMAdeBy" name="EntryMAdeBy" value="<%=(String)session.getAttribute("username")%>"/>
			</td>
			</tr>
			<tr>
			<td class="Title">Comapny Name</td>
			<td><input name="ComapnyName" maxlength="20" type="text" id="ComapnyName" value="<%=lRegistrationBean.getCompanyName()%>" /></td>
			</tr>
			<tr>
			<td class="Title">PAN No</td>
			<td><input name="PanNo" maxlength="10" type="text" id="PanNo" value="<%=lRegistrationBean.getPANNo()%>"/></td>
			<td class="Title">TAN No</td>
			<td><input name="TANNo" maxlength="10" type="text" id="TANNo" value="<%=lRegistrationBean.getTanNo()%>"/></td>
			</tr>
			<tr>
			<td class="Title">File No</td>
			<td><input name="FileNo" maxlength="3" type="text" id="FileNo" value="<%=lRegistrationBean.getFileNo()%>" />
			</td>
			<td class="Title">Bag No</td>
		    <td><input name="BagNo" maxlength="3" type="text" id="BagNo" value="<%=lRegistrationBean.getBagNo()%>" />
			</td>
			</tr>
			<tr>
			<td class="Title">First Name</td>
			<td><input name="FirstName" maxlength="16" type="text"id="FirstName"  value="<%=lRegistrationBean.getFirstName()%>"/></td>
			<td class="Title">Middle Name</td>
			<td><input name="MiddleName" maxlength="15" type="text" id="MiddleName"  value="<%=lRegistrationBean.getMiddleName()%>" /></td>
			</tr>
			<tr>
			<td class="Title">Last Name</td>
			<td><input name="LastName" maxlength="15" type="text" id="LastName"  value="<%=lRegistrationBean.getLastName()%>" /></td>
			<td class="Title">Email Id</td>
			<td><input name="EmailId" maxlength="26" type="text" id="EmailId"  value="<%=lRegistrationBean.getEmailId()%>"/></td>
			</tr>
		<tr>
			<td class="Title">Phone No1</td>
			<td><input name="PhoneNo1" maxlength="10" type="text" id="PhoneNo1"  value="<%=lRegistrationBean.getMobileNo1()%>" /></td>
			<td class="Title">Phone No2</td>
			<td><input name="PhoneNo2" maxlength="10" type="text" id="PhoneNo2"  value="<%=lRegistrationBean.getMoblieNo2()%>" /></td>
		</tr>
		<tr>
			<td class="Title">Work Phone</td>
			<td><input name="WorkPhone1" maxlength="10" type="text" id="WorkPhone1"  value="<%=lRegistrationBean.getWorkPhone()%>" /></td>
		</tr>
		</table>
		<br>
		<br>
		<table id="UserServiceFrom" cellspacing="5" cellpadding="0">
		<tr>
			<td class="Title">Vat</td>
			<td>
			<!-- <input name="VatSer" type="checkbox" id="VatSer" value="1V" class="ceks" onclick="enableDisable(this,'VatNo','PersonAllocationVat')"  /> -->
			<!--  onclick="enableDisable(this,'text1','checkbox1','select1')" if want to add more function--> 
			<input name="VatNo" maxlength="10" type="text" id="VatNo" value="<%=lRegistrationBean.getVatNo()%>"/>
			</td>
			<td class="Title">Person Allocation</td>
			<td><select id="PersonAllocationVat" name="PersonAllocationVat">
					<option value=" ">Select</option>
					<option value="Mary">Mary</option>
					<option value="Heema">Heema</option>
					<option value="Neha">Neha</option>
			</select>
			</td>
			</tr>
			<tr>
			<td class="Title">PTEC</td>
			<td> 
			<!-- <input name="PTECSer" type="checkbox" id="PTECSer" value="1PT" class="ceks" onclick="enableDisable(this,'PTECNo','PersonAllocationPTEC')" /> -->
			<input name="PTECNo" maxlength="10" type="text" id="PTECNo" value="<%=lRegistrationBean.getPTECNO()%>" />
			</td>
			<td class="Title">Person Allocation</td>
			<td><select id="PersonAllocationPTEC" name="PersonAllocationPTEC" >
					<option value=" ">Select</option>
					<option value="Mary">Mary</option>
					<option value="Heema">Heema</option>
					<option value="Neha">Neha</option>
			</select>
			</td>
			</tr>
			<tr>
			<td class="Title">PTRC</td>
		    <td>
		    <!-- <input name="PTRCSer" type="checkbox" id="PTRCSer" value="1PR" class="ceks" onclick="enableDisable(this,'PTRCNo','PersonAllocationPTRC')"/>-->
			<input name="PTRCNo" maxlength="10" type="text" id="PTRCNo" value="<%=lRegistrationBean.getPTRCNO()%>" />
			</td>
			<td class="Title">Person Allocation</td>
			<td><select id="PersonAllocationPTRC" name="PersonAllocationPTRC" >
					<option value=" ">Select</option>
					<option value="Mary">Mary</option>
					<option value="Heema">Heema</option>
					<option value="Neha">Neha</option>
			</select>
			</td>
			</tr>
			<tr>
			<td class="Title">Excise</td>
			<td>
			<!-- <input name="ExciseSer" type="checkbox"id="ExciseSer"  value="1E" class="ceks" onclick="enableDisable(this,'ExciseNo','PersonAllocationExcise')"/>-->
			<input name="ExciseNo" maxlength="10" type="text" id="ExciseNo" value="<%=lRegistrationBean.getExciseNo()%>" />
			</td>
			<td class="Title">Person Allocation</td>
			<td><select id="PersonAllocationExcise" name="PersonAllocationExcise" >
					<option value=" ">Select</option>
					<option value="Mary">Mary</option>
					<option value="Heema">Heema</option>
					<option value="Neha">Neha</option>
			</select>
			</td>`
			</tr>
			<tr>
			<td class="Title">Service Tax</td>
			<td>
			<!-- <input name="ServiceTax"  type="checkbox" id="ServiceTax"  value="1S" class="ceks" onclick="enableDisable(this,'ServiceTaxNo','PersonAllocationServiceTaxNo')"/> -->
			<input name="ServiceTaxNo" maxlength="10" type="text" id="ServiceTaxNo" value="<%=lRegistrationBean.getSerTaxNo()%>"/>
			</td>
			<td class="Title">Person Allocation</td>
			<td><select id="PersonAllocationServiceTaxNo" name="PersonAllocationServiceTaxNo" >
					<option value=" ">Select</option>
					<option value="Mary">Mary</option>
					<option value="Heema">Heema</option>
					<option value="Neha">Neha</option>
			</select>
			</td>
			</tr>
			<tr>
			<td class="Title">TDS</td>
			<td>
			 <!-- <input name="TDSSer" type="checkbox" id="TDSSer"  value="1T" class="ceks" onclick="enableDisable(this,'TDSNo','PersonAllocationTDSSer')"/> -->
			<input name="TDSNo" maxlength="10" type="text" id="TDSNo" value="<%=lRegistrationBean.getTdsNo()%>" />
			</td>
			<td class="Title">Person Allocation</td>
			<td><select id="PersonAllocationTDSSer" name="PersonAllocationTDSSer">
					<option value=" ">Select</option>
					<option value="Mary">Mary</option>
					<option value="Heema">Heema</option>
					<option value="Neha">Neha</option>
			</select>
			</td>
			</tr>
			<tr>
			<td class="Title">Income Tax</td>
		<!-- 
			<input name="IncomeTaxSer" type="checkbox" id="IncomeTaxSer"  value="1I" class="ceks" onclick="enableDisable(this,'IncomeTaxNo','PersonAllocationIncomeTaxNo')"/> -->
			<td>
			<input name="IncomeTaxNo" maxlength="10" type="text" id="IncomeTaxNo" value="<%=lRegistrationBean.getIncomeTaxNo()%>"/>
			</td>
			<td class="Title">Person Allocation</td>
			<td><select id="PersonAllocationIncomeTaxNo" name="PersonAllocationIncomeTaxNo" >
					<option value=" ">Select</option>
					<option value="Mary">Mary</option>
					<option value="Heema">Heema</option>
					<option value="Neha">Neha</option>
			</select>
			</td>
		</tr>
		<tr>
			<td class="Title">Person Allocation</td>
			<td><select id="PersonAllocation" name="PersonAllocation">
					<option value=" ">Select</option>
					<option value="Mary">Mary</option>
					<option value="Heema">Heema</option>
					<option value="Neha">Neha</option>
			</select>
			</td>
			<td class="Title">Firm Allocation</td>
				<td><select id="FirmAllocation" name="FirmAllocation">
					<option value="Bhanu">Bhanu</option>
					<option value="SaiSiddhi">SaiSiddhi</option>
					<option value="Odhav">Odhav</option>
					<option value="Nikunj">Nikunj</option>
					<option value="Mary">Mary</option>
			</select>
			</td>
		</tr>
		<tr><td><button onclick="validateFormOnSubmit();">Register</button></td>
		<td><button onclick="resetform();">Clear</button></td></tr>
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
    <li class="about"><a href="<%=request.getContextPath()%>/ClientRegistrationPage.jsp" target="_self">User Registration</a>
      <ul>
      <li class="about1"><a href="<%=request.getContextPath()%>/ReportsPages/ServiceSelectoreReport.jsp" target="_self">Select Service</a></li>
      <li class="about1"><a href="<%=request.getContextPath()%>/ReportsPages/UserDetailsReport.jsp" target="_self">Edit Client Details</a></li>
      <!-- 
      <li class="about1"><a href="">History</a></li>
      <li class="about1"><a href="">Awards</a></li>
	  <li class="about1"><a href="">Vision</a></li>
	   -->
      </ul>
	</li>
    <li class="services"><a href="#">Vat </a>
      <ul>
      <li class="services1"><a href="<%=request.getContextPath()%>/ReportsPages/CommonQuerySelector.jsp" target="_self">Vat Registration</a></li>
      <li class="services1"><a href="<%=request.getContextPath()%>/ReportsPages/VatReport.jsp" target="_self">Vat Report</a></li>
      <li class="services1"><a href="<%=request.getContextPath()%>/ReportsPages/VatCommonReport.jsp" target="_self">Vat Services</a></li>
      </ul>
    </li>
    <li class="contact"><a href="#">Contact</a>
      <ul>
      </ul>
	</li>
  </ul>
</div>
</div>
<%} %>
 </body>
 <script src="<%=request.getContextPath()%>/jqueryandcss/Aajx.Google.js"></script>
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
