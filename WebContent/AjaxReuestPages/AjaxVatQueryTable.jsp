<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.bhanu.helperss.ConnectionHelper"%>
    <%@page language="java" import="java.util.*" import="java.sql.*" import="com.IssueHelper.*" import="java.text.*" import="java.util.Calendar" import="java.util.Collection;"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<%
String ServiceYear=request.getParameter("YrSelect");//Select Year;
String lPeriodselected=request.getParameter("SerPeriod");//Select Period;
Statement Tablestatement = null;
ResultSet Tableresultset = null;
ConnectionHelper connClass = new ConnectionHelper();
Connection connect = connClass.connect();
Tablestatement = connect.createStatement();
String QueryStringTable="select usr_id,Usr_CompanyName from usrdetails ism INNER JOIN  serviceselector isr on isr.Ser_UserId=ism.Usr_Id  where Ser_vatselection='yes' and isr.Ser_Vatperiod='"+lPeriodselected+"' and isr.Ser_YearSelect='"+ServiceYear+"' GROUP by Usr_id";	
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
    for(int i=1;i<=2;i++) //replace 3 with the length of the columns
    {
    	nProduct.add(Tableresultset.getObject(i));
    }
    Product.add(nProduct);
}
   if (Tablestatement != null) try { Tablestatement.close(); } catch (SQLException ignore) {}
   if (Tableresultset != null) try { Tableresultset.close(); } catch (SQLException ignore) {}
   if (connect != null) try { connect.close(); } catch (SQLException ignore) {}
%>
<body>
<td style="text-align: right; font-size: 12px;"><b>Select Comapny</b></td>
<td><select name="VatClients" id="VatClients">
					<option Selected="" value="">[Select]</option> 
					<%for (ArrayList temp : Product){ %>
					<option value="<%=temp.get(1)%>"><%=temp.get(2)%></option>
					<%}%>
				</select>
			</td>
			<td><button onclick="AjaxTablequerySubmiter();">SELECT</button></td>
</body>
</html>