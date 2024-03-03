package com.servlet;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.entities.Product;
import com.helper.FactoryProvider;

/**
 * Servlet implementation class searchproduct
 */
public class searchproduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public searchproduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
String query = request.getParameter("query");
        
        // Perform search logic
        List<Product> searchResults = performSearch(query);
        
        // Set search results in request attribute
        request.setAttribute("searchResults", searchResults);
       
        // Forward request to searchResults.jsp to display results
        RequestDispatcher dispatcher = request.getRequestDispatcher("searchresult.jsp");
        dispatcher.forward(request, response);
    }

    private List<Product> performSearch(String query) {
        // Query database for products matching the search query
        Session session = FactoryProvider.getFactory().openSession();
        Query<Product> productQuery = session.createQuery("FROM Product WHERE productName LIKE :query OR productDescription LIKE :query", Product.class);
        productQuery.setParameter("query", "%" + query + "%");
        List<Product> searchResults = productQuery.getResultList();
        session.close();
        
        
        
        return searchResults;
    }
}

	


