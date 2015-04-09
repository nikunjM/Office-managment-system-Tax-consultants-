<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" import="java.util.*"	import="java.sql.*" import="com.IssueHelper.*" import="java.text.*" import="java.util.Calendar" import="com.issueBean.*"%>
<html>
<%
Statement statementProName= null;//product
Statement statementCalltype = null;//calltype
Statement statementDepartment=null;//department
Statement statementlocation=null;//location

ResultSet resultsetProName = null;//product
ResultSet resultsetCallType = null;//calltype
ResultSet resultsetDepartment=null;//department
ResultSet resultsetHeadDepartment=null;//HeadDepartment
ResultSet resultsetlocation=null;//location

ConnectionHelper connClass=new ConnectionHelper();
Connection connect = connClass.connection();

statementProName = connect.createStatement();
statementCalltype = connect.createStatement();//are errors which occur in system
statementDepartment=connect.createStatement();
statementlocation=connect.createStatement();


	String Department = "SELECT * FROM Issue_Masters WHERE Master_Type='Department' AND Master_Status ='1'";
    String location   = "SELECT * FROM Issue_Masters WHERE Master_Type='Location'   AND Master_Status ='1'";
	String Product    = "SELECT * FROM Issue_Masters WHERE Master_Type='Product'    AND Master_Status ='1'";
    String CallType   = "SELECT * FROM Issue_Masters WHERE Master_Type='CallError'  AND Master_Status ='1'";

System.out.println(Department);
resultsetDepartment = statementDepartment.executeQuery(Department);
ArrayList<ArrayList> Deps=new ArrayList<ArrayList>();
ArrayList nDep;
int cnt = 0;
while(resultsetDepartment.next())
{
	nDep=new ArrayList();
    cnt+=1;
    nDep.add(String.valueOf(cnt));
    for(int i=1;i<=2;i++) 
    {
    	nDep.add(resultsetDepartment.getObject(i));
    }
    Deps.add(nDep);
}
System.out.println(location );
resultsetlocation = statementlocation.executeQuery(location);

ArrayList<ArrayList> Locs=new ArrayList<ArrayList>();
ArrayList nLocs;
int cLocs = 0;
while(resultsetlocation.next())
{
	nLocs=new ArrayList();
	cLocs+=1;
	nLocs.add(String.valueOf(cLocs));
    for(int i=1;i<=2;i++) 
    {
    	nLocs.add(resultsetlocation.getObject(i));
    }
    Locs.add(nLocs);
}

System.out.println(Product);
resultsetProName = statementProName.executeQuery(Product);


ArrayList<ArrayList> Pros=new ArrayList<ArrayList>();
ArrayList nPros;
int cPros= 0;
while(resultsetProName.next())
{
	nPros=new ArrayList();
	cPros+=1;
	nPros.add(String.valueOf(cPros));
    for(int i=1;i<=2;i++) 
    {
    	nPros.add(resultsetProName.getObject(i));
    }
    Pros.add(nPros);
}

System.out.println(CallType );
resultsetCallType = statementCalltype.executeQuery(CallType);

ArrayList<ArrayList> Calls=new ArrayList<ArrayList>();
ArrayList nCalls;
int cCalls= 0;
while(resultsetCallType.next())
{
	nCalls=new ArrayList();
	cCalls+=1;
	nCalls.add(String.valueOf(cCalls));
    for(int i=1;i<=2;i++) 
    {
    	nCalls.add(resultsetCallType.getObject(i));
    }
    Calls.add(nCalls);
}


%>
<head>
<script src="<%=request.getContextPath()%>/jqueryandcss/DateFormatter.js"></script>
<link href="<%=request.getContextPath()%>/jqueryandcss/ScreenWithMenuCss.css"rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Master</title>

