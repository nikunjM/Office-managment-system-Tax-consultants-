<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.bhanu.helperss.BhanuSessionCheckerHelper"%>
<html>
 <head>
 <%
BhanuSessionCheckerHelper help=new BhanuSessionCheckerHelper();
	if (!help.login(request, null)) 
	{
		
		help.forwardToAnyPage(null, response);
			} 
	else 
	{
	%>
 <title> Common Service Selector </title>
 <script src="<%=request.getContextPath()%>/jqueryandcss/jquery.min.js"></script>
<script	src="<%=request.getContextPath()%>/jqueryandcss/Tabletogle.js"></script>
<script	src="<%=request.getContextPath()%>/jqueryandcss/PagingOfTable.js"></script>
<script src="<%=request.getContextPath()%>/jqueryandcss/DateFormatter.js"></script>
<link href="<%=request.getContextPath()%>/jqueryandcss/ScreenWithMenuCss.css"rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/jqueryandcss/TablenewCss.css"rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Details Page</title>
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
<!-- select Usr_Id ,usr_CompanyName from usrdetails-->
 <body>
<div id="mainarea">
<br>
<br>
  <table>
			<tr>
				<!-- <td style="text-align: right; font-size: 12px;"><b>Company Name</b></td> 
				<td><input type="text" name="filter" value="" id="filter"height="10px"/></td> -->
				<td style="text-align: right; font-size: 12px;"><b>Service Selected</b></td>
				<td>
				<select id="ServiceSelected" name="ServiceSelected">
						<option value="">Select</option>
						<option value="1">Vat</option>
						<option value="2">PTEC</option>
						<option value="3">PTRC</option>
						<option value="4">Excise</option>
						<option value="5">Service tax</option>
						<option value="6">TDS</option>
						<option value="7">Income Tax</option>
						<option value="8">Cst</option>
				</select>
				</td>
				<td style="text-align: right; font-size: 12px;"><b>Selected	Yr</b></td>
				<td><select id="YrSelection" name="YrSelection">
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
				</select>
				</td>
				<td style="text-align: right; font-size: 12px;"><b>Select Period</b></td>
				<td>	
				<select id="PeriodSelect" name="PeriodSelect">
						<option value="">Select</option>
						<option value="Monthly">Monthly</option>
						<option value="Quarterly">Quarterly</option>
						<option value="HalfYearly">Half Yearly</option>
						<option value="Yearly">Yearly</option>
				</select>
				</td>
				<td style="text-align: right; font-size: 12px;"><b>Person Allocated</b></td>
				
				<td>	
				<select id="PersonAllocation" name="PersonAllocation">
						<option value="">Select</option>
						<option value="Mary">Mary</option>
						<option value="ashish">ashish</option>
				</select>
				</td>
				<td><button onclick="AjaxquerySubmiter();">SELECT</button></td>
				</tr>
				<tr><td colspan="19"><%if (request.getAttribute("messageSer") != null) {%>
			<div id='result' style="font-size:24pt;font-family:times new roman;font-weight:bold;font-style:italic;color:red;">
			<%=request.getAttribute("messageSer")%></div>
			<%} else {%><div id='result'><b></b></div><%}%></td>
			</tr>
		</table>
		<div id="ReportViewSpace">
		<form method="GET" name="ServiceForm" style="padding-top: 0px;">
		
		<span id="ReportGenration">	</span>
		</form>
		</div><!--To Show Report Here-->
		</div><!--MainArea Ends Here-->
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
setInterval('updateClock()', 200);
function AjaxquerySubmiter()
{
    document.getElementById("ReportGenration").innerHTML="Fetching............Please Wait";
    if(document.getElementById("ServiceSelected").value.length <1 || document.getElementById("PeriodSelect").value.length <1 || document.getElementById("YrSelection").value.length < 1 )
    {
    	document.getElementById("ReportGenration").innerHTML="Please Select All Parameters......";
    }
    else{
    if(window.XMLHttpRequest){
        reqObj=new XMLHttpRequest();
    }else {
        reqObj=new ActiveXObject("Microsoft.XMLHTTP");
    }
    reqObj.onreadystatechange=ProcessAjaxquerySubmiter;
    var lSerSeleceted=document.getElementById("ServiceSelected").value;//vat tds kya ???
    var lSerPeriod=document.getElementById("PeriodSelect").value;
    var lYrSelected=document.getElementById("YrSelection").value;
    var lPersonAllocation=document.getElementById("PersonAllocation").value;
    reqObj.open("POST","/IssueTracker/AjaxReuestPages/AjaxServiceSelectoreTabelCreater.jsp?SerSelected="+lSerSeleceted+"&SerPeriod="+lSerPeriod+"&YrSelect="+lYrSelected+"&Person="+lPersonAllocation,true);
    reqObj.send(null);
}
}
function ProcessAjaxquerySubmiter(){
    if(reqObj.readyState==4){
        document.getElementById("ReportGenration").innerHTML=reqObj.responseText;
    }
}
function filter(selector, query) {
    query = $.trim(query); //trim white space
    query = query.replace(/ /gi, '|'); //add OR for regex
    $(selector).each(
    function() {
    	$("#customers tbody tr td:nth-child(2):contains('"+query+"')").css("text-decoration", "underline");
        ($(this).text().search(new RegExp(query, "i")) < 0) ? $(this).closest('tr').hide().removeClass('visible') : $(this).closest('tr').show().addClass('visible');
    });
	}
$('input[name="filter"]').live('keyup', function(){
	filter($('tr.alt td:nth-child(2)').each(function() {}), $(this).val());
	});
$("tbody tr").live('dblclick', function() {
var text_val = $(this).children('#UserPkey').text();
var UserKey_val = $(this).children('#UserId').text();
updateRecord(text_val,'Add',UserKey_val);
});
function updateRecord(id,msg,lUserId)
{
    var f=document.ServiceForm;
    f.method="GET";
    document.getElementById("UserPkey").value=id;//Service Selected.... 
    document.getElementById("uStatus").value=msg;//Primery Key....
    document.getElementById("UserId").value=lUserId;
    var SerSelection=document.getElementById("ServiceSelected").value;
    if (SerSelection == "1")
    {
    f.action="<%=request.getContextPath()%>/VatFormApplication.jsp";
    }else if(SerSelection == "2")
    {
    f.action="<%=request.getContextPath()%>/PTECForm.jsp";
    }else if(SerSelection == "3")
    {
    f.action="<%=request.getContextPath()%>/PTRCForm.jsp";
    }
    else if(SerSelection == "8")
    {
    f.action="<%=request.getContextPath()%>/CSTForm.jsp";
    }
    f.submit();
}
</script>
</html>
