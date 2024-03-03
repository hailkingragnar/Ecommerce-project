<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.entities.Product" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Results</title>
</head>
<body>
    <h1>Search Results</h1>
    <div>
        <% 
        List<Product> productList = (List<Product>)request.getAttribute("search");
        if (productList != null && !productList.isEmpty()) {
            for (Product product : productList) {
        %>
        <div>
            <h2><%= product.getProductName() %></h2>
            <p>Description: <%= product.getProductDescription() %></p>
            <p>Price: <%= product.getProductPrice() %></p>
            <p>Quantity: <%= product.getProductQuantity() %></p>
            <p>Discount: <%= product.getProductCategory() %></p>
            <img src="<%= product.getProductPhoto() %>" alt="Product Photo">
        </div>
        <% 
            }
        } else { 
        %>
        <div>
            <p>No products found.</p>
        </div>
        <% 
        }
        %>
    </div>
</body>
</html>