<style type="text/css">
body {
	margin: 0;
	color: #4e4e4e;
	font: 0.9em Verdana, Geneva, Arial, Helvetica, sans-serif;
	font-size: 10pt;
	letter-spacing: 2px;
	margin: 0px;
	background-color:white;
	color:#fffff;
	border: 1px solid red;
}
table {
	border: 1px solid red;
}
table td.Title {
	text-align: left;
	height:20px;
	padding: 3px 7px 2px 7px;
	vertical-align: bottom;
	width: 120px;
	background-color: orange;
				}
select,input[type="text"] 
{
	width: 200px;
	text-align: left;
	padding: 3px 7px 2px 7px;
}
input:hover,select:hover {  
        background-color:#ffff66;  
        border-color:#999999;  
} 

input[type="button"]
{
width: 120px;
}
*{
text-transform:capitalize;
 }
</style>
</head>
<body>
<div id="mainarea">
<br><br><br>
<form id="DepartmentForm" name="DepartmentForm" method="post" action="">
	<table cellspacing="5" cellpadding="0" width="100%" >
		<tr>
		<td class="Title">Department</td>                                                                        
		<td><input type="text" maxlength="20" name="DepartmentMaster" id="DepartmentMaster" value="" onchange="CheckingValues(document.getElementById('DepartmentMaster').value,'Departmentres', processAppDep)"> </td>
		<td><input type="button" value="Add Department"  onclick="validateFormDepartMent(AddDepartment,'Insert')"></td>
		
			<td class="Title">Title</td>
			<td><select name="DepartmentList" id="DepartmentList"  onchange="copy_dataDepart()">
					<option Selected=" " value="">[Select]</option> 
					<%for (ArrayList temp : Deps){ %>
					<option value="<%=temp.get(1)%>"><%=temp.get(2)%></option>
					<%}%>
				</select>
			</td>
			<td><input type="button" value="Delete Department" onclick="AddDepartment('Delete')" ></td>
		</tr>
		<tr>
			<td >Select from DropBox And Change Product Name</td>
			<td><input type="text" maxlength="20" name="DepartmentMasterEdit" id="DepartmentMasterEdit" value="" onchange="CheckingValues(document.getElementById('DepartmentMasterEdit').value,'Departmentres', processAppDep)"> </td>
			<td><input type="button" value="Update Department"onclick="validateFormDepartMentOnDropDown(AddDepartment,'Update');"></td>
			<td>
		</tr>
				
		<tr><td><span id=Departmentres> </span></td></tr>
</table>
</form>
<br><br><br>

<form id="CallTypeForm" name="CallTypeForm" method="post" action="">
	<table cellspacing="5" cellpadding="0" width="100%">
		<tr>
		<td class="Title">CallType/Errors</td>														
		<td><input type="text" maxlength="20" name="CallTypeMaster" id="CallTypeMaster" value="" onchange="CheckingValues(document.getElementById('CallTypeMaster').value,'AddErrorTyperes',ErrorProcess)"> </td>
		<td><input type="button" value="Add Errors" onclick="validateFormError(AddErrorType,'Insert')"></td>
			<td class="Title">Title</td>
			<td><select name="CallTypeList" id="CallTypeList" onchange="copy_dataError()">
					<option Selected="" value="">[Select]</option> 
					<%for (ArrayList lcall : Calls){ %>
					<option value="<%=lcall.get(1)%>"><%=lcall.get(2)%></option>
					<%}%>
				</select>
			</td>
			<td><input type="button" value="Delete Error"  onclick="AddErrorType('Delete')"></td>
		</tr>
		<tr>
			<td >Select from DropBox And Change Error Name</td>
			<td><input type="text" maxlength="20" name="CallTypeMasterEdit" id="CallTypeMasterEdit" value="" onchange="CheckingValues(document.getElementById('CallTypeMasterEdit').value,'AddErrorTyperes',ErrorProcess)"> </td>
			<td><input type="button" value="Update Error"onclick="validateFormErrorMentOnDropDown(AddErrorType,'Update')"></td>
			<td>
		</tr>
		<tr><td><span id=AddErrorTyperes> </span></td></tr>
</table>
</form>
<br><br><br>



