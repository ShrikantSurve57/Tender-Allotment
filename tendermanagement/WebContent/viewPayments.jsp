<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*, com.hit.utility.DBUtil"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Payment History</title>

<style>
    body{
        margin: 0;
        padding: 0;
        background: linear-gradient(135deg, #e1f5ff, #eaffea);
        font-family: Arial, sans-serif;
    }

    h2{
        text-align: center;
        margin-top: 30px;
        color: #2c3e50;
        font-size: 30px;
    }

    .table-container{
        width: 85%;
        margin: 30px auto;
        background: white;
        padding: 25px;
        border-radius: 14px;
        box-shadow: 0px 0px 20px rgba(0,0,0,0.15);
        animation: fadeIn 0.5s ease;
    }

    table{
        border-collapse: collapse;
        width: 100%;
        font-size: 16px;
    }

    th{
        background: #007bff;
        color: white;
        padding: 12px;
        border-radius: 5px;
        text-transform: uppercase;
        letter-spacing: 1px;
    }

    td{
        padding: 12px;
        text-align: center;
        color: #333;
        border-bottom: 1px solid #ddd;
    }

    tr:hover{
        background: #f1f9ff;
        transition: 0.3s;
    }

    tr:nth-child(even){
        background: #f9f9f9;
    }

    @keyframes fadeIn {
        from {
            opacity: 0;
            transform: translateY(25px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }
</style>

</head>
<body>

<h2>Payment History</h2>

<div class="table-container">

<%
Connection con = DBUtil.provideConnection();
PreparedStatement ps = con.prepareStatement("SELECT * FROM payment ORDER BY paymentDate DESC");
ResultSet rs = ps.executeQuery();
%>

<table>
    <tr>
        <th>ID</th>
        <th>Vendor ID</th>
        <th>Tender ID</th>
        <th>Amount</th>
        <th>Status</th>
        <th>Date</th>
    </tr>

<%
while(rs.next()){
%>
<tr>
    <td><%= rs.getInt("id") %></td>
    <td><%= rs.getInt("vendorId") %></td>
    <td><%= rs.getInt("tenderId") %></td>
    <td><%= rs.getDouble("amount") %></td>
    <td><%= rs.getString("status") %></td>
    <td><%= rs.getTimestamp("paymentDate") %></td>
</tr>
<%
}
con.close();
%>
</table>

</div>

</body>
</html>
