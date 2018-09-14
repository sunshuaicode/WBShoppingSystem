<%@page import="org.eclipse.jdt.internal.compiler.ast.ThisReference"%>
<%@page import="java.util.*"%>
<%@page import="edu.shopsys.service.impl.UserServiceImpl"%>
<%@page import="edu.shopsys.service.UserService"%>
<%@page import="edu.shopsys.model.Goods"%>
<%@page import="edu.shopsys.model.User" %>
<%@page import="com.alibaba.fastjson.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <%
  User u = new User();
  u = (User)request.getSession().getAttribute("user");
  UserService service = new UserServiceImpl();
  String type = (String)request.getParameter("type");
  String keyword = (String)request.getAttribute("keyword");
  List<Goods> list = null;
  if(null != keyword){
      list = service.queryByKeyword(keyword);
  }else if(null != type){
      list = service.queryByclass(type);
  }
  %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="author" content="order by dede58.com"/>
<meta name="description" content="飞机模型网上购物麦路客,以飞机模型玩具为主,遥控飞机模型,直升飞机模型,3d飞机模型,女装,日韩女装,韩版女装,时尚女装,男装,奢侈品,运动,休闲,内衣,箱包,鞋,丝袜等,货到付款." />
<meta name="keywords" content="飞机模型,遥控飞机模型,直升飞机模型,3d飞机模型,模型玩具,网上购物,网上购物网站,网上购物中心,女装,日韩女装,韩版女装,时尚女装,男装,奢侈品,运动,休闲,内衣,文胸,箱包,鞋子,丝袜,货到付款" />
<title>搜索结果</title>
<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
<link href="css/base.css" rel="stylesheet" type="text/css" />
<link href="css/index.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.2.6.pack.js"></script>
<script type="text/javascript" src="js/public.js"></script>
</head>
<body>
<h1 class="descriptionhide">飞机模型,遥控飞机模型,直升飞机模型,3d飞机模型,模型玩具,网上购物,网上购物网站,网上购物中心,女装,日韩女装,韩版女装,时尚女装,男装,奢侈品,运动,休闲,内衣,文胸,箱包,鞋子,丝袜,货到付款</h1>
<div class="side_con">
	<div class="l_m">
		<div class="f_l l_m_l">
		<%
		   if(null != u){%>
		       亲爱的<span><%=u.getUser_name() %></span>您好，欢迎来麦路客商城！ <a href="../Login?method=delectUser">[注销]</a>
		   <%}else{%>
		       您好，欢迎来麦路客商城！<a href="login.jsp" class="huise">[登录]</a><a href="register.jsp" class="huise">[免费注册]</a>
		   <%}
		%>
		</div><!--l_m_l end-->
		<div class="f_r l_m_r">
			<ul class="clearfix">
				<li class="collect"><a onclick="bookmark();" href="javascript:void(0);">加入收藏</a></li>
				<li><a href="index.jsp">帮助中心</a></li>
				<li><a href="my-order.jsp" class="yellow">我的订单</a></li>
				<li class="my-mesaer">
					<a href="my-mesaer.jsp">我的麦路客<span class="arrow"></span></a>
					<ul id="my-list">
						<li><a href="my-order.jsp">我的订单</a></li>
						<li><a href="my-faq.jsp">我的问答</a></li>
						<li><a href="my-favorites.jsp">我的收藏</a></li>
						<li><a href="my-points.jsp">我的积分</a></li>
					</ul>
				</li>
			</ul>
		</div><!--l_m_r end-->
	</div><!--l_m end-->
