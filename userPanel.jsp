<%@ page import="com.entities.Product" %>
<%@ page import="java.util.List" %>
<%@ page import = "com.helper.FactoryProvider" %>
<%@ page import = "org.hibernate.Session" %>
<%@ page import = "org.hibernate.query.Query"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Products</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
      <form action ="logout" method = "post">
            <button type="submit">Logout</button>
            </form>
            
            <form action ="searchQuery" method = "post">
            <input type="text">Search</button>
            </form>
    <div class="container">
        <h1>Products</h1>
        <div class="product-list">
            <%
            Session s = FactoryProvider.getFactory().openSession();
    		List <Product> list = s.createQuery("From Product" , Product.class).list();
    		
          
            if (list != null && !list.isEmpty()) {
                for (Product products : list) {
            %>
            <div class="product">
                <h2><%= products.getProductName() %></h2>
                <p>Description: <%= products.getProductDescription() %></p>
                <p>Price: <%= products.getProductPrice() %></p>
                <p>Quantity: <%= products.getProductQuantity() %></p>
                <p>Discount: <%= products.getProductCategory() %></p>
                <img src="<%= products.getProductPhoto() %>" alt="Product Photo">
            </div>
            
            
            <% 
                }
            } else {
            %>
            <p>No products available.</p>
            <% } %>
            
            
           <%  s.close();%>
        </div>
    </div>
</body>
</html>
