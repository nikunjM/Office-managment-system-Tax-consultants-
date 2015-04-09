package com.bhanu.helperss;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import javax.servlet.http.HttpServletRequest;
import com.bhanu.Bean.PTRCRegistrationBean;
public class PTRCFormHelper {
	DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
    Calendar cal = Calendar.getInstance();
    String Datetime = dateFormat.format(cal.getTime());
	//Fill from Resultset
	public void fill(ResultSet pResultSet,PTRCRegistrationBean lUserDetailsBean) throws SQLException
			{
				lUserDetailsBean.setPTRCPkey(pResultSet.getString("PTRC_pKey"));
				lUserDetailsBean.setUserPkey(pResultSet.getString("PTRC_UserKey"));
				lUserDetailsBean.setSerPkey(pResultSet.getString("PTRC_SerKey"));
				lUserDetailsBean.setlPTRCType(pResultSet.getString("PTRC_Type"));
				lUserDetailsBean.setlPTRCPeriod(pResultSet.getString("PTRC_Period"));
				lUserDetailsBean.setlAmountPayable(pResultSet.getString("PTRC_AmountPayable")); 
				lUserDetailsBean.setLpre_AmountPaid1(pResultSet.getString("PTRC_AmountPaid1"));
				lUserDetailsBean.setlAmountPaidDate1(pResultSet.getString("PTRC_AmountDate1"));
				lUserDetailsBean.setLpre_AmountPaid2(pResultSet.getString("PTRC_AmountPaid2"));
				lUserDetailsBean.setlAmountPaidDate2(pResultSet.getString("PTRC_AmountDate2"));
				lUserDetailsBean.setLpre_AmountPaid3(pResultSet.getString("PTRC_AmountPaid3"));
				lUserDetailsBean.setlAmountPaidDate3(pResultSet.getString("PTRC_AmountDate3"));
				lUserDetailsBean.setLpre_AmountPaid4(pResultSet.getString("PTRC_AmountPaid4"));
				lUserDetailsBean.setlAmountPaidDate4(pResultSet.getString("PTRC_AmountDate4"));
				lUserDetailsBean.setlAckNo(pResultSet.getString("PTRC_AckNo"));
				lUserDetailsBean.setlAckNoDate(pResultSet.getString("PTRC_AckNoDate"));
				lUserDetailsBean.setlPTRCStatus(pResultSet.getString("PTRC_Status"));
				lUserDetailsBean.setCreatedBy(pResultSet.getString("PTRC_CreatedBy"));
				lUserDetailsBean.setCreatedOn(pResultSet.getString("PTRC_CreatedOn"));
				lUserDetailsBean.setUpdatedBy(pResultSet.getString("PTRC_UpdatedBy"));
				lUserDetailsBean.setUpdatedOn(pResultSet.getString("PTRC_UpdatedOn"));
				lUserDetailsBean.setRemarks(pResultSet.getString("PTRC_Remarks"));
		     }
	public void fillDurinNull(PTRCRegistrationBean lUserDetailsBean) throws SQLException
	{
		System.out.println("null ki condition main aaya.....");
		lUserDetailsBean.setPTRCPkey("");
		lUserDetailsBean.setUserPkey("");
		lUserDetailsBean.setSerPkey("");
		lUserDetailsBean.setlPTRCType("");
		lUserDetailsBean.setlPTRCPeriod("");
		lUserDetailsBean.setlAmountPayable("");
		lUserDetailsBean.setLpre_AmountPaid1("");
		lUserDetailsBean.setlAmountPaidDate1("");
		lUserDetailsBean.setLpre_AmountPaid2("");
		lUserDetailsBean.setlAmountPaidDate2("");
		lUserDetailsBean.setLpre_AmountPaid3("");
		lUserDetailsBean.setlAmountPaidDate3("");
		lUserDetailsBean.setLpre_AmountPaid4("");
		lUserDetailsBean.setlAmountPaidDate4("");
		lUserDetailsBean.setlAckNo("");
		lUserDetailsBean.setlAckNoDate("");
		lUserDetailsBean.setlPTRCStatus("");
		lUserDetailsBean.setCreatedBy("");
		lUserDetailsBean.setCreatedOn("");
		lUserDetailsBean.setUpdatedBy("");
		lUserDetailsBean.setUpdatedOn("");
		lUserDetailsBean.setRemarks("");
	}
	//Fill from HttprequestObject
		public void fillHelper(HttpServletRequest pHttpRequest,PTRCRegistrationBean lUserDetailsBean)throws Exception 
		{
			//String lVatPkey=pHttpRequest.getParameter("");
			String lUserPkey=pHttpRequest.getParameter("PKey"); 
			String lSerPkey=pHttpRequest.getParameter("SerKey"); 
			String lVatType=pHttpRequest.getParameter("PTRCType");
			String lVatPeriod=pHttpRequest.getParameter("PTRCPeriod");
			String lAmountPayable=pHttpRequest.getParameter("AmountPayable");
			String lpre_AmountPaid1=pHttpRequest.getParameter("pre_AmountPaid1");
			String lAmountPaidDate1=pHttpRequest.getParameter("AmountPaidDate1");
			String lpre_AmountPaid2=pHttpRequest.getParameter("pre_AmountPaid2");
			String lAmountPaidDate2=pHttpRequest.getParameter("AmountPaidDate2");
			String lpre_AmountPaid3=pHttpRequest.getParameter("pre_AmountPaid3");
			String lAmountPaidDate3=pHttpRequest.getParameter("AmountPaidDate3");
			String lpre_AmountPaid4=pHttpRequest.getParameter("pre_AmountPaid4");
			String lAmountPaidDate4=pHttpRequest.getParameter("AmountPaidDate4");
			String lAckNo=pHttpRequest.getParameter("AckNo");
			String lAckNoDate=pHttpRequest.getParameter("AckNoDate");
			String lVatStatus=pHttpRequest.getParameter("PTRCStatus");
			String LRemarks=pHttpRequest.getParameter("PTECRemarks");
			//String CreatedBy=pHttpRequest.getParameter("CreatedBy");
			//String CreatedOn=pHttpRequest.getParameter("");
			//String UpdatedBy=pHttpRequest.getParameter("");
			//String UpdatedOn=pHttpRequest.getParameter("");
			//lUserDetailsBean.setpKey();
			//lUserDetailsBean.setVatPkey( );
			lUserDetailsBean.setUserPkey(lUserPkey);
			lUserDetailsBean.setSerPkey(lSerPkey);
			lUserDetailsBean.setlPTRCType( lVatType);
			lUserDetailsBean.setlPTRCPeriod( lVatPeriod);
			lUserDetailsBean.setlAmountPayable( lAmountPayable);
			lUserDetailsBean.setLpre_AmountPaid1( lpre_AmountPaid1);
			lUserDetailsBean.setlAmountPaidDate1( lAmountPaidDate1);
			lUserDetailsBean.setLpre_AmountPaid2(lpre_AmountPaid2 );
			lUserDetailsBean.setlAmountPaidDate2( lAmountPaidDate2);
			lUserDetailsBean.setLpre_AmountPaid3(lpre_AmountPaid3);
			lUserDetailsBean.setlAmountPaidDate3( lAmountPaidDate3);
			lUserDetailsBean.setLpre_AmountPaid4( lpre_AmountPaid4);
			lUserDetailsBean.setlAmountPaidDate4( lAmountPaidDate4);
			lUserDetailsBean.setlAckNo( lAckNo);
			lUserDetailsBean.setlAckNoDate( lAckNoDate);
			lUserDetailsBean.setlPTRCStatus(lVatStatus );
			lUserDetailsBean.setRemarks(LRemarks);
			//lUserDetailsBean.setCreatedBy( );
			//lUserDetailsBean.setCreatedOn( );
			//lUserDetailsBean.setUpdatedBy( );
			//lUserDetailsBean.setUpdatedOn( );
	 			}
			public void PTRCinsert(Connection pConnection,PTRCRegistrationBean pUserBean) throws SQLException
		{
			ResultSet resultSet=null;
			//PTRC_pKey,PTRC_UserKey,PTRC_SerKey,PTRC_Type,PTRC_Period,PTRC_AmountPayable,PTRC_AmountPaid1,PTRC_AmountDate1,PTRC_AmountPaid2,PTRC_AmountDate2,PTRC_AmountPaid3,PTRC_AmountDate3,PTRC_AmountPaid4,PTRC_AmountDate4,PTRC_AckNo,PTRC_AckNoDate,PTRC_E1E2Form,PTRC_Fform,PTRC_Status,PTRC_CreatedBy,PTRC_CreatedOn,PTRC_UpdatedBy,PTRC_UpdatedOn
			StringBuilder lSql = new StringBuilder();
			lSql.append("INSERT INTO PtrcService(PTRC_UserKey,PTRC_SerKey,PTRC_Type,PTRC_Period,PTRC_AmountPayable,PTRC_AmountPaid1,PTRC_AmountDate1,PTRC_AmountPaid2,PTRC_AmountDate2,PTRC_AmountPaid3,PTRC_AmountDate3,PTRC_AmountPaid4,PTRC_AmountDate4," +
					"PTRC_AckNo,PTRC_AckNoDate,PTRC_Status,PTRC_Remarks,PTRC_CreatedBy,PTRC_CreatedOn,PTRC_UpdatedBy,PTRC_UpdatedOn)");
			lSql.append(" VALUES (");
			lSql.append("'").append(pUserBean.getUserPkey()).append("',");
			lSql.append("'").append(pUserBean.getSerPkey()).append("',");
			lSql.append("'").append(pUserBean.getlPTRCType()).append("',");
			lSql.append("'").append(pUserBean.getlPTRCPeriod()).append("',");
			lSql.append("'").append(pUserBean.getlAmountPayable()).append("',");
		    lSql.append("'").append(pUserBean.getLpre_AmountPaid1()).append("',");
			lSql.append("'").append(pUserBean.getlAmountPaidDate1()).append("',");
			lSql.append("'").append(pUserBean.getLpre_AmountPaid2()).append("',");
			lSql.append("'").append(pUserBean.getlAmountPaidDate2()).append("',");
			lSql.append("'").append(pUserBean.getLpre_AmountPaid3()).append("',");
			lSql.append("'").append(pUserBean.getlAmountPaidDate3()).append("',");
			lSql.append("'").append(pUserBean.getLpre_AmountPaid4()).append("',");
			lSql.append("'").append(pUserBean.getlAmountPaidDate4()).append("',");
			lSql.append("'").append(pUserBean.getlAckNo()).append("',");
			lSql.append("'").append(pUserBean.getlAckNoDate()).append("',");
			lSql.append("'").append(pUserBean.getlPTRCStatus()).append("',");
			lSql.append("'").append(pUserBean.getRemarks()).append("',");
			lSql.append("'").append(pUserBean.getCreatedBy()).append("',");
			lSql.append("'").append(Datetime).append("',");
			lSql.append("'").append(pUserBean.getUpdatedBy()).append("',");
			lSql.append("'").append(pUserBean.getUpdatedOn()).append("');");
			Statement lSt= pConnection.createStatement();
			System.out.println(lSql.toString());
			lSt.execute(lSql.toString());//for inserting elemnt into data base
				}
			public void updateUserDetails(Connection pConnection,PTRCRegistrationBean pUserBean,String Pkey) throws SQLException
			{
				StringBuilder lSql = new StringBuilder();
				lSql.append("vatservice");
				lSql.append(" ,PTRC_Type='").append(pUserBean.getlPTRCType()).append("'");
				lSql.append(" ,PTRC_Period='").append(pUserBean.getlPTRCPeriod()).append("'");//both are always nill
				lSql.append(" ,PTRC_AmountPayable='").append(pUserBean.getlAmountPayable()).append("'");//both are always nill
				lSql.append(" ,PTRC_AmountPaid1='").append(pUserBean.getLpre_AmountPaid1()).append("'");//both are always nill
				lSql.append(" ,PTRC_AmountDate1='").append(pUserBean.getlAmountPaidDate1()).append("'");
				lSql.append(" ,PTRC_AmountPaid2='").append(pUserBean.getLpre_AmountPaid2()).append("'");//both are always nill
				lSql.append(" ,PTRC_AmountDate2='").append(pUserBean.getlAmountPaidDate2()).append("'");
				lSql.append(" ,PTRC_AmountPaid3'").append(pUserBean.getLpre_AmountPaid3()).append("'");
				lSql.append(" ,PTRC_AmountDate3'").append(pUserBean.getlAmountPaidDate3()).append("'");
				lSql.append(" ,PTRC_AmountPaid4='").append(pUserBean.getLpre_AmountPaid4()).append("'");
				lSql.append(" ,PTRC_AmountDate4='").append(pUserBean.getlAmountPaidDate4()).append("'");
				lSql.append(" ,PTRC_AckNo='").append(pUserBean.getlAckNo()).append("'");
				lSql.append(" ,PTRC_AckNoDate='").append(pUserBean.getlAckNoDate()).append("'");
				lSql.append(" ,PTRC_Status='").append(pUserBean.getlPTRCStatus()).append("'");
				lSql.append(" ,PTRC_Remarks='").append(pUserBean.getRemarks()).append("'");
				lSql.append(" ,PTRC_UpdatedBy='").append("nikunj625").append("'");
				lSql.append(" ,PTRC_UpdatedOn='").append(Datetime).append("'");
				lSql.append(" WHERE PTRC_pKey='").append(Pkey).append("'");
				Statement lSt= pConnection.createStatement();
				System.out.println("query"+lSql.toString());
				lSt.executeUpdate(lSql.toString());
			}
			}
			
