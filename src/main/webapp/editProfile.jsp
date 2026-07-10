<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="controllers.UserBean"%>

<%
if(session.getAttribute("user")==null)
{
	response.sendRedirect("login.jsp");
	return;
}

UserBean ub=(UserBean)request.getAttribute("profile");

if(ub==null)
{
	response.sendRedirect("viewEditProfile");
	return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Profile | SecureBank</title>

<style>

*{
	margin:0;
	padding:0;
	box-sizing:border-box;
	font-family:Arial,Helvetica,sans-serif;
}

body{
	background:linear-gradient(135deg,#0f2027,#203a43,#2c5364);
	min-height:100vh;
}

header{
	height:70px;
	background:rgba(0,0,0,.25);
	display:flex;
	justify-content:space-between;
	align-items:center;
	padding:0 40px;
	box-shadow:0 5px 20px rgba(0,0,0,.35);
}

.logo{
	color:#FFD700;
	font-size:30px;
	font-weight:bold;
}

.logout{
	text-decoration:none;
	color:black;
	background:#FFD700;
	padding:12px 25px;
	border-radius:30px;
	font-weight:bold;
}

.logout:hover{
	background:white;
}

.container{
	width:95%;
	max-width:700px;
	margin:40px auto;
}

.card{
	background:rgba(255,255,255,.08);
	backdrop-filter:blur(10px);
	padding:35px;
	border-radius:20px;
	box-shadow:0 15px 35px rgba(0,0,0,.35);
}

.card h1{
	text-align:center;
	color:#FFD700;
	margin-bottom:30px;
}

.form-group{
	margin-bottom:18px;
}

label{
	display:block;
	color:#FFD700;
	margin-bottom:8px;
	font-weight:bold;
}

input,textarea{
	width:100%;
	padding:12px;
	border:none;
	border-radius:8px;
	font-size:16px;
	outline:none;
}

textarea{
	resize:none;
	height:90px;
}

.readonly{
	background:#d9d9d9;
}

.buttons{
	text-align:center;
	margin-top:25px;
}

.btn{
	padding:12px 30px;
	border:none;
	border-radius:30px;
	font-size:16px;
	font-weight:bold;
	cursor:pointer;
	text-decoration:none;
	margin:8px;
}

.save{
	background:#198754;
	color:white;
}

.save:hover{
	background:#157347;
}

.cancel{
	background:#FFD700;
	color:black;
}

.cancel:hover{
	background:white;
}

</style>

</head>

<body>

<header>

<div class="logo">
🏦 SecureBank
</div>

<a href="logout" class="logout">
Logout
</a>

</header>

<div class="container">

<div class="card">

<h1>✏ Edit Profile</h1>

<form action="editProfile" method="post">

<div class="form-group">
<label>User ID</label>
<input type="text" value="<%=ub.getUser_id()%>" readonly class="readonly">
</div>

<div class="form-group">
<label>Account Number</label>
<input type="text" value="<%=ub.getAccount_number()%>" readonly class="readonly">
</div>

<div class="form-group">
<label>Available Balance</label>
<input type="text"
value="₹ <%=String.format("%.2f",ub.getOpen_balance())%>"
readonly class="readonly">
</div>

<div class="form-group">
<label>First Name</label>
<input type="text" name="fname" value="<%=ub.getF_name()%>" required maxlength="30" pattern="[A-Za-z ]{2,30}"
title="Only letters and spaces (2-30 characters)">
</div>

<div class="form-group">
<label>Last Name</label>
<input type="text" name="lname" value="<%=ub.getL_name()%>" required maxlength="30" pattern="[A-Za-z ]{1,30}"
title="Only letters and spaces">
</div>

<div class="form-group">
<label>Email</label>
<input type="email" name="email" value="<%=ub.getEmail()%>" required maxlength="60">
</div>

<div class="form-group">
<label>Mobile Number</label>
<input type="tel" name="phone" value="<%=ub.getPhone_no()%>" required pattern="[6-9][0-9]{9}" maxlength="10"
title="Enter a valid 10-digit mobile number">
</div>

<div class="form-group">
<label>Address</label>
<textarea name="address" required maxlength="150"><%=ub.getAddress()%></textarea>
</div>

<div class="buttons">

<button type="submit" class="btn save">
💾 Update Profile
</button>

<a href="viewProfile" class="btn cancel">
Cancel
</a>

</div>

</form>

</div>

</div>

</body>
</html>