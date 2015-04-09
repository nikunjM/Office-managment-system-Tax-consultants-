package com.bhanu.helperss;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import javax.servlet.http.HttpServletRequest;
import com.bhanu.Bean.CSTRegistrationFormBean;
public class CstFormHelper {
	DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
    Calendar cal = Calendar.getInstance();
    String Datetime = dateFormat.format(cal.getTime());
	//Fill from Resultset
    
	public void fill(ResultSet pResultSet,CSTRegistrationFormBean lUserDetailsBean) throws SQLException
			{
				lUserDetailsBean.setCstPkey(pResultSet.getString("Cst_pKey"));
				lUserDetailsBean.setUserPkey(pResultSet.getString("Cst_UserKey"));
				lUserDetailsBean.setSerPkey(pResultSet.getString("Cst_SerKey"));
				lUserDetailsBean.setlCstType(pResultSet.getString("Cst_Type"));
				lUserDetailsBean.setlCstPeriod(pResultSet.getString("Cst_Period"));
				lUserDetailsBean.setlAmountPayable(pResultSet.getString("Cst_AmountPayable")); 
				lUserDetailsBean.setLpre_AmountPaid1(pResultSet.getString("Cst_AmountPaid1"));
				lUserDetailsBean.setlAmountPaidDate1(pResultSet.getString("Cst_AmountDate1"));
				lUserDetailsBean.setLpre_AmountPaid2(pResultSet.getString("Cst_AmountPaid2"));
				lUserDetailsBean.setlAmountPaidDate2(pResultSet.getString("Cst_AmountDate2"));
				lUserDetailsBean.setLpre_AmountPaid3(pResultSet.getString("Cst_AmountPaid3"));
				lUserDetailsBean.setlAmountPaidDate3(pResultSet.getString("Cst_AmountDate3"));
				lUserDetailsBean.setLpre_AmountPaid4(pResultSet.getString("Cst_AmountPaid4"));
				lUserDetailsBean.setlAmountPaidDate4(pResultSet.getString("Cst_AmountDate4"));
				lUserDetailsBean.setlAckNo(pResultSet.getString("Cst_AckNo"));
				lUserDetailsBean.setlAckNoDate(pResultSet.getString("Cst_AckNoDate"));
				lUserDetailsBean.setlE1E2FromAppl(pResultSet.getString("Cst_E1E2Form"));
				lUserDetailsBean.setlFFromAppl(pResultSet.getString("Cst_Fform"));
				lUserDetailsBean.setlCstStatus(pResultSet.getString("Cst_Status"));
				lUserDetailsBean.setCreatedBy(pResultSet.getString("Cst_CreatedBy"));
				lUserDetailsBean.setCreatedOn(pResultSet.getString("Cst_CreatedOn"));
				lUserDetailsBean.setUpdatedBy(pResultSet.getString("Cst_UpdatedBy"));
				lUserDetailsBean.setUpdatedOn(pResultSet.getString("Cst_UpdatedOn"));
				lUserDetailsBean.setRemarks(pResultSet.getString("Cst_Remarks"));
		     }
	public void fillDurinNull(CSTRegistrationFormBean lUserDetailsBean) throws SQLException
	{
		System.out.println("null ki condition main aaya.....");
		lUserDetailsBean.setCstPkey("");
		lUserDetailsBean.setUserPkey("");
		lUserDetailsBean.setSerPkey("");
		lUserDetailsBean.setlCstType("");
		lUserDetailsBean.setlCstPeriod("");
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
		lUserDetailsBean.setlE1E2FromAppl("");
		lUserDetailsBean.setlFFromAppl("");
		lUserDetailsBean.setlCstStatus("");
		lUserDetailsBean.setCreatedBy("");
		lUserDetailsBean.setCreatedOn("");
		lUserDetailsBean.setUpdatedBy("");
		lUserDetailsBean.setUpdatedOn("");
		lUserDetailsBean.setRemarks("");
	}
	//Fill from HttprequestObject
		public void fillHelper(HttpServletRequest pHttpRequest,CSTRegistrationFormBean lUserDetailsBean)throws Exception 
		{
			 
			//String lVatPkey=pHttpRequest.getParameter("");
			String lUserPkey=pHttpRequest.getParameter("PKey"); 
			String lSerPkey=pHttpRequest.getParameter("SerKey"); 
			String lVatType=pHttpRequest.getParameter("VatType");
			String lVatPeriod=pHttpRequest.getParameter("VatPeriod");
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
			String lCFromAppl=pHttpRequest.getParameter("CFromAppl");
			String lHFromAppl=pHttpRequest.getParameter("HFromAppl");
			String lVatStatus=pHttpRequest.getParameter("VatStatus");
			String LRemarks=pHttpRequest.getParameter("VatRemarks");
			//String CreatedBy=pHttpRequest.getParameter("CreatedBy");
			//String CreatedOn=pHttpRequest.getParameter("");
			//String UpdatedBy=pHttpRequest.getParameter("");
			//String UpdatedOn=pHttpRequest.getParameter("");
			
			//lUserDetailsBean.setpKey();
			//lUserDetailsBean.setVatPkey( );
			lUserDetailsBean.setUserPkey(lUserPkey);
			lUserDetailsBean.setSerPkey(lSerPkey);
			lUserDetailsBean.setlCstType( lVatType);
			lUserDetailsBean.setlCstPeriod( lVatPeriod);
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
			lUserDetailsBean.setlE1E2FromAppl( lCFromAppl);
			lUserDetailsBean.setlFFromAppl( lHFromAppl);
			lUserDetailsBean.setlCstStatus(lVatStatus );
			lUserDetailsBean.setRemarks(LRemarks);
			//lUserDetailsBean.setCreatedBy( );
			//lUserDetailsBean.setCreatedOn( );
			//lUserDetailsBean.setUpdatedBy( );
			//lUserDetailsBean.setUpdatedOn( );
			
	 			}
			public void Cstinsert(Connection pConnection,CSTRegistrationFormBean pUserBean) throws SQLException
		{
			ResultSet resultSet=null;
			//Cst_pKey,Cst_UserKey,Cst_SerKey,Cst_Type,Cst_Period,Cst_AmountPayable,Cst_AmountPaid1,Cst_AmountDate1,Cst_AmountPaid2,Cst_AmountDate2,Cst_AmountPaid3,Cst_AmountDate3,Cst_AmountPaid4,Cst_AmountDate4,Cst_AckNo,Cst_AckNoDate,Cst_E1E2Form,Cst_Fform,Cst_Status,Cst_CreatedBy,Cst_CreatedOn,Cst_UpdatedBy,Cst_UpdatedOn
			StringBuilder lSql = new StringBuilder();
			lSql.append("INSERT INTO cstservice(Cst_UserKey,Cst_SerKey,Cst_Type,Cst_Period,Cst_AmountPayable,Cst_AmountPaid1,Cst_AmountDate1,Cst_AmountPaid2,Cst_AmountDate2,Cst_AmountPaid3,Cst_AmountDate3,Cst_AmountPaid4,Cst_AmountDate4," +
					"Cst_AckNo,Cst_AckNoDate,Cst_E1E2Form,Cst_Fform,Cst_Status,Cst_Remarks,Cst_CreatedBy,Cst_CreatedOn,Cst_UpdatedBy,Cst_UpdatedOn)");
			lSql.append(" VALUES (");
			lSql.append("'").append(pUserBean.getUserPkey()).append("',");
			lSql.append("'").append(pUserBean.getSerPkey()).append("',");
			lSql.append("'").append(pUserBean.getlCstType()).append("',");
			lSql.append("'").append(pUserBean.getlCstPeriod()).append("',");
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
			lSql.append("'").append(pUserBean.getlE1E2FromAppl()).append("',");    
			lSql.append("'").append(pUserBean.getlFFromAppl()).append("',"); 
			lSql.append("'").append(pUserBean.getlCstStatus()).append("',");
			lSql.append("'").append(pUserBean.getRemarks()).append("',");
			lSql.append("'").append(pUserBean.getCreatedBy()).append("',");
			lSql.append("'").append(pUserBean.getCreatedOn()).append("',");
			lSql.append("'").append(pUserBean.getUpdatedBy()).append("',");
			lSql.append("'").append(pUserBean.getUpdatedOn()).append("');");
			Statement lSt= pConnection.createStatement();
			System.out.println(lSql.toString());
			lSt.execute(lSql.toString());//for inserting elemnt into data base
				}
			public void updateUserDetails(Connection pConnection,CSTRegistrationFormBean pUserBean,String Pkey) throws SQLException
			{
				StringBuilder lSql = new StringBuilder();
				lSql.append("vatservice");
				lSql.append(" ,Cst_Type='").append(pUserBean.getlCstType()).append("'");
				lSql.append(" ,Cst_Period='").append(pUserBean.getlCstPeriod()).append("'");//both are always nill
				lSql.append(" ,Cst_AmountPayable='").append(pUserBean.getlAmountPayable()).append("'");//both are always nill
				lSql.append(" ,Cst_AmountPaid1='").append(pUserBean.getLpre_AmountPaid1()).append("'");//both are always nill
				lSql.append(" ,Cst_AmountDate1='").append(pUserBean.getlAmountPaidDate1()).append("'");
				lSql.append(" ,Cst_AmountPaid2='").append(pUserBean.getLpre_AmountPaid2()).append("'");//both are always nill
				lSql.append(" ,Cst_AmountDate2='").append(pUserBean.getlAmountPaidDate2()).append("'");
				lSql.append(" ,Cst_AmountPaid3'").append(pUserBean.getLpre_AmountPaid3()).append("'");
				lSql.append(" ,Cst_AmountDate3'").append(pUserBean.getlAmountPaidDate3()).append("'");
				lSql.append(" ,Cst_AmountPaid4='").append(pUserBean.getLpre_AmountPaid4()).append("'");
				lSql.append(" ,Cst_AmountDate4='").append(pUserBean.getlAmountPaidDate4()).append("'");
				lSql.append(" ,Cst_AckNo='").append(pUserBean.getlAckNo()).append("'");
				lSql.append(" ,Cst_AckNoDate='").append(pUserBean.getlAckNoDate()).append("'");
				lSql.append(" ,Cst_E1E2Form='").append(pUserBean.getlE1E2FromAppl()).append("'");
				lSql.append(" ,Cst_Fform='").append(pUserBean.getlFFromAppl()).append("'");
				lSql.append(" ,Cst_Status='").append(pUserBean.getlCstStatus()).append("'");
				lSql.append(" ,Cst_Remarks='").append(pUserBean.getRemarks()).append("'");
				lSql.append(" ,Cst_UpdatedBy='").append("nikunj625").append("'");
				lSql.append(" ,Cst_UpdatedOn='").append(Datetime).append("'");
				lSql.append(" WHERE Cst_pKey='").append(Pkey).append("'");
				Statement lSt= pConnection.createStatement();
				System.out.println("query"+lSql.toString());
				lSt.executeUpdate(lSql.toString());
			}
			}
			
