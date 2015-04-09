
reqObj=null;
function varifyUser()
{
    document.getElementById("resUser").innerHTML="Checking";
    if(window.XMLHttpRequest){
        reqObj=new XMLHttpRequest();
    }else {
        reqObj=new ActiveXObject("Microsoft.XMLHTTP");
    }
    reqObj.onreadystatechange=processapproval;
    reqObj.open("POST","/IssueTracker/AjaxReuestPages/CheckUserName.jsp?id="+document.getElementById("Empid").value,true);
    reqObj.send(null);
}
function processapproval(){
    if(reqObj.readyState==4){
        document.getElementById("resUser").innerHTML=reqObj.responseText;
    }
}
function buttonallower(id)
{
var button=id;
if (button==true)
	{
	replaceButtonText('myButton2','Register');
	}
else
{
	replaceButtonText('myButton2','Update');
}
}
function replaceButtonText(buttonId, text)
	{
  if (document.getElementById)
  {
    var button=document.getElementById(buttonId);
    if (button)
    {
      if (button.childNodes[0])
      {
        button.childNodes[0].nodeValue=text;
      }
      else if (button.value)
      {
        button.value=text;
      }
      else //if (button.innerHTML)
      {
        button.innerHTML=text;
      }
    }
  }
}
	function validateFormOnSubmit1() {
		var reason = "";
		reason += validateEmpty(UserRegistration.Title);
		reason += validateEmpty(UserRegistration.FirstName);
		reason += validateEmpty(UserRegistration.Empid);
		reason += validatePassword(UserRegistration.Password2);
		reason += validatePassword(UserRegistration.Password);
		reason += validateEmpty(UserRegistration.FirstName);
		reason += validateEmpty(UserRegistration.LastName);
		reason += validatePhone1(UserRegistration.MoblieNo);
		reason += validateWorkPhone1(UserRegistration.WorkPhone);
		reason += validateExtNo(UserRegistration.ExtNo);
		reason += validateEmail1(UserRegistration.Email);
		reason += validateEmpty(UserRegistration.Department);
		reason += validateEmpty(UserRegistration.Location);
		reason +=validateEmpty(UserRegistration.WorkingPosition);
		reason +=radiosex();
		reason += userSubmitValidation();
		reason += MatchPassword('Password','Password2');
		
		if (reason != "") {
			alert("Some fields need correction:\n" + reason);
			return false;
		}
		else
		{
		document.UserRegistration.submit();
		return true;
		}
	}
	function dropdown(fld){
		var error="";
		var e = fld.value;
		var strUser = e.options[e.selectedIndex].value;//if you need text to be compared then use
		var strUser1 = e.options[e.selectedIndex].text;
		if(strUser1=='[Select]') 
	{
		fld.style.background = 'Yellow';
		error="Please select ddl";
	}
	return error;
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
	function userSubmitValidation(){
		var error = "";
	    var msg = document.getElementById("resUser").innerHTML;
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
			error="Please Eneter Valdi Id";
			}
		return error;
	}
	
	function setSelectedIndex(s, valsearch)
	{
	for (i = 0; i< s.options.length; i++)
	{ 
	if (s.options[i].value == valsearch)
	{
	s.options[i].selected = true;
	break;
	}
	}
	return;
	}
	function validateUserName(fld) {
		var error = "";
		var illegalChars = /\W/; // allow letters, numbers, and underscores
		if (fld.value == "") {
			fld.style.background = 'Yellow';
			error = "You didn't enter a  " + fld.name + " properly\n";
		} else if ((fld.value.length ==6)) {
			fld.style.background = 'Yellow';
			error = "Please Enter Exactly 6 Letter EmpId.\n";
		} else if (illegalChars.test(fld.value)) {
			fld.style.background = 'Yellow';
			error = "The " + fld.name + " contains illegal characters.\n";
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
			error = "You didn't enter a " + fld.name + " properly\n";
		} else if ((fld.value.length < 7) || (fld.value.length > 15)) {
			error = "The password is of wrong length < 7. \n";
			fld.style.background = 'Yellow';
		} else if (illegalChars.test(fld.value)) {
			error = "The  " + fld.name + " contains illegal characters.\n";
			fld.style.background = 'Yellow';
		} else if (!((fld.value.search(/(a-z)+/)) && (fld.value
				.search(/(0-9)+/)))) {
			error = "The  " + fld.name + "  must contain at least one numeral.\n";
			fld.style.background = 'Yellow';
		} else {
			fld.style.background = 'White';
		}
		return error;
	}
	
	function MatchPassword(fld1,fld2) 
	{
			var error= ""; 
			var objectDateV1=document.getElementById(fld1);
			var dateV1=objectDateV1.value;
			var objectDateV2=document.getElementById(fld2);
			var dateV2=objectDateV2.value;
			if(dateV1!=dateV2)
				{
				error="Password Your Entered Dosen't Match";
				}
			return error;
		}
	function trim(s) {
		return s.replace(/^\s+|\s+$/, '');
	}
	function validateEmail1(fld) {
		var error = "";
		var tfld = trim(fld.value); // value of field with whitespace trimmed off
		var emailFilter = /^[^@]+@[^@.]+\.[^@]*\w\w$/;
		var illegalChars = /[\(\)\<\>\,\;\:\\\"\[\]]/;

		if (fld.value == "") {
			fld.style.background = 'Yellow';
			error = "You didn't enter an email address.\n";
		} else if (!emailFilter.test(tfld)) { //test email for illegal characters
			fld.style.background = 'Yellow';
			error = "Please enter a valid email address.\n";
		} else if (fld.value.match(illegalChars)) {
			fld.style.background = 'Yellow';
			error = "The email address contains illegal characters.\n";
		} else {
			fld.style.background = 'White';
		}
		return error;
	}
	function validateUserId(fld) {
		var error = "";
		var tfld = trim(fld.value); // value of field with whitespace trimmed off
		var UserIdFilter = /_/;
		var illegalChars = /[\(\)\<\>\,\;\:\\\"\[\]]\@/;

		if (fld.value == "") {
			fld.style.background = 'Yellow';
			error = "You didn't enter an UserId.\n";
		} else if (!UserIdFilter.test(tfld)) { //test email for illegal characters
			fld.style.background = 'Yellow';
			error = "Please enter a valid UserId.\n";	
		} else if (fld.value.match(illegalChars)) {
			fld.style.background = 'Yellow';
			error = "The UserId contains illegal characters.\n";
		} else {
			fld.style.background = 'White';
		}
		return error;
	}
	function validateApproval(fld) {
		var error = "";
		var tfld = trim(fld.value); // value of field with whitespace trimmed off
		if (fld.value == "") {
			fld.style.background = 'Yellow';
			error = "You didn't enter an approval Id.\n";
		} else if (!aprovalIdFilter.test(tfld)) { //test email for illegal characters
			fld.style.background = 'Yellow';
			error = "Please enter a valid approval Id.\n";	
		} else if (fld.value.match(illegalChars)) {
			fld.style.background = 'Yellow';
			error = "The approval Id contains illegal characters.\n";
		} else {
			fld.style.background = 'White';
		}
		return error;
	}
	 function setDifference(form)
	 {  var error="";
	    var x = document.getElementById('datepicker').value;
	    var y = document.getElementById('datepicker2').value;
	    var arr1 = x.split('/');
	    var arr2 = y.split('/');
	    var dt1 = new Date();
	    dt1.setFullYear(arr1[2], arr1[1], arr1[0]);
	    var dt2 = new Date();
	    dt2.setFullYear(arr2[2], arr2[1], arr2[0]);
	    var diff=((dt2.valueOf() - dt1.valueOf()) / (60 * 60 * 24 * 1000));
	    if(diff<=-1)
	    {
	    	error="Please select proper date ";
	    }
	    return error;
	}
	function validateZipCode(fld) {
		var error = "";
		var stripped = fld.value.replace(/[\(\)\.\-\ ]/g, '');
		if (fld.value == "") {
			error = "You didn't enter a ZipCode.\n";
			fld.style.background = 'Yellow';
		} else if (isNaN(parseInt(stripped))) {
			error = "The zipCode contains illegal characters.\n";
			fld.style.background = 'Yellow';
		} else if (!(stripped.length == 6)) {
			error = "The zipCode is of wrong length < 6.\n";
        	fld.style.background = 'Yellow';
    }
    return error;
}
	function UserStatus() {
		error="";
		var radios = document.getElementsByName("Status");
	    var formValid = false;
	    var i = 0;
	    while (!formValid && i < radios.length) {
	        if (radios[i].checked) formValid = true;
	        i++;        
	    }
	    if (!formValid)
	    {
	    error = "Please Select User Status!\n";
	    }
	    return error ;
	}
	function validatePhone1(fld) {
		var error = "";
		var stripped = fld.value.replace(/[\(\)\.\-\ ]/g, '');
		if (fld.value == "") {
			error = "You didn't enter a Mobile/Work number.\n";
			fld.style.background = 'Yellow';
		} else if (isNaN(parseInt(stripped))) {
			error = "The Mobile/Work number contains illegal characters.\n";
			fld.style.background = 'Yellow';
		} else if (!(stripped.length == 10)) {
			error = "The Mobile/Work number is of wrong length < 10.\n";
        fld.style.background = 'Yellow';
    }
    return error;
}
	function validateWorkPhone1(fld) {
		var error = "";
		var stripped = fld.value.replace(/[\(\)\.\-\ ]/g, '');
		if (fld.value == "") {
			error = "You didn't enter a Mobile/Work number.\n";
			fld.style.background = 'Yellow';
		} else if (isNaN(parseInt(stripped))) {
			error = "The Mobile/Work number contains illegal characters.\n";
			fld.style.background = 'Yellow';
		} else if (!(stripped.length == 11)) {
			error = "The Mobile/Work number is of wrong length < 11.\n";
        fld.style.background = 'Yellow';
    }
    return error;
}	
	function validateExtNo(fld) {
		var error = "";
		var stripped = fld.value.replace(/[\(\)\.\-\ ]/g, '');
		if (fld.value == "") {
			error = "You didn't enter a Your Ext No number.\n";
			fld.style.background = 'Yellow';
		} else if (isNaN(parseInt(stripped))) {
			error = "The Mobile number contains illegal characters.\n";
			fld.style.background = 'Yellow';
		} else if (!(stripped.length == 3)) {
			error = "The Ext number is of wrong length < 3.\n";
        fld.style.background = 'Yellow';
    }
    return error;
}
	
	function radiosex() {
		error="";
		var radios = document.getElementsByName("Status");
	    var formValid = false;
	    var i = 0;
	    while (!formValid && i < radios.length) {
	        if (radios[i].checked) formValid = true;
	        i++;        
	    }
	    if (!formValid)
	    {
	    error = "Please Select User Status!!!!!!\n";
	    }
	    return error ;
	}
	
function clearElements(el)
{
    var x, y, z, type = null, object = [];
    object[0] = document.getElementById(el).getElementsByTagName('input');
    object[1] = document.getElementById(el).getElementsByTagName('textarea');
    object[2] = document.getElementById(el).getElementsByTagName('select');
    for (x = 0; x < object.length; x++) {
        for (y = 0; y < object[x].length; y++) {
            type = object[x][y].type;
            switch (type) {
            case 'text':
            case 'textarea':
            case 'password':
                object[x][y].value = '';
                break;
            case 'radio':
            case 'checkbox':
                object[x][y].checked = '';
                break;
            case 'select-one':
                object[x][y].options[0].selected = true;
                break;
            case 'select-multiple':
                for (z = 0; z < object[x][y].options.length; z++) {
                    object[x][y].options[z].selected = false;
                }
               break;
            } 
        } 
    }
}

function OnMatchPassword(fld1,fld2) 
{
		var objectDateV1=document.getElementById(fld1);
		var dateV1=objectDateV1.value;
		var objectDateV2=document.getElementById(fld2);
		var dateV2=objectDateV2.value;
		if(dateV1!=dateV2)
			{
			alert("Password Your Entered Dosen't Match");
			return false;
			}
	}