</div><!--side_con end-->
<div class="header container">
	<div class="l_s">
		<a title="网上购物麦路客商城" class="f_l logo" href="index.jsp"><img src="images/logo.gif" alt="网上购物麦路客商城" width="152" height="71" /></a>
        
        <!-- 搜索框 -->
		<div class="f_l l_s_l">
			<form method="post" action="SearchController?method=keyword" id="ui_element">
				<div class="f_l input_l"><input type="text" name="keyword" id="birds" class="sb_input text" value="" autocomplete="off" onkeydown="javascript:if(event.keyCode==13) search('key');"><ul id="tieslide"></ul></div>
				<div class="f_l input_r"><button type="submit" onclick="search('key');return false;">搜商品</button></div>
			    <span id="searchTip" style="color:#FD544E;"><%if(null!=keyword||null!=type){if(list.size()<=0) {out.println("商品未上架");}else{out.println("");}}else{out.println("");}%></span>
			</form>
			
		</div><!--l_s_l end-->
		<ul class="f_r l_s_r">
			<li class="icon_01"><a title="货到付款" href="help/payment.html">货到付款</a></li><li class="icon_02"><a title="支付宝支付" href="help/payment.html">支付宝支付</a></li><li class="icon_03"><a title="7天退换" href="help/policy.html">7天退换</a></li><li class="icon_04"><a title="提供发票" href="help/invoice-system.html">提供发票</a></li>
		</ul><!--l_s_r end-->
	</div><!--l_s end-->
	<div class="site-nav">
		<div class="floor_nav">
			<ul class="floors">
				<li id="floor_0"><a class="track" name="index" title="首页" href="index.jsp">首页</a></li>
				<li id="floor_1"><a class="track" name="airplane" title="飞机模型" href="airplane.jsp">飞机模型</a></li>
				<li id="floor_2"><a class="track" name="woman" title="女装" href="woman.jsp">女装</a></li>
				<li id="floor_3"><a class="track" name="man" title="男装" href="man.jsp">男装</a></li>
				<li id="floor_4"><a class="track" name="shoes" title="鞋子" href="#">鞋子</a></li>
				<li id="floor_5"><a class="track" name="bags" title="箱包" href="bags.jsp">箱包</a></li>
				<li id="floor_6"><a class="track" name="discount" title="折扣积分" href="discount.jsp">折扣积分</a></li>
				<li id="floor_7"><a class="track" name="sort" title="所有分类" href="sort.jsp">所有分类</a></li>
			</ul>
			<div class="buy_cart">
				<a class="gocart" href="cart.jsp">购物车</a>
				<a class="gopay" href="not-address.jsp">去结账</a>
			</div>
		</div><!--floor_nav end-->
		<div class="sub-floor-menus">
			<div class="menu" id="sub_floor_1">
				<div class="meun_sort">
					<div class="sort clearfix">
						<ul class="f_l sort_nav">
							<li>
								<dl>
									<dt><a href="#">垂直 ></a></dt>
									<dd><span><a href="#">直升机</a></span></dd>
								</dl>
							</li>
							<li>
								<dl>
									<dt><a href="#">滑跑 ></a></dt>
									<dd><span><a href="#">滑翔机</a></span><span><a href="#">三角翼</a></span><span><a href="#">仿真机</a></span><span><a href="#">战斗机</a></span><span><a href="#">旋翼机</a></span></dd>
								</dl>
							</li>
						</ul><!--sort_nav end-->
						<div class="f_l sort_pp">
							<h3>热门品牌</h3>
							<ul>
								<li><a href="#">JACKJONES</a><a href="#">九牧王</a><a href="#">七匹狼</a><a href="#">马克华菲</a><a href="#">稻草人</a><a href="#">TONYJEANS</a><a href="#">凡诺</a></li>
							</ul>
							<div class="blank10"></div>
							<h3>新品推荐</h3>
							<p align="center"><a href="#"><img src="images/polo.jpg" width="135" height="137" alt="美素活悦弹力系列" /></a></p>
						</div><!--sort_pp end-->
					</div><!--sort end-->
				</div><!--meun_sort end-->		
			</div><!--sub_floor_1 end-->
			<div class="menu" id="sub_floor_2">
				<div class="meun_sort">
					<div class="sort clearfix">
						<ul class="f_l sort_nav">
							<li>
								<dl>
									<dt><a href="#">上装 ></a></dt>
									<dd><span><a href="#">T恤</a></span><span><a href="#">背心</a></span><span><a href="#">长袖</a></span><span><a href="#">衬衫</a></span><span><a href="#">棉毛衫</a></span><span><a href="#">雪纺纱</a></span><span><a href="#">吊带衫</a></span><span><a href="#">针织衫</a></span><span><a href="#">毛衣</a></span><span><a href="#">风衣</a></span><span><a href="#">马甲</a></span><span><a href="#">大衣</a></span><span><a href="#">羽绒服</a></span></dd>
								</dl>
							</li>
							<li>
								<dl>
									<dt><a href="#">下装 ></a></dt>
									<dd><span><a href="#">牛仔裤</a></span><span><a href="#">休闲裤</a></span><span><a href="#">短裤</a></span><span><a href="#">运动裤</a></span><span><a href="#">裤子</a></span></dd>
								</dl>
							</li>
							<li>
								<dl>
									<dt><a href="#">裙子 ></a></dt>
									<dd><span><a href="#">连衣裙</a></span><span><a href="#">半身裙</a></span></dd>
								</dl>
							</li>
							<li>
								<dl>
									<dt><a href="#">袜子 ></a></dt>
									<dd><span><a href="#">丝袜</a></span><span><a href="#">短袜</a></span><span><a href="#">长袜</a></span></dd>
								</dl>
							</li>
						</ul><!--sort_nav end-->
						<div class="f_l sort_pp">
							<h3>热门品牌</h3>
							<ul>
								<li><a href="#">JACKJONES</a><a href="#">九牧王</a><a href="#">七匹狼</a><a href="#">马克华菲</a><a href="#">稻草人</a><a href="#">TONYJEANS</a><a href="#">凡诺</a></li>
							</ul>
							<div class="blank10"></div>
							<h3>新品推荐</h3>
							<p align="center"><a href="#"><img src="images/polo.jpg" width="135" height="137" alt="美素活悦弹力系列" /></a></p>
						</div><!--sort_pp end-->
					</div><!--sort end-->
				</div><!--meun_sort end-->	
			</div><!--sub_floor_2 end-->
			<div class="menu" id="sub_floor_3">
				<div class="meun_sort">
					<div class="sort clearfix">
						<ul class="f_l sort_nav">
							<li>
								<dl>
									<dt><a href="#">上装 ></a></dt>
									<dd><span><a href="#">T恤</a></span><span><a href="#">背心</a></span><span><a href="#">长袖</a></span><span><a href="#">衬衫</a></span><span><a href="#">棉毛衫</a></span><span><a href="#">针织衫</a></span><span><a href="#">毛衣</a></span><span><a href="#">马甲</a></span><span><a href="#">大衣</a></span><span><a href="#">羽绒服</a></span></dd>
								</dl>
							</li>
							<li>
								<dl>
									<dt><a href="#">下装 ></a></dt>
									<dd><span><a href="#">牛仔裤</a></span><span><a href="#">休闲裤</a></span><span><a href="#">短裤</a></span><span><a href="#">运动裤</a></span><span><a href="#">裤子</a></span></dd>
								</dl>
							</li>
							<li>
								<dl>
									<dt><a href="#">袜子 ></a></dt>
									<dd><span><a href="#">短袜</a></span><span><a href="#">长袜</a></span></dd>
								</dl>
							</li>
						</ul><!--sort_nav end-->
						<div class="f_l sort_pp">
							<h3>热门品牌</h3>
							<ul>
								<li><a href="#">JACKJONES</a><a href="#">九牧王</a><a href="#">七匹狼</a><a href="#">马克华菲</a><a href="#">稻草人</a><a href="#">TONYJEANS</a><a href="#">凡诺</a></li>
							</ul>
							<div class="blank10"></div>
							<h3>新品推荐</h3>
							<p align="center"><a href="#"><img src="images/polo.jpg" width="135" height="137" alt="美素活悦弹力系列" /></a></p>
						</div><!--sort_pp end-->
					</div><!--sort end-->
				</div><!--meun_sort end-->	
			</div><!--sub_floor_3 end-->
			<div class="menu" id="sub_floor_4">
				<div class="meun_sort">
					<div class="sort clearfix">
						<ul class="f_l sort_nav">
							<li>
								<dl>
									<dt><a href="#">男鞋 ></a></dt>
									<dd><span><a href="#">凉鞋</a></span><span><a href="#">单鞋</a></span><span><a href="#">家居鞋</a></span><span><a href="#">休闲鞋</a></span><span><a href="#">运动鞋</a></span></dd>
								</dl>
							</li>
							<li>
								<dl>
									<dt><a href="#">女鞋 ></a></dt>
									<dd><span><a href="#">凉鞋</a></span><span><a href="#">单鞋</a></span><span><a href="#">高跟鞋</a></span><span><a href="#">靴子</a></span><span><a href="#">家居鞋</a></span><span><a href="#">休闲鞋</a></span><span><a href="#">运动鞋</a></span></dd>
								</dl>
							</li>
						</ul><!--sort_nav end-->
						<div class="f_l sort_pp">
							<h3>热门品牌</h3>
							<ul>
								<li><a href="#">JACKJONES</a><a href="#">九牧王</a><a href="#">七匹狼</a><a href="#">马克华菲</a><a href="#">稻草人</a><a href="#">TONYJEANS</a><a href="#">凡诺</a></li>
							</ul>
							<div class="blank10"></div>
							<h3>新品推荐</h3>
							<p align="center"><a href="#"><img src="images/polo.jpg" width="135" height="137" alt="美素活悦弹力系列" /></a></p>
						</div><!--sort_pp end-->
					</div><!--sort end-->
				</div><!--meun_sort end-->	
			</div><!--sub_floor_4 end-->
			<div class="menu" id="sub_floor_5">
				<div class="meun_sort">
					<div class="sort clearfix">
						<ul class="f_l sort_nav">
							<li>
								<dl>
									<dt><a href="#">女包 ></a></dt>
									<dd><span><a href="#">单肩包</a></span><span><a href="#">斜挎包</a></span><span><a href="#">手提包</a></span><span><a href="#">钱包</a></span><span><a href="#">手包</a></span><span><a href="#">胸包</a></span><span><a href="#">手提/斜肩两用包</a></span></dd>
								</dl>
							</li>
							<li>
								<dl>
									<dt><a href="#">男包 ></a></dt>
									<dd><span><a href="#">公文包</a></span><span><a href="#">斜肩包</a></span><span><a href="#">钱包</a></span><span><a href="#">手包</a></span><span><a href="#">手提/斜肩两用包</a></span></dd>
								</dl>
							</li>
							<li>
								<dl>
									<dt><a href="#">电脑包 ></a></dt>
									<dd><span><a href="#">双肩电脑包</a></span><span><a href="#">手提电脑包</a></span><span><a href="#">相机包</a></span></dd>
								</dl>
							</li>
							<li>
								<dl>
									<dt><a href="#">旅行包 ></a></dt>
									<dd><span><a href="#">拉杆箱</a></span><span><a href="#">旅行包</a></span><span><a href="#">双肩包</a></span><span><a href="#">书包</a></span></dd>
								</dl>
							</li>
						</ul><!--sort_nav end-->
						<div class="f_l sort_pp">
							<h3>热门品牌</h3>
							<ul>
								<li><a href="#">JACKJONES</a><a href="#">九牧王</a><a href="#">七匹狼</a><a href="#">马克华菲</a><a href="#">稻草人</a><a href="#">TONYJEANS</a><a href="#">凡诺</a></li>
							</ul>
							<div class="blank10"></div>
							<h3>新品推荐</h3>
							<p align="center"><a href="#"><img src="images/polo.jpg" width="135" height="137" alt="美素活悦弹力系列" /></a></p>
						</div><!--sort_pp end-->
					</div><!--sort end-->
				</div><!--meun_sort end-->	
			</div><!--sub_floor_5 end-->
		</div><!--sub_floor_menus end-->
	</div><!--site-nav end-->
