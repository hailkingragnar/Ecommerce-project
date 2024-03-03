package com.servlet;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.entities.UserData;
import com.helper.FactoryProvider;
import jakarta.servlet.http.HttpSession;



/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("email");
		String password  = request.getParameter("password");
		
		
		
		UserData user = validateCredentials(email, password);
		HttpSession s = request.getSession();
		s.setAttribute("email", email);
		
		if(user != null) {
		
		if (user.isAdmin()) {
			s.setAttribute("admin", user);
			
			
			response.sendRedirect("admindashboard.jsp");
			
		}else {
			
		 s.setAttribute("user", user);
		response.sendRedirect("userDashboard.jsp");
		
		}
		}else {
			request.setAttribute("error", "Invalid email or Password");
			request.getRequestDispatcher("login.jsp").forward(request , response);
		}
	}


	private UserData validateCredentials(String email, String password) {
		Session s = FactoryProvider.getFactory().openSession();
		Transaction tx = null;
		try{
			tx = s.beginTransaction();
		Query<UserData> query = s.createQuery(" FROM UserData WHERE userEmail =: email AND userPassword =: password");
		query.setParameter("email" , email );
		query.setParameter("password" , password);
		UserData user = query.uniqueResult();
		tx.commit();
		return user;
		}catch(Exception e) {
			if(tx != null) {
				tx.rollback();
				}e.printStackTrace();
				return null;
		}finally {
			s.close();
			
		}
	}

}
