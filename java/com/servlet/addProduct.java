package com.servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Category;
import com.entities.Product;
import com.helper.FactoryProvider;

/**
 * Servlet implementation class addProduct
 */
@MultipartConfig
public class addProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Session s = FactoryProvider.getFactory().openSession();
		String op = request.getParameter("operation");
		if(op.trim().equals("addProduct")) {
		try{
			
		String productName = request.getParameter("productName");
		String productDescription = request.getParameter("description");
		Part part = request.getPart("image");
		String productPrice = request.getParameter("price");
		String category = request.getParameter("category");
		String productQuantity = request.getParameter("quantity");
		
		
		
		Integer price = null;
		
		Integer quantity = null;

		// Parse the parameters if they are not null or empty
		if (productPrice != null && !productPrice.isEmpty()) {
		    price = Integer.parseInt(productPrice);
		}
	
		
		if (productQuantity != null && !productQuantity.isEmpty()) {
		    quantity = Integer.parseInt(productQuantity);
		}
		
		Product product = new Product();
        product.setProductName(productName);
        product.setProductDescription(productDescription);
        product.setProductPrice(price);
        product.setProductQuantity(quantity);
        product.setProductDiscount(category);
        product.setProductPhoto(part.getSubmittedFileName());
       
        Transaction tx = s.beginTransaction();
		String path = request.getServletContext().getRealPath("image") + File.separator+part.getSubmittedFileName();
		System.out.print(path);
		
		FileOutputStream fos = new FileOutputStream(path);
		InputStream is = part.getInputStream();
		
		byte[] data = new byte[is.available()];
		
		is.read(data);
		fos.write(data);
        fos.close();
		 s.persist(product);
		 s.merge(product);
		 tx.commit();

		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(s.isOpen() && s!=null) {
				s.close();}
		} 
		
        

		}else if(op.trim().equals("addCategory")) try{
			String categoryName = request.getParameter("name");
			String description = request.getParameter("description");
			
			Category cat = new Category();
	        cat.setCategoryName("categoryName");
	        cat.setCategoryDescription("description");
	        Transaction tx = s.beginTransaction();
	        
				
				s.persist(cat);
				s.merge(cat);
				tx.commit();
			request.setAttribute("Message", "Category is added succesfully!!");	
			response.sendRedirect("categoryadd.jsp");
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(s.isOpen() && s!=null) {
				s.close();}
		}else {
			request.setAttribute("error", "Invalid");
			request.getRequestDispatcher("addCategory.jsp").forward(request , response);
		}
		
}  
	
}

