package com.hit.srv;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hit.utility.DBUtil;

@WebServlet("/PaymentSrv")
public class PaymentSrv extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        try {
            int vendorId = Integer.parseInt(req.getParameter("vendorId"));
            int tenderId = Integer.parseInt(req.getParameter("tenderId"));
            double amount = Double.parseDouble(req.getParameter("amount"));

            Connection con = DBUtil.provideConnection();

            PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO payment(vendorId, tenderId, amount, status) VALUES (?, ?, ?, 'Paid')");

            ps.setInt(1, vendorId);
            ps.setInt(2, tenderId);
            ps.setDouble(3, amount);

            int x = ps.executeUpdate();

            con.close(); // close connection

            if (x > 0) {
                resp.sendRedirect("paymentSuccess.jsp");
            } else {
                resp.getWriter().println("Payment Failed!");
            }

        } catch (Exception e) {
            e.printStackTrace();
            resp.getWriter().println("Error: " + e.getMessage());
        }
    }
}
