<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UPI Payment</title>

<style>
    body{
        font-family: Arial, sans-serif;
        background: #f2f4f7;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }

    .container{
        background: white;
        width: 400px;
        padding: 30px;
        border-radius: 12px;
        box-shadow: 0 0 15px rgba(0,0,0,0.2);
        text-align: center;
    }

    input{
        width: 100%;
        padding: 10px;
        margin: 10px 0;
        border-radius: 6px;
        border: 1px solid #ccc;
        font-size: 15px;
    }

    button{
        width: 100%;
        background: #007bff;
        color: white;
        padding: 12px;
        font-size: 16px;
        border: none;
        border-radius: 6px;
        cursor: pointer;
        transition: 0.3s ease;
    }

    button:hover{
        background: #0056b3;
    }

    .qr-box{
        margin-top: 20px;
        padding: 10px;
        background: #f7f7f7;
        border-radius: 10px;
    }
</style>

</head>
<body>

<div class="container">

    <h2>Make UPI Payment</h2>

    <form method="post" action="PaymentSrv">

        <label>Vendor ID:</label>
        <input type="number" name="vendorId" required>

        <label>Tender ID:</label>
        <input type="number" name="tenderId" required>

        <label>Amount:</label>
        <input type="number" id="amount" name="amount" step="0.01" required>

        <div id="qrSection" style="display:none;">
            <h3>Scan & Pay</h3>
            <div class="qr-box">
                <img id="upiQR" src="" width="230px">
            </div>
        </div>

        <button type="button" onclick="generateQR()">Generate QR</button>
        <button type="submit" style="margin-top:10px; display:none;" id="submitBtn">I Have Paid</button>

    </form>
</div>

<script>
function generateQR() {
    let amount = document.getElementById("amount").value;

    if(amount === "" || amount <= 0){
        alert("Enter a valid amount");
        return;
    }

    // Your UPI ID + Name (Replace test@upi with your real UPI ID)
    let upiId = "test@upi";
    let name = "Receiver Name";
    
    let url = 
        "upi://pay?pa=" + upiId +
        "&pn=" + name +
        "&am=" + amount +
        "&cu=INR";

    // Google Chart API for QR
    let qrUrl = "https://chart.googleapis.com/chart?cht=qr&chs=250x250&chl=" + encodeURIComponent(url);

    document.getElementById("upiQR").src = qrUrl;

    document.getElementById("qrSection").style.display = "block";
    document.getElementById("submitBtn").style.display = "block";
}
</script>

</body>
</html>
