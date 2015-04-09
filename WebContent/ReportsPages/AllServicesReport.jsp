<%@page import="com.bhanu.helperss.ServiceSelectoreHelper"%>
<%@page import="com.bhanu.Bean.ServiceSelector"%>
<%@page import="com.bhanu.helperss.BhanuSessionCheckerHelper"%>
<%@page import="com.bhanu.helperss.BhanuUserEntryHelper"%>
<%@page import="com.bhanu.helperss.ConnectionHelper"%>
<%@page import="com.bhanu.Bean.BhanuUserDetailsBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
	{
	%>
	<%
				ServiceSelector lUserDetailsBean= new ServiceSelector();
				ArrayList<ServiceSelector> editBean = new ArrayList<ServiceSelector>();
				ConnectionHelper connClass=new ConnectionHelper();
				Connection connect = connClass.connect();
				Statement statement = null;
				ResultSet resultset = null;	
				statement = connect.createStatement();
				//String issueReportQuery= "SELECT usr_id,usr_title,usr_EmpId,Usr_UserName,Usr_PassWord,Usr_RePassWord,Usr_FirstName,Usr_MiddleName,Usr_LastName,Usr_MobileNo1,Usr_MoblieNo2,Usr_WorkPhone,Usr_ExtNo,Usr_EmailId,ism1.Master_Names,ism2.Master_Names,ism3.Head_Name,usr_workPosition,Usr_UserStatus,usr_UserType,Usr_UpdatedBy FROM UsrDetails lusr INNER JOIN Issue_Masters ism1 ON lusr.Usr_DepartMent=ism1.Dep_No INNER JOIN Issue_Masters ism2 ON lusr.Usr_Location=ism2.Dep_No INNER  JOIN Head_Masters  ism3 ON lusr.Usr_EmpManagerId=ism3.Head_id";
				String issueReportQuery= "SELECT Ser_id,Ser_UserId,ism.Usr_CompanyName,Ser_YearSelect,Ser_VatSelection,Ser_Vatperiod,Ser_VatAudit,Ser_PTECSelection,Ser_PTECperiod,Ser_PTECAudit,Ser_PtrcSelection,Ser_Ptrcperiod ,Ser_PtrcAudit ,Ser_ExciseSelection ,Ser_Exciseperiod ,Ser_ExciseAudit,Ser_ServiceTaxSelection ,Ser_ServiceTaxperiod ,Ser_ServiceAudit ,	Ser_TDSSelection ,Ser_Tdsperiod,Ser_TdsAudit,Ser_IncometaxSelection,Ser_IncomeTaxperiod ,Ser_IncomeTaxAudit from serviceselector isr INNER JOIN usrdetails ism on isr.Ser_UserId=ism.Usr_Id";
				System.out.println(issueReportQuery);
				resultset = statement.executeQuery(issueReportQuery);
				if (!resultset.next())
				{
					out.println("Sorry, could not find the data. ");
				}
				else
				{
					%>
					<%
					try{
						do
						{
						ServiceSelectoreHelper lUserEntryHelper= new ServiceSelectoreHelper();
						ServiceSelector lUserDetailsBean1= new ServiceSelector();
						lUserEntryHelper.fillService(resultset,lUserDetailsBean1);
						editBean.add(lUserDetailsBean1);
						resultset.next();
						} while (resultset.isAfterLast() != true);
					}
					catch (Exception ex)
					{
						ex.printStackTrace();
					}finally 
					{
				         if (resultset != null) try { resultset.close(); } catch (SQLException ignore) {}
				         if (statement != null) try { statement.close(); } catch (SQLException ignore) {}
				         if (connect != null) try { connect.close(); } catch (SQLException ignore) {}
				     }
			%>
<HEAD>
<script src="<%=request.getContextPath()%>/jqueryandcss/jquery.min.js"></script>
<script	src="<%=request.getContextPath()%>/jqueryandcss/Tabletogle.js"></script>
<script	src="<%=request.getContextPath()%>/jqueryandcss/PagingOfTable.js"></script>
<script src="<%=request.getContextPath()%>/jqueryandcss/DateFormatter.js"></script>
<link href="<%=request.getContextPath()%>/jqueryandcss/ScreenWithMenuCss.css"rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/jqueryandcss/TablenewCss.css"rel="stylesheet" type="text/css" />
<script src="<%=request.getContextPath()%>/jqueryandcss/Aajx.Google.js"></script>
<style type="text/css">
</style>
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


.headercell {
    background-color: #f0eae2;
    font-weight: bold;
}
.legend div.unchecked
{
    background-image:url(http://jquery.bassistance.de/validate/demo/images/unchecked.gif);
}
.legend div
{
    background-repeat:no-repeat;
    background-image:url(http://jquery.bassistance.de/validate/demo/images/checked.gif);
    cursor:pointer;
    background-position:left center;
    padding-left:20px;
}
.legend div
{
display:inline-block;
height:30px;
width:100px;
float:left;
border:1px solid ;
 margin: 3px 3px 0 3px;
}
</style>   
</head>
<body id="index">
<span id=sessioncheck></span>
<div id="mainarea">
<br>
	<br>
	<!--  <table class="legend">
	<tr><td><div>ID</div></td><td><div>Company Name</div><div>Selected Year</div></td></tr>
	</table>
	-->
	<!-- <table>
	<tr class="legend" > -->
	<div class="legend" > 
	<div>Company Name</div>
	<div>Selected Year</div>			
	<div>Vat Selection</div>
	<div>Vat Periodicity</div>
	<div>Vat Audit</div>
	<div>PTEC Selection</div>
	<div>PTEC Periodicity</div>
	<div>PTEC Audit</div>
	<div>PTRC Selection</div>
	<div>PTRC Periodicity</div>
	<div>PTRC Audit</div>
	<div>Excise Selection</div>
	<div>Excise Periodicity</div>	
	<div>Excise Audit</div>
	<div>Service Tax Selection</div>
	<div>Service Tax Periodicity</div>
	<div>Service Tax Audit</div>
	<div>tds Selection</div>
	<div>tds Periodicity</div>
	<div>tds Audit</div>
	<div>IncomeTax Selection</div>
	<div>IncomeTax Periodicity</div>
	<div>IncomeTax Audit</div>
	</div>
	
	<!-- </tr>
	</table> -->
			<table>
			<tr>
				<td style="text-align: right; font-size: 12px;"><b>Company Name</b></td>
				<td><input type="text" name="filter" value="" id="filter" height="10px" /></td>
				<td style="text-align: right; font-size: 12px;"><b>Selected	Yr</b></td>
				<td><select id="filterYr" name="filterYr">
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
				<select id="filterPeriod" name="filterPeriod">
						<option value="">Select</option>
						<option value="1">Monthly</option>
						<option value="2">Quaterly</option>
						<option value="3">Half Yearly</option>
						<option value="4">Yearly</option>
				</select>
				</td>
				 
				<%session.setAttribute("rs",editBean);%>
			</tr>
		</table>
<BR>
  <form method="GET" name="IssueReprotForm" style="padding-top: 0px;">
  <input type="hidden" id="UserPkey" name="UserPkey" /><input type="hidden" id="uStatus" name="uStatus" />
		<TABLE id ="customers" class="sortable" cellpadding="0" cellspacing="0" border="0">
		<thead >
	<tr class="headercell">
	<th class="sort-alpha"><h3>ID</h3></th>
	<th class="sort-alpha"><h3>Company Name</h3></th>
	<th class="sort-alpha"><h3>Selected Year</h3></th>
	<th class="sort-alpha"><h3>Vat Selection</h3></th><!-- not required -->
	<th class="sort-alpha"><h3>Vat Periodicity</h3></th>
	<th class="sort-alpha"><h3>Vat Audit</h3></th>
	<th class="sort-alpha"><h3>PTEC Selection</h3></th><!-- not required -->
	<th class="sort-alpha"><h3>PTEC Periodicity</h3></th>
	<th class="sort-alpha"><h3>PTEC Audit</h3></th>
	<th class="sort-alpha"><h3>PTRC Selection</h3></th><!-- not required -->
	<th class="sort-alpha"><h3>PTRC Periodicity</h3></th>
	<th class="sort-alpha"><h3>PTRC Audit</h3></th>
	<th class="sort-alpha"><h3>Excise Selection</h3></th><!-- not required -->
	<th class="sort-alpha"><h3>Excise Periodicity</h3></th>
	<th class="sort-alpha"><h3>Excise Audit</h3></th>
	<th class="sort-alpha"><h3>Service Tax Selection</h3></th><!-- not required -->
	<th class="sort-alpha"><h3>Service Tax Periodicity</h3></th>
	<th class="sort-alpha"><h3>Service Tax Audit</h3></th>
	<th class="sort-alpha"><h3>tds Selection</h3></th><!-- not required -->
	<th class="sort-alpha"><h3>tds Periodicity</h3></th>
	<th class="sort-alpha"><h3>tds Audit</h3></th>
	<th class="sort-alpha"><h3>IncomeTax Selection</h3></th><!-- not required -->
	<th class="sort-alpha"><h3>IncomeTax Periodicity</h3></th>
	<th class="sort-alpha"><h3>IncomeTax Audit</h3></th>
		</tr>
			</thead>
			<tbody>
			<% int i=1;
				for (ServiceSelector temp : editBean)
						{
					%>
				<tr class="alt">
				<td><%=i%></td>
				<TD><%=temp.getFirstName()%></td>
				<TD><%=temp.getYrSelect()%></td>
				<TD><%=temp.getVatSelect()%></td>
				<TD><%=temp.getVatType()%></td>
				<TD><%=temp.getVatAudit()%></td>
				<TD><%=temp.getYrSelectPTEC()%></td>
				<TD><%=temp.getPTECType()%></td>
				<TD><%=temp.getPTECAudit()%></td>
				<TD><%=temp.getPTRCYrSelect()%></td>
				<TD><%=temp.getPTRCType()%></td>
				<TD><%=temp.getPTRCAudit()%></td>
				<TD><%=temp.getExciseYrSelect()%></td>
				<TD><%=temp.getExciseType()%></td>
				<TD><%=temp.getExciseAudit()%></td>
				<TD><%=temp.getSerTaxYrSelect()%></td>
				<TD><%=temp.getSerTaxType()%></td>
				<TD><%=temp.getServiceAudit()%></td>
				<TD><%=temp.getTDSYrSelect()%></td>
				<TD><%=temp.getTDSType()%></td>
				<TD><%=temp.getTDSAudit()%></td>
				<TD><%=temp.getIncomTaxYrSelect()%></td>
				<TD><%=temp.getIncomTaxType()%></td>
				<TD><%=temp.getInocmeTaxAudit()%></td>
				</tr>
				<%i++;				
				}%>
			</tbody>
		</TABLE>
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
<div id="flip12">Menu</div>
<br>
<div id="panel12">
<ul class="menu">
	<li><a href="<%=request.getContextPath()%>/MainFrame.jsp" target="_self"><b>Home page</b>
		</a> <em style="width: 100px">Goes To Home Page</em><br />
		</li>
		<ul>
			<li><a href="<%=request.getContextPath()%>/ClientRegistrationPage.jsp" target="_self"><b>Registrationpage</b>
			</a> <em style="width: 100px">Admin Can Add New User Data</em>
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
<%}%>
<script src="<%=request.getContextPath()%>/jqueryandcss/Aajx.Google.js"></script>
<script>
var pager = new Pager('customers',10);
pager.init();
pager.showPageNav('pager', 'pageNavPosition');
pager.showPage(1);

$("tbody tr").live('dblclick', function() {
var text_val = $(this).children('#EmpId').text();
updateRecord(text_val,'update');
});
$(document).ready(
function() {
	$("td:nth-child(16)").filter(function() { return $.text([this]) == 'Disable' || $.text([this]) == 'Suspended'}).closest('tr').addClass('red');
	});

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
function filter(selector, query) {
    query = $.trim(query); //trim white space
    query = query.replace(/ /gi, '|'); //add OR for regex
    $(selector).each(
    function() {
    	$("#customers tbody tr td:nth-child(5):contains('"+query+"')").css("text-decoration", "underline");
        ($(this).text().search(new RegExp(query, "i")) < 0) ? $(this).closest('tr').hide().removeClass('visible') : $(this).closest('tr').show().addClass('visible');
    });
	}
$('input[name="filter"]').live('keyup', function(){
	filter($('tr.alt td:nth-child(2)').each(function() {}), $(this).val());
	});
$('#filterYr').live('keyup', function(){
	filter($('tr.alt td:nth-child(3)').each(function() {}), $(this).val());
	});
$('#filterPeriod').live('keyup', function(){
	filter($('tr.alt td:nth-child(5)').each(function() {}), $(this).val());
	});
setInterval('updateClock()', 200);

/*
$(document).ready( function() {
    // When site loaded, load the Popupbox First
    loadPopupBox();
    $('#popupBoxClose').click( function() {            
        unloadPopupBox();
    });
    
    $('#container').click( function() {
        unloadPopupBox();
    });

    function unloadPopupBox() {    // TO Unload the Popupbox
        $('#popup_box').fadeOut("slow");
        $("#container").css({ // this is just for style        
            "opacity": "1"  
        }); 
    }    
    function loadPopupBox() {    // To Load the Popupbox
        $('#popup_box').fadeIn("slow");
        $("#container").css({ // this is just for style
            "opacity": "0.3"  
        });         
    }        
});
*/
$('div.legend div').click(function() {
    $(this).toggleClass("unchecked");
    var t = $.trim($(this).text());
    var i = $(".headercell th:contains(" + t + ")").index() + 1;
	$('td:nth-child(' + i + ')').toggle();
	$('th:nth-child(' + i + ')').toggle();
});
</script>
</html>