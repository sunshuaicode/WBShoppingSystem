package edu.shopsys.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.HttpCookie;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.corba.se.spi.ior.iiop.AlternateIIOPAddressComponent;

import edu.shopsys.service.UserService;
import edu.shopsys.service.impl.AdminServiceImpl;
import edu.shopsys.service.impl.UserServiceImpl;
import edu.shopsys.model.User;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("doPostLogin");
		String method = request.getParameter("method");
		if ("login".equals(method)) {
			login(request, response);
			/*
			 * }else if("isHavenId".equals(method)){ isHavenId(request,response);
			 */
		} else if ("register".equals(method)) {
			register(request, response);
		}else if ("Cookielogin".equals(method)) {
			cookLogin(request, response);
		}else if("delectUser".equals(method)) {
			delectUser(request, response);
		}
	}

	// 登陆
	private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("loginid");

		/*
		 * //以io流方式，返回resultTip值 response.setContentType("text/html;charset=UTF-8");
		 * PrintWriter pWriter = response.getWriter(); pWriter.write(resultTip);
		 * pWriter.flush(); pWriter.close();
		 */
		// 获取客户输入的验证码
		String checkCodeClient = request.getParameter("checkcode");
		//String resultTip = "imgs/wrong.jpg";
		String checkcodeServer = (String) (request.getSession().getAttribute("CHECKCODE"));
		

		String password = request.getParameter("loginpwd");
		System.out.println("userid=" + id + ";paw=" + password);
		UserService svr = new UserServiceImpl();
		User user = svr.queryInfo(id);
		boolean isSucces = svr.login(id, password);
		//判断验证码是否正确
		if (checkCodeClient.equals(checkcodeServer)) {
			//判断用户名是否成功登陆 
			if (isSucces) {
				request.getSession().setAttribute("isLogin", true);
				request.getSession().setAttribute("userId", id);
				request.getSession().setAttribute("user", user);
				//判断是否勾选记住用户名免登陆
				if(request.getParameter("chkRememberUserid")!=null && request.getParameter("chkRememberUserid").equals("is")){
	
					//在客户端保存用户名和密码request.getParameter("chkRememberUserid").equals("is")
					Cookie c =new Cookie("loginid",id);
					c.setMaxAge(60*60*24);//设置cookie数据有效时长
					response.addCookie(c);//向客户端写数据
					response.getWriter().print("c.getValue()");
					//new一个cookie记密码
					Cookie c1 =new Cookie("loginpwd",password);
					c1.setMaxAge(60*60*24);//设置cookie数据有效时长
					response.addCookie(c1);//向客户端写数据
					}
				System.out.println("88888888888");
				response.sendRedirect("view_user/index.jsp");
				response.getWriter().print("<script language='javascript'>alert('登录成功')</script>");
			} else {
				response.getWriter().print("<script language='javascript'>alert('登录失败，请检查用户名或密码是否正确')</script>");
				response.sendRedirect("view_user/login.jsp");
				System.out.println("s大萨达撒所大");
			}
			
			
		}else {
			response.getWriter().print("<script language='javascript'>alert('登录失败，验证码错误')</script>");
		}
		
	}

	
	
	// 注册用户
	private void register(HttpServletRequest request, HttpServletResponse response) {

		// 获取客户输入的验证码
		String checkCodeClient = request.getParameter("checkcode");
		String resultTip = "imgs/wrong.jpg";
		String checkcodeServer = (String) (request.getSession().getAttribute("CHECKCODE"));

		System.out.println("adduser");
		// 从请求中获取各项参数值
		String uid = request.getParameter("userid");
		UserService svr = new UserServiceImpl();
		System.out.println("检查重复id");
		// 如果用户名没有重复
		String uname = request.getParameter("username");
		String upwd = request.getParameter("pwd");
		String uemail = request.getParameter("mail");
		// 默认
		String usex = "未知";
		String uadd = "未填写";
		// 获取当前时间
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String utime = sdf.format(new Date());
		// 默认正常状态
		String usl = "正常";
		// 将以上数据封装成User对象
		User user = new User(uid, uname, upwd, uemail, usex, uadd, utime, usl);
		UserService us = new UserServiceImpl();

		// 比较客户端与服务端验证码
		if (checkCodeClient.equals(checkcodeServer)) {
			//是否没有用户id重复
			boolean noHaven = svr.hadThing(uid);
			if (noHaven) {
				try {
					
					// 调用服务层方法register
					us.register(user);
					response.sendRedirect("view_user/login.jsp");
					response.getWriter().print("<script language='javascript'>alert('注册成功，请尽快修改个人详细信息')</script>");
				} catch (IOException e) {
					e.printStackTrace();
				}
			} else {
				try {
					response.getWriter().print("<script language='javascript'>alert('注册失败，用户id重复或未填写完信息,返回上一层继续注册')</script>");

				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		} else {
			try {
				response.getWriter().print("<script language='javascript'>alert('注册失败，验证码错误')</script>");
			} catch (IOException e) {
				// TODO 自动生成的 catch 块
				e.printStackTrace();
			}
		}

	}
	
	
	//免登陆方法
	private void cookLogin(HttpServletRequest request,HttpServletResponse response) {
		System.out.println("免登陆开始");
		String uid = request.getParameter("loginid");
		String upwd = request.getParameter("loginpwd");
		UserService svr = new UserServiceImpl();
		User user = svr.queryInfo(uid);
		boolean iscook=svr.login(uid, upwd);
		if(iscook) {
			try {
				request.getSession().setAttribute("user", user);
				request.getSession().setAttribute("isLogin", true);
				request.getSession().setAttribute("userId", uid);
				response.sendRedirect("view_user/index.jsp");
				
			} catch (IOException e) {
				// TODO 自动生成的 catch 块
				e.printStackTrace();
			}
		}
	}
	
	//注销用户方法
	private void delectUser(HttpServletRequest request,HttpServletResponse response) {
		
		System.out.println("注销没");
		
		//删除sessio
		HttpSession session = request.getSession();
		session.invalidate();
		
		//设置cookie存活时间为0，即删除
		Cookie cookie1 = new Cookie("loginid", null);
		cookie1.setMaxAge(0);
		Cookie cookie2 = new Cookie("loginpwd", null);
		cookie2.setMaxAge(0);
		response.addCookie(cookie1);
		response.addCookie(cookie2);
		try {
     		String url= request.getHeader("Referer");
			response.sendRedirect(url);
            return;
		} catch (IOException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		
		/*Cookie[] cookie = request.getCookies();
		for (int i = 0; i < cookie.length; i++) {
			Cookie cook = cookie[i];
			if(cook.getName().equalsIgnoreCase("eredg4.login.account")){ //获取键 
			System.out.println("account:"+cook.getValue().toString());    //获取值 
			}
			}
		setcookie('loginid','',0);*/
		
		
	}
	
	// 检验用户重复id
	/*
	 * private void isHavenId(HttpServletRequest request, HttpServletResponse
	 * response) { System.out.println("检查重复id"); String
	 * uid=request.getParameter("data"); UserService svr = new UserServiceImpl();
	 * boolean noHaven = svr.hadThing(uid); //判断用户名是否有重复 if(noHaven==true) { try {
	 * System.out.println("无重复id"); response.getWriter().
	 * print("<script language='javascript'>alert('验证成功')</script>"); } catch
	 * (IOException e) { e.printStackTrace(); } }else { try {
	 * System.out.println("有重复id"); response.getWriter().
	 * print("<script language='javascript'>alert('验证失败，请重新输入')</script>"); } catch
	 * (IOException e) { e.printStackTrace(); }
	 * 
	 * } }
	 */

	

}
