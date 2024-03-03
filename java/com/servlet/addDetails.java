package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Category;
import com.entities.Product;
import com.entities.UserData;
import com.helper.FactoryProvider;

/**
 * Servlet implementation class addDetails
 */
public class addDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addDetails() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Session s = FactoryProvider.getFactory().openSession(); 
		try{
			 String userName = request.getParameter("userName");
	        String userEmail = request.getParameter("userEmail");
	        String userPassword = request.getParameter("userPassword");
	        String userPhone = request.getParameter("userPhone");
	        String userAddress = request.getParameter("userAddress");
	        String userPic = request.getParameter("userPic");
	        
	        
	        
	        // Create User object
	        UserData user = new UserData();
	        user.setUserName(userName);
	        user.setUserEmail(userEmail);
	        user.setUserPassword(userPassword);
	        user.setUserPhone(userPhone);
	        user.setUserAddress(userAddress);
	        
	       
	        
	        
	        
			Transaction tx = s.beginTransaction();
			s.persist(user);
			s.merge(user);
			
			tx.commit();
			s.close();
			
		   
			
			
			PrintWriter out = response.getWriter();
			out.println("<h1 style = 'text-align:center;'>Registration Succeful<h1>");
			
	    
	    }catch(Exception e)
	        {e.printStackTrace();
	        }finally {
	        	if(s!=null && s.isOpen()) {
	        		s.close();
	        	}
	        }
		}
	

	}


