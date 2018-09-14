package edu.shopsys.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.shopsys.model.User;
import edu.shopsys.service.AdminService;
import edu.shopsys.service.impl.AdminServiceImpl;
@WebServlet("/UserAdminListController")
public class UserAdminListController extends HttpServlet {
 
 
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
 
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
 
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
 
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
        System.out.println(1234);
		AdminService ads = new AdminServiceImpl();
 
		String method = request.getParameter("method");
		if (method == null || method.equals("")) {
			method = "user_list";
		}
		// 匹配userlist页面
		if (method.equals("user_list")) {
			List<User> ulist = null;
			try {
				ulist = ads.queryUser();
			} catch (SQLException e) {
				// TODO 自动生成的 catch 块
				e.printStackTrace();
			}
			session.setAttribute("ulist", ulist);
			response.sendRedirect("view_admin/user_list.jsp");
			return;
		}
		if (method.equals("del")) {
			String user_id = request.getParameter("user_id");
			System.out.println("del run");
			try {
				ads.delectUser(user_id);
			} catch (SQLException e) {
				// TODO 自动生成的 catch 块
				e.printStackTrace();
			}
			out.print("<script>alert('删除成功！');window.location='UserAdminListController?mothod=user_list';</script>");
			return;
		}
		if (method.equals("edit")) {
			String user_id=request.getParameter("user_id");
			String user_name = request.getParameter("user_name");
			String user_pwd = request.getParameter("user_pwd");
			String user_email = request.getParameter("user_email");
			String user_sex = request.getParameter("user_sex");
			String user_address = request.getParameter("user_address");
			String user_register_time = request.getParameter("user_register_time");
			String user_state = request.getParameter("user_state");
			User u = new User(user_id,user_name,user_pwd,user_email,user_sex,user_address,user_register_time,user_state);
			try {
				ads.updateUser(u);
			} catch (SQLException e) {
				// TODO 自动生成的 catch 块
				e.printStackTrace();
			}
			out.print("<script>alert('修改成功！');window.location='UserAdminListController?mothod=user_list';</script>");
			return;
		}
	}
}