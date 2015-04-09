package com.bhanu.helperss;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import com.bhanu.Bean.BhanuUserDetailsBean;
import com.bhanu.Bean.ServiceSelector;
public class ServiceSelectoreHelper
{
	DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
    Calendar cal = Calendar.getInstance();
    String Datetime = dateFormat.format(cal.getTime());
	//Fill from Resultset
	public void fillService(ResultSet pResultSet,ServiceSelector lUserDetailsBean) throws SQLException
			{
		lUserDetailsBean.setPKey(pResultSet.getString(1));
		lUserDetailsBean.setFirstName(pResultSet.getString(3));
		lUserDetailsBean.setUserId(pResultSet.getString("Ser_UserId"));		 
		lUserDetailsBean.setYrSelect(pResultSet.getString("Ser_YearSelect"));
		lUserDetailsBean.setVatSelect(pResultSet.getString("Ser_VatSelection"));
		lUserDetailsBean.setVatType(pResultSet.getString("Ser_Vatperiod"));
		lUserDetailsBean.setVatAudit(pResultSet.getString("Ser_VatAudit"));
		lUserDetailsBean.setYrSelectPTEC(pResultSet.getString("Ser_PTECSelection"));
		lUserDetailsBean.setPTECType(pResultSet.getString("Ser_PTECperiod"));
		lUserDetailsBean.setPTECAudit(pResultSet.getString("Ser_PTECAudit"));
		lUserDetailsBean.setPTRCYrSelect(pResultSet.getString("Ser_PtrcSelection"));
		lUserDetailsBean.setPTRCType(pResultSet.getString("Ser_Ptrcperiod"));
		lUserDetailsBean.setPTRCAudit(pResultSet.getString("Ser_PtrcAudit"));
		lUserDetailsBean.setExciseYrSelect(pResultSet.getString("Ser_ExciseSelection"));
		lUserDetailsBean.setExciseType(pResultSet.getString("Ser_Exciseperiod"));
		lUserDetailsBean.setExciseAudit(pResultSet.getString("Ser_ExciseAudit"));
		lUserDetailsBean.setSerTaxYrSelect(pResultSet.getString("Ser_ServiceTaxSelection"));
		lUserDetailsBean.setSerTaxType(pResultSet.getString("Ser_ServiceTaxperiod"));
		lUserDetailsBean.setServiceAudit(pResultSet.getString("Ser_ServiceAudit"));
		lUserDetailsBean.setTDSYrSelect(pResultSet.getString("Ser_TDSSelection"));
		lUserDetailsBean.setTDSType(pResultSet.getString("Ser_Tdsperiod"));
		lUserDetailsBean.setTDSAudit(pResultSet.getString("Ser_TdsAudit"));
		lUserDetailsBean.setIncomTaxYrSelect(pResultSet.getString("Ser_IncometaxSelection"));
		lUserDetailsBean.setIncomTaxType(pResultSet.getString("Ser_IncomeTaxperiod"));
		lUserDetailsBean.setInocmeTaxAudit(pResultSet.getString("Ser_IncomeTaxAudit"));
		  }
		public void fillServiceCommon(ResultSet pResultSet,ServiceSelector lUserDetailsBean) throws SQLException
			{
		lUserDetailsBean.setPKey(pResultSet.getString(1));
		lUserDetailsBean.setUserId(pResultSet.getString(2));
		lUserDetailsBean.setFirstName(pResultSet.getString(3));//company Name
		lUserDetailsBean.setYrSelect(pResultSet.getString(4));
		lUserDetailsBean.setVatSelect(pResultSet.getString(5));// any Service Selected 
		lUserDetailsBean.setVatType(pResultSet.getString(6));// any Service Selected 
		lUserDetailsBean.setVatAudit(pResultSet.getString(7));// any Service Selected 
		  }
		public void fillServicePTEC(ResultSet pResultSet,ServiceSelector lUserDetailsBean) throws SQLException
			{
		lUserDetailsBean.setPKey(pResultSet.getString(1));
		lUserDetailsBean.setFirstName(pResultSet.getString(3));
		lUserDetailsBean.setUserId(pResultSet.getString("Ser_UserId"));		 
		lUserDetailsBean.setYrSelect(pResultSet.getString("Ser_YearSelect"));
		lUserDetailsBean.setVatSelect(pResultSet.getString("Ser_VatSelection"));
		lUserDetailsBean.setVatType(pResultSet.getString("Ser_Vatperiod"));
		lUserDetailsBean.setVatAudit(pResultSet.getString("Ser_VatAudit"));
		lUserDetailsBean.setYrSelectPTEC(pResultSet.getString("Ser_PTECSelection"));
		lUserDetailsBean.setPTECType(pResultSet.getString("Ser_PTECperiod"));
		lUserDetailsBean.setPTECAudit(pResultSet.getString("Ser_PTECAudit"));
		lUserDetailsBean.setPTRCYrSelect(pResultSet.getString("Ser_PtrcSelection"));
		lUserDetailsBean.setPTRCType(pResultSet.getString("Ser_Ptrcperiod"));
		lUserDetailsBean.setPTRCAudit(pResultSet.getString("Ser_PtrcAudit"));
		lUserDetailsBean.setExciseYrSelect(pResultSet.getString("Ser_ExciseSelection"));
		lUserDetailsBean.setExciseType(pResultSet.getString("Ser_Exciseperiod"));
		lUserDetailsBean.setExciseAudit(pResultSet.getString("Ser_ExciseAudit"));
		lUserDetailsBean.setSerTaxYrSelect(pResultSet.getString("Ser_ServiceTaxSelection"));
		lUserDetailsBean.setSerTaxType(pResultSet.getString("Ser_ServiceTaxperiod"));
		lUserDetailsBean.setServiceAudit(pResultSet.getString("Ser_ServiceAudit"));
		lUserDetailsBean.setTDSYrSelect(pResultSet.getString("Ser_TDSSelection"));
		lUserDetailsBean.setTDSType(pResultSet.getString("Ser_Tdsperiod"));
		lUserDetailsBean.setTDSAudit(pResultSet.getString("Ser_TdsAudit"));
		lUserDetailsBean.setIncomTaxYrSelect(pResultSet.getString("Ser_IncometaxSelection"));
		lUserDetailsBean.setIncomTaxType(pResultSet.getString("Ser_IncomeTaxperiod"));
		lUserDetailsBean.setInocmeTaxAudit(pResultSet.getString("Ser_IncomeTaxAudit"));
		  }
		public void fillServiceIncomeTax(ResultSet pResultSet,ServiceSelector lUserDetailsBean) throws SQLException
		{
	lUserDetailsBean.setPKey(pResultSet.getString(1));
	lUserDetailsBean.setFirstName(pResultSet.getString(3));
	lUserDetailsBean.setUserId(pResultSet.getString("Ser_UserId"));		 
	lUserDetailsBean.setYrSelect(pResultSet.getString("Ser_YearSelect"));
	lUserDetailsBean.setVatSelect(pResultSet.getString("Ser_VatSelection"));
	lUserDetailsBean.setVatType(pResultSet.getString("Ser_Vatperiod"));
	lUserDetailsBean.setVatAudit(pResultSet.getString("Ser_VatAudit"));
	lUserDetailsBean.setYrSelectPTEC(pResultSet.getString("Ser_PTECSelection"));
	lUserDetailsBean.setPTECType(pResultSet.getString("Ser_PTECperiod"));
	lUserDetailsBean.setPTECAudit(pResultSet.getString("Ser_PTECAudit"));
	lUserDetailsBean.setPTRCYrSelect(pResultSet.getString("Ser_PtrcSelection"));
	lUserDetailsBean.setPTRCType(pResultSet.getString("Ser_Ptrcperiod"));
	lUserDetailsBean.setPTRCAudit(pResultSet.getString("Ser_PtrcAudit"));
	lUserDetailsBean.setExciseYrSelect(pResultSet.getString("Ser_ExciseSelection"));
	lUserDetailsBean.setExciseType(pResultSet.getString("Ser_Exciseperiod"));
	lUserDetailsBean.setExciseAudit(pResultSet.getString("Ser_ExciseAudit"));
	lUserDetailsBean.setSerTaxYrSelect(pResultSet.getString("Ser_ServiceTaxSelection"));
	lUserDetailsBean.setSerTaxType(pResultSet.getString("Ser_ServiceTaxperiod"));
	lUserDetailsBean.setServiceAudit(pResultSet.getString("Ser_ServiceAudit"));
	lUserDetailsBean.setTDSYrSelect(pResultSet.getString("Ser_TDSSelection"));
	lUserDetailsBean.setTDSType(pResultSet.getString("Ser_Tdsperiod"));
	lUserDetailsBean.setTDSAudit(pResultSet.getString("Ser_TdsAudit"));
	lUserDetailsBean.setIncomTaxYrSelect(pResultSet.getString("Ser_IncometaxSelection"));
	lUserDetailsBean.setIncomTaxType(pResultSet.getString("Ser_IncomeTaxperiod"));
	lUserDetailsBean.setInocmeTaxAudit(pResultSet.getString("Ser_IncomeTaxAudit"));
	  }
	
