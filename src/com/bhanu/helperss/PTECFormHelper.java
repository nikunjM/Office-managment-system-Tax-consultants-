package com.bhanu.helperss;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import javax.servlet.http.HttpServletRequest;
import com.bhanu.Bean.PTECRegistrationBean;
public class PTECFormHelper {
	DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
    Calendar cal = Calendar.getInstance();
    String Datetime = dateFormat.format(cal.getTime());
	//Fill from Resultset
	public void fill(ResultSet pResultSet,PTECRegistrationBean lUserDetailsBean) throws SQLException
			{
				lUserDetailsBean.setPTECPkey(pResultSet.getString("PTEC_pKey"));
				lUserDetailsBean.setUserPkey(pResultSet.getString("PTEC_UserKey"));
				lUserDetailsBean.setSerPkey(pResultSet.getString("PTEC_SerKey"));
				lUserDetailsBean.setlPTECPeriod(pResultSet.getString("PTEC_Period"));
				lUserDetailsBean.setLpre_AmountPaid1(pResultSet.getString("PTEC_AmountPaid1"));
				lUserDetailsBean.setlAmountPaidDate1(pResultSet.getString("PTEC_AmountDate1"));
				lUserDetailsBean.setlAckNo(pResultSet.getString("PTEC_AckNo"));
				lUserDetailsBean.setlAckNoDate(pResultSet.getString("PTEC_AckNoDate"));
				lUserDetailsBean.setCreatedBy(pResultSet.getString("PTEC_CreatedBy"));
				lUserDetailsBean.setCreatedOn(pResultSet.getString("PTEC_CreatedOn"));
				lUserDetailsBean.setUpdatedBy(pResultSet.getString("PTEC_UpdatedBy"));
				lUserDetailsBean.setUpdatedOn(pResultSet.getString("PTEC_UpdatedOn"));
				lUserDetailsBean.setRemarks(pResultSet.getString("PTEC_Remarks"));
		     }
	public void fillDurinNull(PTECRegistrationBean lUserDetailsBean) throws SQLException
	{
		System.out.println("null ki condition main aaya.....");
		lUserDetailsBean.setPTECPkey("");
		lUserDetailsBean.setUserPkey("");
		lUserDetailsBean.setSerPkey("");
		lUserDetailsBean.setlPTECPeriod("");
		lUserDetailsBean.setLpre_AmountPaid1("");
		lUserDetailsBean.setlAmountPaidDate1("");
		lUserDetailsBean.setlAckNo("");
		lUserDetailsBean.setlAckNoDate("");
		lUserDetailsBean.setCreatedBy("");
		lUserDetailsBean.setCreatedOn("");
		lUserDetailsBean.setUpdatedBy("");
		lUserDetailsBean.setUpdatedOn("");
		lUserDetailsBean.setRemarks("");
	}
	//Fill from HttprequestObject
		public void fillHelper(HttpServletRequest pHttpRequest,PTECRegistrationBean lUserDetailsBean)throws Exception 
		{
			String lUserPkey=pHttpRequest.getParameter("PKey"); 
			String lSerPkey=pHttpRequest.getParameter("SerKey"); 
			String lPTECPeriod=pHttpRequest.getParameter("AssYr");
			String lpre_AmountPaid1=pHttpRequest.getParameter("pre_AmountPaid1");
			String lAmountPaidDate1=pHttpRequest.getParameter("AmountPaidDate1");
			String lAckNo=pHttpRequest.getParameter("AckNo");
			String lAckNoDate=pHttpRequest.getParameter("AckNoDate");
			String LRemarks=pHttpRequest.getParameter("VatRemarks");
			String UpdatedBy=pHttpRequest.getParameter("EntryMAdeBy");
			
			lUserDetailsBean.setUserPkey(lUserPkey);
			lUserDetailsBean.setSerPkey(lSerPkey);
			lUserDetailsBean.setlPTECPeriod( lPTECPeriod);
			lUserDetailsBean.setLpre_AmountPaid1( lpre_AmountPaid1);
			lUserDetailsBean.setlAmountPaidDate1( lAmountPaidDate1);
			lUserDetailsBean.setlAckNo( lAckNo);
			lUserDetailsBean.setlAckNoDate( lAckNoDate);
			lUserDetailsBean.setRemarks(LRemarks);
			lUserDetailsBean.setCreatedBy(UpdatedBy );
			lUserDetailsBean.setUpdatedBy( UpdatedBy);
	 			}
		
		
		public void PTECinsert(Connection pConnection,PTECRegistrationBean pUserBean) throws SQLException
		{
			ResultSet resultSet=null;
			StringBuilder lSql = new StringBuilder();
			lSql.append("INSERT INTO PTECService(PTEC_UserKey,PTEC_SerKey,PTEC_Period,PTEC_AmountPaid,PTEC_AmountDate,PTEC_AckNo,PTEC_AckNoDate,PTEC_Remarks,PTEC_CreatedBy,PTEC_CreatedOn,PTEC_UpdatedBy,PTEC_UpdatedOn)");
			lSql.append(" VALUES (");
			lSql.append("'").append(pUserBean.getUserPkey()).append("',");
			lSql.append("'").append(pUserBean.getSerPkey()).append("',");
			lSql.append("'").append(pUserBean.getlPTECPeriod()).append("',");
		    lSql.append("'").append(pUserBean.getLpre_AmountPaid1()).append("',");
			lSql.append("'").append(pUserBean.getlAmountPaidDate1()).append("',");
			lSql.append("'").append(pUserBean.getlAckNo()).append("',");
			lSql.append("'").append(pUserBean.getlAckNoDate()).append("',");
			lSql.append("'").append(pUserBean.getRemarks()).append("',");
			lSql.append("'").append(pUserBean.getCreatedBy()).append("',");
			lSql.append("'").append(Datetime).append("',");
			lSql.append("'").append(pUserBean.getUpdatedBy()).append("',");
			lSql.append("'").append(Datetime).append("');");
			Statement lSt= pConnection.createStatement();
			System.out.println(lSql.toString());
			lSt.execute(lSql.toString());//for inserting elemnt into data base
				}
			public void updateUserDetails(Connection pConnection,PTECRegistrationBean pUserBean,String Pkey) throws SQLException
			{
				StringBuilder lSql = new StringBuilder();
				lSql.append("vatservice");
				lSql.append(" ,PTEC_Period='").append(pUserBean.getlPTECPeriod()).append("'");//both are always nill
				lSql.append(" ,PTEC_AmountPaid1='").append(pUserBean.getLpre_AmountPaid1()).append("'");//both are always nill
				lSql.append(" ,PTEC_AmountDate1='").append(pUserBean.getlAmountPaidDate1()).append("'");
				lSql.append(" ,PTEC_AckNo='").append(pUserBean.getlAckNo()).append("'");
				lSql.append(" ,PTEC_AckNoDate='").append(pUserBean.getlAckNoDate()).append("'");
				lSql.append(" ,PTEC_Remarks='").append(pUserBean.getRemarks()).append("'");
				lSql.append(" ,PTEC_UpdatedBy='").append(pUserBean.getUpdatedBy()).append("'");
				lSql.append(" ,PTEC_UpdatedOn='").append(Datetime).append("'");
				lSql.append(" WHERE PTEC_pKey='").append(Pkey).append("'");
				Statement lSt= pConnection.createStatement();
				System.out.println("query"+lSql.toString());
				lSt.executeUpdate(lSql.toString());
			}
			}
