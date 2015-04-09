package com.bhanu.helperss;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import javax.servlet.http.HttpServletRequest;
import com.bhanu.Bean.VatRegistraFormBean;
public class VatFormHelper
{
	DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
    Calendar cal = Calendar.getInstance();
    String Datetime = dateFormat.format(cal.getTime());
	//Fill from Resultset
    
	public void fill(ResultSet pResultSet,VatRegistraFormBean lUserDetailsBean) throws SQLException
			{
				lUserDetailsBean.setVatPkey(pResultSet.getString("Vat_pKey"));
				lUserDetailsBean.setUserPkey(pResultSet.getString("Vat_UserKey"));
				lUserDetailsBean.setSerPkey(pResultSet.getString("Vat_SerKey"));
				lUserDetailsBean.setlVatType(pResultSet.getString("Vat_Type"));
				lUserDetailsBean.setlVatPeriod(pResultSet.getString("Vat_Period"));
				lUserDetailsBean.setlAmountPayable(pResultSet.getString("Vat_AmountPayable")); 
				lUserDetailsBean.setLpre_AmountPaid1(pResultSet.getString("Vat_AmountPaid1"));
				lUserDetailsBean.setlAmountPaidDate1(pResultSet.getString("Vat_AmountDate1"));
				lUserDetailsBean.setLpre_AmountPaid2(pResultSet.getString("Vat_AmountPaid2"));
				lUserDetailsBean.setlAmountPaidDate2(pResultSet.getString("Vat_AmountDate2"));
				lUserDetailsBean.setLpre_AmountPaid3(pResultSet.getString("Vat_AmountPaid3"));
				lUserDetailsBean.setlAmountPaidDate3(pResultSet.getString("Vat_AmountDate3"));
				lUserDetailsBean.setLpre_AmountPaid4(pResultSet.getString("Vat_AmountPaid4"));
				lUserDetailsBean.setlAmountPaidDate4(pResultSet.getString("Vat_AmountDate4"));
				lUserDetailsBean.setlAckNo(pResultSet.getString("Vat_AckNo"));
				lUserDetailsBean.setlAckNoDate(pResultSet.getString("Vat_AckNoDate"));
				lUserDetailsBean.setlCFromAppl(pResultSet.getString("Vat_CForm"));
				lUserDetailsBean.setlHFromAppl(pResultSet.getString("Vat_Hform"));
				lUserDetailsBean.setlVatStatus(pResultSet.getString("Vat_Status"));
				lUserDetailsBean.setCreatedBy(pResultSet.getString("Vat_CreatedBy"));
				lUserDetailsBean.setCreatedOn(pResultSet.getString("Vat_CreatedOn"));
				lUserDetailsBean.setUpdatedBy(pResultSet.getString("Vat_UpdatedBy"));
				lUserDetailsBean.setUpdatedOn(pResultSet.getString("Vat_UpdatedOn"));
				lUserDetailsBean.setRemarks(pResultSet.getString("Vat_Remarks"));
		     }
	public void fillDurinNull(VatRegistraFormBean lUserDetailsBean) throws SQLException
	{
		System.out.println("null ki condition main aaya.....");
		lUserDetailsBean.setVatPkey("");
		lUserDetailsBean.setUserPkey("");
		lUserDetailsBean.setSerPkey("");
		lUserDetailsBean.setlVatType("");
		lUserDetailsBean.setlVatPeriod("");
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
		lUserDetailsBean.setlCFromAppl("");
		lUserDetailsBean.setlHFromAppl("");
		lUserDetailsBean.setlVatStatus("");
		lUserDetailsBean.setCreatedBy("");
		lUserDetailsBean.setCreatedOn("");
		lUserDetailsBean.setUpdatedBy("");
		lUserDetailsBean.setUpdatedOn("");
		lUserDetailsBean.setRemarks("");
	}
	//Fill from HttprequestObject
		public void fillHelper(HttpServletRequest pHttpRequest,VatRegistraFormBean lUserDetailsBean)throws Exception 
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
			String CreatedBy=pHttpRequest.getParameter("EntryMAdeBy");
			//String CreatedOn=pHttpRequest.getParameter("");
			String UpdatedBy=pHttpRequest.getParameter("EntryMAdeBy");
			//String UpdatedOn=pHttpRequest.getParameter("");
			