</div><!--header end-->

<div class="content container">
	<div class="blank10"></div>
	<div class="clear mb-10"></div>

	<div class="f_l sort_brand_l">
		<div class="w_box">
			<div class="w_box_t">
				<div class="f_l w_box_t_l"></div>
				<h2 class="f_l red">商品分类</h2>
				<div class="f_r w_box_t_r"></div>
				<div class="f_r more"><a href="#">查看所有分类>></a></div>
			</div><!--w_box_t end-->
			<div class="w_box_m cate_list">
				<ul>
					<li>
						<dl>
							<dt><a href="women.jsp">女装<span class="icon_01"></span></a></dt>
							<dd id="womenType"><a href="#">T恤</a><a href="#">卫衣</a><a href="#">衬衫</a><a href="#">雪纺衫</a><a href="#">背心</a><a href="#">吊带衫</a><a href="#">针织衫毛衣</a><a href="#">风衣</a><a href="#">大衣</a><a href="#">羽绒服</a><a href="#">内衣</a><a href="#">家居服</a>
							</dd>
						</dl>
					</li>
					<li>
						<dl>
							<dt><a href="man.jsp">男装<span class="icon_02"></span></a></dt>
							<dd id="manType"><a href="#">T恤</a><a href="#">衬衫</a><a href="#">外套</a><a href="#">针织衫</a><a href="#">毛衣</a><a href="#">大衣</a><a href="#">羽绒服</a><a href="#">马夹</a><a href="#">裤子</a><a href="#">内衣</a><a href="#">家居服</a>
							</dd>
						</dl>
					</li>
					<li>
						<dl>
							<dt><a href="#">内衣<span class="icon_03"></span></a></dt>
							<dd id="neiyiType"><a href="#">袜子</a><a href="#">睡衣</a><a href="#">泳装</a><a href="#">文胸</a><a href="#">内裤</a><a href="#">保暖内衣</a><a href="#">塑身内衣</a><a href="#">情趣内衣</a>
							</dd>
						</dl>
					</li>
					<li>
						<dl>
							<dt><a href="shoes.jsp">鞋子<span class="icon_04"></span></a></dt>
							<dd id="shoesType"><a href="#">凉鞋</a><a href="#">单鞋</a><a href="#">靴子</a><a href="#">家居鞋</a><a href="#">休闲鞋</a><a href="#">运动鞋</a><a href="#">电工鞋</a>
							</dd>
						</dl>
					</li>
					<li>
						<dl class="last">
							<dt><a href="#">配饰<span class="icon_05"></span></a></dt>
							<dd id="peishiType"><a href="#">太阳镜</a><a href="#">丝巾</a><a href="#">披肩</a><a href="#">帽子</a><a href="#">手套</a><a href="#">皮带</a><a href="#">吊坠</a><a href="#">项链</a><a href="#">发饰</a><a href="#">胸针</a><a href="#">戒指</a>
							</dd>
						</dl>
					</li>
				</ul>
			</div><!--w_box_m end-->
			<div class="w_box_b">
				<div class="f_l w_box_b_l"></div>
				<div class="f_r w_box_b_r"></div>
			</div><!--w_box_b end-->
		</div><!--w_box end-->
	</div><!--sort_brand_l end-->
	
	<div class="f_r rank">
		<ul class="tabcon">
			<li class="current">
				<div class="p-name"><span class="f_l num">1</span><a href="#">新款短袖衬衫 自选两件168元</a></div>
				<div class="p-img"><a href="#" target="_blank"><img title="新款短袖衬衫 自选两件168元" src="images/spacer.gif" lazyload="images/women/top/but_home_women_list-2-0315-2.jpg" width="235" height="118" /></a></div>
			</li>
			<li>
				<div class="p-name"><span class="f_l num">2</span><a href="#">女款衬衫 特惠价88元起</a></div>
				<div class="p-img"><a href="#" target="_blank"><img title="女款衬衫 特惠价88元起" src2="images/women/top/but_home_women_list-2-0315.jpg" width="235" height="118" /></a></div>
			</li>
			<li>
				<div class="p-name"><span class="f_l num">3</span><a href="#">针织衫+牛津纺衬衫两件168元</a></div>
				<div class="p-img"><a href="#" target="_blank"><img title="针织衫+牛津纺衬衫两件168元" src2="images/women/top/but_home_women_list-3-0312.jpg" width="235" height="118" /></a></div>
			</li>
			<li>
				<div class="p-name"><span class="f_l num">4</span><a href="#">情侣衬衫两件仅售128元起</a></div>
				<div class="p-img"><a href="#" target="_blank"><img title="情侣衬衫两件仅售128元起" src2="images/women/top/but_home_women_list-4-0301.jpg" width="235" height="118" /></a></div>
			</li>
		</ul>
	</div><!--rank end-->
	
	<div class="clear mb-10"></div>

	<div class="subject subimg-01">
		<h2>搜索结果</h2>
		<a href="#">棉衣</a><span>|</span><a href="#">大衣</a><span>|</span><a href="#">毛衣</a><span>|</span><a href="#">衬衫</a><span>|</span><a href="#">帽子 </a><span>|</span><a href="#">女包</a><span>|</span><a href="#">男包</a><span>|</span><a href="#">流行配饰</a><span>|</span><a href="#">T恤</a><span>|</span><a href="#">夹克</a>
	</div><!--subject end-->
	<div class="module mb-10 clearfix" id="searchbody">
		<div class="f_l modpic news-modpic bigTarget" style="width: 100%;">
		
		  <%
		  if(null != list){
			  for(int i=0;i<list.size();i++){
			  %>
				  <ul>
					<li class="picHover" pid="41815">
                        <!-- SearchController?method=detail&list=11 -->
						<a href="#"><img class="load_img" src="images/spacer.gif" lazyload="<%=list.get(i).getGoods_image() %>" width="180" height="180" alt="美腿配丝袜" /></a>
						<div class="p-name">
						  <a rel="nofollow external" href="SearchController?method=detailSearch&goods=<%=list.get(i).getGoods_id()%>">
						     <%=list.get(i).getGoods_name() %>
						  </a>
						</div>
						<div class="p-price"><del title="市场价">¥<%=list.get(i).getGoods_price()+list.get(i).getGoods_price()*0.3%>元</del><strong title="麦路客价">&yen;<%=list.get(i).getGoods_price() %>元</strong></div>
					</li>
				  </ul>
			  <%}
		  }else{
		      
		  }%>
		  
			
		</div><!--modpic end-->			
	</div><!--module end-->
	<div class="clear mb-10"></div>
	
	<div class="f_r e-zine">
		<h2>免费索取产品目录</h2>
		<p>我们将最新的产品信息发到您的Email</p>
		<form method="post" action="" class="e-zine-con">
			<div class="input-text"><input type="text" name="" value="输入您的电子邮箱地址" id="emailaddress" /></div><button type="submit">订阅</button>
		</form>
	</div>
	
	<div class="f_r weibo">
		<a class="tengxun" href="#" target="_blank">关注麦路客腾讯微博</a>
		<a class="wangyi" href="#" target="_blank">关注麦路客网易微博</a>
		<a class="souhu" href="#" target="_blank">关注麦路客搜狐微博</a>
		<a class="xinlang" href="#" target="_blank">关注麦路客新浪微博</a>
	</div>
	
	<div class="clear mb-10"></div>
	
	<div style="display:none;" class="ico" id="imgICO"></div>
	<div style="position:absolute;display:none;" id="detail"></div>
