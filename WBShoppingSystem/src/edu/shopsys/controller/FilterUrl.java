//package edu.shopsys.controller;
//
//import java.io.IOException;
//import javax.servlet.Filter;
//import javax.servlet.FilterChain;
//import javax.servlet.FilterConfig;
//import javax.servlet.ServletException;
//import javax.servlet.ServletRequest;
//import javax.servlet.ServletResponse;
//import javax.servlet.annotation.WebFilter;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
///**
// * Servlet Filter implementation class UrlFilter
// */
//@WebFilter(filterName = "UrlFilter", urlPatterns = "/*")
//public class FilterUrl implements Filter {
//
//
//    public FilterUrl() {
//        // TODO Auto-generated constructor stub
//    }
//
//
//    public void destroy() {
//
//    }
//
//
//    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
//            throws IOException, ServletException {
//        // 1.强制转换
//        HttpServletRequest request = (HttpServletRequest) req;
//        HttpServletResponse response = (HttpServletResponse) resp;
//        HttpSession session=request.getSession(); 
//        // 获取请求的uri
//        String uri = request.getRequestURI();
//        String contextPath = request.getContextPath();
//        String path = uri.substring(contextPath.length());
//        Integer login=(Integer)session.getAttribute("isLogin");
//            if(uri.indexOf("/login.jsp")>-1){//登录页面不过滤
//            arg2.doFilter(arg0, arg1);//递交给下一个过滤器
//            return;
//              }  
//                 if(login!=null){//已经登录
//            arg2.doFilter(request, response);//放行，递交给下一个过滤器
//           
//        }else{
//            response.sendRedirect("login.jsp");
//        }
//          System.out.println("isLogin=" + login);
////        System.out.println("uri:" + uri);
////        System.out.println("contextPath:" + contextPath);
////        System.out.println("path:" + path);
////        System.out.println("拦截请求02");
//        chain.doFilter(request, response);
////        System.out.println("拦截响应02");
//    }
//
//    /**
//     * @see Filter#init(FilterConfig)
//     */
//    public void init(FilterConfig fConfig) throws ServletException {}
//
//}
