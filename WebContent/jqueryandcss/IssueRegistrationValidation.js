	function validateFormOnSubmit1() {
		var reason = "";
		reason += validateEmpty(IssueComplain.Raised);
		reason += validateEmpty(IssueComplain.EmployeeId);
		reason += validateEmpty(IssueComplain.Product);
		reason += validateEmpty(IssueComplain.Severity);
		reason += validateEmpty(IssueComplain.ProblemType);
		reason += validateEmpty(IssueComplain.Priority);
		reason += validateEmpty(IssueComplain.upload);
		reason += validateEmpty(IssueComplain.Description);
		reason += radioPriority();
		
		if (reason != "") {
			alert("Some fields need correction:\n" + reason);
			return false;
		}
		else
		{
		CheckSession();
		document.IssueComplain.submit();
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
	function radioPriority() {
		error="";
		var radios = document.getElementsByName("PriorityScale");
	    var formValid = false;
	    var i = 0;
	    while (!formValid && i < radios.length) {
	        if (radios[i].checked) formValid = true;
	        i++;        
	    }
	    if (!formValid)
	    {
	    error = "Please Select Priority Scale!!!!!!\n";
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
