<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Product</title>
</head>
<body>

   
      <form action = "addProduct" method ="post" enctype="multipart/form-data">
      <input type="hidden" name ="operation" value ="addProduct">
    
  
        
    <div class="product-detail">
        <h1>Product Details</h1>
        <div class="details">
            <input type="text" placeholder="Product Name" name = "productName">
            <input type="number" placeholder="Product Price" name = "price">
            <input type="text" placeholder="Product Description" name = "description">
            <input type="text" placeholder="Product Category" name = "category">
            <input type="number"placeholder="Product Quantity" name ="quantity">
             <input type="file" name="image" /><br />
           <button type="submit" class="btn btn-primary">Add</button>
        </div>
        
    </div>
   
     
   
       
</form>


</body>
</html>

