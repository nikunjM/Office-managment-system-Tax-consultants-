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
public class BhanuUserEntryHelper
{
	DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
    Calendar cal = Calendar.getInstance();
    String Datetime = dateFormat.format(cal.getTime());
	//Fill from Resultset
    
    public void fillVatFiller(ResultSet pResultSet,BhanuUserDetailsBean lUserDetailsBean) throws SQLException
	{
    	lUserDetailsBean.setpKey(pResultSet.getString(1));//Ser id
    	lUserDetailsBean.setBagNo(pResultSet.getString(2));//User ID 
    	lUserDetailsBean.setCompanyName(pResultSet.getString(3));//Comapny name
    	lUserDetailsBean.setPANNo(pResultSet.getString(4));//PTRC No
    	lUserDetailsBean.setFileNo(pResultSet.getString(5));//File No
    	lUserDetailsBean.setComapnyAllocation(pResultSet.getString(6));//Company Allocation
    	lUserDetailsBean.setConsultancyAllocation(pResultSet.getString(7));//Ptrc Allocation 
    	lUserDetailsBean.setVatAllocated(pResultSet.getString(8));//vat selection yes or no;//Consultancy Allocation 
    	lUserDetailsBean.setVatService(pResultSet.getString(9));//vat period m.q,y,hf
    	lUserDetailsBean.setVatNo(pResultSet.getString(10));//ptrc Selection 
    	lUserDetailsBean.setTitle(pResultSet.getString(11));//Audit
    	lUserDetailsBean.setWorkPhone(pResultSet.getString(12));//year selected;
	}
	public void fill(ResultSet pResultSet,BhanuUserDetailsBean lUserDetailsBean) throws SQLException
			{
		lUserDetailsBean.setpKey(pResultSet.getString("Usr_Id"));
		lUserDetailsBean.setTitle(pResultSet.getString("Usr_Title"));
		lUserDetailsBean.setCompanyName(pResultSet.getString("Usr_CompanyName"));
		lUserDetailsBean.setPANNo(pResultSet.getString("Usr_PanNo"));
		lUserDetailsBean.setTanNo(pResultSet.getString("Usr_TANNo"));
		lUserDetailsBean.setFileNo(pResultSet.getString("Usr_FileNo"));
		lUserDetailsBean.setBagNo(pResultSet.getString("Usr_BagNo"));
		lUserDetailsBean.setFirstName(pResultSet.getString("Usr_FirstName"));
		lUserDetailsBean.setMiddleName(pResultSet.getString("Usr_MiddleName"));
		lUserDetailsBean.setLastName(pResultSet.getString("Usr_LastName"));
		lUserDetailsBean.setEmailId(pResultSet.getString("Usr_EmailId"));
		lUserDetailsBean.setMobileNo1(pResultSet.getString("Usr_MobileNo1"));
		lUserDetailsBean.setMoblieNo2(pResultSet.getString("Usr_MoblieNo2"));    
		lUserDetailsBean.setWorkPhone(pResultSet.getString("Usr_WorkPhone"));
		lUserDetailsBean.setVatService(pResultSet.getString("Usr_VatService"));
		lUserDetailsBean.setVatNo(pResultSet.getString("Usr_VatNo"));
		lUserDetailsBean.setVatAllocated(pResultSet.getString("Usr_VatAllocated"));
		lUserDetailsBean.setPTECService(pResultSet.getString("Usr_PTECService"));
		lUserDetailsBean.setPTECNO(pResultSet.getString("Usr_PTECNO"));
		lUserDetailsBean.setPTECAllocated(pResultSet.getString("Usr_PTECAllocated"));
		lUserDetailsBean.setPTRCService(pResultSet.getString("Usr_PTRCService"));
		lUserDetailsBean.setPTRCNO(pResultSet.getString("Usr_PTRCNO"));
		lUserDetailsBean.setPTRCAllocated(pResultSet.getString("Usr_PTRCAllocated"));
		lUserDetailsBean.setExciseService(pResultSet.getString("Usr_ExciseService"));
		lUserDetailsBean.setExciseNo(pResultSet.getString("Usr_ExciseNo"));
		lUserDetailsBean.setExciseAllocated(pResultSet.getString("Usr_ExciseAllocated"));
		lUserDetailsBean.setSerTaxService(pResultSet.getString("Usr_SerTaxService"));
		lUserDetailsBean.setSerTaxNo(pResultSet.getString("Usr_SerTaxNo"));
		lUserDetailsBean.setSerTaxAllocation(pResultSet.getString("Usr_SerTaxAllocation"));
		lUserDetailsBean.setTDSService(pResultSet.getString("Usr_TDSService"));
		lUserDetailsBean.setTdsNo(pResultSet.getString("Usr_TdsNo"));
		lUserDetailsBean.setTdsAllocation(pResultSet.getString("Usr_TdsAllocation"));
		lUserDetailsBean.setIncomeTaxService(pResultSet.getString("Usr_IncomeTaxService"));
		lUserDetailsBean.setIncomeTaxNo(pResultSet.getString("Usr_IncomeTaxNo"));
		lUserDetailsBean.setIncomeTaxAllocation(pResultSet.getString("Usr_IncomeTaxAllocation"));
		lUserDetailsBean.setComapnyAllocation(pResultSet.getString("Usr_ComapnyAllocation"));
		lUserDetailsBean.setConsultancyAllocation(pResultSet.getString("Usr_ConsultancyAllocation"));
		lUserDetailsBean.setUserType(pResultSet.getString("Usr_UserType"));
		lUserDetailsBean.setEntryMade(pResultSet.getString("Usr_CreatedBy"));
		lUserDetailsBean.setCreatedOn(pResultSet.getString("Usr_CreatedOn"));
		lUserDetailsBean.setUpdatedBy(pResultSet.getString("Usr_UpdatedBy"));
		lUserDetailsBean.setUpdatedOn(pResultSet.getString("Usr_UpdatedOn"));
		lUserDetailsBean.setUpdatedVersion(pResultSet.getInt("Usr_UpdateVersion"));
		     }
	public void fillDurinNull(BhanuUserDetailsBean lUserDetailsBean) throws SQLException
	{
		System.out.println("null ki condition main aaya.....");
		lUserDetailsBean.setpKey("");
		lUserDetailsBean.setTitle("");
		lUserDetailsBean.setCompanyName("");
		lUserDetailsBean.setPANNo("");
		lUserDetailsBean.setTanNo("");
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
		public void fillHelper(HttpServletRequest pHttpRequest,BhanuUserDetailsBean lUserDetailsBean)throws Exception 
		{
			 
			//String lpKey=pHttpRequest.getParameter("UserPkey");
			String lTitle=pHttpRequest.getParameter("TitleDrop");
			String lCompanyName=pHttpRequest.getParameter("ComapnyName");
			String lPANNo=pHttpRequest.getParameter("PanNo");
			String lTanNo=pHttpRequest.getParameter("TANNo");
			String lFileNo=pHttpRequest.getParameter("FileNo");
			String lBagNo=pHttpRequest.getParameter("BagNo");
			String lFirstName=pHttpRequest.getParameter("FirstName");
			String lMiddleName=pHttpRequest.getParameter("MiddleName");
			String lLastName=pHttpRequest.getParameter("LastName");
			String lEmailId=pHttpRequest.getParameter("EmailId");
			String lMobileNo1=pHttpRequest.getParameter("PhoneNo1");
			String lMoblieNo2=pHttpRequest.getParameter("PhoneNo2");    
			String lWorkPhone=pHttpRequest.getParameter("WorkPhone1");
			String lVatService=pHttpRequest.getParameter("VatSer");
			String lVatNo=pHttpRequest.getParameter("VatNo");
			String lVatAllocated=pHttpRequest.getParameter("PersonAllocationVat");
			String lPTECService=pHttpRequest.getParameter("PTECSer");
			String lPTECNO=pHttpRequest.getParameter("PTECNo");
			String lPTECAllocated=pHttpRequest.getParameter("PersonAllocationPTEC");
			String lPTRCService=pHttpRequest.getParameter("PTRCSer");
			String lPTRCNO=pHttpRequest.getParameter("PTRCNo");
			String lPTRCAllocated=pHttpRequest.getParameter("PersonAllocationPTRC");
			String lExciseService=pHttpRequest.getParameter("ExciseSer");
			String lExciseNo=pHttpRequest.getParameter("ExciseNo");
			String lExciseAllocated=pHttpRequest.getParameter("PersonAllocationExcise");
			String lSerTaxService=pHttpRequest.getParameter("ServiceTax");
			String lSerTaxNo=pHttpRequest.getParameter("ServiceTaxNo");
			String lSerTaxAllocation=pHttpRequest.getParameter("PersonAllocationServiceTaxNo");
			String lTDSService=pHttpRequest.getParameter("TDSSer");
			String lTdsNo=pHttpRequest.getParameter("TDSNo");
			String lTdsAllocation=pHttpRequest.getParameter("PersonAllocationTDSSer");
			String lIncomeTaxService=pHttpRequest.getParameter("IncomeTaxSer");
			String lIncomeTaxNo=pHttpRequest.getParameter("IncomeTaxNo");
			String lIncomeTaxAllocation=pHttpRequest.getParameter("PersonAllocationIncomeTaxNo");
			String lComapnyAllocation=pHttpRequest.getParameter("PersonAllocation");
			String lConsultancyAllocation=pHttpRequest.getParameter("FirmAllocation");
			String lEntryMade=pHttpRequest.getParameter("EntryMAdeBy");
			/*
			String lUserType=pHttpRequest.getParameter("");
			String lCreatedOn=pHttpRequest.getParameter("");
			String lUpdatedBy=pHttpRequest.getParameter("");
			String lUpdatedOn=pHttpRequest.getParameter(" ");
			*/
			
			//lUserDetailsBean.setpKey();
			lUserDetailsBean.setTitle(lTitle);
			lUserDetailsBean.setCompanyName(lCompanyName);
			lUserDetailsBean.setPANNo(lPANNo);
			lUserDetailsBean.setTanNo(lTanNo);
			lUserDetailsBean.setFileNo(lFileNo);
			lUserDetailsBean.setBagNo(lBagNo);
			lUserDetailsBean.setFirstName(lFirstName);
			lUserDetailsBean.setMiddleName(lMiddleName);
			lUserDetailsBean.setLastName(lLastName);
			lUserDetailsBean.setEmailId(lEmailId);
			lUserDetailsBean.setMobileNo1(lMobileNo1);
			lUserDetailsBean.setMoblieNo2(lMoblieNo2);    
			lUserDetailsBean.setWorkPhone(lWorkPhone);
			lUserDetailsBean.setVatService(lVatService);
			lUserDetailsBean.setVatNo(lVatNo);
			lUserDetailsBean.setVatAllocated(lVatAllocated);
			lUserDetailsBean.setPTECService(lPTECService);
			lUserDetailsBean.setPTECNO(lPTECNO);
			lUserDetailsBean.setPTECAllocated(lPTECAllocated);
			lUserDetailsBean.setPTRCService(lPTRCService);
			lUserDetailsBean.setPTRCNO(lPTRCNO);
			lUserDetailsBean.setPTRCAllocated(lPTRCAllocated);
			lUserDetailsBean.setExciseService(lExciseService);
			lUserDetailsBean.setExciseNo(lExciseNo);
			lUserDetailsBean.setExciseAllocated(lExciseAllocated);
			lUserDetailsBean.setSerTaxService(lSerTaxService);
			lUserDetailsBean.setSerTaxNo(lSerTaxNo);
			lUserDetailsBean.setSerTaxAllocation(lSerTaxAllocation);
			lUserDetailsBean.setTDSService(lTDSService);
			lUserDetailsBean.setTdsNo(lTdsNo);
			lUserDetailsBean.setTdsAllocation(lTdsAllocation);
			lUserDetailsBean.setIncomeTaxService(lIncomeTaxService);
			lUserDetailsBean.setIncomeTaxNo(lIncomeTaxNo);
			lUserDetailsBean.setIncomeTaxAllocation(lIncomeTaxAllocation);
			lUserDetailsBean.setComapnyAllocation(lComapnyAllocation);
			lUserDetailsBean.setConsultancyAllocation(lConsultancyAllocation);
			//lUserDetailsBean.setUserType();
			lUserDetailsBean.setEntryMade(lEntryMade);
			//lUserDetailsBean.setCreatedOn();
			lUserDetailsBean.setUpdatedBy(lEntryMade);
			//lUserDetailsBean.setUpdatedOn();
	 			}
			public void insert(Connection pConnection,BhanuUserDetailsBean pUserBean) throws SQLException
		{
			ResultSet resultSet=null;
			StringBuilder lSql = new StringBuilder();
			lSql.append("INSERT INTO usrdetails(Usr_Title, Usr_CompanyName,Usr_PanNo,Usr_TANNo,Usr_FileNo, Usr_BagNo, Usr_FirstName, Usr_MiddleName,Usr_LastName, Usr_EmailId, Usr_MobileNo1, Usr_MoblieNo2, Usr_WorkPhone, Usr_VatService, Usr_VatNo, Usr_VatAllocated, Usr_PTECService, Usr_PTECNO,Usr_PTECAllocated, Usr_PTRCService, Usr_PTRCNO, Usr_PTRCAllocated, Usr_ExciseService, Usr_ExciseNo, Usr_ExciseAllocated, Usr_SerTaxService,Usr_SerTaxNo,Usr_SerTaxAllocation, Usr_TDSService, Usr_TdsNo, Usr_TdsAllocation, Usr_IncomeTaxService, Usr_IncomeTaxNo, Usr_IncomeTaxAllocation, Usr_ComapnyAllocation,Usr_ConsultancyAllocation, Usr_UserType, Usr_CreatedBy, Usr_CreatedOn, Usr_UpdatedBy, Usr_UpdatedOn, Usr_UpdateVersion)");
			lSql.append(" VALUES (");
			lSql.append("'").append(pUserBean.getTitle()).append("',");
			lSql.append("'").append(pUserBean.getCompanyName()).append("',");
			lSql.append("'").append(pUserBean.getPANNo()).append("',");
			lSql.append("'").append(pUserBean.getTanNo()).append("',");
			lSql.append("'").append(pUserBean.getFileNo()).append("',");
			lSql.append("'").append(pUserBean.getBagNo()).append("',");
			lSql.append("'").append(pUserBean.getFirstName()).append("',");
			lSql.append("'").append(pUserBean.getMiddleName()).append("',");
			lSql.append("'").append(pUserBean.getLastName()).append("',");
			lSql.append("'").append(pUserBean.getEmailId()).append("',");
			lSql.append("'").append(pUserBean.getMobileNo1()).append("',");
			lSql.append("'").append(pUserBean.getMoblieNo2()).append("',");
			lSql.append("'").append(pUserBean.getWorkPhone()).append("',");
			lSql.append("'").append(pUserBean.getVatService()).append("',");    
			lSql.append("'").append(pUserBean.getVatNo()).append("',"); 
			lSql.append("'").append(pUserBean.getVatAllocated()).append("',");
			lSql.append("'").append(pUserBean.getPTECService()).append("',");
			lSql.append("'").append(pUserBean.getPTECNO()).append("',");
			lSql.append("'").append(pUserBean.getPTECAllocated()).append("',");
			lSql.append("'").append(pUserBean.getPTRCService()).append("',");
			lSql.append("'").append(pUserBean.getPTRCNO()).append("',");
			lSql.append("'").append(pUserBean.getPTRCAllocated()).append("',");
			lSql.append("'").append(pUserBean.getExciseService()).append("',");
			lSql.append("'").append(pUserBean.getExciseNo()).append("',");
			lSql.append("'").append(pUserBean.getExciseAllocated()).append("',");
			lSql.append("'").append(pUserBean.getSerTaxService()).append("',");
			lSql.append("'").append(pUserBean.getSerTaxNo()).append("',");
			lSql.append("'").append(pUserBean.getSerTaxAllocation()).append("',");
			lSql.append("'").append(pUserBean.getTDSService()).append("',");
			lSql.append("'").append(pUserBean.getTdsNo()).append("',");
			lSql.append("'").append(pUserBean.getTdsAllocation()).append("',");
			lSql.append("'").append(pUserBean.getIncomeTaxService()).append("',");
			lSql.append("'").append(pUserBean.getIncomeTaxNo()).append("',");
			lSql.append("'").append(pUserBean.getIncomeTaxAllocation()).append("',");
			lSql.append("'").append(pUserBean.getComapnyAllocation()).append("',");
			lSql.append("'").append(pUserBean.getConsultancyAllocation()).append("',");
			lSql.append("'").append(pUserBean.getUserType()).append("',");
			lSql.append("'").append(pUserBean.getEntryMade()).append("',");//Select any Of this 
			//lSql.append("'").append(EntryMadeBy).append("',");
			lSql.append("'").append(Datetime).append("',");
			lSql.append("'").append(pUserBean.getUpdatedBy()).append("',");//Select any Of this 
			lSql.append("'").append(Datetime).append("',");
			lSql.append("'").append(pUserBean.getUpdatedVersion()).append("');");
			Statement lSt= pConnection.createStatement();
			System.out.println(lSql.toString());
			lSt.execute(lSql.toString());//for inserting elemnt into data base
				}
			public void updateUserDetails(Connection pConnection,BhanuUserDetailsBean pUserBean,String Pkey) throws SQLException
			{
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
				lSql.append(" ,Usr_UserStatus ='").append(pUserBean.getUserStatus()).append("'");
				lSql.append(" ,Usr_UserType ='").append(pUserBean.getUserType()).append("'");
				lSql.append(" ,Usr_UpdatedBy ='").append(pUserBean.getUpdatedBy()).append("'");
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
