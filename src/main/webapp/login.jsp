<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
if(session.getAttribute("user") != null)
{
    response.sendRedirect("profile.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bank Login</title>
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
    width:420px;
    background:rgba(255,255,255,0.08);
    backdrop-filter:blur(10px);
    padding:40px;
    border-radius:15px;
    box-shadow:0 15px 40px rgba(0,0,0,0.4);
}

.container h1{
    text-align:center;
    color:white;
    margin-bottom:30px;
    letter-spacing:1px;
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
    font-size:15px;
    outline:none;
}

.btn{
    width:100%;
    padding:14px;
    border:none;
    border-radius:30px;
    background:#00b894;
    color:white;
    font-size:17px;
    font-weight:bold;
    cursor:pointer;
    transition:.3s;
}

.btn:hover{
    background:#019875;
    transform:scale(1.03);
}

.bottom-text{
    text-align:center;
    margin-top:20px;
    color:white;
}

.bottom-text a{
    color:#00cec9;
    text-decoration:none;
    font-weight:bold;
}

.bottom-text a:hover{
    text-decoration:underline;
}

</style>

</head>

<body>

<div class="container">

    <h1>Bank Login</h1>
    
    <%
String message = (String)request.getAttribute("msg");
String color = (String)request.getAttribute("msgColor");

if(message != null)
{
%>

<div style="
background:<%=color%>;
color:white;
padding:12px;
margin-bottom:20px;
border-radius:8px;
text-align:center;
font-weight:bold;">

<%=message%>

</div>

<%
}
%>

    <form action="login" method="post">

        <div class="input-box">
            <label>User ID</label>
            <input type="text" name="uid" placeholder="Enter User ID" required>
        </div>

        <div class="input-box">
            <label>Password</label>
            <input type="password" name="upass" placeholder="Enter Password" required>
        </div>

        <input type="submit" value="Login" class="btn">

    </form>

    <div class="bottom-text">
        Don't have an account?
        <a href="register.jsp">Create Account</a>
    </div>

</div>

</body>
</html>