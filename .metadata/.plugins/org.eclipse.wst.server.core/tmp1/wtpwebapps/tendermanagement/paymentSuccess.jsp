<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Payment Successful</title>

<style>
    body{
        margin: 0;
        padding: 0;
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        background: linear-gradient(135deg, #e0ffe8, #d1f7ff);
        font-family: 'Arial', sans-serif;
    }

    .card{
        background: white;
        width: 450px;
        padding: 40px;
        border-radius: 16px;
        box-shadow: 0 0 18px rgba(0,0,0,0.15);
        text-align: center;
        animation: fadeIn 0.5s ease;
    }

    .tick{
        font-size: 60px;
        color: #28a745;
        margin-bottom: 10px;
    }

    h2{
        color: #28a745;
        margin-top: 0;
        font-size: 28px;
    }

    a{
        display: inline-block;
        padding: 12px 25px;
        margin-top: 20px;
        background: #007bff;
        color: white;
        border-radius: 8px;
        text-decoration: none;
        font-size: 16px;
        transition: 0.3s ease;
        width: 180px;
    }

    a:hover{
        background: #0056b3;
    }

    .secondary{
        background: #28a745;
    }

    .secondary:hover{
        background: #1c7e34;
    }

    @keyframes fadeIn{
        from{
            opacity: 0;
            transform: translateY(30px);
        }
        to{
            opacity: 1;
            transform: translateY(0);
        }
    }
</style>

</head>
<body>

<div class="card">
    <div class="tick">✔</div>
    <h2>Payment Successful!</h2>

    <a href="viewPayments.jsp">View Payment History</a>
    <a href="payment.jsp" class="secondary">Make Another Payment</a>
</div>

</body>
</html>
