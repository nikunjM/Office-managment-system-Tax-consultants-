<%@page import="java.util.ArrayList"%>
<%@page language="java" import="java.util.List"	import="java.sql.*" import="com.IssueHelper.*" import="java.util.ArrayList"  import="com.issueBean.*"%>
<html>
<head>
<meta http-equiv="pragma" content="no-cache; charset=ISO-8859-1">
<title>Save File</title>
</head>
<body>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFSheet"%>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFWorkbook"%>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFCell"%>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFRow"%>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFCellStyle"%>
<%@ page import="org.apache.poi.hssf.util.HSSFColor"%>
<%@ page import="org.apache.poi.hssf.usermodel.*"%>
<%@ page import="org.apache.poi.hssf.util.HSSFColor.*"%>
<%@ page import="java.io.* " %>
<%@page import="java.sql.* "%>
 <%
// String EX_DT=null;
 //ArrayList<UserDetailsBean> editBean = new ArrayList<UserDetailsBean>();
 //check before creating file exsits or not..........
 /*
 */
 
 String filename="D:/app/IssueTracker/exlFiles/helloa.xls" ;
 boolean exists = false;
 if (exists)
 {
  out.println("File or Directory exist.PLZ enter another filename");
 }
 else
 {
 String s1=null;
   try
 {
     //  EX_DT=(String)session.getAttribute( "dte" );
     // out.println("Ex_Dt in try"+EX_DT);
   HSSFWorkbook hwb=new HSSFWorkbook();
   HSSFSheet sheet =  hwb.createSheet("new sheet");
   HSSFSheet sheet1 =  hwb.createSheet("new sheet1");//we can n no of sheets
   
   
   HSSFCellStyle style = hwb.createCellStyle();
   style.setFillForegroundColor(HSSFColor.LIME.index);
   style.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
   style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
   style.setBorderBottom(HSSFCellStyle.BORDER_MEDIUM );
   style.setBorderLeft(HSSFCellStyle.BORDER_MEDIUM);
   style.setBorderRight(HSSFCellStyle.BORDER_MEDIUM) ;
   style.setBorderTop(HSSFCellStyle.BORDER_MEDIUM);
   
   HSSFFont font = hwb.createFont();
   font.setColor(HSSFColor.RED.index);
   font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
   
   HSSFRow rowhead=sheet.createRow((short)0);
   
   HSSFCell cells[]=new HSSFCell[13];
   for(int i=0;i<13;i++)
   {
   cells[i]=rowhead.createCell((short)i);
   cells[i].setCellStyle(style);
   out.println("Loop No"+i);
   }
   cells[0].setCellValue("Id");
   cells[1].setCellValue("Issue No");
   cells[2].setCellValue("Issue Raised Time");
   cells[3].setCellValue("Assigend To");
   cells[4].setCellValue("Product");
   cells[5].setCellValue("Severity");
   cells[6].setCellValue("Priority");
   cells[7].setCellValue("Priority Scale");
   cells[8].setCellValue("Problem Type");
   cells[9].setCellValue("Issue Status");
   cells[10].setCellValue("Description");
   cells[11].setCellValue("Attached File");
   cells[12].setCellValue("Resolution");
  	
  	int ia=1;
  	ArrayList<IssueRegistrerBean> editBean = (ArrayList)session.getAttribute("IssSession");
	for (IssueRegistrerBean temp : editBean)
			{
   HSSFRow row = sheet.createRow((short)ia);
   row.createCell((short) 0).setCellValue(ia++);
   row.createCell((short) 1).setCellValue(temp.getIssueNo().toUpperCase());
   row.createCell((short) 2).setCellValue(temp.getRaised().toUpperCase());
   row.createCell((short) 3).setCellValue(temp.getEmployeeId().toUpperCase());
   row.createCell((short) 4).setCellValue(temp.getProduct().toUpperCase());
   row.createCell((short) 5).setCellValue(temp.getlSeverity().toUpperCase());
   row.createCell((short) 6).setCellValue(temp.getPriority().toUpperCase());
   row.createCell((short) 7).setCellValue(temp.getPriorityScale().toUpperCase());
   row.createCell((short) 8).setCellValue(temp.getProblemType().toUpperCase());
   row.createCell((short) 9).setCellValue(temp.getStatus().toUpperCase());
   row.createCell((short) 10).setCellValue(temp.getDescription().toUpperCase());
   row.createCell((short) 11).setCellValue(temp.getUpload().toUpperCase());
   row.createCell((short) 12).setCellValue(temp.getIssResolution().toUpperCase());
   		}
	   for(int Col=0;Col<13;Col++)
	   {
		   sheet.autoSizeColumn((short)Col);
		   out.println("auto size"+Col);
		  
	   }
   FileOutputStream fileOut =  new FileOutputStream(filename);//file
   hwb.write(fileOut);
   fileOut.close();
   session.removeAttribute("IssSession");
   out.println("attribute removed");
   %>
   <h1><b><i><%out.println("Your excel file has been generated!");%></i></b></h1>
    <% 
 	}
  catch ( Exception ex )
   {   
    System.out.println(ex);
   }
   }
  %>
</body>
</html>