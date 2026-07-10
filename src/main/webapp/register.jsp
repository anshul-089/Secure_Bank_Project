<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Account</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Arial, Helvetica, sans-serif;
}

body{
    background:linear-gradient(135deg,#0f2027,#203a43,#2c5364);
    display:flex;
    justify-content:center;
    align-items:center;
    min-height:100vh;
}

.container{
    width:900px;
    background:rgba(255,255,255,0.08);
    backdrop-filter:blur(10px);
    border-radius:15px;
    padding:40px;
    box-shadow:0 15px 40px rgba(0,0,0,0.4);
}

.container h1{
    color:#fff;
    text-align:center;
    margin-bottom:30px;
    letter-spacing:1px;
}

.form-grid{
    display:grid;
    grid-template-columns:1fr 1fr;
    gap:20px;
}

.input-box{
    display:flex;
    flex-direction:column;
}

.input-box label{
    color:#fff;
    margin-bottom:8px;
    font-weight:bold;
}

.input-box input{
    padding:12px;
    border:none;
    border-radius:8px;
    font-size:15px;
    outline:none;
}

.full{
    grid-column:1/3;
}

.btn{
    grid-column:1/3;
    text-align:center;
    margin-top:15px;
}

.btn input{
    width:220px;
    padding:14px;
    background:#00b894;
    color:white;
    border:none;
    border-radius:30px;
    cursor:pointer;
    font-size:17px;
    font-weight:bold;
    transition:.3s;
}

.btn input:hover{
    background:#019875;
    transform:scale(1.05);
}

@media(max-width:850px){

.container{
    width:95%;
}

.form-grid{
    grid-template-columns:1fr;
}

.full,
.btn{
    grid-column:1;
}

}
.login-link{
    text-align:center;
    margin-top:25px;
    color:#ffffff;
    font-size:18px;
}

.login-link a{
    color:#00e5ff;
    text-decoration:none;
    font-weight:bold;
    transition:0.3s;
}

.login-link a:hover{
    color:#FFD700;
    text-decoration:underline;
}

</style>

</head>

<body>

<div class="container">

<h1>Create New Bank Account</h1>

<%
String msg = (String)request.getAttribute("msg");
String color = (String)request.getAttribute("msgColor");

if(msg != null)
{
%>

<div style="
background:<%= color %>;
color:white;
padding:12px;
margin-bottom:20px;
border-radius:8px;
text-align:center;
font-weight:bold;">

<%= msg %>

</div>

<%
}
%>

<%
Long accountNo = (Long)request.getAttribute("accountNo");

if(accountNo != null)
{
%>

<div style="
    background:#0d6efd;
    color:white;
    padding:15px;
    margin-bottom:20px;
    border-radius:10px;
    text-align:center;
    font-size:18px;
    font-weight:bold;">

    🎉 Account Created Successfully!<br><br>

    <span style="font-size:22px;">
        Your Account Number:
        <%= accountNo %>
    </span>

</div>

<%
}
%>

<form action="register" method="post">

<div class="form-grid">

<div class="input-box">
<label>User ID</label>
<input type="text" name="uid" placeholder="Enter User ID" required>
</div>

<div class="input-box">
<label>First Name</label>
<input type="text" name="fname" placeholder="Enter First Name" required>
</div>

<div class="input-box">
<label>Last Name</label>
<input type="text" name="lname" placeholder="Enter Last Name" required>
</div>

<div class="input-box">
<label>Email</label>
<input type="email" name="uemail" placeholder="Enter Email">
</div>

<div class="input-box">
<label>Password</label>
<input type="password" name="upass" placeholder="Enter Password" required>
</div>

<div class="input-box">
<label>Mobile Number</label>
<input type="text" name="umobno" placeholder="Enter Mobile Number" maxlength="10" required>
</div>

<div class="input-box full">
<label>Address</label>
<input type="text" name="uaddr" placeholder="Enter Address" required>
</div>


<div class="input-box">
<label>PIN Number</label>
<input type="text" name="pin_no" placeholder="Set PIN Number" maxlength="4" required>
</div>


<div class="input-box">
<label>Opening Balance</label>
<input type="number" name="open_bal" step="0.01" min="1" placeholder="Enter Opening Balance" required>
</div>

<div class="btn">
<input type="submit" value="Create Account">
</div>

<div class="login-link">
    Already have an account?
    <a href="login.jsp">Sign In</a>
</div>

</div>

</form>

</div>

<script>

document.querySelector("form").addEventListener("submit", function(e){

    let uid = document.getElementsByName("uid")[0].value.trim();
    let fname = document.getElementsByName("fname")[0].value.trim();
    let lname = document.getElementsByName("lname")[0].value.trim();
    let email = document.getElementsByName("uemail")[0].value.trim();
    let pass = document.getElementsByName("upass")[0].value;
    let mobile = document.getElementsByName("umobno")[0].value.trim();
    let address = document.getElementsByName("uaddr")[0].value.trim();
    let pin = document.getElementsByName("pin_no")[0].value.trim();
    let balance = document.getElementsByName("open_bal")[0].value.trim();

    // User ID
    if(!/^[0-9]+$/.test(uid)){
        alert("User ID must contain only numbers.");
        e.preventDefault();
        return;
    }

    // First Name
    if(!/^[A-Za-z]{2,30}$/.test(fname)){
        alert("First Name should contain only alphabets (2-30 characters).");
        e.preventDefault();
        return;
    }

    // Last Name
    if(!/^[A-Za-z]{2,30}$/.test(lname)){
        alert("Last Name should contain only alphabets (2-30 characters).");
        e.preventDefault();
        return;
    }

    // Email
    let emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

    if(!emailPattern.test(email)){
        alert("Enter a valid Email Address.");
        e.preventDefault();
        return;
    }

    // Password
    let passwordPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&^#])[A-Za-z\d@$!%*?&^#]{8,20}$/;

    if(!passwordPattern.test(pass)){
        alert("Password must be 8-20 characters with uppercase, lowercase, number and special character.");
        e.preventDefault();
        return;
    }

    // Mobile
    if(!/^[6-9]\d{9}$/.test(mobile)){
        alert("Enter a valid 10-digit Mobile Number.");
        e.preventDefault();
        return;
    }

    // Address
    if(address.length < 5){
        alert("Address should be at least 5 characters.");
        e.preventDefault();
        return;
    }

    // PIN
    if(!/^\d{4}$/.test(pin)){
        alert("PIN must be exactly 4 digits.");
        e.preventDefault();
        return;
    }

    // Opening Balance
    if(isNaN(balance) || Number(balance) <= 0){
        alert("Opening Balance must be greater than 0.");
        e.preventDefault();
        return;
    }

});

</script>

</body>
</html>