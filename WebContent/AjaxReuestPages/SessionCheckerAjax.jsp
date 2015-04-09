
<%@page import="com.bhanu.Bean.BhanuUserDetailsBean"%>
<%BhanuUserDetailsBean lbean=(BhanuUserDetailsBean)session.getAttribute("UserBean");%>
<%/*
boolean valid;
if(lbean!=null)
{
	valid= true;
System.out.println("Valid Value"+valid);
	}
else{
	valid= false;
	}
System.out.println("Valid Value"+valid);
*/
	%>
<%=lbean!= null ? "true" : "false" %>