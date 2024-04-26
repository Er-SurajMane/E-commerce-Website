<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="header.jsp"%>
<%@include file="footer.jsp"%>
<html>
<head>
<link rel="stylesheet" href="css/messageUs.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Message Us</title>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">contact us <i class='fas fa-comment-alt'></i></div>
<br> <br>
<%
String msg = request.getParameter("msg");
if("valid".equals(msg)){
%>
<h3 style="text-align:center; color:yellow;">Thank You for Contacting us, we'll get back to you soon !</h3>
<%} %>
<%
if("invalid".equals(msg)){
%>
<h3 style="text-align:center; ">Some thing Went Wrong, Please Try Again !</h3>
<%} %>
<form action="contactUsAction.jsp" method="post">
<input class="input-style" name="subject" type="text" placeholder="Subject" required>
<hr>
<textarea class="input-style" name="body" placeholder="Enter Message here..." required></textarea>
<hr>
<button class="button" type="submit">Send <i class="far fa-arrow-alt-circle-right"></i> </button>
</form>
<br><br><br>
</body>
</html>