<form id="LocationForm" name="LocationForm" method="post" action="">
	<table cellspacing="5" cellpadding="0" width="100%">
		<tr>
		<td class="Title">Location</td>
		<td><input type="text" maxlength="20" name="LocationMaster" id="LocationMaster" value="" onchange="CheckingValues(document.getElementById('LocationMaster').value,'AddLocationres',LocationProcess)"> </td>
					<td><input type="button" value="Add Location" onclick="validateFormLocation(AddLocation,'Insert')"></td>
			<td class="Title">Title</td>
			<td><select name="LocationList" id="LocationList" value="" onchange="copy_dataLoca()">
					<option Selected="" value="">[Select]</option> 
					<%for (ArrayList lLoc : Locs){ %>
					<option value="<%=lLoc.get(1)%>"><%=lLoc.get(2)%></option>
					<%}%>
				</select>
			</td>
			<td><input type="button" value="Delete Location" onclick="AddLocation('Delete')"></td>
		</tr>
		<tr>
			<td>Select from DropBox And Change Location Name</td>
			<td><input type="text" maxlength="26" name="LocationMasterEdit" id="LocationMasterEdit" value="" onchange="CheckingValues(document.getElementById('LocationMasterEdit').value,'AddLocationres',LocationProcess)"> </td>
			<td><input type="button" value="Update Location"onclick="validateFormLocaMentOnDropDown(AddLocation,'Update')"></td>
			<td>
		</tr>
		
		<tr><td><span id=AddLocationres> </span></td></tr>
</table>
</form>
<br><br><br>

<form id="ProductForm" name="ProductForm" method="post" action="">
	<table cellspacing="5" cellpadding="0" width="100%">
		<tr>
		<td class="Title">Product</td>																		
		<td><input type="text" maxlength="20" name="ProductMaster" id="ProductMaster" value="" onchange="CheckingValues(document.getElementById('ProductMaster').value,'AddProductres',ProductProcess)"> </td>
		<td><input type="button" value="Add Product" onclick="validateFormProduct(AddProduct,'Insert')"></td>
			<td class="Title">Title</td>
			<td><select name="ProductList" id="ProductList" onchange="copy_data();"  >
					<option Selected="" value="">[Select]</option> 
					<%for (ArrayList lpro: Pros){ %>
					<option value="<%=lpro.get(1)%>"><%=lpro.get(2)%></option>
					<%}%>
				</select>
			</td>
			<td><input type="button" value="Delete Product"onclick="AddProduct('Delete')"></td>
			</tr>
			<tr>
			<td >Select from DropBox And Change Product Name</td>
			<td><input type="text" maxlength="20" name="ProductMasterEdit" id="ProductMasterEdit" value="" onchange="CheckingValues(document.getElementById('ProductMasterEdit').value,'AddProductres',ProductProcess)"> </td>
			<td><input type="button" value="Update Product"onclick="validateFormProductOnDropDown(AddProduct,'Update')"></td>
			<td>
		</tr>
		<tr><td><span id=AddProductres> </span></td></tr>
</table>
</form>
<br><br><br>


<form id="Head_Master" name="Head_Master" method="post" onclick="javascript:return false;">
	<table cellspacing="5" cellpadding="0" width="100%">
	<tr>
	<td class="Title">Department</td>
		<td><select name="DepartmentHeadList" id="DepartmentHeadList" >
					<option Selected="" value="">[Select]</option> 
					<%for (ArrayList lDep: Deps){ %>
					<option value="<%=lDep.get(1)%>"><%=lDep.get(2)%></option>
					<%}%>	
					</select>
			</td>
		</tr>
		<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>
		<tr>
		<td class="Title">Email Id</td>
		<td><input type="text" maxlength="50" name="Head_EmailId" id="Head_EmailId" value=""></td>
		<td class="Title">Emp Id</td>
		<td><input type="text" maxlength="20" name="Head_EmpId" id="Head_EmpId" value=""></td>
		</tr>
		<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>
		<tr>
		<td class="Title">Emp Name</td>
		<td><input type="text" maxlength="20" name="Head_Name" id="Head_Name" value=""></td>
		<td><input type="hidden" maxlength="20" name="Head_PKey" id="Head_PKey" value=""></td>
		</tr>
		<tr>
		<td><input type="button" value="Add " onclick="validateFormHead(AddHead,'Insert')"></td>
		</tr>
		<tr><td><span id=AddHeadMsg> </span></td></tr>
	</table>
	</form>
	</div>
