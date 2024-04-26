<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String email = session.getAttribute("email").toString();
String subject= request.getParameter("subject");
String body= request.getParameter("body");
try{
	Connection con = ConnectionProvider.getCon();
	PreparedStatement pst = con.prepareStatement("insert into message(email,subject,body) values(?,?,?)");
	pst.setString(1, email);
	pst.setString(2, subject);
	pst.setString(3, body);
	pst.executeUpdate();
	response.sendRedirect("contactUs.jsp?msg=valid");
}

catch(Exception e){
	System.out.println(e);
	response.sendRedirect("contactUs.jsp?msg=invalid");
}
%>