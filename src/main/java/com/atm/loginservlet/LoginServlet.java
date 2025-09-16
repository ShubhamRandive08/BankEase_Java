package com.atm.loginservlet;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.atm.dbconnection.DbConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String cardNumber = req.getParameter("cardNumber");
		String secCode = req.getParameter("securityCode");
		String pin = req.getParameter("pin");

		res.setContentType("text/html");

		Connection con = DbConnection.dbConnectionPostgres();

		try {
			PreparedStatement oneValidUser = con
					.prepareStatement("select * from registeruser where card_no = ? and cvv = ? and  pin = ?;");
			PreparedStatement allUserInfo = con.prepareStatement(
					"select * from registeruser inner join accounts on registeruser.reg_id = accounts.user_id where accounts.status = 'active';");
			oneValidUser.setString(1, cardNumber);
			oneValidUser.setString(2, secCode);
			oneValidUser.setString(3, pin);

			ResultSet rs = oneValidUser.executeQuery();
			ResultSet alluserinfo = allUserInfo.executeQuery();

			if (alluserinfo.next()) {
				// Get user details from the result set
				String name = alluserinfo.getString("acc_holder_name");
				String accNo = alluserinfo.getString("acc_no");
				String cardNo = alluserinfo.getString("card_no");
				String balance = alluserinfo.getString("balance");

				// Create session and store user information
				HttpSession session = req.getSession();
				session.setAttribute("name", name);
				session.setAttribute("accNo", accNo);
				session.setAttribute("cardNo", cardNo);
				session.setAttribute("balance", balance);
				
				int lastFourDigits = Integer.parseInt(accNo.substring(accNo.length() - 4));
				session.setAttribute("lastFourAccDigits", lastFourDigits);

			}

			int i = 0;
			if (rs.next()) {
				i = 1;

			} else
				i = 0;

			if (i > 0) {
				req.setAttribute("msg", "Access Granted. Now You are using SBI Virtual ATM.");
				req.getRequestDispatcher("home.jsp").forward(req, res);
			} else {
				req.setAttribute("msg", "Please Provide Valid Creadintials");
				req.getRequestDispatcher("login.jsp").include(req, res);
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

}