<div id="topbar" style="background-color: white; width: 110%" >
<table style="border-color: white;">
<tr>
<td><div><img style="width: 100%;max-height:70%"src="<%=request.getContextPath()%>/images/images/Bhanu.jpg"/></div></td>
<td><div id ="clocks"><h2 id="clock"></h2></div></td>
</tr>
</table>
</div>    
<div id="left">
<div id="Header" style="margin: 10px">
<%UserDetailsBean lbean=(UserDetailsBean)session.getAttribute("UserBean"); %>
<h3> Hello,<%=lbean.getEmployeeId().toUpperCase()%></h3>
</div>
<div id="flip12">Menu</div>
<br>
<div id="panel12">
<ul class="menu">
<li><a href="<%=request.getContextPath()%>/MainFrame.jsp" target="_self"><b>Home page</b>
		</a> <em>Goes To Home Page</em><br />
		</li>
		<ul>
			<li><a href="<%=request.getContextPath()%>/UserRegistration.jsp" target="_self"><b>Registrationpage</b>
			</a> <em>Admin Can Add New User Data</em>
			</li>
			<br/>
		</ul>
		<li><a href="<%=request.getContextPath()%>/IssueRegisterPage.jsp" target="_self"><b>ComplainForm</b>
		</a> <em>User Can RegisterIts Complain </em><br />
		</li>
		<li><a href="<%=request.getContextPath()%>/ReportsPages/IssueReporter.jsp" target="_self"><b>Issue Reports</b>
		</a> <em>The Technical team Can Review the Reoprts</em><br />
		</li>
		<li><a href="<%=request.getContextPath()%>/AdminRights/MasterAddition.jsp" target="_self">Master Page<b></b>
		</a> <em>Admin can Add Master Details or update It</em><br />
		</li>
		<li><a href="<%=request.getContextPath()%>/ReportsPages/UserDetailsReport.jsp" target="_self">User Reports<b></b>
		</a> <em>Admin Can View User Details </em><br />
		</li>
		<li><a href="<%=request.getContextPath()%>/ChangePassword.jsp" target="_self">Change Password<b></b>
		</a> <em>User Can Change Password </em><br />
		</li>
		<li><a href="<%=request.getContextPath()%>/Logout.jsp" target="_top"><b>Logout</b>
		</a><br/>
		</li>
	</ul>
</div>
</div>
</body>
<script type="text/javascript">

function copy_data(){//product 
    var a = document.getElementById("ProductList");
    var TextVal=a.options[a.selectedIndex].text;
    document.getElementById("ProductMasterEdit").value=TextVal;
   } 
function copy_dataDepart(){
    var a = document.getElementById("DepartmentList");
    var TextVal=a.options[a.selectedIndex].text;
    document.getElementById("DepartmentMasterEdit").value=TextVal;
   }
function copy_dataLoca(){
    var a = document.getElementById("LocationList");
    var TextVal=a.options[a.selectedIndex].text;
    document.getElementById("LocationMasterEdit").value=TextVal;
   }
function copy_dataError(){
    var a = document.getElementById("CallTypeList");
    var TextVal=a.options[a.selectedIndex].text;
    document.getElementById("CallTypeMasterEdit").value=TextVal;
   }
   
