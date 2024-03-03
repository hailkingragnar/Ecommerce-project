<%@ page import="com.entities.Product" %>
<%@ page import="java.util.List" %>
<%@ page import = "com.helper.FactoryProvider" %>
<%@ page import = "org.hibernate.Session" %>
<%@ page import = "org.hibernate.query.Query"%>
<!DOCTYPE html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Products</title>
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="newproductstyle.css">
    
    <link rel="stylesheet"href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"/>
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'/>
</head>
<body>
    
          <div class="container">
        <div class="product-grid">

 
  <% 
        Session s = FactoryProvider.getFactory().openSession();
        Query<Product> query = s.createQuery("FROM Product", Product.class);
        List<Product> productList = query.getResultList();
        for(Product product : productList){
    %>

   
            <!-- Product 1 -->
            <div class="product">
                <img src="images/basket.png" alt="Product 1">
                <h2><%= product.getProductName() %></h2>
                <p><%=product.getProductDescription() %></p>
                <span><%= product.getProductPrice() %></span>
                 
            </div>
            
            <%} %>
        </div>
    </div>
            
            
           <%  s.close();%>
     
