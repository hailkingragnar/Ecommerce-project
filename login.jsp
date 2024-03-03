<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Log In</title>
</head>
<body>
    <h1>Try again!</h1>
    <% if(request.getAttribute("error") != null) {%>
    <p style = "color : red;"><%=request.getAttribute("error")%></p><%} %>
    
    <%@include file="form.jsp" %>
    
</body>
</html>