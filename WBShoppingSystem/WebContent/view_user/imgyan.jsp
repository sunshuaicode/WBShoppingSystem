<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType = "image/jpeg" import = "java.awt.*,java.awt.image.*,java.util.*,javax.imageio.*" %>
    <%!
    //生成随机颜色值
    public Color getColor(){
    	Random ran=new Random();
    	int r=ran.nextInt(256);
    	int g=ran.nextInt(256);
    	int b=ran.nextInt(256);
    	return new Color(r,g,b);
    }
    public String getNum(){
    	int ran = (int)(Math.random()*9000)+1000;
    	return String.valueOf(ran);
    }
    %>

    <%//禁用浏览器缓存，防止验证码不及时被加载
    response.setHeader("pragma", "mo-cache");
    response.setHeader("cache-control", "no-cache");
    response.setDateHeader("expires",0);
    //设置验证码图片
    BufferedImage image = new BufferedImage(100,35,BufferedImage.TYPE_INT_RGB);
    //创建画笔对象graphics
    Graphics graphics =image.getGraphics();
    //验证码背景颜色（0，0）开始，宽100高30
    graphics.fillRect(0, 0, 100, 30);
   // 在验证码图片随机生成干扰线
   for(int i=0;i<60;i++){
	   Random random = new Random();
	   int xBegin=random.nextInt(100);
	   int yBegin=random.nextInt(30);
	   int xEnd=random.nextInt(xBegin+10);
	   int yEnd=random.nextInt(yBegin+10);
	   //设置线条颜色
	   graphics.setColor(getColor());
	   //绘制线条
	   graphics.drawLine(xBegin, yBegin, xBegin+xEnd, yBegin+yEnd);
   }
   //设置验证码的字体格式：
   graphics.setFont(new Font("serif",Font.BOLD,20));
   //字体颜色
   graphics.setColor(Color.BLUE);
   //获取四个随机数
   String checkCode = getNum();
   //在数字间加间隔
   StringBuffer sb=new StringBuffer();
   for(int i=0;i<checkCode.length();i++){
	   sb.append(checkCode.charAt(i)+"");
   }
   //从（15，20）开始绘制图片
   graphics.drawString(sb.toString(), 15, 20);
   //将验证码放入 session,
   session.setAttribute("CHECKCODE", checkCode);
   //将验证码绘制成jpe格式
   ImageIO.write(image,"jpeg" ,response.getOutputStream());
   out.clear();
   //验证码会被其他页面引用   jpeg生成后会作为<img>元素的src属性被其他页面引用
   out=pageContext.pushBody();
    %>
