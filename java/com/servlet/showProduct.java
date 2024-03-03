package com.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;

import com.entities.Product;
import com.helper.FactoryProvider;

/**
 * Servlet implementation class showProduct
 */
public class showProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public showProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		        Session session = FactoryProvider.getFactory().openSession();
		        List<Product> products = session.createQuery("from Product", Product.class).list();
		        request.setAttribute("product", products);
		        response.sendRedirect("allProduct.jsp");
		        response.sendRedirect("allProduct.jsp");
		        
		        session.close();
		      
		    }
	}

	


