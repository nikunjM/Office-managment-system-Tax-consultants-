<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
//document.getElementById("lab").style.visibility="visible";
//document.getElementById("lab").innerHTML="<font color=red>Enter Address</font>" ;

		function validateFormOnSubmit()
		{
		var reason = "";
		reason += validateUsername(frmlogin.userName);
		reason += validatePassword(frmlogin.passWord);
		if (reason != "") {
			alert("Some fields need correction:\n" + reason);
			return false;
		}
		document.frmlogin.submit();
		return true;
		}
	function validateEmpty(fld) {
		var error = "";
		if (fld.value.length == 0) {
			fld.style.background = 'Yellow';
			error = "The required field has not been filled in.\n"
		} else {
			fld.style.background = 'White';
		}
		return error;
	}
	function validateUsername(fld) {
		var error = "";
		var illegalChars = /\W/; // allow letters, numbers, and underscores

		if (fld.value == "") {
			fld.style.background = 'Yellow';
			error = "You didn't enter a username.\n";
		} else if ((fld.value.length < 4) || (fld.value.length > 15)) {
			fld.style.background = 'Yellow';
			error = "The username is the wrong length.\n";
		} else if (illegalChars.test(fld.value)) {
			fld.style.background = 'Yellow';
			error = "The username contains illegal characters.\n";
		} else {
			fld.style.background = 'White';
		}
		return error;
	}
	function validatePassword(fld) {
		var error = "";
		var illegalChars = /[\W_]/; // allow only letters and numbers 

		if (fld.value == "") {
			fld.style.background = 'Yellow';
			error = "You didn't enter a password.\n";
		} else if ((fld.value.length < 5) || (fld.value.length > 15)) {
			error = "The password is the wrong length. \n";
			fld.style.background = 'Yellow';
		} else if (illegalChars.test(fld.value)) {
			error = "The password contains illegal characters.\n";
			fld.style.background = 'Yellow';
		} else if (!((fld.value.search(/(a-z)+/)) && (fld.value
				.search(/(0-9)+/)))) {
			error = "The password must contain at least one numeral.\n";
			fld.style.background = 'Yellow';
		} else {
			fld.style.background = 'White';
		}
		return error;
	}
	function trim(s) {
		return s.replace(/^\s+|\s+$/, '');
	}
	function disableBackButton()
	{
	window.history.forward();
	}
	function reFresh() 
	{
	location.reload(true);
	setTimeout("disableBackButton()", 0);
	}
	
	reqObj=null;
	function varifyAccese()
	{
	    document.getElementById("resUser").innerHTML="Checking";
	    if(window.XMLHttpRequest){
	        reqObj=new XMLHttpRequest();
	    }else {
	        reqObj=new ActiveXObject("Microsoft.XMLHTTP");
	    }
	    reqObj.onreadystatechange=processBlock;
	    reqObj.open("POST","<%=request.getContextPath()%>/LoginBlock.jsp?UserID="+ document.getElementById("userName").value+"&ipAdd=" + document.getElementById("IP").value,true);
		reqObj.send(null);
	}
	function processBlock() {
		if (reqObj.readyState == 4) {
			document.getElementById("resUser").innerHTML = reqObj.responseText;

		}
	}
	function formDefault(theInput) {
		if (theInput.value == "") {
			theInput.value = theInput.defaultValue;
		}
	}
	function resetBox(box, defaultvalue) {
		if (box.value == defaultvalue) {
			box.value = "";
		}
	}
</script>
<style type="text/css">
body {
	color: rgb(102, 102, 102);
	background-color: #F3F3F3;
}

#homeContainer {
	background-repeat: repeat no-repeat;
	margin: 50px auto auto;
	overflow: hidden;
	width: 960px;
}

span.header,.boldText {
	float: left;
	font-size: 16px !important;
	margin: 5px;
	line-height: 24px !important;
	font-weight: normal !important;
	color: rgb(102, 102, 102);
}

input {
	border: 1px solid #999;
	width: 100%;
	margin-bottom: 10px;
	height: 20px;
	padding-left: 5px;
}

button {
	float: right;
	width: 75px;
	border: none;
	height: 20px;
	font-weight: normal;
}

#myBox {
	height: 40px;
	border-top: 1px solid rgb(229, 236, 247);
	border-bottom: 1px solid rgb(229, 236, 247);
	width: 100%;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Log in Page</title>
</head>
<%
	String ipAddress = request.getRemoteAddr();
	String ipAddressa = request.getRemoteHost();
%>
<div id="homeContainer" style="width: 350px; margin-top: 120px;">
	<div
		style="background-color: rgb(59, 89, 152); margin-left: 200px; display: block; width: 150px; height: 26px;">
		<p
			style="line-height: 24px; font-size: 14px; padding-left: 20px; color: rgb(255, 255, 255);">
			<img
				style="float: left; height: 24px; width: 16px; padding-right: 5px;"
				src="<%=request.getContextPath()%>/images/images/key.png" /> User Login
		</p>
	</div>
	<div
		style="border: 1px solid rgb(59, 89, 152); height: 350px; padding: 10px; background-color: rgb(255, 255, 255);">
		<div id="newsBox_Latest" class="box_B topMargin"
			style="width: 312px; margin-left: 0px; margin-right: 10px; margin-top: 0px;">
			<div class="contentPad">
				<img style="margin-top: 30px; margin-left: 80px;"
					src="<%=request.getContextPath()%>/images/images/Bhanu.jpg" width="150"
					height="97" />
			</div>
		</div>
		<div id="newsBox_Latest" class="box_B topMargin"
			style="width: 312px; margin-left: 0px; margin-right: 10px; margin-top: 20px;">
			<div class="contentPad">
				<div id="myBox">
					<span class="header">Login to Portal</span>
				</div>
				<div id="loginform">
					<form name="frmlogin" style="padding-top: 0px; margin-top: 0px;"action="<%=request.getContextPath()%>/LoginServlet" method="post"onsubmit="javascript:return false;">
						<br /> <input name="IP" type="hidden" id="IP"
							style="color: rgb(178, 173, 173);" size="40"
							value="<%=ipAddress%>" /> <input name="userName" type="text"
							id="userName" class="clearField"
							style="color: rgb(178, 173, 173);" size="40"
							onblur="varifyAccese();" maxlength="12" 
							value="" /> 
							
							<input name="passWord" type="password" id="passWord" class="clearField2"
							style="color: rgb(178, 173, 173);" size="40" maxlength="12" value=""/> <br />
							 <span id=resUser> </span>
						<%
							if (request.getAttribute("errorMessage") != null) {
						%>
						<div id='result'><%=request.getAttribute("errorMessage")%></div>
						<%
							} else {
						%>
						<div id='result'><b></b></div>
						<%
							}
						%>
					</form>
				</div>
				<br />
			</div>
		</div>
	</div>
</div>
</body>
</html>