	public void fillDurinNull(BhanuUserDetailsBean lUserDetailsBean) throws SQLException
	{
		System.out.println("null ki condition main aaya.....");
		lUserDetailsBean.setpKey("");
		lUserDetailsBean.setTitle("");
		lUserDetailsBean.setCompanyName("");
		lUserDetailsBean.setPANNo("");
		lUserDetailsBean.setTanNo("");
		lUserDetailsBean.setVatTinNO("");
		lUserDetailsBean.setCstTinNo("");
		lUserDetailsBean.setFileNo("");
		lUserDetailsBean.setBagNo("");
		lUserDetailsBean.setFirstName("");
		lUserDetailsBean.setMiddleName("");
		lUserDetailsBean.setLastName("");
		lUserDetailsBean.setEmailId("");
		lUserDetailsBean.setMobileNo1("");
		lUserDetailsBean.setMoblieNo2("");    
		lUserDetailsBean.setWorkPhone("");
		lUserDetailsBean.setVatService("");
		lUserDetailsBean.setVatNo("");
		lUserDetailsBean.setVatAllocated("");
		lUserDetailsBean.setPTECService("");
		lUserDetailsBean.setPTECNO("");
		lUserDetailsBean.setPTECAllocated("");
		lUserDetailsBean.setPTRCService("");
		lUserDetailsBean.setPTRCNO("");
		lUserDetailsBean.setPTRCAllocated("");
		lUserDetailsBean.setExciseService("");
		lUserDetailsBean.setExciseNo("");
		lUserDetailsBean.setExciseAllocated("");
		lUserDetailsBean.setSerTaxService("");
		lUserDetailsBean.setSerTaxNo("");
		lUserDetailsBean.setSerTaxAllocation("");
		lUserDetailsBean.setTDSService("");
		lUserDetailsBean.setTdsNo("");
		lUserDetailsBean.setTdsAllocation("");
		lUserDetailsBean.setIncomeTaxService("");
		lUserDetailsBean.setIncomeTaxNo("");
		lUserDetailsBean.setIncomeTaxAllocation("");
		lUserDetailsBean.setComapnyAllocation("");
		lUserDetailsBean.setConsultancyAllocation("");
		lUserDetailsBean.setUserType("");
		lUserDetailsBean.setEntryMade("");
		lUserDetailsBean.setCreatedOn("");
		lUserDetailsBean.setUpdatedBy("");
		lUserDetailsBean.setUpdatedOn("");
	}
	
