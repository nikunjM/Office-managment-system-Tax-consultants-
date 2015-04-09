package com.bhanu.servlet;
import java.io.IOException;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Calendar;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.bhanu.helperss.*;
//@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html;charset=UTF-8");
		String userName = request.getParameter("userName");
	    String passWord = request.getParameter("passWord");
	    String IPAdd=request.getParameter("IP");
	    DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
	    Calendar cal = Calendar.getInstance();
	    String Datetime = dateFormat.format(cal.getTime());
	    Double num = Math.floor(Math.random() * 90000) + 10000;
	    boolean login = false;
	    System.out.println("Before Query---------->>"+userName+passWord+IPAdd+Datetime+"_---------------subPrint hua");
	    String CheckingLogin = "SELECT * FROM adminuser WHERE ADD_UserName = ? AND ADD_UserPassWord = ? AND ADD_UserStatus= '1' ";
	    PreparedStatement statement = null;
	    ResultSet resultSet = null;
	    boolean loginlog;
	    ConnectionHelper connClass = new ConnectionHelper();
		Connection connect=connClass.connect();
		//First there has to be log entery if result set is true then log in in that if user has already enterd wrong pass wprd for 
		//more then three time then there should be no login process so change has to be done in log in .....
		try
		{
			 statement = connect.prepareStatement(CheckingLogin);
	         statement.setString(1,userName);
	         statement.setString(2,passWord);
	         resultSet = statement.executeQuery();
	         login = resultSet.next();
	         System.out.println("After Query Inside Try ---------->>"+userName+passWord+IPAdd+Datetime+login+"---------------true False Dhek");
		}
		 catch (Exception e) {
	         throw new ServletException("Login failed", e);
	     }
		 System.out.println("Log Is Started _____>>"+login);
	    try 
 	    {
	    	StringBuilder lLogEnter = new StringBuilder();
		    lLogEnter .append("INSERT INTO LOGINLOG (LL_UserId,LL_IPAddress,LL_LoginTime,LL_Status,LL_SessionKey)");
		    lLogEnter .append(" VALUES (");
		    lLogEnter .append("'").append(userName).append("',");
		    lLogEnter .append("'").append(IPAdd).append("',");
		    lLogEnter .append("'").append(Datetime).append("',");
		    lLogEnter .append("'").append(login).append("',");
		    lLogEnter .append("'").append(num).append("');");
		    System.out.println("After Query Inside insert LOg ke udar ---------->>"+userName+passWord+IPAdd+Datetime+login+"_---------------true False Dhek");
 	   	Statement log= connect.createStatement();
		System.out.println(lLogEnter.toString());
		log.execute(lLogEnter.toString());
		//till here log has been inserted and login process is not started ......
         System.out.println("updated succesfully log succesfully");
         System.out.println("new after LOG Added_____>>"+login);
 	    }catch (Exception e) {
 	    	throw new ServletException("unable to Insert Log", e);
		}
		finally {
	         if (resultSet != null) try { resultSet.close(); } catch (SQLException ignore) {}
	         if (statement != null) try { statement.close(); } catch (SQLException ignore) {}
	         if (connect != null) try { connect.close(); } catch (SQLException ignore) {}
	     }
	     if (login) {
	    	 request.getSession().setAttribute("username",userName);
	    	 request.getSession().setAttribute("Sessionkey",num);
	    	 response.sendRedirect(request.getContextPath()+"/SessionSetPage.jsp"); // Redirect to home page.
	     } else {
	    	 request.setAttribute("errorMessage", "Invalid username or password");
	    	 System.out.println(request.getContextPath()+"/BhanuLogIn.jsp");
	         request.getRequestDispatcher("./BhanuLogIn.jsp").forward(request, response); 
	       }
	}
	}
