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
	<%
	Statement Tablestatement = null;
	ResultSet Tableresultset = null;
	ConnectionHelper connClass = new ConnectionHelper();
	Connection connect = connClass.connect();
	Tablestatement = connect.createStatement();
		
	String QueryStringTable = "SELECT Cst_Pkey,ser1.Usr_CompanyName,ser_yearSelect,SUM(Cst_AmountPayable) AS totalPayable,SUM(Cst_amountPaid1+Cst_amountPaid2+Cst_amountPaid3+Cst_amountPaid4) AS total,COUNT(*) AS ReturnNos,Cst_UserKey,ser1.Usr_VatAllocated FROM cstservice vat INNER JOIN usrdetails ser1 ON vat.Cst_UserKey=ser1.Usr_Id	INNER JOIN serviceselector isr ON vat.Cst_SerKey=isr.Ser_Id WHERE Cst_Type='Orignal' AND isr.Ser_YearSelect='2008-09' GROUP BY Cst_UserKey;"; 		
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
	    for(int i=1;i<=8;i++) //replace 3 with the length of the columns
	    {
	    	nProduct.add(Tableresultset.getObject(i));
	    }
	    Product.add(nProduct);
	}
			%>
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
				<td style="text-align: right; font-size: 12px;"><b>Company Name</b></td>
				<td><input type="text" name="filter" value="" id="filter"height="10px" /></td>
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
	<th class="sort-alpha"><h3>Total Payable</h3></th>
	<th class="sort-alpha"><h3>Total Paid</h3></th>
	<th class="sort-alpha"><h3>Total Return</h3></th>
	<th class="sort-alpha"><h3>work Allocated</h3></th>
		</tr>
			</thead>
			<tbody>
			<% int i=1;
			for (ArrayList temp : Product){ 
					%>
				<tr class="alt">
				<td><%=i%></td>
				<TD style="display: none"><%=temp.get(1)%></td>
				<TD><%=temp.get(2)%></td>
				<TD><%=temp.get(3)%></td>
				<TD><%=temp.get(4)%></td>
				<TD><%=temp.get(5)%></td>
				<TD><%=temp.get(6)%></td>
				<TD style="display: none"><%=temp.get(7)%></td>
				<TD><%=temp.get(8)%></td>
				
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
<script type="text/javascript">
function updateRecord(id,msg)
{
    var f=document.IssueReprotForm;
    f.method="GET";
    document.getElementById("UserPkey").value=id;
    document.getElementById("uStatus").value=msg;
    f.action="<%=request.getContextPath()%>/ServiceSelectionPage.jsp";
    f.submit();
}
</script>
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
	/*
setInterval('updateClock()', 200);
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
});*/
</script>
</html>