reqObj=null;
function AddDepartment(msg)
{
    document.getElementById("Departmentres").innerHTML="Checking";
    if(window.XMLHttpRequest){
        reqObj=new XMLHttpRequest();
    }else {
        reqObj=new ActiveXObject("Microsoft.XMLHTTP");
    }
    reqObj.onreadystatechange=DepartmentProcess;
    if(msg=="Insert")
    {
    	reqObj.open("POST","<%=request.getContextPath()%>/AjaxReuestPages/AddDepartment.jsp?Department="+document.getElementById("DepartmentMaster").value+"&Status="+msg ,true);
    	reqObj.send(null);
    }else if(msg=="Update")
    {
    	var depkey=document.getElementById("DepartmentList").value;
    	reqObj.open("POST","<%=request.getContextPath()%>/AjaxReuestPages/AddDepartment.jsp?Department="+document.getElementById("DepartmentMasterEdit").value+"&Key="+depkey+"&Status="+msg,true);
    	reqObj.send(null);
    }
    else if(msg=="Delete")
    
    	if (confirm('Are you sure you want to Delete????')) 
    	{
    	reqObj.open("POST","<%=request.getContextPath()%>/AjaxReuestPages/AddDepartment.jsp?Department="+document.getElementById("DepartmentList").value+"&Status="+msg,true);
    	reqObj.send(null);
    	}else{
    	setTimeout(function(){window.location.reload(1);},150);
    	}
    }
