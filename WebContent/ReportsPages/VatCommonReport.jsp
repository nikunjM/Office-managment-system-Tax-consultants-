<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.bhanu.helperss.BhanuSessionCheckerHelper"%>
<%@page import="com.bhanu.Bean.ServiceSelector"%>
<%@page import="com.bhanu.helperss.ServiceSelectoreHelper"%>
<%@page import="org.apache.el.lang.ELSupport"%>
<%@page import="com.bhanu.helperss.ConnectionHelper"%>
<%@page language="java" import="java.util.*" import="java.sql.*" import="com.IssueHelper.*" import="java.text.*" import="java.util.Calendar" import="java.util.Collection;"%>
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
		
		String Query1="select usr_id,Usr_CompanyName from usrdetails ism INNER JOIN  serviceselector isr on isr.Ser_UserId=ism.Usr_Id  where Ser_vatselection='yes' group by USr_Id";
		ArrayList<ArrayList> Product = new ArrayList<ArrayList>();
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
				    for(int i=1;i<=2;i++) //replace 3 with the length of the columns
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
		}
	%>
 <title> Vat Common Report </title>
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
#popupBoxClose 
{
    font-size:20px;  
    line-height:15px;  
    right:5px;  
    top:5px;  
    position:absolute;  
    color:#6fa5e2;  
    font-weight:500;      
}
select
{
width: 150px;
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
				
				
				<!--
				
				 
				Cform-------Yes/No Year 
				h form-------Yes/No Yes/No Year
				Person Vat Report ------Year  
				Vat report---Yes/No,Year 
				Audit Report--Yes/No,Year Wise 
				
				-->
				<select id="VatServiceSelected" name="VatServiceSelected" onchange="ChangeDropBox();">
						<option value="">Select</option>
						<option value="1">C-Form</option>	
						<option value="2">H-Form</option>
						<option value="3">Person Allocated</option>
						<option value="4">Vat Report</option>
						<option value="5">Audit Report</option>
				</select>
				</td>
				<td style="text-align: right; font-size: 12px;" class="HiddenFor3"><b>Selection</b></td>
				<td class="HiddenFor3">	
				<select id="VatSelection" name="VatSelection" >
						<option value="">Select</option>
						<option value="Yes">Yes</option>
						<option value="No">No</option>
				</select>
				</td>
				<td style="text-align: right; font-size: 12px;"><b>Party Name</b></td>
				<td >	
				<select id="VatSelectionPartyWise" name="VatSelectionPartyWise" >
						<option value="">Select</option>
				<%for (ArrayList temp : Product){ %>
					<option value="<%=temp.get(1)%>"><%=temp.get(2)%></option>
					<%}%>
				</select>
				</td>
				<td style="text-align: right; font-size: 12px; display: none" class="HiddenFor1" ><b>Person Allocation</b></td>
				<td class="HiddenFor1" style=" display: none">	
				<select id="VatPersonSelection" name="VatPersonSelection" >
						<option value="">Select</option>
						<option value="Mary">Mary</option>
						<option value="Ashish">Ashish</option>
						<option value="Nikunj">Nikunj</option>
				</select>
				</td>
				<td style="text-align: right; font-size: 12px;"><b>Selected	Yr</b></td>
				<td><select id="VatYrSelection" name="VatYrSelection">
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
function ChangeDropBox()
{
	var DropVal=document.getElementById("VatServiceSelected").value;
	if (DropVal==3)
	{
		$('.HiddenFor3').hide();
		$('.HiddenFor1').show();
	}else
	{
		$('.HiddenFor3').show();
		$('.HiddenFor1').hide();
	}
}
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
setInterval('updateClock()', 200);
function AjaxquerySubmiter()
{
    document.getElementById("ReportGenration").innerHTML="Fetching............Please Wait";
    if(document.getElementById("VatServiceSelected").value.length <1 || document.getElementById("VatYrSelection").value.length < 1 )
    {
    	document.getElementById("ReportGenration").innerHTML="Please Select All Parameters......";
    }
    else
   {
    if(window.XMLHttpRequest){
        reqObj=new XMLHttpRequest();
    }else {
        reqObj=new ActiveXObject("Microsoft.XMLHTTP");
    }
    reqObj.onreadystatechange=ProcessAjaxquerySubmiter;
    var lSerSeleceted=document.getElementById("VatServiceSelected").value;//vat c,h???
    var lYrSelected=document.getElementById("VatYrSelection").value;//Year
    var lSerSelection=document.getElementById("VatSelection").value;//YesOR No
    var lPersonSelection=document.getElementById("VatPersonSelection").value;//perosn
    var lCoampnyWise=document.getElementById("VatSelectionPartyWise").value;//UserComapny
    reqObj.open("POST","/IssueTracker/AjaxReuestPages/AjaxTableVatCommonQuery.jsp?SerSelected="+lSerSeleceted+"&SerVatselect="+lSerSelection+"&YrSelect="+lYrSelected+"&SerVatPerson="+lPersonSelection+"&UserComapny="+lCoampnyWise,true);
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
