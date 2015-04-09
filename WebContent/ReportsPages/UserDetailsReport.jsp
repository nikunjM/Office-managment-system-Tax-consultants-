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
				BhanuUserDetailsBean lUserDetailsBean= new BhanuUserDetailsBean();
				ArrayList<BhanuUserDetailsBean> editBean = new ArrayList<BhanuUserDetailsBean>();
				ConnectionHelper connClass=new ConnectionHelper();
				Connection connect = connClass.connect();
				Statement statement = null;
				ResultSet resultset = null;	
				statement = connect.createStatement();
				//String issueReportQuery= "SELECT usr_id,usr_title,usr_EmpId,Usr_UserName,Usr_PassWord,Usr_RePassWord,Usr_FirstName,Usr_MiddleName,Usr_LastName,Usr_MobileNo1,Usr_MoblieNo2,Usr_WorkPhone,Usr_ExtNo,Usr_EmailId,ism1.Master_Names,ism2.Master_Names,ism3.Head_Name,usr_workPosition,Usr_UserStatus,usr_UserType,Usr_UpdatedBy FROM UsrDetails lusr INNER JOIN Issue_Masters ism1 ON lusr.Usr_DepartMent=ism1.Dep_No INNER JOIN Issue_Masters ism2 ON lusr.Usr_Location=ism2.Dep_No INNER  JOIN Head_Masters  ism3 ON lusr.Usr_EmpManagerId=ism3.Head_id";
				String issueReportQuery= "SELECT Usr_Id, Usr_Title, Usr_CompanyName, Usr_PanNo, Usr_TANNo,Usr_FileNo, Usr_BagNo, Usr_FirstName, Usr_MiddleName, Usr_LastName, Usr_EmailId, Usr_MobileNo1, Usr_MoblieNo2, Usr_WorkPhone, Usr_VatService, Usr_VatNo, Usr_VatAllocated, Usr_PTECService, Usr_PTECNO, Usr_PTECAllocated, Usr_PTRCService, Usr_PTRCNO, Usr_PTRCAllocated, Usr_ExciseService, Usr_ExciseNo, Usr_ExciseAllocated, Usr_SerTaxService, Usr_SerTaxNo, Usr_SerTaxAllocation, Usr_TDSService, Usr_TdsNo, Usr_TdsAllocation, Usr_IncomeTaxService, Usr_IncomeTaxNo, Usr_IncomeTaxAllocation, Usr_ComapnyAllocation, Usr_ConsultancyAllocation, Usr_UserType, Usr_CreatedBy, Usr_CreatedOn, Usr_UpdatedBy, Usr_UpdatedOn, Usr_UpdateVersion	FROM usrdetails";
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
						BhanuUserEntryHelper lUserEntryHelper= new BhanuUserEntryHelper();
						BhanuUserDetailsBean lUserDetailsBean1= new BhanuUserDetailsBean();
						lUserEntryHelper.fill(resultset,lUserDetailsBean1);
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

