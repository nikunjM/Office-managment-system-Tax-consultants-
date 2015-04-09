<%@page import="com.bhanu.helperss.BhanuSessionCheckerHelper"%>
<%@page import="com.bhanu.Bean.BhanuUserDetailsBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page language="java" import="java.util.List"	import="java.sql.*" import="com.IssueHelper.*" import="java.text.SimpleDateFormat" import="java.util.Calendar"%>
 <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	
<script type="text/javascript">
function updateClock() {
    var now = new Date();
    var elem = document.getElementById('clock');
    elem.innerHTML = dateFormat(now, "dddd, mmmm dS, yyyy, h:MM:ss TT");
}
function timedRefresh(timeoutPeriod) {
	setTimeout("location.reload(true);",timeoutPeriod);
}
</script>	
<head>

<title>Main frame </title>
<style type="text/css">
body {
	font: 1.364em/1.867em 'Roadgeek2005OldParksRegular', Georgia, sans-serif;
	}
	h2,h1
	{
	font: 1.364em/1.867em 'Roadgeek2005OldParksRegular', Georgia, sans-serif;
	letter-spacing: 2px;
	position: relative;
	left:10%;
	color: #4e4e4e;
	top: 10%;
	}
</style>
<script src="<%=request.getContextPath()%>/jqueryandcss/DateFormatter.js"></script>
<link href="<%=request.getContextPath()%>/jqueryandcss/ScreenWithMenuCss.css"rel="stylesheet" type="text/css" />
</head>
<body onload="checkSession();">
<%
BhanuSessionCheckerHelper help=new BhanuSessionCheckerHelper();
	if (!help.login(request, null)) 
	{
		
		help.forwardToAnyPage(null, response);
			} 
	else 
	{
	%>
<span id=sessioncheck></span>
<div id="mainarea">
<h1>Bhanu Office Managment</h1>
<h2>Gives you the best way to Communicate with your seniors and saves you from paper work</h2>
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
<%} %>
</body>
<script src="<%=request.getContextPath()%>/jqueryandcss/Aajx.Google.js"></script>
<script>
setInterval('updateClock()', 200);
</script>
</html>