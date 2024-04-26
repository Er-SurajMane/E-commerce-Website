<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String email = session.getAttribute("email").toString();
String status = "processing";

try{
	Connection con = ConnectionProvider.getCon();
	PreparedStatement pst = con.prepareStatement("Update cart set status=? where email=? and status='invoice'");
	pst.setString(1, status);
	pst.setString(2, email);
	pst.executeUpdate();
	response.sendRedirect("home.jsp");
}
catch(Exception e){
	System.out.println(e);
}
%>