<style type="text/css">
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Details Page</title>
</head>
<body id="index">
<span id=sessioncheck></span>
<div id="mainarea">
<table>
<tr>
<td style="text-align: right;font-size: 19px;"><b>Filter on Company Name</b></td><td><input type="text" name="filter" value="" id="filter" height="10px" /></td>
<%session.setAttribute("rs",editBean);%>
</tr>
</table>
  <form method="GET" name="IssueReprotForm" style="padding-top: 0px;">
  <input type="hidden" id="UserPkey" name="UserPkey" /><input type="hidden" id="uStatus" name="uStatus" />
	<TABLE id ="customers" class="sortable" cellpadding="0" cellspacing="0" border="0" width="90%">
	<thead >
	<tr>
	<th class="sort-alpha"><h3>User Id </h3></th>
	<th class="sort-alpha"><h3>User Title</h3></th>
	<th class="sort-alpha"><h3>User CompanyName </h3></th>
	<th class="sort-alpha"><h3>User PanNo</h3></th>
	<th class="sort-alpha"><h3>User TANNo</h3></th>
	<th class="sort-alpha"><h3>User FileNo</h3></th>
	<th class="sort-alpha"><h3>User BagNo</h3></th>
	<th class="sort-alpha"><h3>User FirstName </h3></th>
	<th class="sort-alpha"><h3>User MiddleName </h3></th>
	<th class="sort-alpha"><h3>User LastName </h3></th>
	<th class="sort-alpha"><h3>User EmailId </h3></th>
	<th class="sort-alpha"><h3>User MobileNo1 </h3></th>
	<th class="sort-alpha"><h3>User MoblieNo2 </h3></th>
	<th class="sort-alpha"><h3>User WorkPhone </h3></th>
	<th class="sort-alpha"><h3>User VatService</h3></th>
	<th class="sort-alpha"><h3>User VatNo</h3></th>
	<th class="sort-alpha"><h3>User VatAllocated</h3></th>
	<th class="sort-alpha"><h3>User PTECService </h3></th>
	<th class="sort-alpha"><h3>User PTECNO </h3></th>
	<th class="sort-alpha"><h3>User PTECAllocated </h3></th>
	<th class="sort-alpha"><h3>User PTRCService </h3></th>
	<th class="sort-alpha"><h3>User PTRCNO </h3></th>
	<th class="sort-alpha"><h3>User PTRCAllocated </h3></th>
	<th class="sort-alpha"><h3>User ExciseService </h3></th>
	<th class="sort-alpha"><h3>User ExciseNo </h3></th>
	<th class="sort-alpha"><h3>User ExciseAllocated </h3></th>
	<th class="sort-alpha"><h3>User SerTaxService </h3></th>
	<th class="sort-alpha"><h3>User SerTaxNo </h3></th>
	<th class="sort-alpha"><h3>User SerTaxAllocation </h3></th>
	<th class="sort-alpha"><h3>User TDSService </h3></th>
	<th class="sort-alpha"><h3>User TdsNo </h3></th>
	<th class="sort-alpha"><h3>User TdsAllocation </h3></th>
	<th class="sort-alpha"><h3>User IncomeTaxService </h3></th>
	<th class="sort-alpha"><h3>User IncomeTaxNo </h3></th>
	<th class="sort-alpha"><h3>User IncomeTaxAllocation </h3></th>
	<th class="sort-alpha"><h3>User ComapnyAllocation </h3></th>
	<th class="sort-alpha"><h3>User ConsultancyAllocation</h3></th>
	<th><h3></h3> 
	</tr>
			</thead>
			<tbody>
			<% int i=1;
				for (BhanuUserDetailsBean temp : editBean)
						{
					
					%>
					<tr class="alt">
					<td><%=i%>
					<td style="display: none;"><%=temp.getpKey() %></td>
					<TD><%=temp.getTitle()%></td>
					<TD><%=temp.getCompanyName()%>
					<TD><%=temp.getPANNo()%></td>
					<TD><%=temp.getTanNo()%></td>
					<TD><%=temp.getFileNo()%></td>
					<TD><%=temp.getBagNo()%></td>
					<TD><%=temp.getFirstName()%></td>
					<TD><%=temp.getMiddleName()%></td>
					<TD><%=temp.getLastName()%></td>
					<TD><%=temp.getEmailId()%></td>
					<TD><%=temp.getMobileNo1()%></td>
					<TD><%=temp.getMoblieNo2()%></td>
					<TD><%=temp.getWorkPhone()%></td>
					<TD><%=temp.getVatService()%></td>
					<TD><%=temp.getVatNo()%></td>
					<TD><%=temp.getVatAllocated()%></td>
					<TD><%=temp.getPTECService()%></td>
					<TD><%=temp.getPTECNO()%></td>
					<TD><%=temp.getPTECAllocated()%></td>
					<TD><%=temp.getPTRCService()%></td>
					<TD><%=temp.getPTRCNO()%></td>
					<TD><%=temp.getPTRCAllocated()%></td>
					<TD><%=temp.getExciseService()%></td>
					<TD><%=temp.getExciseNo()%></td>
					<TD><%=temp.getExciseAllocated()%></td>
					<TD><%=temp.getSerTaxService()%></td>
					<TD><%=temp.getSerTaxNo()%></td>
					<TD><%=temp.getSerTaxAllocation()%></td>
					<TD><%=temp.getTDSService()%></td>
					<TD><%=temp.getTdsNo()%></td>
					<TD><%=temp.getTdsAllocation()%></td>
					<TD><%=temp.getIncomeTaxService()%></td>
					<TD><%=temp.getIncomeTaxNo()%></td>
					<TD><%=temp.getIncomeTaxAllocation()%></td>
					<TD><%=temp.getComapnyAllocation()%></td>
					<TD><%=temp.getConsultancyAllocation()%></td>
				<td><input type="button" name="edit" value="Edit" onclick="updateRecord('<%=temp.getpKey()%>','update')"></td>
				<td id ="EmpId" style="display: none;"><%=temp.getpKey()%></td>
				<TD id ="Status" style="display: none;"><%=temp.getUserType()%></td>
				</tr>
				<%i++;				
				}%>
			</tbody>
		</TABLE>
		<div id="pageNavPosition" style="padding-top:10px" align="center"></div>
		</form>
		</div>
		
<div id="topbar" >
<table>
<tr>
<td><div><img style="width: 100%;max-height: 70%"src="<%=request.getContextPath()%>/images/images/Bhanu.jpg"/></div></td>
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
</body>
<script type="text/javascript">
function updateRecord(id,msg)
{
    var f=document.IssueReprotForm;
    f.method="GET";
    document.getElementById("UserPkey").value=id;
    document.getElementById("uStatus").value=msg;
    f.action="<%=request.getContextPath()%>/ClientRegistrationPage.jsp";
    f.submit();
}
</script>
<%}%>
<%}%>
<script src="<%=request.getContextPath()%>/jqueryandcss/Aajx.Google.js"></script>
<script>
var pager = new Pager('customers',15);
pager.init();
pager.showPageNav('pager', 'pageNavPosition');
pager.showPage(1);

$("#customers tbody tr").live('dblclick', function() {
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
    	$("#customers tbody tr td:nth-child(4):contains('"+query+"')").css("text-decoration", "underline");
        ($(this).text().search(new RegExp(query, "i")) < 0) ? $(this).closest('tr').hide().removeClass('visible') : $(this).closest('tr').show().addClass('visible');
    });
	}
$('input[name="filter"]').live('blur', function(){
	filter($('tr.alt td:nth-child(4)').each(function() {}), $(this).val());
	});
setInterval('updateClock()', 200);
</script>
</html>