	//Fill from HttprequestObject
		public void fillHelper(HttpServletRequest pHttpRequest,ServiceSelector lUserDetailsBean)throws Exception 
		{
			String lUsrId=pHttpRequest.getParameter("UserPkey"); 
			String lYearSelect=pHttpRequest.getParameter("YrSelect");
			String lVatSelection=pHttpRequest.getParameter("VatSelect");
			String lVatperiod=pHttpRequest.getParameter("VatType");
			String lVatAudit=pHttpRequest.getParameter("VatAudit");
			String lPTECSelection=pHttpRequest.getParameter("YrSelectPTEC");
			String lPTECperiod=pHttpRequest.getParameter("PTECType");
			String lPTECAudit=pHttpRequest.getParameter("PTECAudit");
			String lPtrcSelection=pHttpRequest.getParameter("PTRCYrSelect");
			String lPtrcperiod=pHttpRequest.getParameter("PTRCType");
			String lPtrcAudit=pHttpRequest.getParameter("PTRCAudit");
			String lExciseSelection=pHttpRequest.getParameter("ExciseYrSelect");
			String lExciseperiod=pHttpRequest.getParameter("ExciseType");
			String lExciseAudit=pHttpRequest.getParameter("ExciseAudit");
			String lServiceTaxSelection=pHttpRequest.getParameter("SerTaxYrSelect");
			String lServiceTaxperiod=pHttpRequest.getParameter("SerTaxType");
			String lServiceAudit=pHttpRequest.getParameter("ServiceAudit");
			String lTDSSelection=pHttpRequest.getParameter("TDSYrSelect");
			String lTdsperiod=pHttpRequest.getParameter("TDSType");
			String lTdsAudit=pHttpRequest.getParameter("TDSAudit");
			String lIncometaxSelection=pHttpRequest.getParameter("IncomTaxYrSelect");
			String lIncomeTaxperiod=pHttpRequest.getParameter("IncomTaxType");
			String lIncomeTaxAudit=pHttpRequest.getParameter("InocmeTaxAudit");
			//String lCreatedBy=pHttpRequest.getParameter("");
			//String lCreatedOn=pHttpRequest.getParameter("");

			lUserDetailsBean.setUserId(lUsrId);
			lUserDetailsBean.setYrSelect(lYearSelect);
			lUserDetailsBean.setVatSelect(lVatSelection);
			lUserDetailsBean.setVatType(lVatperiod);
			lUserDetailsBean.setVatAudit(lVatAudit);
			lUserDetailsBean.setYrSelectPTEC(lPTECSelection);
			lUserDetailsBean.setPTECType(lPTECperiod);
			lUserDetailsBean.setPTECAudit(lPTECAudit);
			lUserDetailsBean.setPTRCYrSelect(lPtrcSelection);
			lUserDetailsBean.setPTRCType(lPtrcperiod);
			lUserDetailsBean.setPTRCAudit(lPtrcAudit);
			lUserDetailsBean.setExciseYrSelect(lExciseSelection);
			lUserDetailsBean.setExciseType(lExciseperiod);
			lUserDetailsBean.setExciseAudit(lExciseAudit);
			lUserDetailsBean.setSerTaxYrSelect(lServiceTaxSelection);
			lUserDetailsBean.setSerTaxType(lServiceTaxperiod);
			lUserDetailsBean.setServiceAudit(lServiceAudit);
			lUserDetailsBean.setTDSYrSelect(lTDSSelection);
			lUserDetailsBean.setTDSType(lTdsperiod);
			lUserDetailsBean.setTDSAudit(lTdsAudit);
			lUserDetailsBean.setIncomTaxYrSelect(lIncometaxSelection);
			lUserDetailsBean.setIncomTaxType(lIncomeTaxperiod);
			lUserDetailsBean.setInocmeTaxAudit(lIncomeTaxAudit);
			lUserDetailsBean.setCreatedBy("nikunj");//select propar way to do it
			lUserDetailsBean.setCreatedOn(Datetime);
	 			}
			public void insert(Connection pConnection,ServiceSelector pUserBean) throws SQLException
		{
			ResultSet resultSet=null;
			StringBuilder lSql = new StringBuilder();
			lSql.append("INSERT INTO ServiceSelector(Ser_UserId,Ser_YearSelect,Ser_VatSelection,Ser_Vatperiod,Ser_VatAudit,Ser_PTECSelection,Ser_PTECperiod,Ser_PTECAudit,Ser_PtrcSelection,Ser_Ptrcperiod,Ser_PtrcAudit,Ser_ExciseSelection,Ser_Exciseperiod,Ser_ExciseAudit,Ser_ServiceTaxSelection,Ser_ServiceTaxperiod,Ser_ServiceAudit,Ser_TDSSelection,Ser_Tdsperiod,Ser_TdsAudit,Ser_IncometaxSelection,Ser_IncomeTaxperiod,Ser_IncomeTaxAudit,Ser_CreatedBy,Ser_CreatedOn)");
			lSql.append(" VALUES (");
			lSql.append("'").append(pUserBean.getUserId()).append("',");
			lSql.append("'").append(pUserBean.getYrSelect()).append("',");
			lSql.append("'").append(pUserBean.getVatSelect()).append("',");
			lSql.append("'").append(pUserBean.getVatType()).append("',");
			lSql.append("'").append(pUserBean.getVatAudit()).append("',");
			lSql.append("'").append(pUserBean.getYrSelectPTEC()).append("',");
			lSql.append("'").append(pUserBean.getPTECType()).append("',");
			lSql.append("'").append(pUserBean.getPTECAudit()).append("',");
			lSql.append("'").append(pUserBean.getPTRCYrSelect()).append("',");
			lSql.append("'").append(pUserBean.getPTRCType()).append("',");
			lSql.append("'").append(pUserBean.getPTRCAudit()).append("',");
			lSql.append("'").append(pUserBean.getExciseYrSelect()).append("',");
			lSql.append("'").append(pUserBean.getExciseType()).append("',");
			lSql.append("'").append(pUserBean.getExciseAudit()).append("',");
			lSql.append("'").append(pUserBean.getSerTaxYrSelect()).append("',");
			lSql.append("'").append(pUserBean.getSerTaxType()).append("',");
			lSql.append("'").append(pUserBean.getServiceAudit()).append("',");
			lSql.append("'").append(pUserBean.getTDSYrSelect()).append("',");
			lSql.append("'").append(pUserBean.getTDSType()).append("',");
			lSql.append("'").append(pUserBean.getTDSAudit()).append("',");
			lSql.append("'").append(pUserBean.getIncomTaxYrSelect()).append("',");
			lSql.append("'").append(pUserBean.getIncomTaxType()).append("',");
			lSql.append("'").append(pUserBean.getInocmeTaxAudit()).append("',");
			lSql.append("'").append(pUserBean.getCreatedBy()).append("',");
			lSql.append("'").append(Datetime).append("');");
			Statement lSt= pConnection.createStatement();
			System.out.println(lSql.toString());
			lSt.execute(lSql.toString());//for inserting elemnt into data base
				}
			public void updateUserDetails(Connection pConnection,BhanuUserDetailsBean pUserBean,String Pkey) throws SQLException
			{
				ResultSet resultSet=null;
				StringBuilder lSql = new StringBuilder();
				lSql.append("UPDATE usrdetails");
				lSql.append(" SET  Usr_Title='").append(pUserBean.getTitle()).append("'");
			    lSql.append(" ,Usr_CompanyName='").append(pUserBean.getCompanyName()).append("'");
				lSql.append(" ,Usr_PanNo='").append(pUserBean.getPANNo()).append("'");
				lSql.append(" ,Usr_TANNo='").append(pUserBean.getTanNo()).append("'");
				lSql.append(" ,Usr_FileNo='").append(pUserBean.getFileNo()).append("'");
				lSql.append(" ,Usr_BagNo='").append(pUserBean.getBagNo()).append("'");
				lSql.append(" ,Usr_FirstName='").append(pUserBean.getFirstName()).append("'");
				lSql.append(" ,Usr_MiddleName='").append(pUserBean.getMiddleName()).append("'");
				lSql.append(" ,Usr_LastName='").append(pUserBean.getLastName()).append("'");
				lSql.append(" ,Usr_EmailId='").append(pUserBean.getEmailId()).append("'");
				lSql.append(" ,Usr_MobileNo1='").append(pUserBean.getMobileNo1()).append("'");
				lSql.append(" ,Usr_MoblieNo2='").append(pUserBean.getMoblieNo2()).append("'");
				lSql.append(" ,Usr_WorkPhone='").append(pUserBean.getWorkPhone()).append("'");
				lSql.append(" ,Usr_VatService='").append(pUserBean.getVatService()).append("'");
				lSql.append(" ,Usr_VatNo='").append(pUserBean.getVatNo()).append("'");
				lSql.append(" ,Usr_VatAllocated='").append(pUserBean.getVatAllocated()).append("'");
				lSql.append(" ,Usr_PTECService='").append(pUserBean.getPTECService()).append("'");
				lSql.append(" ,Usr_PTECNO='").append(pUserBean.getPTECNO()).append("'");
				lSql.append(" ,Usr_PTECAllocated='").append(pUserBean.getPTECAllocated()).append("'");
				lSql.append(" ,Usr_PTRCService='").append(pUserBean.getPTRCService()).append("'");
				lSql.append(" ,Usr_PTRCNO='").append(pUserBean.getPTRCNO()).append("'");
				lSql.append(" ,Usr_PTRCAllocated='").append(pUserBean.getPTRCAllocated()).append("'");
				lSql.append(" ,Usr_ExciseService='").append(pUserBean.getExciseService()).append("'");
				lSql.append(" ,Usr_ExciseNo='").append(pUserBean.getExciseNo()).append("'");
				lSql.append(" ,Usr_ExciseAllocated='").append(pUserBean.getExciseAllocated()).append("'");
				lSql.append(" ,Usr_SerTaxService='").append(pUserBean.getSerTaxService()).append("'");
				lSql.append(" ,Usr_SerTaxNo='").append(pUserBean.getSerTaxNo()).append("'");
				lSql.append(" ,Usr_SerTaxAllocation='").append(pUserBean.getSerTaxAllocation()).append("'");
				lSql.append(" ,Usr_TDSService='").append(pUserBean.getTDSService()).append("'");
				lSql.append(" ,Usr_TdsNo='").append(pUserBean.getTdsNo()).append("'");
				lSql.append(" ,Usr_TdsAllocation='").append(pUserBean.getTdsAllocation()).append("'");
				lSql.append(" ,Usr_IncomeTaxService='").append(pUserBean.getIncomeTaxService()).append("'");
				lSql.append(" ,Usr_IncomeTaxNo='").append(pUserBean.getIncomeTaxNo()).append("'");
				lSql.append(" ,Usr_IncomeTaxAllocation='").append(pUserBean.getIncomeTaxAllocation()).append("'");
				lSql.append(" ,Usr_ComapnyAllocation='").append(pUserBean.getComapnyAllocation()).append("'");
				lSql.append(" ,Usr_ConsultancyAllocation='").append(pUserBean.getConsultancyAllocation()).append("'");
				//lSql.append(" ,Usr_CreatedBy='").append(pUserBean.get)).append("'");
				//lSql.append(" ,Usr_CreatedOn='").append(pUserBean.get)).append("'");//No Need to change since already entered 
				//lSql.append(" ,Usr_UserStatus ='").append(pUserBean.getUserStatus()).append("'");
				//lSql.append(" ,Usr_UserType ='").append(pUserBean.getUserType()).append("'");
				lSql.append(" ,Usr_UpdatedBy ='").append(pUserBean.getEntryMade()).append("'");
				lSql.append(" ,Usr_UpdatedOn ='").append(Datetime).append("'");
				lSql.append(" ,Usr_UpdateVersion  =").append("Usr_UpdateVersion+1").append("");
				lSql.append(" WHERE Usr_Id='").append(Pkey).append("'");
				Statement lSt= pConnection.createStatement();
				System.out.println("query"+lSql.toString());
				lSt.executeUpdate(lSql.toString());
			}
			public static ArrayList<ArrayList> getApprovalIdDrop(String lDepartment) throws ServletException, SQLException
			{
				Statement statementHead=null;//Head
				ResultSet resultsetHeadDrop= null;//Head Resultset

				ConnectionHelper connClass=new ConnectionHelper();
				Connection connect = connClass.connect();
				statementHead = connect.createStatement();
				String HeadDropDown = "SELECT Head_id,Head_Deaprtment,Head_EmailId,Head_name,head_EmpId FROM Head_Masters  WHERE Head_Active ='1' AND Head_Deaprtment='"+lDepartment+"'";
				resultsetHeadDrop= statementHead.executeQuery(HeadDropDown);
				ArrayList<ArrayList> Heads=new ArrayList<ArrayList>();
				ArrayList nHeads;
				int cnt = 0;
				while(resultsetHeadDrop.next())
				{
					nHeads=new ArrayList();
				    cnt+=1;
				    nHeads.add(String.valueOf(cnt));
				    for(int i=1;i<=5;i++) 
				    {
				    	nHeads.add(resultsetHeadDrop.getObject(i));
				    }
				    Heads.add(nHeads);
				}
				return Heads;
			}			
		}