			//lUserDetailsBean.setpKey();
			//lUserDetailsBean.setVatPkey( );
			lUserDetailsBean.setUserPkey(lUserPkey);
			lUserDetailsBean.setSerPkey(lSerPkey);
			lUserDetailsBean.setlVatType( lVatType);
			lUserDetailsBean.setlVatPeriod( lVatPeriod);
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
			lUserDetailsBean.setlCFromAppl( lCFromAppl);
			lUserDetailsBean.setlHFromAppl( lHFromAppl);
			lUserDetailsBean.setlVatStatus(lVatStatus );
			lUserDetailsBean.setRemarks(LRemarks);
			lUserDetailsBean.setCreatedBy(CreatedBy);
			//lUserDetailsBean.setCreatedOn( );
			lUserDetailsBean.setUpdatedBy(UpdatedBy);
			//lUserDetailsBean.setUpdatedOn( );
			
	 			}
			public void Vatinsert(Connection pConnection,VatRegistraFormBean pUserBean) throws SQLException
		{
			ResultSet resultSet=null;
			//Vat_pKey,Vat_UserKey,Vat_SerKey,Vat_Type,Vat_Period,Vat_AmountPayable,Vat_AmountPaid1,Vat_AmountDate1,Vat_AmountPaid2,Vat_AmountDate2,Vat_AmountPaid3,Vat_AmountDate3,Vat_AmountPaid4,Vat_AmountDate4,Vat_AckNo,Vat_AckNoDate,Vat_CForm,Vat_Hform,Vat_Status,Vat_CreatedBy,Vat_CreatedOn,Vat_UpdatedBy,Vat_UpdatedOn
			StringBuilder lSql = new StringBuilder();
			lSql.append("INSERT INTO vatService(Vat_UserKey,Vat_SerKey,Vat_Type,Vat_Period,Vat_AmountPayable,Vat_AmountPaid1,Vat_AmountDate1,Vat_AmountPaid2,Vat_AmountDate2,Vat_AmountPaid3,Vat_AmountDate3,Vat_AmountPaid4,Vat_AmountDate4," +
					"Vat_AckNo,Vat_AckNoDate,Vat_CForm,Vat_Hform,Vat_Status,Vat_Remarks,Vat_CreatedBy,Vat_CreatedOn,Vat_UpdatedBy,Vat_UpdatedOn)");
			lSql.append(" VALUES (");
			lSql.append("'").append(pUserBean.getUserPkey()).append("',");
			lSql.append("'").append(pUserBean.getSerPkey()).append("',");
			lSql.append("'").append(pUserBean.getlVatType()).append("',");
			lSql.append("'").append(pUserBean.getlVatPeriod()).append("',");
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
			lSql.append("'").append(pUserBean.getlCFromAppl()).append("',");    
			lSql.append("'").append(pUserBean.getlHFromAppl()).append("',"); 
			lSql.append("'").append(pUserBean.getlVatStatus()).append("',");
			lSql.append("'").append(pUserBean.getRemarks()).append("',");
			lSql.append("'").append(pUserBean.getCreatedBy()).append("',");
			lSql.append("'").append(Datetime).append("',");
			lSql.append("'").append(pUserBean.getUpdatedBy()).append("',");
			lSql.append("'").append(Datetime).append("');");
			Statement lSt= pConnection.createStatement();
			System.out.println(lSql.toString());
			lSt.execute(lSql.toString());//for inserting elemnt into data base
				}
			public void updateUserDetails(Connection pConnection,VatRegistraFormBean pUserBean,String Pkey) throws SQLException
			{
				StringBuilder lSql = new StringBuilder();
				lSql.append("UPDATE vatservice");
				lSql.append("  SET Vat_Type='").append(pUserBean.getlVatType()).append("'");
				lSql.append(" ,Vat_Period='").append(pUserBean.getlVatPeriod()).append("'");//both are always nill
				lSql.append(" ,Vat_AmountPayable='").append(pUserBean.getlAmountPayable()).append("'");//both are always nill
				lSql.append(" ,Vat_AmountPaid1='").append(pUserBean.getLpre_AmountPaid1()).append("'");//both are always nill
				lSql.append(" ,Vat_AmountDate1='").append(pUserBean.getlAmountPaidDate1()).append("'");
				lSql.append(" ,Vat_AmountPaid2='").append(pUserBean.getLpre_AmountPaid2()).append("'");//both are always nill
				lSql.append(" ,Vat_AmountDate2='").append(pUserBean.getlAmountPaidDate2()).append("'");
				lSql.append(" ,Vat_AmountPaid3='").append(pUserBean.getLpre_AmountPaid3()).append("'");
				lSql.append(" ,Vat_AmountDate3='").append(pUserBean.getlAmountPaidDate3()).append("'");
				lSql.append(" ,Vat_AmountPaid4='").append(pUserBean.getLpre_AmountPaid4()).append("'");
				lSql.append(" ,Vat_AmountDate4='").append(pUserBean.getlAmountPaidDate4()).append("'");
				lSql.append(" ,Vat_AckNo='").append(pUserBean.getlAckNo()).append("'");
				lSql.append(" ,Vat_AckNoDate='").append(pUserBean.getlAckNoDate()).append("'");
				lSql.append(" ,Vat_CForm='").append(pUserBean.getlCFromAppl()).append("'");
				lSql.append(" ,Vat_Hform='").append(pUserBean.getlHFromAppl()).append("'");
				lSql.append(" ,Vat_Status='").append(pUserBean.getlVatStatus()).append("'");
				lSql.append(" ,Vat_Remarks='").append(pUserBean.getRemarks()).append("'");
				lSql.append(" ,Vat_UpdatedBy='").append(pUserBean.getUpdatedBy()).append("'");
				lSql.append(" ,Vat_UpdatedOn='").append(Datetime).append("'");
				lSql.append(" WHERE Vat_pKey='").append(Pkey).append("'");
				Statement lSt= pConnection.createStatement();
				System.out.println("query"+lSql.toString());
				lSt.executeUpdate(lSql.toString());
			}
			}