function DepartmentProcess()
{
    if(reqObj.readyState==4){
    document.getElementById("Departmentres").innerHTML=reqObj.responseText;
    setTimeout(function(){window.location.reload(1);},1500);
}
}
function AddProduct(msg)
{
    document.getElementById("AddProductres").innerHTML="Checking";
    if(window.XMLHttpRequest){
        reqObj=new XMLHttpRequest();
    }else {
        reqObj=new ActiveXObject("Microsoft.XMLHTTP");
    }
    reqObj.onreadystatechange=ProductProcess;
    if(msg=="Insert")
    {
    	reqObj.open("POST","<%=request.getContextPath()%>/AjaxReuestPages/AddProduct.jsp?Department="+document.getElementById("ProductMaster").value+"&Status="+msg,true);
    	reqObj.send(null);
    }else if(msg=="Update")
    {
    	var depkey=document.getElementById("ProductList").value;
    	reqObj.open("POST","<%=request.getContextPath()%>/AjaxReuestPages/AddProduct.jsp?Department="+document.getElementById("ProductMasterEdit").value+"&Key="+depkey+"&Status="+msg,true);
    	reqObj.send(null);
    	
    }
    else if(msg=="Delete")
    {
    	if (confirm('Are you sure you want to Delete????')) 
	{
    	reqObj.open("POST","<%=request.getContextPath()%>/AjaxReuestPages/AddProduct.jsp?Department="+document.getElementById("ProductList").value+"&Status="+msg,true);
    	reqObj.send(null);
	}else 
	{
		setTimeout(function(){window.location.reload(1);},150);
	}
    }
    
}
function ProductProcess()
{
    if(reqObj.readyState==4){
    document.getElementById("AddProductres").innerHTML=reqObj.responseText;
    setTimeout(function(){window.location.reload(1);},1500);
}
}
function AddLocation(msg)
{
    document.getElementById("AddLocationres").innerHTML="Checking";
    if(window.XMLHttpRequest){
        reqObj=new XMLHttpRequest();
    }else {
        reqObj=new ActiveXObject("Microsoft.XMLHTTP");
    }
    reqObj.onreadystatechange=LocationProcess;
    if(msg=="Insert")
    {
    	reqObj.open("POST","<%=request.getContextPath()%>/AjaxReuestPages/AddLocation.jsp?Department="+document.getElementById("LocationMaster").value+"&Status="+msg,true);
    	reqObj.send(null);
    }
    	else if(msg=="Update")
        {
        	var depkey=document.getElementById("LocationList").value;
        	reqObj.open("POST","<%=request.getContextPath()%>/AjaxReuestPages/AddLocation.jsp?Department="+document.getElementById("LocationMasterEdit").value+"&Key="+depkey+"&Status="+msg,true);
        	reqObj.send(null);
        }
        else if(msg=="Delete")
            {
    	if (confirm('Are you sure you want to Delete????')) 
    	{
    		reqObj.open("POST","<%=request.getContextPath()%>/AjaxReuestPages/AddLocation.jsp?Department="+document.getElementById("LocationList").value+"&Status="+msg,true);
    		reqObj.send(null);	
    	} else {
    		setTimeout(function(){window.location.reload(1);},150);
    	}
    }
    
}
function LocationProcess()
{
    if(reqObj.readyState==4){
    document.getElementById("AddLocationres").innerHTML=reqObj.responseText;
    setTimeout(function(){window.location.reload(1);},1500);
}
}
function AddErrorType(msg)
{
    document.getElementById("AddErrorTyperes").innerHTML="Checking";
    if(window.XMLHttpRequest){
        reqObj=new XMLHttpRequest();
    }else {
        reqObj=new ActiveXObject("Microsoft.XMLHTTP");
    }
    reqObj.onreadystatechange=ErrorProcess;
    if(msg=="Insert")
    {
    	reqObj.open("POST","<%=request.getContextPath()%>/AjaxReuestPages/AddErrors.jsp?Department="+document.getElementById("CallTypeMaster").value+"&Status="+msg,true);
    	reqObj.send(null);
    }else if(msg=="Update")
    {
    	var depkey=document.getElementById("CallTypeList").value;
    	reqObj.open("POST","<%=request.getContextPath()%>/AjaxReuestPages/AddErrors.jsp?Department="+document.getElementById("CallTypeMasterEdit").value+"&Key="+depkey+"&Status="+msg,true);
    	reqObj.send(null);
    }
    else if(msg=="Delete")
        {
    	if (confirm('Are you sure you want to Delete????')) 
    	{
    	reqObj.open("POST","<%=request.getContextPath()%>/AjaxReuestPages/AddErrors.jsp?Department="+document.getElementById("CallTypeList").value+"&Status="+msg,true);
    	reqObj.send(null);
    	}else
    	{
    		setTimeout(function(){window.location.reload(1);},150);
    	}
    }
    
}
function ErrorProcess()
{
    if(reqObj.readyState==4){
    document.getElementById("AddErrorTyperes").innerHTML=reqObj.responseText;
    setTimeout(function(){window.location.reload(1);},1500);
}
}
function AddHead(msg)
{
    document.getElementById("AddHeadMsg").innerHTML="Checking";
    if(window.XMLHttpRequest){
        reqObj=new XMLHttpRequest();
    }else {
        reqObj=new ActiveXObject("Microsoft.XMLHTTP");
    }
    reqObj.onreadystatechange=HeadProcess;
    var depart=document.getElementById("DepartmentHeadList").value;
    var Email=document.getElementById("Head_EmailId").value;
    var EmpID=document.getElementById("Head_EmpId").value;
    var Name=document.getElementById("Head_Name").value;
    if(msg=="Insert")
    {
    	reqObj.open("POST","<%=request.getContextPath()%>/AjaxReuestPages/AddHOD.jsp?Department="+depart+"&hEmail="+Email+"&hEmpId="+EmpID+"&hName="+Name+"&Status="+msg,true);
    }else
    {
    	reqObj.open("POST","<%=request.getContextPath()%>/AjaxReuestPages/AddHOD.jsp?Department="+depart+"&hEmail="+Email+"&hEmpId="+EmpID+"&hName="+Name+"&Status="+msg,true);
    }
    reqObj.send(null);
}
function HeadProcess()
{
    if(reqObj.readyState==4){
    document.getElementById("AddHeadMsg").innerHTML=reqObj.responseText;
    setTimeout(function(){window.location.reload(1);},1500);
}
}
function CheckingValues(Val,spanres,fn)
{
    document.getElementById("spanres").innerHTML="Checking";
    if(window.XMLHttpRequest){
        reqObj=new XMLHttpRequest();
    }else {
        reqObj=new ActiveXObject("Microsoft.XMLHTTP");
    }
    reqObj.onreadystatechange=fn;
    reqObj.open("POST","/IssueTracker/AjaxReuestPages/CheckExistes.jsp?id="+Val,true);
    reqObj.send(null);
}
function processAppDep(){
    if(reqObj.readyState==4){
     document.getElementById('Departmentres').innerHTML=reqObj.responseText;
    }
}

