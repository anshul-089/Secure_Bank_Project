<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>SecureBank</title>

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
    display:flex;
    justify-content:space-between;
    align-items:center;
    padding:20px 8%;
}

.logo{
    font-size:30px;
    font-weight:bold;
    color:#FFD700;
}

nav a{
    text-decoration:none;
    color:white;
    margin-left:30px;
    font-size:18px;
    transition:.3s;
}

nav a:hover{
    color:#FFD700;
}

/* Hero Section */

.hero{
    display:flex;
    justify-content:space-between;
    align-items:center;
    padding:70px 8%;
    min-height:85vh;
}

.left{
    width:50%;
}

.left h1{
    font-size:55px;
    margin-bottom:20px;
}

.left h1 span{
    color:#FFD700;
}

.left p{
    font-size:20px;
    line-height:32px;
    margin-bottom:35px;
    color:#dddddd;
}

.buttons a{
    text-decoration:none;
    padding:15px 35px;
    margin-right:20px;
    border-radius:30px;
    font-size:18px;
    font-weight:bold;
    transition:.3s;
}

.login{
    background:#FFD700;
    color:black;
}

.login:hover{
    background:white;
}

.register{
    border:2px solid white;
    color:white;
}

.register:hover{
    background:white;
    color:black;
}

/* Image */

.right{
    width:45%;
}

.right img{
    width:100%;
    border-radius:20px;
    box-shadow:0px 10px 30px rgba(0,0,0,.5);
    transition:.4s;
}

.right img:hover{
    transform:scale(1.03);
}

/* Responsive */

@media(max-width:900px){

.hero{
    flex-direction:column-reverse;
    text-align:center;
}

.left,
.right{
    width:100%;
}

.right img{
    margin-bottom:40px;
}

header{
    flex-direction:column;
}

nav{
    margin-top:20px;
}

nav a{
    margin:10px;
}

.left h1{
    font-size:40px;
}

}
</style>

</head>

<body>

<header>
    <div class="logo">🏦 SecureBank</div>

    <nav>
        <a href="#">Home</a>
        <a href="#">Services</a>
        <a href="#">About</a>
        <a href="#">Contact</a>
    </nav>
</header>

<section class="hero">

    <div class="left">

        <h1>Welcome to <span>SecureBank</span></h1>

        <p>
            Fast, Secure and Trusted Banking Services.
            Manage your account anytime, anywhere with complete security.
        </p>

        <div class="buttons">
            <a href="login.jsp" class="login">Login</a>
            <a href="register.jsp" class="register">Open Account</a>
        </div>

    </div>

    <div class="right">
        <img src="https://images.unsplash.com/photo-1554224155-6726b3ff858f?w=700" alt="Bank">
    </div>

</section>

</body>
</html>