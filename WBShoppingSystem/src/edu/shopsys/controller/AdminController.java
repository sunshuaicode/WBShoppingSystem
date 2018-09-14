package edu.shopsys.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;
import javax.mail.Address;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.sun.org.apache.bcel.internal.generic.NEW;
import edu.shopsys.model.Goods;
import edu.shopsys.service.AdminService;
import edu.shopsys.service.impl.AdminServiceImpl;

/**
 * Servlet implementation class AdminController
 */
@WebServlet("/AdminController")
public class AdminController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request,response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("doPostAdminStart!!!!!");
        String method = request.getParameter("method");
        System.out.println("method="+method);
        if ("login".equals(method)) {
           login(request,response);
        }else if("transaction".equals(method)) {
           transaction(request, response);
        }else if("add".equals(method)){
           add(request,response);
        }else if ("delete".equals(method)) {
           delete(request, response);
        }else if ("update".equals(method)) {
          update(request, response);
        }else if ("home".equals(method)) {
          home(request, response);
        }else if ("product".equals(method)) {
          product(request, response);
        }else if ("goods".equals(method)) {
          goods(request, response);
        }
        
    }
    protected void login(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
      System.out.println("loginStart!!!!");
      String username=null;
      String password=null;
      username=request.getParameter("username");
      password=request.getParameter("password");
      String checkCodeClient=null;
      checkCodeClient=request.getParameter("checkcode");
      String checkcodeServer=(String)(request.getSession().getAttribute("CHECKCODE"));
      System.out.println("checkCodeClient="+checkCodeClient);
      System.out.println("checkcodeServer="+checkcodeServer);
      System.out.println("username="+username);
      System.out.println("password="+password);
      boolean result=checkCodeClient.equals(checkcodeServer);
      System.out.println("result="+result);
      //先判断验证码是否正确
      if(result){
        AdminService asc=new AdminServiceImpl();
        boolean adc=asc.login(username, password);
        System.out.println("账号密码是否正确？"+adc);
        Object a=request.getSession().getAttribute("isLogin");
        System.out.println("islogin="+a);
        if(adc) {
           //密码和账号都正确
          PrintWriter pw = response.getWriter();
          pw.print(1);
        }
        else if(username!=null||password!=null){
          //密码或者账号错误
          PrintWriter pw = response.getWriter();
          pw.print(-1);
        }
      }else if(checkCodeClient!=null&&result==false){
        //验证码错误
        System.out.println("输入的验证码错误！！！");
        PrintWriter pw=response.getWriter();
        pw.print(0);
        }
      
    }
    protected void add(HttpServletRequest request, HttpServletResponse response) {
      System.out.println("addStart!!!!");
      
    }
    protected void delete(HttpServletRequest request, HttpServletResponse response) throws IOException {
      System.out.println("deleteStart!!!!");
      String goodsId=request.getParameter("goodsId");
      AdminService adce = new AdminServiceImpl();
     boolean a=adce.dedelteGoods(goodsId);
     PrintWriter pw=response.getWriter();
     pw.print(a);
     System.out.println("删除是否成功"+a);
    }
    protected void update(HttpServletRequest request, HttpServletResponse response) throws IOException {
      System.out.println("updateStart!!!!");
      String updataGood=request.getParameter("goodsUp");
      AdminService adce = new AdminServiceImpl();
      System.out.println(updataGood);
      boolean up=adce.modifyGoodsInfo(updataGood);
      PrintWriter pw=response.getWriter();
      pw.print(up);
      System.out.println(up);
    }
    
    protected void transaction(HttpServletRequest request, HttpServletResponse response) throws IOException {
    	System.out.println("\n"+"订单信息查询");
    	response.setContentType("application/json;Charset=utf-8");
    	response.setCharacterEncoding("utf-8");
    	String sumMoney = String.valueOf(new AdminServiceImpl().sumMoney());
    	String ordermount = String.valueOf(new AdminServiceImpl().allOrderMount());
    	String finishmount = String.valueOf(new AdminServiceImpl().successOrderMount());
    	String failmount = String.valueOf(new AdminServiceImpl().failOrderMount());
    	
    	String jsonstr = "{\"sumMoney\":\""+sumMoney+"\",\"ordermount\":\""+ordermount+"\",\"finishmount\":\""+finishmount+"\",\"failmount\":\""+failmount+"\"}";
    	PrintWriter pw=response.getWriter();
    	
        pw.write(jsonstr);
        System.out.println(jsonstr);
    }
    protected void home(HttpServletRequest request, HttpServletResponse response) throws IOException {
      System.out.println("homeStart!!!!");
      String sumMoney = String.valueOf(new AdminServiceImpl().sumMoney());
      String countuser=String.valueOf(new AdminServiceImpl().countsUser());
      String allOrder=String.valueOf(new AdminServiceImpl().allOrderMount());
      //商品统计信息
      String out=String.valueOf(new AdminServiceImpl().soldOut());
      String putaway=String.valueOf(new AdminServiceImpl().putaway());
      String sum=String.valueOf(new AdminServiceImpl().sumAmount());
      //订单统计信息
      String paid=String.valueOf(new AdminServiceImpl().accountPaid());
      String deliver=String.valueOf(new AdminServiceImpl().pronoun());
      String settle=String.valueOf(new AdminServiceImpl().settlement());
      String success=String.valueOf(new AdminServiceImpl().successOrderMount());
      
      String jsonstr = "{\"sumMoney\":\""+sumMoney+"\",\"countuser\":\""+countuser+"\",\"allOrder\":\""+allOrder+"\",\"out\":\""+out+"\","
          + "\"putaway\":\""+putaway+"\",\"sum\":\""+sum+"\",\"paid\":\""+paid+"\",\"deliver\":\""+deliver+"\",\"settle\":\""+settle+"\","
              + "\"success\":\""+success+"\"}";
      PrintWriter pw=response.getWriter();
      
      pw.write(jsonstr);
      System.out.println(jsonstr);
    }
    protected void product(HttpServletRequest request, HttpServletResponse response) throws IOException {
      System.out.println("productStart!!!!");
      AdminService adce = new AdminServiceImpl();
      List<Goods> list=new ArrayList();
      list=adce.queryGoods();
      request.getSession().setAttribute("goods", list);
      String sum=String.valueOf(new AdminServiceImpl().sumAmount());
      request.getSession().setAttribute("sum", sum);
     /* String jsonstr = "{\"sum\":\""+sum+"\"}";
      PrintWriter pw=response.getWriter();
      
      pw.write(jsonstr);*/
      System.out.println("sum="+sum);
      System.out.println(list);
    }
    protected void goods(HttpServletRequest request, HttpServletResponse response) {
      System.out.println("goodsStart!!!!");
      AdminService adce = new AdminServiceImpl();
      List<Goods> list=new ArrayList();
      String Goodname=request.getParameter("goodsname");
      System.out.println("Goodname="+Goodname);
      list=adce.queryGoods(Goodname);
      request.getSession().setAttribute("goods", list);
      System.out.println(list);
    }
        
}
