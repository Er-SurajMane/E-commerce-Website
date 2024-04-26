<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>Signup</title>
</head>
<body>
<div id='container'>
  <div class='signup'>
  <form action="signupAction.jsp" method="post">
  	<input type="text" name="name" placeholder="Enter Name" required>
  	<input type="email" name="email" placeholder="Enter Email Id" required>
  	<input type="number" name="mobileNumber" placeholder="Enter Mobile Number" required>
  	<select name="securityQuestion" required>
  	<option value="What was your first car?">What was your first car?</option>
  	<option value="What is the name of your school?">What is the name of your school?</option>
  	<option value="What is the name of your birthplace?">What is the name of your birthplace?</option>
  	<option value="What is the name of your city?">What is the name of your city?</option>
  	</select>
  	<input type="text" name="answer" placeholder="Enter Answer" required>
  	<input type="password" name="password" placeholder="Enter Password" required>
  	<input type="submit" value="signup">
  </form>
    
      <h2><a href="login.jsp">Login</a></h2>
  </div>
  <div class='whysign'>
<% 
String msg = request.getParameter("msg");
if("valid".equals(msg))
{
%>	
<h1>Registration Successful</h1>
<% }%>

<% 
if("invalid".equals(msg))
{
%>
<h1>Something Went Wrong, Please Try Again..!!</h1>
<%} %>

    <h1>Genie</h1>
    <h4>Everything You wish to Shop..!!</h4>
  </div>
</div>

</body>
</html>