<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
  
  <%@ page import ="com.entities.UserData" %> 
  
    <%  
         UserData user=(UserData)session.getAttribute("admin");
    if(user==null){
    	%> <h1>You are not logged in! Log in first.</h1>
    	<%     response.sendRedirect("pagenotfound.jsp");
    	      return;
    	      
    }else if(!user.isAdmin()){
    	%> <h1>Fraud</h1>
    	<%     response.sendRedirect("pagenotfound.jsp");
    	   return;
   } 
    		
    	
    %> 
    

<html>
<head>
<meta charset="UTF-8">
<title>Admin Panel</title>
    <link rel="stylesheet" href="adminstyle.css">
</head>
<body>
 <div class="admin-panel">
        <h1>Admin Panel</h1>
        <ul class="button">
            <li><button id="add-product-btn"><a href="addProduct.jsp"> Add Product</a></button></li>
            <li><button id="add-product-btn"><a href="allProduct.jsp">All Products</a></button></li>
            <li><button id="add-product-btn"><a href="#">Orders</a></button></li>
            <li><form action="logout" method="post">
             <button type="submit">Logout</button></form></li>
           
           </ul>
    </div>




</body>
</html>