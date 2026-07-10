<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Withdraw Money</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Arial, Helvetica, sans-serif;
}

body{
    height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
    background:linear-gradient(135deg,#0f2027,#203a43,#2c5364);
}

.container{
    width:400px;
    background:rgba(255,255,255,0.08);
    backdrop-filter:blur(12px);
    border:1px solid rgba(255,255,255,0.15);
    border-radius:18px;
    padding:35px;
    box-shadow:0 10px 30px rgba(0,0,0,0.4);
}

.container h2{
    text-align:center;
    color:white;
    margin-bottom:30px;
}

.input-box{
    margin-bottom:20px;
}

.input-box label{
    color:white;
    display:block;
    margin-bottom:8px;
    font-size:15px;
}

.input-box input{
    width:100%;
    padding:12px;
    border:none;
    outline:none;
    border-radius:10px;
    font-size:15px;
}

.input-box input:focus{
    box-shadow:0 0 10px #4facfe;
}

.btn{
    width:100%;
    padding:13px;
    border:none;
    border-radius:10px;
    background:#ff4d4d;
    color:white;
    font-size:17px;
    cursor:pointer;
    transition:.3s;
    font-weight:bold;
}

.btn:hover{
    background:#ff1a1a;
    transform:translateY(-2px);
}

.back{
    text-align:center;
    margin-top:20px;
}

.back a{
    color:#7dcfff;
    text-decoration:none;
    font-weight:bold;
}

.back a:hover{
    color:white;
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

<h2>💸 Withdraw Money</h2>

<%
String msg = request.getParameter("msg");

if(msg != null)
{
    if(msg.equals("success"))
    {
%>

<div class="success">
    ✅ ₹ Money Withdrawn Successfully!
</div>

<%
    }
    else if(msg.equals("failed"))
    {
%>

<div class="error">
    ❌ Invalid PIN or Insufficient Balance!
</div>

<%
    }
    else if(msg.equals("invalid"))
    {
    %>
    <div class="error">
        ❌ Please enter a valid amount and a 4-digit PIN.
    </div>
    <%
    }
}
%>

<form action="withdraw" method="post">

<div class="input-box">
<label>Enter Amount</label>
<input type="number" name="uwithdraw" min="1" step="1" placeholder="Enter amount" required>
</div>

<div class="input-box">
<label>Enter PIN</label>
<input type="password" name="upin" maxlength="4" inputmode="numeric" placeholder="Enter your PIN" required>
</div>

<input type="submit" value="Withdraw Money" class="btn">

</form>

<div class="back">
<a href="profile.jsp">← Back to Dashboard</a>
</div>

</div>

</body>
</html>