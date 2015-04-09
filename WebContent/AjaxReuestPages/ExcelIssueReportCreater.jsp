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
 String filename="D:/app/IssueTracker/exlFiles/hello.xls" ;
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
   
   HSSFCell cells[]=new HSSFCell[15];
   for(int i=0;i<15;i++)
   {
   cells[i]=rowhead.createCell((short)i);
   cells[i].setCellStyle(style);
   }
   cells[0].setCellValue("id");
   cells[1].setCellValue("Empy Id");
   cells[2].setCellValue("Title");
   cells[3].setCellValue("First Name");
   cells[4].setCellValue("Middle Name");
   cells[5].setCellValue("Last Name");
   cells[6].setCellValue("Mobile No1");
   cells[7].setCellValue("Mobile No2");
   cells[8].setCellValue("Work Phone");
   cells[9].setCellValue("Ext No");
   cells[10].setCellValue("Email Id");
   cells[11].setCellValue("Department");
   cells[12].setCellValue("Location");
   cells[13].setCellValue("Emp.Manager Id");
   cells[14].setCellValue("Work Position");
   
   int i=1;
 ArrayList<UserDetailsBean> editBean = (ArrayList)session.getAttribute("rs");
  int ia=1;
	for (UserDetailsBean temp : editBean)
			{
   HSSFRow row = sheet.createRow((short)ia);
   row.createCell((short) 0).setCellValue(ia++);
   row.createCell((short) 1).setCellValue(temp.getEmployeeId().toUpperCase());
   row.createCell((short) 2).setCellValue(temp.getTitle().toUpperCase());
   row.createCell((short) 3).setCellValue(temp.getFirstName().toUpperCase());
   row.createCell((short) 4).setCellValue(temp.getMiddleName().toUpperCase());
   row.createCell((short) 5).setCellValue(temp.getLastName().toUpperCase());
   row.createCell((short) 6).setCellValue(temp.getMobileNo1().toUpperCase());
   row.createCell((short) 7).setCellValue(temp.getMoblieNo2().toUpperCase());
   row.createCell((short) 8).setCellValue(temp.getWorkPhone().toUpperCase());
   row.createCell((short) 9).setCellValue(temp.getExtNo().toUpperCase());
   row.createCell((short) 10).setCellValue(temp.getEmailId().toUpperCase());
   row.createCell((short) 11).setCellValue(temp.getDepartMent().toUpperCase());
   row.createCell((short) 12).setCellValue(temp.getLocation().toUpperCase());
   row.createCell((short) 13).setCellValue(temp.getEmpManagerId().toUpperCase());
   row.createCell((short) 14).setCellValue(temp.getWorkPosition().toUpperCase());
   		}
	   for(int Col=0;Col<16;Col++)
	   {
		   sheet.autoSizeColumn((short)Col);
		  
	   }
   FileOutputStream fileOut =  new FileOutputStream(filename);//file
   hwb.write(fileOut);
   fileOut.close();
   session.removeAttribute("rs");
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