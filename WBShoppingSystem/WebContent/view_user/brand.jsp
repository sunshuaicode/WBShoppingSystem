<%@page import="java.util.*"%>
<%@page import="edu.shopsys.model.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%
  User u = new User();
  u = (User)request.getSession().getAttribute("user");
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="author" content="order by dede58.com"/>
<title>麦路客商城-中国专业的网上销售女装、男装、童装、鞋子、配饰购物商城</title>
<meta name="description" content="麦路客商城-专业的网上购物服装商城，主要在线销售男装、女装、童装、鞋、配饰、短袖、T恤、背心、内衣、毛衣、衬衫、针织衫、羊毛衫、卫衣、外套、羽绒服、休闲裤、牛仔裤、袜子等让您随时享受舒心惬意的网购之旅，同时为您提供最新的时尚潮流资讯，为每一位用户提供最新时尚潮流的折扣商品，天天低价、支持货到付款、7天无理由退换货。" />
<meta name="keywords" content="麦路客商城,男装,女装,童装,鞋,家居,配饰,衬衫,衬衣,长袖衬衫,短袖衬衫,全棉,纯棉,百分百棉,100%棉,全棉衬衫,纯棉衬衫,全棉衬衣,纯棉衬衣,免烫,免熨,免烫衬衫,免熨衬衫,免烫衬衣,领尖扣,直领,T恤,,棉线衫,卫衣,外套,西服,休闲西服,毛衣,背心,毛背心,裤子,长裤,休闲裤,牛仔裤,短裤,鞋,凉鞋,皮鞋,板鞋,商务皮鞋,休闲皮鞋,内衣,内裤,秋衣,秋裤,三角裤,平角裤,领带,袜子,棉袜,拖鞋,打折" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
<link href="css/base.css" rel="stylesheet" type="text/css" />
<link href="css/sort.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.2.6.pack.js"></script>
<script type="text/javascript" src="js/public.js"></script>
</head>
<body>
<div class="side_con">
	<div class="l_m">
		<div class="f_l l_m_l">
			<%
			   if(null != u){%>
			       <a href="#"><i class="iconfont">&#xe622;</i> <%=u.getUser_name() %></a><span>|</span>  <a href="../Login?method=delectUser">[注销]</a> <a href="index.jsp">麦路客首页</a><span>|</span><a href="my-mesaer.jsp">我的麦路客</a><span>|</span><a href="help/index.jsp">帮助中心</a>
			   <%}else{%>
			       <div class="f_r oh_dh_m">请<a href="login.jsp" class="red">登录</a>或<a href="register.jsp" class="red">注册</a><span>|</span><a href="index.jsp">麦路客首页</a><span>|</span><a href="my-mesaer.jsp">我的麦路客</a><span>|</span><a href="help/index.jsp">帮助中心</a></div>
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
		<a class="f_l logo" href="index.jsp"><img src="images/logo.gif" alt="麦路客商城" width="152" height="71" /></a>
		<!-- 搜索框 -->
		<div class="f_l l_s_l">
			<form method="post" action="SearchController?method=keyword" id="ui_element">
				<div class="f_l input_l"><input type="text" name="keyword" id="birds" class="sb_input text" value="" autocomplete="off" onkeydown="javascript:if(event.keyCode==13) search('key');"><ul id="tieslide"></ul></div>
				<div class="f_l input_r"><button type="submit" onclick="search('key');return false;">搜商品</button></div>
			</form>
		</div><!--l_s_l end-->
		<ul class="f_r l_s_r">
			<li class="icon_01"><a href="help/payment.jsp">货到付款</a></li><li class="icon_02"><a href="help/payment.jsp">支付宝支付</a></li><li class="icon_03"><a href="help/policy.jsp">7天退换</a></li><li class="icon_04"><a href="help/invoice-system.jsp">提供发票</a></li>
		</ul><!--l_s_r end-->
	</div><!--l_s end-->
	<div class="site-nav">
		<div class="floor_nav">
			<ul class="floors">
				<li id="floor_0"><a href="index.jsp" class="track">首页</a></li>
				<li id="floor_1"><a href="airplane.jsp" class="track">飞机模型</a></li>
				<li id="floor_2"><a href="women.jsp" class="track">女装</a></li>
				<li id="floor_3"><a href="man.jsp" class="track">男装</a></li>
				<li id="floor_4"><a href="shoes.jsp" class="track">鞋子</a></li>
				<li id="floor_5"><a href="bags.jsp" class="track">箱包</a></li>
				<li id="floor_6"><a href="discount.jsp" class="track">折扣积分</a></li>
				<li id="floor_7"><a href="sort.jsp" class="track">所有分类</a></li>
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
	<div class="breadcrumbs">
		<a href="index.jsp">首页</a><span>></span>所有品牌
	</div><!--breadcrumbs end-->
	<ul class="allstore">
		<li><a href="sort.jsp">所有分类</a></li>
		<li><a class="current" href="brand.jsp">所有品牌</a></li>
		<li><a href="#">所有商品</a></li>
	</ul><!--allstore end-->
	<ul class="f_l allbrand-tab">
		<li class="current"><span>女装(6)</span></li>
		<li><span>男装(6)</span></li>
		<li><span>内衣(6)</span></li>
		<li><span>鞋子(6)</span></li>
		<li><span>配饰(6)</span></li>
	</ul><!--allbrand-tab end-->
	<div class="f_l allbrand-con">
		<div class="items">
			<ul>
				<li>
					<dl>
						<dt><a class="title" href="#">欧梦达</a></dt>
						<dd class="p_pic"><i></i><a href="#"><img src="images/brand_r1_c1.gif" width="148" height="30" alt="欧梦达" /></a></dd>
						<dd>打造时尚 优雅 甜美 可爱的女性形象。</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt><a class="title" href="#">欧梦达</a></dt>
						<dd class="p_pic"><i></i><a href="#"><img src="images/brand_r1_c1.gif" width="148" height="30" alt="欧梦达" /></a></dd>
						<dd>打造时尚 优雅 甜美 可爱的女性形象。</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt><a class="title" href="#">欧梦达</a></dt>
						<dd class="p_pic"><i></i><a href="#"><img src="images/brand_r1_c1.gif" width="148" height="30" alt="欧梦达" /></a></dd>
						<dd>打造时尚 优雅 甜美 可爱的女性形象。</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt><a class="title" href="#">欧梦达</a></dt>
						<dd class="p_pic"><i></i><a href="#"><img src="images/brand_r1_c1.gif" width="148" height="30" alt="欧梦达" /></a></dd>
						<dd>打造时尚 优雅 甜美 可爱的女性形象。</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt><a class="title" href="#">欧梦达</a></dt>
						<dd class="p_pic"><i></i><a href="#"><img src="images/brand_r1_c1.gif" width="148" height="30" alt="欧梦达" /></a></dd>
						<dd>打造时尚 优雅 甜美 可爱的女性形象。</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt><a class="title" href="#">欧梦达</a></dt>
						<dd class="p_pic"><i></i><a href="#"><img src="images/brand_r1_c1.gif" width="148" height="30" alt="欧梦达" /></a></dd>
						<dd>打造时尚 优雅 甜美 可爱的女性形象。</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt><a class="title" href="#">欧梦达</a></dt>
						<dd class="p_pic"><i></i><a href="#"><img src="images/brand_r1_c1.gif" width="148" height="30" alt="欧梦达" /></a></dd>
						<dd>打造时尚 优雅 甜美 可爱的女性形象。</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt><a class="title" href="#">欧梦达</a></dt>
						<dd class="p_pic"><i></i><a href="#"><img src="images/brand_r1_c1.gif" width="148" height="30" alt="欧梦达" /></a></dd>
						<dd>打造时尚 优雅 甜美 可爱的女性形象。</dd>
					</dl>
				</li>
			</ul>
			<div class="clear"></div>
		</div><!--items end-->
		<div class="items">
			<ul>
				<li>
					<dl>
						<dt><a class="title" href="#">欧梦达</a></dt>
						<dd class="p_pic"><i></i><a href="#"><img src="images/brand_r1_c1.gif" width="148" height="30" alt="欧梦达" /></a></dd>
						<dd>打造时尚 优雅 甜美 可爱的女性形象。</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt><a class="title" href="#">欧梦达</a></dt>
						<dd class="p_pic"><i></i><a href="#"><img src="images/brand_r1_c1.gif" width="148" height="30" alt="欧梦达" /></a></dd>
						<dd>打造时尚 优雅 甜美 可爱的女性形象。</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt><a class="title" href="#">欧梦达</a></dt>
						<dd class="p_pic"><i></i><a href="#"><img src="images/brand_r1_c1.gif" width="148" height="30" alt="欧梦达" /></a></dd>
						<dd>打造时尚 优雅 甜美 可爱的女性形象。</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt><a class="title" href="#">欧梦达</a></dt>
						<dd class="p_pic"><i></i><a href="#"><img src="images/brand_r1_c1.gif" width="148" height="30" alt="欧梦达" /></a></dd>
						<dd>打造时尚 优雅 甜美 可爱的女性形象。</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt><a class="title" href="#">欧梦达</a></dt>
						<dd class="p_pic"><i></i><a href="#"><img src="images/brand_r1_c1.gif" width="148" height="30" alt="欧梦达" /></a></dd>
						<dd>打造时尚 优雅 甜美 可爱的女性形象。</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt><a class="title" href="#">欧梦达</a></dt>
						<dd class="p_pic"><i></i><a href="#"><img src="images/brand_r1_c1.gif" width="148" height="30" alt="欧梦达" /></a></dd>
						<dd>打造时尚 优雅 甜美 可爱的女性形象。</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt><a class="title" href="#">欧梦达</a></dt>
						<dd class="p_pic"><i></i><a href="#"><img src="images/brand_r1_c1.gif" width="148" height="30" alt="欧梦达" /></a></dd>
						<dd>打造时尚 优雅 甜美 可爱的女性形象。</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt><a class="title" href="#">欧梦达</a></dt>
						<dd class="p_pic"><i></i><a href="#"><img src="images/brand_r1_c1.gif" width="148" height="30" alt="欧梦达" /></a></dd>
						<dd>打造时尚 优雅 甜美 可爱的女性形象。</dd>
					</dl>
				</li>
			</ul>
			<div class="clear"></div>
		</div><!--items end-->
		<div class="items">
			<ul>
				<li>
					<dl>
						<dt><a class="title" href="#">欧梦达</a></dt>
						<dd class="p_pic"><i></i><a href="#"><img src="images/brand_r1_c1.gif" width="148" height="30" alt="欧梦达" /></a></dd>
						<dd>打造时尚 优雅 甜美 可爱的女性形象。</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt><a class="title" href="#">欧梦达</a></dt>
						<dd class="p_pic"><i></i><a href="#"><img src="images/brand_r1_c1.gif" width="148" height="30" alt="欧梦达" /></a></dd>
						<dd>打造时尚 优雅 甜美 可爱的女性形象。</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt><a class="title" href="#">欧梦达</a></dt>
						<dd class="p_pic"><i></i><a href="#"><img src="images/brand_r1_c1.gif" width="148" height="30" alt="欧梦达" /></a></dd>
						<dd>打造时尚 优雅 甜美 可爱的女性形象。</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt><a class="title" href="#">欧梦达</a></dt>
						<dd class="p_pic"><i></i><a href="#"><img src="images/brand_r1_c1.gif" width="148" height="30" alt="欧梦达" /></a></dd>
						<dd>打造时尚 优雅 甜美 可爱的女性形象。</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt><a class="title" href="#">欧梦达</a></dt>
						<dd class="p_pic"><i></i><a href="#"><img src="images/brand_r1_c1.gif" width="148" height="30" alt="欧梦达" /></a></dd>
						<dd>打造时尚 优雅 甜美 可爱的女性形象。</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt><a class="title" href="#">欧梦达</a></dt>
						<dd class="p_pic"><i></i><a href="#"><img src="images/brand_r1_c1.gif" width="148" height="30" alt="欧梦达" /></a></dd>
						<dd>打造时尚 优雅 甜美 可爱的女性形象。</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt><a class="title" href="#">欧梦达</a></dt>
						<dd class="p_pic"><i></i><a href="#"><img src="images/brand_r1_c1.gif" width="148" height="30" alt="欧梦达" /></a></dd>
						<dd>打造时尚 优雅 甜美 可爱的女性形象。</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt><a class="title" href="#">欧梦达</a></dt>
						<dd class="p_pic"><i></i><a href="#"><img src="images/brand_r1_c1.gif" width="148" height="30" alt="欧梦达" /></a></dd>
						<dd>打造时尚 优雅 甜美 可爱的女性形象。</dd>
					</dl>
				</li>
			</ul>
			<div class="clear"></div>
		</div><!--items end-->
		<div class="items">
			<ul>
				<li>
					<dl>
						<dt><a class="title" href="#">欧梦达</a></dt>
						<dd class="p_pic"><i></i><a href="#"><img src="images/brand_r1_c1.gif" width="148" height="30" alt="欧梦达" /></a></dd>
						<dd>打造时尚 优雅 甜美 可爱的女性形象。</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt><a class="title" href="#">欧梦达</a></dt>
						<dd class="p_pic"><i></i><a href="#"><img src="images/brand_r1_c1.gif" width="148" height="30" alt="欧梦达" /></a></dd>
						<dd>打造时尚 优雅 甜美 可爱的女性形象。</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt><a class="title" href="#">欧梦达</a></dt>
						<dd class="p_pic"><i></i><a href="#"><img src="images/brand_r1_c1.gif" width="148" height="30" alt="欧梦达" /></a></dd>
						<dd>打造时尚 优雅 甜美 可爱的女性形象。</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt><a class="title" href="#">欧梦达</a></dt>
						<dd class="p_pic"><i></i><a href="#"><img src="images/brand_r1_c1.gif" width="148" height="30" alt="欧梦达" /></a></dd>
						<dd>打造时尚 优雅 甜美 可爱的女性形象。</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt><a class="title" href="#">欧梦达</a></dt>
						<dd class="p_pic"><i></i><a href="#"><img src="images/brand_r1_c1.gif" width="148" height="30" alt="欧梦达" /></a></dd>
						<dd>打造时尚 优雅 甜美 可爱的女性形象。</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt><a class="title" href="#">欧梦达</a></dt>
						<dd class="p_pic"><i></i><a href="#"><img src="images/brand_r1_c1.gif" width="148" height="30" alt="欧梦达" /></a></dd>
						<dd>打造时尚 优雅 甜美 可爱的女性形象。</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt><a class="title" href="#">欧梦达</a></dt>
						<dd class="p_pic"><i></i><a href="#"><img src="images/brand_r1_c1.gif" width="148" height="30" alt="欧梦达" /></a></dd>
						<dd>打造时尚 优雅 甜美 可爱的女性形象。</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt><a class="title" href="#">欧梦达</a></dt>
						<dd class="p_pic"><i></i><a href="#"><img src="images/brand_r1_c1.gif" width="148" height="30" alt="欧梦达" /></a></dd>
						<dd>打造时尚 优雅 甜美 可爱的女性形象。</dd>
					</dl>
				</li>
			</ul>
			<div class="clear"></div>
		</div><!--items end-->
		<div class="items">
			<ul>
				<li>
					<dl>
						<dt><a class="title" href="#">欧梦达</a></dt>
						<dd class="p_pic"><i></i><a href="#"><img src="images/brand_r1_c1.gif" width="148" height="30" alt="欧梦达" /></a></dd>
						<dd>打造时尚 优雅 甜美 可爱的女性形象。</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt><a class="title" href="#">欧梦达</a></dt>
						<dd class="p_pic"><i></i><a href="#"><img src="images/brand_r1_c1.gif" width="148" height="30" alt="欧梦达" /></a></dd>
						<dd>打造时尚 优雅 甜美 可爱的女性形象。</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt><a class="title" href="#">欧梦达</a></dt>
						<dd class="p_pic"><i></i><a href="#"><img src="images/brand_r1_c1.gif" width="148" height="30" alt="欧梦达" /></a></dd>
						<dd>打造时尚 优雅 甜美 可爱的女性形象。</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt><a class="title" href="#">欧梦达</a></dt>
						<dd class="p_pic"><i></i><a href="#"><img src="images/brand_r1_c1.gif" width="148" height="30" alt="欧梦达" /></a></dd>
						<dd>打造时尚 优雅 甜美 可爱的女性形象。</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt><a class="title" href="#">欧梦达</a></dt>
						<dd class="p_pic"><i></i><a href="#"><img src="images/brand_r1_c1.gif" width="148" height="30" alt="欧梦达" /></a></dd>
						<dd>打造时尚 优雅 甜美 可爱的女性形象。</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt><a class="title" href="#">欧梦达</a></dt>
						<dd class="p_pic"><i></i><a href="#"><img src="images/brand_r1_c1.gif" width="148" height="30" alt="欧梦达" /></a></dd>
						<dd>打造时尚 优雅 甜美 可爱的女性形象。</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt><a class="title" href="#">欧梦达</a></dt>
						<dd class="p_pic"><i></i><a href="#"><img src="images/brand_r1_c1.gif" width="148" height="30" alt="欧梦达" /></a></dd>
						<dd>打造时尚 优雅 甜美 可爱的女性形象。</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt><a class="title" href="#">欧梦达</a></dt>
						<dd class="p_pic"><i></i><a href="#"><img src="images/brand_r1_c1.gif" width="148" height="30" alt="欧梦达" /></a></dd>
						<dd>打造时尚 优雅 甜美 可爱的女性形象。</dd>
					</dl>
				</li>
			</ul>
			<div class="clear"></div>
		</div><!--items end-->
	</div><!--allbrand-con end-->
	<div class="clear mb-10"></div>
	<script type="text/javascript">
	$(document).ready(function(){
		$('.allbrand-con > .items:first').show();
		$('.allbrand-tab li').each(function(index){
			$(this).click(function(){
				$('.allbrand-tab li').removeClass('current');
				$(this).addClass('current');
				$('.allbrand-con > .items:visible').hide();
				$('.allbrand-con > .items:eq('+ index +')').show();
			});
		});
	});
	</script>
</div><!--content end-->
	
<div class="footer container">
	<div class="service">
		<div class="cat_bg"></div>
		<div class="help_list clearfix">
			<dl>
				<dt>新手指南</dt>
				<dd><a href="help/index.jsp" target="_blank"><span>购物流程</span></a></dd>
				<dd><a href="help/account.jsp" target="_blank"><span>我的麦路客</span></a></dd>
				<dd><a href="help/common.jsp" target="_blank"><span>常见问题</span></a></dd>
				<dd><a href="register.jsp" target="_blank"><span>注册用户</span></a></dd>
				<dd><a href="forgot-password.jsp" target="_blank"><span>找回密码</span></a></dd>
			</dl>
			<dl>
				<dt>订单问题</dt>
				<dd><a href="help/order-status.jsp" target="_blank">订单状态</a></dd>
				<dd><a href="help/cancel-order.jsp" target="_blank">取消订单</a></dd>   
				<dd><a href="help/not-order.jsp" target="_blank">未达订单</a></dd> 
			</dl>
			<dl>
				<dt>会员积分</dt>
				<dd><a href="help/integral-rules.jsp" target="_blank">积分规则</a></dd>
				<dd><a href="help/integral.jsp" target="_blank">积分问题</a></dd> 
				<dd><a href="help/exchange-integral.jsp" target="_blank">积分兑换</a></dd>   
			</dl>
			<dl>
				<dt>如何付款/退款</dt>
				<dd><a href="help/payment.jsp" target="_blank">支付方式</a></dd>
				<dd><a href="help/wait-pay.jsp" target="_blank">支付等待</a></dd>
				<dd><a href="help/pay-issue.jsp" target="_blank">支付问题</a></dd>
				<dd><a href="help/refund.jsp" target="_blank">办理退款</a></dd>
				<dd><a href="help/invoice-system.jsp" target="_blank">发票制度</a></dd>        
			</dl>
			<dl>
				<dt>配送和收费</dt>
				<dd><a href="help/time-range.jsp" target="_blank">配送时间</a></dd> 
				<dd><a href="help/delivery-time.jsp" target="_blank">送达时间</a></dd> 
				<dd><a href="help/inspection-sign.jsp" target="_blank">验货与签收</a></dd> 
				<dd><a href="help/express.jsp" target="_blank">快递配送和收费</a></dd> 
				<dd><a href="help/ems.jsp" target="_blank">EMS配送和收费</a></dd>      
			</dl>
			<dl>
				<dt>售后服务</dt>
				<dd><a href="help/policy.jsp" target="_blank">退换货政策</a></dd>
				<dd><a href="help/apply-goods.jsp" target="_blank">如何办理退换货</a></dd>     
			</dl>
		</div>
	</div><!--service end-->
	<div class="copyright">
		<a href="help/about.jsp" target="_blank">关于麦路客</a><span>|</span><a href="help/contact.jsp" target="_blank">联系麦路客</a><span>|</span><a href="help/job.jsp" target="_blank">加入麦路客</a><span>|</span><a href="sort.jsp" target="_blank">网站地图</a><span>|</span><a href="help/complainting.jsp" target="_blank">投诉与建议</a><span>|</span><a href="help/links.jsp" target="_blank">友情链接</a><br />
		Copyright&nbsp;&nbsp;©&nbsp;&nbsp;2009-2011&nbsp;&nbsp;<a title="麦路客商城" href="http://www.mailuke.com/">www.mailuke.com</a>&nbsp;&nbsp;麦路客商城版权所有<span>|</span><a href="http://www.miibeian.gov.cn/" target="_blank">沪ICP备10031526号</a><br />
		<a href="#" target="_blank"><img src="images/beian.gif" width="128" height="47" alt="经营性网站备案中心" /></a><a href="#" target="_blank"><img src="images/trustA.gif" width="119" height="47" alt="A级-信用企业" /></a><a href="#" target="_blank"><img src="images/alipay.gif" width="123" height="40" alt="支付宝-特约商家" /></a>
	</div><!--copyright end-->
</div><!--footer end-->

<!-- plugin -->
<script type="text/javascript" src="js/lib.js"></script>
<!-- online -->
<script type="text/javascript" src="js/online.js"></script>	
</body>
</html>