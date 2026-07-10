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
    response.sendRedirect("viewProfile");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Profile | SecureBank</title>

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

/* Header */

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
    transition:.3s;
}

.logout:hover{
    background:white;
}

/* Main */

.container{
    width:90%;
    max-width:900px;
    margin:45px auto;
}

.profile-card{

    background:rgba(255,255,255,.08);
    backdrop-filter:blur(10px);
    border-radius:20px;
    padding:35px;
    box-shadow:0 15px 35px rgba(0,0,0,.35);

}

.profile-header{

    text-align:center;
    margin-bottom:35px;

}

.profile-header h1{

    color:#FFD700;
    font-size:34px;
    margin-bottom:10px;

}

.profile-header p{

    color:#ddd;
    font-size:18px;

}

.grid{

    display:grid;
    grid-template-columns:1fr 1fr;
    gap:20px;

}

.item{

    background:rgba(255,255,255,.06);
    border-left:5px solid #FFD700;
    border-radius:10px;
    padding:18px;

}

.item h4{

    color:#FFD700;
    font-size:15px;
    margin-bottom:8px;
    letter-spacing:1px;

}

.item p{

    color:white;
    font-size:18px;
    word-break:break-word;

}

.balance{

    color:#00ff99 !important;
    font-size:24px !important;
    font-weight:bold;

}

.buttons{

    margin-top:40px;
    text-align:center;

}

.btn{

    display:inline-block;
    text-decoration:none;
    padding:12px 28px;
    margin:8px;
    border-radius:30px;
    font-weight:bold;
    transition:.3s;

}

.dashboard{

    background:#FFD700;
    color:black;

}

.dashboard:hover{

    background:white;

}

.edit{

    background:#198754;
    color:white;

}

.edit:hover{

    background:#157347;

}

@media(max-width:768px){

.grid{

    grid-template-columns:1fr;

}

header{

    padding:0 20px;

}

.logo{

    font-size:24px;

}

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

<div class="profile-card">

<div class="profile-header">

<h1>👤 My Profile</h1>

<p>Welcome, <%= ub.getF_name() %>!</p>

</div>

<div class="grid">

<div class="item">
<h4>User ID</h4>
<p><%= ub.getUser_id() %></p>
</div>

<div class="item">
<h4>Account Number</h4>
<p><%= ub.getAccount_number() %></p>
</div>

<div class="item">
<h4>First Name</h4>
<p><%= ub.getF_name() %></p>
</div>

<div class="item">
<h4>Last Name</h4>
<p><%= ub.getL_name() %></p>
</div>

<div class="item">
<h4>Email Address</h4>
<p><%= ub.getEmail() %></p>
</div>

<div class="item">
<h4>Mobile Number</h4>
<p><%= ub.getPhone_no() %></p>
</div>

<div class="item">
<h4>Address</h4>
<p><%= ub.getAddress() %></p>
</div>

<div class="item">
<h4>Available Balance</h4>
<p class="balance">₹ <%= String.format("%.2f",ub.getOpen_balance()) %></p>
</div>

</div>

<div class="buttons">

<a href="profile.jsp" class="btn dashboard">
🏠 Dashboard
</a>

<a href="viewEditProfile" class="btn edit">
    ✏ Edit Profile
</a>

</div>

</div>

</div>

</body>
</html>