package com.atm.registerservlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
			
			PreparedStatement allUser = con.prepareStatement(
				    "select * from registeruser where acc_no = ? or card_no = ?"
				);
				allUser.setString(1, acc_no);
				allUser.setString(2, card_no);
				ResultSet rs = allUser.executeQuery();
				int i = 0;
				if(rs.next()) {
				    i = 1;   // record exists
				} else {
				    i = 0;   // no record found
				}

			if(i <= 0) {
				PreparedStatement pt = con.prepareStatement("insert into registeruser(acc_holder_name, acc_no, card_no, cvv, pin, exp_date) values (?,?,?,?,?,?);");
				pt.setString(1, acc_holder_name);
				pt.setString(2, acc_no);
				pt.setString(3, card_no);
				pt.setString(4, cvv);
				pt.setString(5, pin);
				pt.setString(6, exp_date);
				
				int j = pt.executeUpdate();
				
				if(j > 0) {
					req.setAttribute("msg", "ATM Successfully Registerd, You Can Login Now");
					req.getRequestDispatcher("login.jsp").forward(req, res);
				}else {
					req.setAttribute("msg", "ATM Registetion unsuccessful, Please try again");
					req.getRequestDispatcher("Register.jsp").include(req, res);
				}
			}else {
			    PrintWriter out = res.getWriter();
			    out.println("<html><head>");
			    out.println("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>");
			    out.println("</head><body>");
			    out.println("<script>");
			    out.println("Swal.fire({");
			    out.println("  icon: 'error',");
			    out.println("  title: 'Registration Failed',");
			    out.println("  text: 'ATM Registration unsuccessful, Please try again'");
			    out.println("}).then(function(){ window.location='Register.jsp'; });");
			    out.println("</script>");
			    out.println("</body></html>");
			}

			
			
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
	}
}
