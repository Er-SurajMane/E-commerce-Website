
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>Login</title>
</head>
<body>
<div id='container'>
  <div class='signup'>
     <form action="loginAction.jsp" method="post">
     <input type="email" name="email" placeholder="Enter Email Id" required>
     <input type="password" name="password" placeholder="Enter Password" required>
     <input type="submit" value="Login" >
     </form>
      <h2><a href="signup.jsp">SignUp</a></h2>
       <h2><a href="forgotPassword.jsp">Forgot Password?</a></h2>
  </div>
  <div class='whysignLogin'>
  <%
  String msg = request.getParameter("msg");
  if("notexist".equals(msg)){
  %>
  <h1>Incorrect Username or Password</h1>
<%} %>

<%
if("invalid".equals(msg)){
%>
<h1>Something Went Wrong, Please Try Again !</h1>
<%} %>
    <h1>Genie</h1>
    <h4>Everything You wish to Shop..!!</h4>
  </div>
</div>

</body>
</html>