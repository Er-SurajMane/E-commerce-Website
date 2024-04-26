<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String email = session.getAttribute("email").toString();
String mobileNumber = request.getParameter("number");
String address = request.getParameter("address");
String paymentMode = request.getParameter("paymentMode");
String transactionId = request.getParameter("transactionId");
String status="invoice";

try{
	Connection con = ConnectionProvider.getCon();
	PreparedStatement pst = con.prepareStatement("Update cart set orderDate=now(), deliveryDate=DATE_ADD(orderDate,INTERVAL 7 DAY), paymentMethod=?, transactionId=?, status=?, address=?, mobilenumber=? where email=?");
	pst.setString(1, paymentMode);
	pst.setString(2, transactionId);
	pst.setString(3, status);
	pst.setString(4, address);
	pst.setString(5, mobileNumber);
	pst.setString(6, email);
	pst.executeUpdate();
	response.sendRedirect("bill.jsp");
}
catch(Exception e){
	System.out.println(e);
}
%>