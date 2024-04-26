<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="footer.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/addressPaymentForOrder-style.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Home</title>
<script>
if(window.history.forward(1) !=null)
	window.history.forward(1); </script>
</head>
<body>
<div class="topnav sticky">
    <br>
    <br>
            <center style="background-color: white;"><h2>Genie</h2></center>            
          </div>
<br>
<table>
<thead>
<%
String email=session.getAttribute("email").toString();
int total=0;
int sno=0;
try{
	Connection con = ConnectionProvider.getCon();
	Statement st = con.createStatement();
	ResultSet rs1 = st.executeQuery("select sum(total) from cart where email='"+email+"'");
	while(rs1.next()){
		total=rs1.getInt(1);
	}

%>
          <tr>
          <th scope="col"><a href="myCart.jsp"><i class='fas fa-arrow-circle-left'> Back</i></a></th>
            <th scope="col" style="background-color: yellow;">Total: <i class="fa fa-inr"></i><%out.println(total); %> </th>
          </tr>
        </thead>
        <thead>
          <tr>
          <th scope="col">S.No</th>
            <th scope="col">Products</th>
            <th scope="col">Category</th>
            <th scope="col"><i class="fa fa-inr"></i> price</th>
            <th scope="col">Quantity</th>
            <th scope="col">Total</th>
          </tr>
        </thead>
        <tbody>
        <%
		ResultSet rs = st.executeQuery("select * from products inner join cart on products.id=cart.product_id and cart.email='"+email+"'");	      
      	while(rs.next())
      	{	
        %>
          <tr>
            <%sno=sno+1;%>
           <td><% out.println(sno); %></td>
            <td><%=rs.getString(2) %></td>
            <td><%=rs.getString(3) %></td>
            <td><i class="fa fa-inr"></i> <%=rs.getString(5) %></td>
            <td><%=rs.getString(8) %></td>
            <td><i class="fa fa-inr"></i> <%=rs.getString(10) %></td>
            </tr>
         <%
         }
      	 ResultSet rs2= st.executeQuery("select * from users where email='"+email+"'");
      	 while(rs2.next()){
      	 
      	 %>
        </tbody>
      </table>
      
<form action="addressPaymentForOrderAction.jsp" method="post">

<div class="left-div">
<h3>Mobile Number</h3>
 <input class="input-style" type="number" name="number" placeholder="Enter Mobile Number" required>
</div>

<div class="right-div">
<h3>Address</h3>
 <input class="input-style" type="text" name="address" placeholder="Enter Delivery Address" required>
</div>

<div class="left-div">
<h3>Payment Mode</h3>
<select class="input-style" name="paymentMode">
<option value="Cash on Delivery">Cash on Delivery</option>
<option value="Online( pay on-genie@pay.com )">Online ( pay on - genie@pay.com )</option>
</select>
</div>

<div class="right-div">
<h3>Transaction Id</h3>
<input class="input-style" type="text" name="transactionId" placeholder="Enter Transaction Id after Online Payment">
</div>
<br> <br> <br>
<div>
<center><button class="button" type="submit">Generate Invoice<i class='far fa-arrow-alt-circle-right'></i></button></center>
</div>
<br> <br> <br>
<hr style="width: 100%">
</form>

<%
}
}
catch(Exception e){
	System.out.println(e);
}
%>
      <br>
      <br>
      <br>

</body>
</html>