</div><!--content end-->

<div class="footer container">
	<div class="service">
		<div class="cat_bg"></div>
		<div class="help_list clearfix">
			<dl>
				<dt>新手指南</dt>
				<dd><a href="help/index.jsp" target="_blank"><span>购物流程</span></a></dd>
				<dd><a href="help/account.html" target="_blank"><span>我的麦路客</span></a></dd>
				<dd><a href="help/common.html" target="_blank"><span>常见问题</span></a></dd>
				<dd><a href="register.jsp" target="_blank"><span>注册用户</span></a></dd>
				<dd><a href="forgot-password.jsp" target="_blank"><span>找回密码</span></a></dd>
			</dl>
			<dl>
				<dt>订单问题</dt>
				<dd><a href="help/order-status.html" target="_blank">订单状态</a></dd>
				<dd><a href="help/cancel-order.html" target="_blank">取消订单</a></dd>   
				<dd><a href="help/not-order.html" target="_blank">未达订单</a></dd> 
			</dl>
			<dl>
				<dt>会员积分</dt>
				<dd><a href="help/integral-rules.html" target="_blank">积分规则</a></dd>
				<dd><a href="help/integral.html" target="_blank">积分问题</a></dd> 
				<dd><a href="help/exchange-integral.html" target="_blank">积分兑换</a></dd>   
			</dl>
			<dl>
				<dt>如何付款/退款</dt>
				<dd><a href="help/payment.html" target="_blank">支付方式</a></dd>
				<dd><a href="help/wait-pay.jsp" target="_blank">支付等待</a></dd>
				<dd><a href="help/pay-issue.html" target="_blank">支付问题</a></dd>
				<dd><a href="help/refund.html" target="_blank">办理退款</a></dd>
				<dd><a href="help/invoice-system.html" target="_blank">发票制度</a></dd>        
			</dl>
			<dl>
				<dt>配送和收费</dt>
				<dd><a href="help/time-range.html" target="_blank">配送时间</a></dd> 
				<dd><a href="help/delivery-time.html" target="_blank">送达时间</a></dd> 
				<dd><a href="help/inspection-sign.html" target="_blank">验货与签收</a></dd> 
				<dd><a href="help/express.html" target="_blank">快递配送和收费</a></dd> 
				<dd><a href="help/ems.html" target="_blank">EMS配送和收费</a></dd>      
			</dl>
			<dl>
				<dt>售后服务</dt>
				<dd><a href="help/policy.html" target="_blank">退换货政策</a></dd>
				<dd><a href="help/apply-goods.html" target="_blank">如何办理退换货</a></dd>     
			</dl>
		</div>
	</div><!--service end-->
	<div class="copyright">
		<a href="help/about.html" target="_blank">关于麦路客</a><span>|</span><a href="help/contact.html" target="_blank">联系麦路客</a><span>|</span><a href="help/job.html" target="_blank">加入麦路客</a><span>|</span><a href="sort.jsp" target="_blank">网站地图</a><span>|</span><a href="help/complainting.html" target="_blank">投诉与建议</a><span>|</span><a href="help/links.html" target="_blank">友情链接</a><br />
		Copyright&nbsp;&nbsp;©&nbsp;&nbsp;2009-2011&nbsp;&nbsp;<a title="麦路客商城" href="http://www.mailuke.com/">www.mailuke.com</a>&nbsp;&nbsp;麦路客商城版权所有<span>|</span><a href="http://www.miibeian.gov.cn/" target="_blank">沪ICP备10031526号</a><br />
		<a href="#" target="_blank"><img src="images/beian.gif" width="128" height="47" alt="经营性网站备案中心" /></a><a href="#" target="_blank"><img src="images/trustA.gif" width="119" height="47" alt="A级-信用企业" /></a><a href="#" target="_blank"><img src="images/alipay.gif" width="123" height="40" alt="支付宝-特约商家" /></a>
	</div><!--copyright end-->
</div><!--footer end-->

<!-- plugin -->
<script type="text/javascript" src="js/lib.js"></script>
<!-- index -->
<script type="text/javascript" src="js/index.js"></script>
<!-- online -->
<script type="text/javascript" src="js/online.js"></script> 
</body>
</html>