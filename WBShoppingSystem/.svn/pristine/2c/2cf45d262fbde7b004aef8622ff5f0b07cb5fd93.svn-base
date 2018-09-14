package edu.shopsys.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.corba.se.spi.ior.iiop.AlternateIIOPAddressComponent;

import edu.shopsys.service.UserService;
import edu.shopsys.service.impl.AdminServiceImpl;
import edu.shopsys.service.impl.UserServiceImpl;
import edu.shopsys.model.User;

/**
 * Servlet implementation class userLookForOrder
 */
@WebServlet("/userLookForOrder")
public class userLookForOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public userLookForOrder() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		doPost(request, response);
			
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}
	
	
	protected void transaction(HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println("\n" + "订单信息查询");
		String id = "555";
		String state = "已支付";
		response.setContentType("application/json;Charset=utf-8");
		response.setCharacterEncoding("utf-8");
		String idOfOrder = String.valueOf(new UserServiceImpl().queryById(id));
		String stateOfOder = String.valueOf(new UserServiceImpl().queryOrder(state));

		String jsonstr = "{\"idOfOrder\":\"" + idOfOrder + "\"}";
		String jsonstr1 = "{\"stateOfOder\":\"" + stateOfOder + "\"}";
		PrintWriter pw = response.getWriter();
		
		
		if (1 == 1) {
			pw.write(jsonstr);
			System.out.println(jsonstr);
		} else if (1 == 0) {
			pw.write(jsonstr1);
			System.out.println(jsonstr);
		}

	}

}
