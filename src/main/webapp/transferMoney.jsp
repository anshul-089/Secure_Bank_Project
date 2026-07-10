<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Transfer Money | SecureBank</title>

<%
if(session.getAttribute("user")==null)
{
    response.sendRedirect("login.jsp");
    return;
}
%>

<style>
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Arial, Helvetica, sans-serif;
}

body{
    background:linear-gradient(135deg,#0f2027,#203a43,#2c5364);
    height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
}

.container{
    width:420px;
    background:rgba(255,255,255,0.08);
    backdrop-filter:blur(12px);
    border-radius:15px;
    padding:35px;
    box-shadow:0 8px 25px rgba(0,0,0,.35);
    color:white;
}

h2{
    text-align:center;
    margin-bottom:25px;
    color:#00d4ff;
}

label{
    display:block;
    margin-bottom:8px;
    font-size:15px;
}

input[type=text]{
    width:100%;
    padding:12px;
    margin-bottom:18px;
    border:none;
    border-radius:8px;
    outline:none;
    font-size:15px;
}

.btn{
    width:100%;
    padding:12px;
    border:none;
    border-radius:8px;
    background:linear-gradient(to right,#00c6ff,#0072ff);
    color:white;
    font-size:16px;
    cursor:pointer;
    transition:.3s;
}

.btn:hover{
    transform:translateY(-2px);
    box-shadow:0 5px 15px rgba(0,114,255,.5);
}

.back{
    display:block;
    text-align:center;
    margin-top:18px;
    text-decoration:none;
    color:#00d4ff;
    font-weight:bold;
}

.back:hover{
    color:white;
}

input[type=text],
input[type=number],
input[type=password]{
    width:100%;
    padding:12px;
    margin-bottom:18px;
    border:none;
    border-radius:8px;
    outline:none;
    font-size:15px;
}

.success{
    background:#d4edda;
    color:#155724;
    padding:12px;
    border-radius:8px;
    margin-bottom:20px;
    text-align:center;
    font-weight:bold;
}

.error{
    background:#f8d7da;
    color:#721c24;
    padding:12px;
    border-radius:8px;
    margin-bottom:20px;
    text-align:center;
    font-weight:bold;
}

</style>

</head>
<body>

<div class="container">

    <h2>💸 Money Transfer</h2>
    
<%
String msg = request.getParameter("msg");

if("success".equals(msg))
{
%>

<div class="success">
    ✅ Money Transfer Successfully.
</div>

<%
}
else if("failed".equals(msg))
{
%>

<div class="error">
    ❌ Money Transfer Failed!
</div>

<%
}
%>

    <form action="moneyTransfer" method="post">

         <label>Receiver Account Number</label>
         <input type="text" name="racno" maxlength="12" pattern="[0-9]{12}" placeholder="Enter Receiver Account Number" required>

         <label>Amount</label>
		 <input type="number" name="tamount" min="1" step="0.01" placeholder="Enter Amount" required>

     	 <label>Enter Your PIN</label>
         <input type="password" name="pin" maxlength="4" pattern="[0-9]{4}" placeholder="Enter 4 Digit PIN" required>

       

    	<input type="submit" value="Transfer Money" class="btn">

    </form>

    <a href="profile.jsp" class="back">⬅ Back to Dashboard</a>

</div>

</body>
</html>