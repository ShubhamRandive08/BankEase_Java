package com.atm.registerservlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.atm.dbconnection.DbConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		Connection con = DbConnection.dbConnectionPostgres();
		
		res.setContentType("text/html");
		String acc_holder_name = req.getParameter("account_holder_name");
        String acc_no = req.getParameter("account_id");
        String card_no = req.getParameter("card_number");
        String exp_date = req.getParameter("expiry_date");
        String cvv = req.getParameter("cvv");
        String pin = req.getParameter("pin");
		
		try {
			PreparedStatement pt = con.prepareStatement("insert into registeruser(acc_holder_name, acc_no, card_no, cvv, pin, exp_date) values (?,?,?,?,?,?);");
			pt.setString(1, acc_holder_name);
			pt.setString(2, acc_no);
			pt.setString(3, card_no);
			pt.setString(4, cvv);
			pt.setString(5, pin);
			pt.setString(6, exp_date);
			
			int i = pt.executeUpdate();
			
			if(i > 0) {
				req.setAttribute("msg", "ATM Successfully Registerd, You Can Login Now");
				req.getRequestDispatcher("login.jsp").forward(req, res);
			}else {
				req.setAttribute("msg", "ATM Registetion unsuccessful, Please try again");
				req.getRequestDispatcher("Register.jsp").include(req, res);
			}
			
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
	}
}
