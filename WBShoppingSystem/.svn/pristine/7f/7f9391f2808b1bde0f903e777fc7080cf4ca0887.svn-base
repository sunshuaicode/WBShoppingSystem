package edu.shopsys.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONArray;

import edu.shopsys.model.GoodsOrder;
import edu.shopsys.model.ShippingAddress;
import edu.shopsys.service.UserService;
import edu.shopsys.service.impl.UserServiceImpl;

/**
 * Servlet implementation class UserController
 */
@WebServlet("/UserController")
public class UserController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	doPost(request, response);
        System.out.println("doGetUser");
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("doPostUser");
    	String method=request.getParameter("method");
    	if ("addGoodOrder".equals(method)) {
    		addGoodOrder(request,response);
		}else if ("addShippingAddress".equals(method)) {
			addShippingAddress(request,response);
		}else if ("modifyShippingAddress".equals(method)) {
			modifyShippingAddress(request,response);
		}else if ("queryOrderInfoByOderyId".equals(method)) {
			queryOrderInfoByOderyId(request,response);
		}else if ("queryOrderByUserId".equals(method)) {
			queryOrderByUserId(request,response);
		} 
    }

    private void queryOrderByUserId(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
    	System.out.println("queryOrderByUserId");
    	String ui=request.getParameter("user_id");
    	System.out.println(ui);
    	UserService us=new UserServiceImpl();    	
    	PrintWriter pw = response.getWriter();
    	String jsonString = JSONArray.toJSONString(us.queryOrderByUserId(ui));
    	//System.out.println("jjj"+jsonString);
    	pw.print(jsonString);
	}

	private void queryOrderInfoByOderyId(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		// TODO Auto-generated method stub
    	System.out.println("queryOrderInfoByOderyId");
    	String oi=request.getParameter("order_id");
    	System.out.println(oi);
    	UserService us=new UserServiceImpl();    	
    	PrintWriter pw = response.getWriter();
    	//String jsonString = JSONArray.toJSONString(us.queryOrderInfo(oi));
    	List<Map<String, Object>> list = new ArrayList();
    	list = us.queryOrderInfo(oi);
    	request.setAttribute("orderDetail", list);
    	System.out.println(111111);
    	System.out.println(list.get(0).get("order_pay"));
    	request.getRequestDispatcher("view_user/my-orderdetail.jsp").forward(request, response);
    	System.out.println(2222);
    	//response.sendRedirect("view_user/my-orderdetail.jsp");
    	//pw.print(jsonString);
	}

	private void modifyShippingAddress(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
    	System.out.println("addShippingAddress");
    	//从请求中获取各项参数值
    	String ai=request.getParameter("address_id");
		String nac=request.getParameter("new_address_cnee");
		String nap=request.getParameter("new_address_phone");
		String naa=request.getParameter("new_address_add");
		String napc=request.getParameter("new_address_pc");
		String naui=request.getParameter("new_address_user_id");
		//将以上数据封装成ShippingAddress对象
		ShippingAddress newShippingAddress=new ShippingAddress(ai, nac, nap, naa, napc, naui);	
		UserService us=new UserServiceImpl();
		//调用服务层方法addShippingAddress
		us.modifyShippingAddress(newShippingAddress);
	}

	//新增收货地址
    private void addShippingAddress(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
    	System.out.println("addShippingAddress");
    	//从请求中获取各项参数值
    	String ai=request.getParameter("address_id");
		String ac=request.getParameter("address_cnee");
		String ap=request.getParameter("address_phone");
		String aa=request.getParameter("address_add");
		String apc=request.getParameter("address_pc");
		String aui=request.getParameter("address_user_id");
		//将以上数据封装成ShippingAddress对象
		ShippingAddress shippingAddress=new ShippingAddress(ai, ac, ap, aa, apc, aui);	
		UserService us=new UserServiceImpl();
		//调用服务层方法addShippingAddress
		us.addShippingAddress(shippingAddress);
	}

	//生成订单
	private void addGoodOrder(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		System.out.println("addGoodOrder");
		//从请求中获取各项参数值
		String oi=request.getParameter("order_id");
		String ot=request.getParameter("order_time");
		String op=request.getParameter("order_pay");
		String ogi=request.getParameter("order_goods_id");
		String oai=request.getParameter("order_address_id");
		String os=request.getParameter("order_state");
		String oui=request.getParameter("order_user-id");
		//将以上数据封装成GoodsOrder对象
		GoodsOrder goodsorder=new GoodsOrder(oi,ot,op,ogi,oai,os,oui);
		UserService us=new UserServiceImpl();
		//调用服务层方法addGoodOrder
		us.addGoodOrder(goodsorder);
	}

}
