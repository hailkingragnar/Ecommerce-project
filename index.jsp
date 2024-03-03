<%@ page import="com.entities.Product" %>
<%@ page import="java.util.List" %>
<%@ page import = "com.helper.FactoryProvider" %>
<%@ page import = "org.hibernate.Session" %>
<%@ page import = "org.hibernate.query.Query"%>
<%@ page import="java.io.*,java.util.*,javax.servlet.*,javax.servlet.http.*" %>
<%@ page import ="com.entities.UserData" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="icon" type="image/icon" href="images/favicon.PNG">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="style.css">
    

    <link rel="stylesheet"href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"/>
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'/>
   
     
    
</head>
<body>
    <header class="header">
        <a  href="#" class="logo"><i class="fa fa-shopping-basket" ></i>KP STORES</a>
    
    <nav class="navbar">
        <ul >
        <li><a href="#home">Home</a></li>
        <li><a href="#features">Features</a></li>
        <li><a href="#product">Product</a></li>
        <li><a href="#categories">Categories <i class="fa fa-caret-down"></i></a>
            <ul class="dropdown">
                <li><a href="#">fruits</a></li>
                <li><a href="#">vegetables</a></li>
                <li><a href="#">fishes</a></li>
                <li><a href="#">meats</a></li>
                <li><a href="#">pickels</a></li>
                <li><a href="#">dairy-products</a></li>
                <li><a href="#">handicrafts</a></li>
                <li><a href="#">foods</a></li>
                
            </ul>

        </li>
        
        </ul>
  <%  HttpSession se = request.getSession();
     UserData user = (UserData)se.getAttribute("user");
  %>
    </nav>
    <div class="icon">
        <div class="fa fa-search" id="search-btn"></div>
        <div class='bx bx-shopping-bag add-cart' id="cart-btn"></div>
        <div class="fa fa-user" id="account-btn">
        </div> <% if(user!=null){ %><span style ="font-size:10px">hemant</span> <%} %>

    </div>
    <form class="search-form" action= "searchproduct" method ="get" >
        <input type="text" id="search-box"   placeholder="search here........." name="search">
        <label for="search-box"  class="fa fa-search"></label>
        <button type ="submit">search</button>
    </form>

    
    <div class="shopping-cart">
        <div class="cart">
        <h2 class="cart-title">Your cart</h2>
        <div class="cart-content">
            
        </div>
        <div class="total">
            <div class="total-title">total</div>
            <div class="total-price">rs0</div>
        </div>

        <button type="button" class="btn">buy now</button>

        
        </div>
    </div>
    
<% 
%>
   
       
    
    
    <form action="LoginServlet" class="login-form" method="post" >
        <h3>LOGIN NOW</h3>
        <input type="email" id="email" placeholder="enter your email" class="box" name = "email">
        <div id="emailError" class="error-message"></div>
        <input type="password" id="password" placeholder="enter your password" class="box" name ="password">
        
        <p>Don't Have An Account <a href="userregister.jsp">Create Account</a> </p>
        <input type="submit" value="Login Now" class="btn">
    </form>

    



</header>
    <!--content-->
    <section class="home" id="home">
        <div class="content">
        <h3>Fresh And <span>Organic</span> Products For You</h3>
        <a href="#" class="btn">Shop Now</a>
        </div>
    </section>
    <!--content-->
    
    <!-- feature section-->
   

    <!-- feature section-->

        
 <section class="product" id="product">
 
    <h1 class="heading">our <span>Products</span></h1>
     <div class="product-container">
  <% 
        Session s = FactoryProvider.getFactory().openSession();
        Query<Product> query = s.createQuery("FROM Product", Product.class);
        List<Product> productList = query.getResultList();
        for(Product product : productList){
    %>

   
    
    <!--product section-->
    
   
    <div class="box" data-name="p-6">
        <img src="images/<%=product.getProductPhoto() %>" alt="" class="product-img">
        <h1  class="product-title"><%=product.getProductName() %></h1>
        <div class="price"><%=product.getProductPrice() %></div>
        <div class="stars">
            <i class="fa fa-star"></i>
            <i class="fa fa-star"></i>
            <i class="fa fa-star"></i>
            <i class="fa fa-star"></i>
            <i class="fa fa-star-half"></i>

        </div>
        <p class="description"><%=product.getProductDescription() %></p>
        <i class='bx bx-shopping-bag add-cart'></i>
    </div>
   <%} %></div> </section>
    <!--product section-->


    <!--footer-->
    <div class="footer">
        <div class="box-container">
            <div class="box">
                <h3>KP-S <i class="fa fa-shopping-basket"></i></h3>
                <p>Feel Free To Contack Us On Our Socian Media Handlers</p>
                <div class="share">
                    <a href="#" class="fa fa-facebook"></a>
                    <a href="#" class="fa fa-instagram"></a>
                    <a href="#" class="fa fa-whatsapp"></a>
                </div>
            </div>

            <div class="box">
                <h3>Contact us </h3>
                <a href="#" class="links"> <i class="fa fa-phone"></i> +977 9868211764</a>
                <a href="#" class="links"> <i class="fa fa-envelope"></i> jshh@gmail.com</a>
                <a href="#" class="links"> <i class="fa fa-map-marker"></i> Nepalgunj, Banke </a>
            </div>
        </div>
        <div class="credit">Created By <span>MMC </span>/ All Rights Reserved</div>
    </div>

    <!--footer-->
 <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
    <script src="script.js"></script>
    
</body>
</html>