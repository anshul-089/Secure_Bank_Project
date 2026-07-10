<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%
if(session.getAttribute("user")==null)
{
    response.sendRedirect("login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Check Balance | SecureBank</title>

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:Arial,Helvetica,sans-serif;
}

body{
background:linear-gradient(135deg,#0f2027,#203a43,#2c5364);
display:flex;
justify-content:center;
align-items:center;
height:100vh;
}

.container{
width:420px;
background:rgba(255,255,255,.08);
padding:35px;
border-radius:18px;
box-shadow:0 10px 30px rgba(0,0,0,.35);
}

h2{
text-align:center;
color:#FFD700;
margin-bottom:25px;
}

input{
width:100%;
padding:14px;
margin:12px 0;
border:none;
border-radius:8px;
font-size:16px;
}

button{
width:100%;
padding:14px;
background:#FFD700;
border:none;
border-radius:8px;
font-size:17px;
font-weight:bold;
cursor:pointer;
transition:.3s;
}

button:hover{
background:white;
}

.balance{
margin-top:20px;
text-align:center;
color:#7CFC00;
font-size:22px;
font-weight:bold;
}

.error{
margin-top:20px;
text-align:center;
color:red;
font-weight:bold;
}

.back{
display:block;
text-align:center;
margin-top:20px;
color:white;
text-decoration:none;
}

</style>

</head>

<body>

<div class="container">

<h2>Check Account Balance</h2>

<form action="checkBalance" method="post">

<input
type="password"
name="pin"
placeholder="Enter Transaction PIN"
maxlength="4"
required>

<button type="submit">Check Balance</button>

</form>

<%
Object balance=request.getAttribute("balance");

if(balance!=null)
{
%>

<div class="balance">
Current Balance <br><br>
₹ <%=balance%>
</div>

<%
}

String msg=(String)request.getAttribute("msg");

if(msg!=null)
{
%>

<div class="error">
<%=msg%>
</div>

<%
}
%>

<a class="back" href="profile.jsp">← Back to Dashboard</a>

</div>

</body>
</html>