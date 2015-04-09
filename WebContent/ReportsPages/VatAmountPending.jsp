<%@page import="com.bhanu.helperss.ServiceSelectoreHelper"%>
<%@page import="com.bhanu.Bean.ServiceSelector"%>
<%@page import="com.bhanu.helperss.BhanuSessionCheckerHelper"%>
<%@page import="com.bhanu.helperss.BhanuUserEntryHelper"%>
<%@page import="com.bhanu.helperss.ConnectionHelper"%>
<%@page import="com.bhanu.Bean.BhanuUserDetailsBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page language="java" import="java.util.*"	import="java.sql.*" import="com.IssueHelper.*" import="java.text.*" import="java.util.Calendar" import="com.issueBean.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <%
	BhanuSessionCheckerHelper help=new BhanuSessionCheckerHelper();
	if (!help.login(request, null)) 
	{
		help.forwardToAnyPage(null, response);
			} 
	else 
	{%>
	<HEAD>
<script src="<%=request.getContextPath()%>/jqueryandcss/jquery.min.js"></script>
<script	src="<%=request.getContextPath()%>/jqueryandcss/Tabletogle.js"></script>
<script	src="<%=request.getContextPath()%>/jqueryandcss/PagingOfTable.js"></script>
<script src="<%=request.getContextPath()%>/jqueryandcss/DateFormatter.js"></script>
<link href="<%=request.getContextPath()%>/jqueryandcss/ScreenWithMenuCss.css"rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/jqueryandcss/TablenewCss.css"rel="stylesheet" type="text/css" />
<style type="text/css">
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Vat Report Page</title>
<style type="text/css">
/* popup_box DIV-Styles*/
#popup_box { 
    display:none; /* Hide the DIV */
    position:fixed;  
    _position:absolute; /* hack for internet explorer 6 */  
    height:300px;  
    width:600px;  
    background:#FFFFFF;  
    left: 300px;
    top: 150px;
    z-index:100; /* Layering ( on-top of others), if you have lots of layers: I just maximized, you can change it yourself */
    margin-left: 15px;  
    
    /* additional features, can be omitted */
    border:2px solid #ff0000;      
    padding:15px;  
    font-size:15px;  
    -moz-box-shadow: 0 0 5px #ff0000;
    -webkit-box-shadow: 0 0 5px #ff0000;
    box-shadow: 0 0 5px #ff0000;
}
#container {
    background: #d2d2d2; /*Sample*/
    width:100%;
    height:100%;
}
a{  
cursor: pointer;  
text-decoration:none;  
} 

/* This is for the positioning of the Close Link */
#popupBoxClose {
    font-size:20px;  
    line-height:15px;  
    right:5px;  
    top:5px;  
    position:absolute;  
    color:#6fa5e2;  
    font-weight:500;      
}
</style>   
</head>
<body id="index">
<span id=sessioncheck></span>
<div id="mainarea">
<br>
	<div id="popup_box">    <!-- OUR PopupBox DIV-->
    <h1>This IS A Cool PopUp</h1>
    <a id="popupBoxClose">Close</a>    
	</div>
			<table>
			<tr>
				<!-- <td style="text-align: right; font-size: 12px;"><b>Company Name</b></td>
				<td><input type="text" name="filter" value="" id="filter"height="10px" /></td> -->
				<td style="text-align: right; font-size: 12px;"><b>Selected	Yr</b></td>
				<td><select id="VatYear" name="VatYear">
						<option value="">Select</option>
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
				</select></td>
				<td style="text-align: right; font-size: 12px;"><b>Vat Periodicity</b></td>
				<td>
				<select id="VatPeriod" name="VatPeriod" onchange="AjaxVatquerySubmiter();">
						<option value="">Select</option>
						<option value="Monthly">Monthly</option>
						<option value="Quaterly">Quaterly</option>
						<option value="HalfYearly">Half Yearly</option>
						<option value="Yearly">Yearly</option>
				</select>
				</td>
			</tr>
		</table>
		<BR>
  <form method="GET" name="VatReprotForm" style="padding-top: 0px;">
<input type="hidden" id="UserPkey" name="UserPkey" />
<input type="hidden" id="uStatus" name="uStatus" /><!-- UserPkey Is Service allocated address -->
<input type="hidden" id="UserId" name="UserId" />
<input type="hidden" id="EntryMAdeBy" name="EntryMAdeBy" value="<%=(String)session.getAttribute("username")%>"/>

	<span id="VatReportGenration">
	</span>
 	<div id="pageNavPosition" style="padding-top: 20px" align="center"></div>
	</form>
</div>
<div id="topbar" >
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
      </ul>
	</li>
    <li class="services"><a href="#">Vat </a>
      <ul>
      <li class="services1"><a href="<%=request.getContextPath()%>/ReportsPages/CommonQuerySelector.jsp" target="_self">Vat Registration</a></li>
      <li class="services1"><a href="<%=request.getContextPath()%>/ReportsPages/VatReport.jsp" target="_self">Vat Report</a></li>
      <li class="services1"><a href="<%=request.getContextPath()%>/ReportsPages/VatCommonReport.jsp" target="_self">Vat Services</a></li>
      <li class="services1"><a href="<%=request.getContextPath()%>/ReportsPages/VatAmountPending.jsp" target="_self">Pending Amount</a></li>
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
function AjaxVatquerySubmiter()
{
    if(document.getElementById("VatYear").value.length <1 || document.getElementById("VatPeriod").value.length <1)
    {
    	document.getElementById("VatReportGenration").innerHTML="Please Select All Parameters......";
    }
    else{
    document.getElementById("VatReportGenration").innerHTML="Fetching............Please Wait";	
    if(window.XMLHttpRequest){
        reqObj=new XMLHttpRequest();
    }else {
        reqObj=new ActiveXObject("Microsoft.XMLHTTP");
    }
    reqObj.onreadystatechange=ProcessAjaxquerySubmiter;
    var lYrSelected=document.getElementById("VatYear").value;
    var lSerPeriod=document.getElementById("VatPeriod").value;
    reqObj.open("POST","/IssueTracker/AjaxReuestPages/AjaxtableReportDown.jsp?SerPeriod="+lSerPeriod+"&YrSelect="+lYrSelected+"&Page=VatPending",true);
    reqObj.send(null);
}
}
function ProcessAjaxquerySubmiter(){
    if(reqObj.readyState==4){
        document.getElementById("VatReportGenration").innerHTML=reqObj.responseText;
    }
}
</script>
<%}%>
</html>