function validateFormHead(fn,lStauts) {
	var reason = "";
	reason += validateEmpty(Head_Master.DepartmentHeadList);
	reason += validateEmpty(Head_Master.Head_EmailId);
	reason += validateEmpty(Head_Master.Head_EmpId);
	reason += validateEmpty(Head_Master.Head_Name);
	if (reason != "") {
		alert("Some fields need correction:\n" + reason);
		return false;
	}
	else
	{
	fn(lStauts);
	return true;
	}
}
function validateFormDepartMent(fn,lStauts) {
	var reason = "";
	reason += validateEmpty(DepartmentForm.DepartmentMaster);
	reason += userSubmitValidation("Departmentres");
	if (reason != "") {
		alert("Some fields need correction:\n" + reason);
		return false;
	}
	else
	{
	fn(lStauts);
	return true;
	}
}

function validateFormDepartMentOnDropDown(fn,lStauts) {
	var reason = "";
	reason += userSubmitValidation("Departmentres");
	if (reason != "") {
		alert("Some fields need correction:\n" + reason);
		return false;
	}
	else
	{
	fn(lStauts);
	return true;
	}
}

function validateFormProduct(fn,lStauts) {
	var reason = "";
	reason += validateEmpty(ProductForm.ProductMaster);
	reason += userSubmitValidation("AddProductres");
	if (reason != "") {
		alert("Some fields need correction:\n" + reason);
		return false;
	}
	else
	{
	fn(lStauts);
	return true;
	}
}
function validateFormProductOnDropDown(fn,lStauts) {
	var reason = "";
	reason += userSubmitValidation("AddProductres");
	if (reason != "") {
		alert("Some fields need correction:\n" + reason);
		return false;
	}
	else
	{
	fn(lStauts);
	return true;
	}
}

function validateFormLocation(fn,lStauts) {
	var reason = "";
	reason += validateEmpty(LocationForm.LocationMaster);
	reason += userSubmitValidation("AddLocationres");
	if (reason != "") {
		alert("Some fields need correction:\n" + reason);
		return false;
	}
	else
	{
	fn(lStauts);
	return true;
	}
}

function validateFormLocaMentOnDropDown(fn,lStauts) {
	var reason = "";
	reason += userSubmitValidation("AddLocationres");
	if (reason != "") {
		alert("Some fields need correction:\n" + reason);
		return false;
	}
	else
	{
	fn(lStauts);
	return true;
	}
}








function validateFormError(fn,lStauts) {
	var reason = "";
	reason += validateEmpty(CallTypeForm.CallTypeMaster);
	reason += userSubmitValidation("AddErrorTyperes");
	
	if (reason != "") {
		alert("Some fields need correction:\n" + reason);
		return false;
	}
	else
	{
	fn(lStauts);
	return true;
	}
}
function validateFormErrorMentOnDropDown(fn,lStauts) {
	var reason = "";
	reason += userSubmitValidation("AddErrorTyperes");
	if (reason != "") {
		alert("Some fields need correction:\n" + reason);
		return false;
	}
	else
	{
	fn(lStauts);
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

function userSubmitValidation(span){
	var error = "";
    var msg = document.getElementById(span).innerHTML;
    var input="Done";
	var result = msg.toLowerCase().indexOf(input.toLowerCase())>=0;
		if(result)
		{
		
		}
		else if (msg.length<=1)
		{
		
		}
		else
		{
		error="Already Exists....";
		}
	return error;
}
</script>
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
function updateClock() {
    var now = new Date();
    var elem = document.getElementById('clock');
    elem.innerHTML = dateFormat(now, "dddd, mmmm dS, yyyy, h:MM:ss TT");
}
setInterval('updateClock()', 200);
</script>
</html>

