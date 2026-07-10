<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
if(session.getAttribute("user")==null)
{
    response.sendRedirect("login.jsp");
    return;
}

/* Prevent Browser Cache */
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires",0);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Change Transaction PIN | SecureBank</title>

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
    min-height:100vh;
}

.container{
    width:450px;
    background:rgba(255,255,255,.08);
    backdrop-filter:blur(10px);
    padding:40px;
    border-radius:15px;
    box-shadow:0 15px 35px rgba(0,0,0,.35);
}

h2{
    text-align:center;
    color:#FFD700;
    margin-bottom:30px;
}

.input-box{
    margin-bottom:20px;
}

.input-box label{
    display:block;
    color:white;
    margin-bottom:8px;
    font-weight:bold;
}

.input-box input{
    width:100%;
    padding:12px;
    border:none;
    border-radius:8px;
    outline:none;
    font-size:15px;
}

.btn{
    width:100%;
    padding:14px;
    border:none;
    border-radius:30px;
    background:#00b894;
    color:white;
    font-size:17px;
    cursor:pointer;
    font-weight:bold;
    transition:.3s;
}

.btn:hover{
    background:#019875;
    transform:scale(1.03);
}

.back{
    display:block;
    text-align:center;
    margin-top:18px;
    color:#FFD700;
    text-decoration:none;
    font-weight:bold;
}

.back:hover{
    text-decoration:underline;
}

</style>

</head>
<body>

<div class="container">

<h2>🔐 Change Transaction PIN</h2>

<%
String msg=(String)request.getAttribute("msg");
String color=(String)request.getAttribute("color");

if(msg!=null)
{
%>

<div style="
background:<%=color%>;
padding:12px;
border-radius:8px;
color:white;
text-align:center;
margin-bottom:20px;
font-weight:bold;">

<%=msg%>

</div>

<%
}
%>

<form action="changePin" method="post">

<div class="input-box">
<label>Current PIN</label>
<input type="password" name="oldPin" maxlength="4" placeholder="Enter Current PIN" required>
</div>

<div class="input-box">
<label>New PIN</label>
<input type="password" name="newPin" maxlength="4" placeholder="Enter New PIN" required>
</div>

<div class="input-box">
<label>Confirm New PIN</label>
<input type="password" name="confirmPin" maxlength="4" placeholder="Confirm New PIN" required>
</div>

<input type="submit" value="Change PIN" class="btn">

</form>

<a href="profile.jsp" class="back">← Back to Dashboard</a>

</div>

</body>
</html>