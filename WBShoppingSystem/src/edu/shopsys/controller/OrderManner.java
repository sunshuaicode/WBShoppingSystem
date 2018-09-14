package edu.shopsys.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONArray;

import edu.shopsys.model.GoodsorderAndGoods;
import edu.shopsys.service.AdminService;
import edu.shopsys.service.impl.AdminServiceImpl;

@WebServlet("/OrderManner")
public class OrderManner extends HttpServlet{
	    //private static final long serialVersionUID = 1L;
	
	    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        doPost(request,response);
	    }
	    
	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        System.out.println("开始进行订单处理");
	        response.setContentType("text/html;charset=utf-8");
	        String method = null;
	        method = request.getParameter("method");
	        System.out.println("method="+method);
	        if("orderquerybystate".equals(method)) {
	           orderQueryByState(request,response);
	        }else if("orderquerybyid".equals(method)) {
	        	orderQueryById(request,response);
	        }else if("allorderquery".equals(method)){
	        	allOrderQuery(request,response);
	        }else if("deleteorder".equals(method)) {
	        	deleteOrder(request, response);
	        }else if("setstatebyid".equals(method)) {
	        	setState(request, response);
	        }else if("orderquerybytype".equals(method)) {
	        	orderQueryByType(request, response);
	        }
	        
	    }
	    
	    /*public List<GoodsorderAndGoods> allOrderSelect(){
	    	System.out.println("开始获取所有的订单信息");
	    	AdminService service = new AdminServiceImpl();	
	    	List<GoodsorderAndGoods> list = service.queryGoodsOrderAndGoods();
	    	System.out.println("获取信息成功");
	    	return list;
	    }*/
	    	    
	    public void allOrderQuery(HttpServletRequest request, HttpServletResponse response) {
	    	System.out.println("开始获取所有的订单信息");
	    	AdminService service = new AdminServiceImpl();	
	    	List<GoodsorderAndGoods> list = service.queryGoodsOrderAndGoods();
	        request.getSession().setAttribute("GoodsOrderAndGoods", list);
	    	System.out.println("从数据源获取信息成功");
	        /*try {
				request.getRequestDispatcher("/view_admin/view/Orderform.jsp").forward(request, response);
			} catch (ServletException | IOException e) {
				// TODO 自动生成的 catch 块
				e.printStackTrace();
			}*/
		}
	    
	    public void orderQueryByState(HttpServletRequest request, HttpServletResponse response) {
	    	System.out.println("开始根据订单状态获取订单信息");
	    	String orderState = request.getParameter("orderstate");
	    	AdminService service = new AdminServiceImpl();	    	
	    	PrintWriter pw=null;;
			try {
				pw = response.getWriter();
			} catch (IOException e) {
				// TODO 自动生成的 catch 块
				e.printStackTrace();
			}
	        String jsonString = JSONArray.toJSONString(service.queryGoodsOrderAndGoodsByState(orderState));
			pw.print(jsonString);
	    }
	    
	    public void orderQueryById(HttpServletRequest request, HttpServletResponse response) {
	    	System.out.println("开始根据订单编号获取订单信息");
	    	String orderId = request.getParameter("orderid");
	    	System.out.println("orderId ="+orderId);
	    	AdminService service = new AdminServiceImpl();	
	    	List<GoodsorderAndGoods> list = service.queryGoodsOrderAndGoodsByID(orderId);
	    	request.getSession().setAttribute("GoodsOrderAndGoods", list);
	    	System.out.println("从数据源获取信息成功");
	    	System.out.println("数据放入session成功");
	    	PrintWriter pw=null;;
			try {
				pw = response.getWriter();
			} catch (IOException e) {
				// TODO 自动生成的 catch 块
				e.printStackTrace();
			}
	        /*String jsonString = JSONArray.toJSONString(service.queryGoodsOrderAndGoodsByID(orderId));*/
			pw.print(1);
	    }
	    
	    public void orderQueryByType(HttpServletRequest request, HttpServletResponse response) {
	    	System.out.println("开始根据商品类型获取订单信息");
	    	String goodstype = request.getParameter("goodstype");
	    	System.out.println("goodstype ="+goodstype);
	    	AdminService service = new AdminServiceImpl();	
	    	List<GoodsorderAndGoods> list = service.queryGoodsOrderAndGoodsByType(goodstype);
	    	request.getSession().setAttribute("GoodsOrderAndGoods", list);
	    	System.out.println("从数据源获取信息成功");
	    	System.out.println("数据放入session成功");
	    }
	    
	    public void deleteOrder(HttpServletRequest request, HttpServletResponse response) {
	    	System.out.println("开始删除order");
	    	String orderid=request.getParameter("orderid");
	    	AdminService service = new AdminServiceImpl();
	    	Boolean boo = service.deleteOrder(orderid);
	    	PrintWriter pw=null;;
			try {
				pw = response.getWriter();
			} catch (IOException e) {
				// TODO 自动生成的 catch 块
				e.printStackTrace();
			}
			if(boo) {
				pw.print(1);
			}else {
				pw.print(0);
			}
		}
	    
	    public void setState(HttpServletRequest request, HttpServletResponse response) {
	    	System.out.println("开始设置状态");
	    	String orderid=request.getParameter("orderid");
	    	String state=request.getParameter("state");
	    	AdminService service = new AdminServiceImpl();
	    	Boolean bool = service.setOrderState(orderid, state);
	    	PrintWriter pw=null;;
			try {
				pw = response.getWriter();
			} catch (IOException e) {
				// TODO 自动生成的 catch 块
				e.printStackTrace();
			}
			if(bool) {
				pw.print(1);
			}else {
				pw.print(0);
			}
	    }
     }
