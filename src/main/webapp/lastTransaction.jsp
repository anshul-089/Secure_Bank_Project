<%@page import="java.util.ArrayList"%>
<%@page import="controllers.TransactionBean"%>

<%
response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires",0);

if(session.getAttribute("user")==null)
{
    response.sendRedirect("login.jsp");
    return;
}

ArrayList<TransactionBean> list =
(ArrayList<TransactionBean>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Last Transactions</title>

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

header{
    display:flex;
    justify-content:space-between;
    align-items:center;
    padding:20px 8%;
}

.logo{
    font-size:28px;
    font-weight:bold;
    color:#00d4ff;
}

.container{
    width:90%;
    max-width:1200px;
    margin:40px auto;
}

.card{
    background:white;
    color:#333;
    border-radius:15px;
    padding:30px;
    box-shadow:0 10px 25px rgba(0,0,0,0.3);
}

h2{
    text-align:center;
    margin-bottom:25px;
    color:#203a43;
}

table{
    width:100%;
    border-collapse:collapse;
}

table th{
    background:#203a43;
    color:white;
    padding:12px;
}

table td{
    padding:12px;
    text-align:center;
    border-bottom:1px solid #ddd;
}

table tr:hover{
    background:#f5f5f5;
}

.back-btn{
    display:inline-block;
    margin-top:25px;
    text-decoration:none;
    background:#203a43;
    color:white;
    padding:12px 25px;
    border-radius:8px;
    transition:.3s;
}

.back-btn:hover{
    background:#0f2027;
}

.empty{
    text-align:center;
    color:red;
    font-size:18px;
    margin-top:20px;
}

</style>

</head>

<body>

<header>

<div class="logo">
SecureBank
</div>

</header>

<div class="container">

<div class="card">

<h2>Last 10 Transactions</h2>

<%
if(list!=null && !list.isEmpty())
{
%>

<table>

<tr>
<th>Transaction ID</th>
<th>Sender</th>
<th>Receiver</th>
<th>Amount</th>
<th>Type</th>
<th>Date & Time</th>
</tr>

<%
for(TransactionBean tb:list)
{
%>

<tr>

<td><%=tb.getTransaction_id()%></td>

<td><%=tb.getSender_account()%></td>

<td><%=tb.getReceiver_account()%></td>

<td>&#8377; <%=tb.getAmount()%></td>

<td><%=tb.getTransaction_type()==null?"-":tb.getTransaction_type()%></td>

<td><%=tb.getTransaction_date()==null?"-":tb.getTransaction_date()%></td>

</tr>

<%
}
%>

</table>

<%
}
else
{
%>

<div class="empty">
No Transactions Found.
</div>

<%
}
%>

<center>

<a href="profile.jsp" class="back-btn">
&#8592; Back to Dashboard
</a>

</center>

</div>

</div>

</body>
</html>