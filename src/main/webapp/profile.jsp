<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
/* Session Validation */
if(session == null || session.getAttribute("user") == null)
{
    response.sendRedirect("login.jsp");
    return;
}

/* Prevent Browser Cache */
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SecureBank Dashboard</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Arial, Helvetica, sans-serif;
}

body{
    background:linear-gradient(135deg,#0f2027,#203a43,#2c5364);
    color:white;
}

/* Header */

header{
    height:70px;
    background:rgba(0,0,0,.25);
    display:flex;
    justify-content:space-between;
    align-items:center;
    padding:0 40px;
    box-shadow:0 5px 20px rgba(0,0,0,.3);
}

.logo{
    font-size:28px;
    font-weight:bold;
    color:#FFD700;
}

.logout{
    text-decoration:none;
    background:#FFD700;
    color:black;
    padding:12px 25px;
    border-radius:30px;
    font-weight:bold;
    transition:.3s;
}

.logout:hover{
    background:white;
}

/* Main Layout */

.container{
    display:flex;
    min-height:calc(100vh - 70px);
}

/* Sidebar */

.sidebar{
    width:260px;
    background:rgba(0,0,0,.20);
    padding-top:30px;
    box-shadow:5px 0 20px rgba(0,0,0,.2);
}

.sidebar h2{
    text-align:center;
    color:#FFD700;
    margin-bottom:30px;
}

.sidebar a{
    display:block;
    text-decoration:none;
    color:white;
    padding:18px 30px;
    font-size:18px;
    transition:.3s;
}

.sidebar a:hover{
    background:#FFD700;
    color:black;
    padding-left:40px;
}

/* Content Area */

.content{
    flex:1;
    padding:50px;
}

/* Welcome Card */

.card{
    background:rgba(255,255,255,.08);
    border-radius:20px;
    padding:40px;
    box-shadow:0 10px 30px rgba(0,0,0,.3);
}

.card h1{
    color:#FFD700;
    margin-bottom:20px;
    font-size:38px;
}

.card p{
    color:#dddddd;
    font-size:20px;
    line-height:35px;
}

/* Dashboard Boxes */

.box-container{
    display:flex;
    gap:30px;
    margin-top:40px;
    flex-wrap:wrap;
}

.box{
    flex:1;
    min-width:220px;
    background:rgba(255,255,255,.08);
    padding:25px;
    border-radius:15px;
    text-align:center;
    transition:.3s;
}

.box:hover{
    transform:translateY(-8px);
}

.box h3{
    color:#FFD700;
    margin-bottom:15px;
}

.box p{
    font-size:18px;
    color:#ddd;
}

@media(max-width:900px){

.container{
    flex-direction:column;
}

.sidebar{
    width:100%;
}

.content{
    padding:25px;
}

.box-container{
    flex-direction:column;
}

}

</style>

</head>

<body>

<header>

    <div class="logo">
        🏦 SecureBank
    </div>

    <a href="logout" class="logout">Logout</a>

</header>

<div class="container">

    <!-- Sidebar -->

    <div class="sidebar">

        <h2>Dashboard</h2>

        <a href="viewProfile">👤 View Profile</a>

        <a href="viewEditProfile">✏ Edit Profile</a>

        <a href="deposit.jsp">💰 Deposit</a>

        <a href="withdraw.jsp">🏧 Withdraw</a>

        <a href="transferMoney.jsp">💸 Transfer Money</a>
        
        <a href="checkBalance.jsp">💳 Check Balance</a>

        <a href="lastTransaction">📜 Last Transaction</a>
        
        <a href="changePin.jsp">🔐 Change PIN</a>

    </div>

    <!-- Main Content -->

    <div class="content">

        <div class="card">

            <h1>
                Welcome,
                ${empty sessionScope.user ? 'User' : sessionScope.user.f_name}
            </h1>

            <p>
                Welcome to SecureBank Internet Banking.
                Use the menu on the left to access all banking services.
                Your account information is protected with secure authentication.
            </p>

        </div>

        <div class="box-container">

            <div class="box">
                <h3>Account Number</h3>
                <p>${sessionScope.user.account_number}</p>
            </div>

            <div class="box">
                <h3>Available Balance</h3>
                <p>₹ ${sessionScope.user.open_balance}</p>
            </div>

        </div>

    </div>

</div>

</body>
</html>