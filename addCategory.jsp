<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action = "addProduct" method = "post">
  <input type = "hidden" name="operation" value = "addCategory">
       <div class="mb-3">
    <label for="name" class="form-label">Category name</label>
    <input type="text" class="form-control" id="name"  name = "name">
   
  </div> 
  
        <div class="mb-3">
    <label for="address" class="form-label">Description</label>
    <input type="text" class="form-control" id="address"  name = "description">
 
  </div> 
  
    <button type ="submit">Add</button>
  
    </form>
</body>
</html>