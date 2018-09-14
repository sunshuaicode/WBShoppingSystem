package edu.shopsys.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.coyote.http11.filters.VoidInputFilter;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import edu.shopsys.model.Goods;
import edu.shopsys.model.ShopCar;
import edu.shopsys.service.UserService;
import edu.shopsys.service.impl.UserServiceImpl;
import edu.shopsys.util.RandomCodeUtils;

@WebServlet("/view_user/SearchController")
public class SearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	    doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String method = request.getParameter("method");
		System.out.println(method);
		switch (method) {
		case "keyword":
			searchKeyword(request, response);
			break;
		case "classSearch":
		    classSearch(request, response);
		    break;
		case "detailSearch":
		    detailSearch(request, response);
		    break;
		case "carSearch":
		    carSearch(request, response);
		    break;
		case "deleteCarGoods":
		    deleteCarGoods(request, response);
		    break;
		default:
			break;
		}
	}
	//关键字查询
	public void searchKeyword(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	    //获取输入框中的关键字
		String keyword = request.getParameter("keyword");
		request.setAttribute("keyword", keyword);
		//将搜索框中的关键字发到页面
		request.getRequestDispatcher("search.jsp").forward(request, response);
	}
	//类别查询
	public void classSearch(HttpServletRequest request, HttpServletResponse response) {
        String type = request.getParameter("type");
        request.setAttribute("type", type);
        PrintWriter out = null;
        try {
            out = response.getWriter();
            out.write(type);
            out.flush();
            out.close();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
	//商品具体信息
	public void detailSearch(HttpServletRequest request, HttpServletResponse response) {
	    String goods_id = request.getParameter("goods");
	    UserService service = new UserServiceImpl();
	    Goods goods = service.queryById(goods_id);
	    request.setAttribute("goods", goods);
	    try {
            request.getRequestDispatcher("product-details.jsp").forward(request, response);
//            request.getRequestDispatcher("pay.jsp").forward(request, response);
        } catch (ServletException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
	
	//购物车
	public void carSearch(HttpServletRequest request, HttpServletResponse response) {
	    UserService service = new UserServiceImpl();//新建service对象
	    PrintWriter out = null;
	    SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");//设置日期格式
	    String size = (String)request.getParameter("size");//获取尺码
	    String color = (String)request.getParameter("color");//获取颜色
	    String[] goodsId = request.getParameter("goodsId").split(":");//获取商品的ID
	    int amount = Integer.parseInt(request.getParameter("amount"));//获取商品数量
	    String carId = RandomCodeUtils.getRandomCharAndNumr(5)+df.format(new Date());//随机生成一个购物车ID
	    String userId = (String)request.getSession().getAttribute("userId");//获取用户id
	    if (null != userId) {
	        service.addToShopCar(carId, goodsId[1], amount, userId, color,size);
	        try {
	            out = response.getWriter();
	            out.write(userId);
	            out.flush();
	            out.close();
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
	}
	
	//删除购物车中商品
	public void deleteCarGoods(HttpServletRequest request, HttpServletResponse response) {
        UserService service = new UserServiceImpl();
        String carId = request.getParameter("carId");
        service.deleteCarGoods(carId);
    }

}
