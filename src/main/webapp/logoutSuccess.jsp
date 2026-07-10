<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Logout Successful</title>

<%
response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires",0);

if(session != null)
{
    session.invalidate();
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
    display:flex;
    justify-content:center;
    align-items:center;
    height:100vh;
    background:linear-gradient(135deg,#0f2027,#203a43,#2c5364);
}

.box{
    background:rgba(255,255,255,0.08);
    padding:40px 60px;
    border-radius:15px;
    text-align:center;
    color:white;
    box-shadow:0 10px 30px rgba(0,0,0,.4);
}

.box h1{
    color:#00ff99;
    margin-bottom:15px;
}

.box p{
    font-size:18px;
}

</style>

<script>
setTimeout(function(){
    window.location.href="login.jsp";
},3000);
</script>

</head>

<body>

<div class="box">
    <h1>✅ Logout Successful</h1>
    <p>Redirecting to Login Page...</p>
</div>

</body>
</html>