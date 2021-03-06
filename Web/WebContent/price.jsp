<%@page import="constants.EasyPayConstants"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>EasyPay - Billing</title>
<style>

#erroruserid{
color:red;
}

#erroruserid1{
color:red;
}
.row{
   margin:0 auto;
   width : 50%;
   padding-top:100px;
}

.card {
  box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
}

.card {
  margin-top: 10px;
  box-sizing: border-box;
  border-radius: 2px;
  background-clip: padding-box;
}
.card span.card-title {
    color: #fff;
    font-size: 24px;
    font-weight: 300;
    text-transform: uppercase;
}

.card .card-image {
  position: relative;
  overflow: hidden;
}
.card .card-image img {
  border-radius: 2px 2px 0 0;
  width:50%;
  height:50%;
  background-clip: padding-box;
  position: relative;
  z-index: -1;
}
.card .card-image span.card-title {
  position: absolute;
  bottom: 0;
  left: 0;
  padding: 16px;
}
.card .card-content {
  padding: 16px;
  border-radius: 0 0 2px 2px;
  background-clip: padding-box;
  box-sizing: border-box;
}
.card .card-content p {
  margin: 10;
  color: inherit;
  text-align:center;
}
.card .card-content span.card-title {
  line-height: 48px;
}
.card .card-action {
  border-top: 1px solid rgba(160, 160, 160, 0.2);
  padding: 16px;
}
.card .card-action a {
  color: #ffab40;
  margin-right: 16px;
  transition: color 0.3s ease;
  text-transform: uppercase;
}
.card .card-action a:hover {
  color: #ffd8a6;
  text-decoration: none;
}

nav{
    background-color: #3E2723;
    margin:0;
    overflow: hidden;
}

nav ul{
    margin:0;
    padding:0;

}

.billText{
  font-family:"Arial";
}

.billTextTotal{
  font-weight:bold;
  font-family:"Arial";
}

nav#header_menu ul li a {

    color: white;
    
    display: block;
    line-height: 2em;

    padding: 1em 1em;
    text-decoration: none;
}

.container{
    margin-bottom : 50px;
    padding-bottom:50px;
    
}

.copyright{
    position:fixed;
    bottom:0;

    margin-top: 100px;;
    width: 100%;

    padding: 20px 20px;
    background:#3E2723;
    text-align:center;
    color:white;
}


nav#menu {
    color: black;
    background-color: #3E2723;
    font-weight: bold;
    float:left;
    display: block;
    line-height: 3em;
   
   
    border : 1px solid black;
    
    text-decoration: none;
    width:150px;

}

body {
    min-height: 100%;
    margin:0 auto;
   
    clear: both;
}




nav#header_menu ul li{
    display:inline-block;
    list-style-type: none;
}


nav .left{
    float:left;
    padding: 1em 1em;
    
    font-size:20px;
    font-family:"Courier New", Courier, monospace;
    color: white;

}

nav .right{
    float:right;
    margin-right:2em;
    font-family:"Courier New", Courier, monospace;

}

</style>

<script type="text/javascript">
function checkUserId() {
	if(document.user.userid.value==""){
		document.getElementById("erroruserid").innerHTML="Enter a valid Username";
		return false;
	}else{
		return true;
	}
}


</script>
</head>
<body>
<div id="header">
            <nav id="header_menu">
                <ul  class="left" >
                    <li>Cold Stone Tech</li>
                </ul>

                <ul class="right">
                    
                         <li><a href="index.jsp">Home</a></li>
                        <li><a href='${pageContext.request.contextPath}/price'>Billing</a></li>
                      
                      
                    
                </ul>

            </nav>



</div>
        

<div class="container">
    <div class="row">
        <!-- Card Projects -->
        <div class="col-md-6 col-md-offset-3">
            <div class="card">
            
                <div class="card-image">
                    <img class="img-responsive" src="https://www.coldstonecreamery.com/assets/img/products/signaturecreations/signaturecreations.jpg">
                    <span class="card-title"></span>
                </div>
                
                <div class="card-content">
                <%String weight = (String)request.getAttribute("Weight"); %>
                <%String cost = (String)request.getAttribute("Cost"); %>
                <%String id = (String)request.getAttribute("Id"); %>
                <%String status = (String)request.getAttribute("status"); %>
  				  
  				  
                <form name="user" action="user" onsubmit="return checkUserId()">
                
              
                
                <input type="hidden" name="id" value="<%=id%>" />
                <input type="hidden" name="price" value="<%=cost%>" />
                    <p class="billText">Weight: <c:out value ="<%=weight%>"/> grams</p>
                    <p class="billText">Price per gram: <c:out value="<%=EasyPayConstants.PRICE_PER_GRAM %>"/> cents</p>
                    <p class="billTextTotal">Total: <c:out value ="<%=cost%>"/></p>
                    <p>Enter Userid: <input type="text" name="userid"/></p>
                      <c:if test="${status!=null}">
     <p id="erroruserid1">Invalid User</p>
     			</c:if>     
                    <p id="erroruserid"></p>
                   <p> <input type="submit" value="Submit" /> </p>
                   </form>
                </div>
                
                <div class="card-action">
               
                </div>
            </div>
        </div>
    </div>
</div>

<section class="copyright">
    &copy; Cold Stone Tech 
  
    
   
</section>
</body>
</html>