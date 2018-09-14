<%@page import="java.util.*"%>
<%@page import="edu.shopsys.service.impl.UserServiceImpl"%>
<%@page import="edu.shopsys.service.UserService"%>
<%@page import="edu.shopsys.model.Goods" %>
<%@page import="edu.shopsys.model.User" %>
<%@page import="javax.servlet.http.Cookie"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%
   User u = new User();
   u = (User)request.getSession().getAttribute("user");
   Goods goods = (Goods)request.getAttribute("goods");
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="author" content="order by dede58.com"/>
<title>时尚银丝连裤袜-麦路客商城</title>
<meta name="description" content="麦路客商城-专业的网上购物服装商城，主要在线销售男装、女装、童装、鞋、配饰、短袖、T恤、情侣装、背心、内衣、毛衣、衬衫、针织衫、羊毛衫、卫衣、外套、羽绒服、休闲裤、牛仔裤、袜子等让您随时享受舒心惬意的网购之旅，同时为您提供最新的时尚潮流资讯，为每一位用户提供最新时尚潮流的折扣商品，天天低价、支持货到付款、7天无理由退换货。" />
<meta name="keywords" content="童装、婴儿装、T恤、背心、长袖T恤、短袖T恤、亲子T恤针织衫、长袖针织衫、针织外套、针织背心、外套、裤子、休闲裤、牛仔裤、运动裤裙子、内衣裤、棉袜、麦路客商城" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
<link href="css/base.css" rel="stylesheet" type="text/css"/>
<link href="css/detail.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="js/jquery-1.2.6.pack.js"></script>
<script type="text/javascript" src="js/public.js"></script>
<script type="text/javascript" src="js/jquery.pager.js"></script>
</head>
<body>
<h1 id="fenxiang" class="descriptionhide">麦路客商城-专业的网上购物服装商城，主要在线销售男装、女装、童装、鞋、配饰、短袖、T恤、情侣装、背心、内衣、毛衣、衬衫、针织衫、羊毛衫、卫衣、外套、羽绒服、休闲裤、牛仔裤、袜子等让您随时享受舒心惬意的网购之旅，同时为您提供最新的时尚潮流资讯，为每一位用户提供最新时尚潮流的折扣商品，天天低价、支持货到付款、7天无理由退换货。</h1>
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
				<li id="floor_1"><a href="airplane.jsp" class="selected track">飞机模型</a></li>
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
		<a href="index.jsp">首页</a><span>></span><a href="search.jsp?type=<%=goods.getGoods_type() %>" class="cur"><%=goods.getGoods_type() %></a><span>></span><%=goods.getGoods_name() %>
	</div><!--breadcrumbs end-->
	<div class="line-border mb-10"></div>
	<%if(null != goods){%>
	    <div class="area_l g_z preview">
		<div class="f_l smallImg">
			<div class="scrollbutton smallImgUp"></div>
			<div id="imageMenu">
				<ul>
					<li id="onlickImg"><img src="<%=goods.getGoods_image()%>" width="68" height="68" alt="<%=goods.getGoods_info() %>" /></li>
					<li><img src="<%=goods.getGoods_image()%>" width="68" height="68" alt="丝袜美腿" /></li>
					<li><img src="<%=goods.getGoods_image()%>" width="68" height="68" alt="丝袜美腿" /></li>
					<li><img src="<%=goods.getGoods_image()%>" width="68" height="68" alt="丝袜美腿" /></li>
				</ul>
			</div>
			<div class="scrollbutton smallImgDown"></div>
		</div><!--smallImg end-->
		
		<div id="vertical" class="bigImg f_r">
			<img src="<%=goods.getGoods_image()%>" width="400" height="460" title="丝袜美腿" id="midimg">
			<div style="display:none;" id="winSelector"></div>
		</div><!--bigImg end-->
		</div><!--preview end-->
		<div class="area_r g_f" id="application">
	<form action="SearchController?method=carSearch" method="post">
		<h2 class="con-title"><%=goods.getGoods_info() %><span class="red">(物超所值)</span></h2>
		<ul class="goods_main">
			<li class="pingpai">商品品牌:<%=goods.getGoods_brand() %><span id="goodsId">商品编号:<%=goods.getGoods_id() %></span></li>
			<li class="price">麦路客价：<span class="number red">￥<%=goods.getGoods_price() %></span>市场价：<em class="yuanjia">￥<%=goods.getGoods_price()+goods.getGoods_price()*0.3 %></em></li>
		</ul><!--goods_main end-->
		<div class="goods_choose">
			<div class="choose_color imageMenu">
				<div>颜色：<strong class="red" id="goods_color1">红色系列</strong></div>
				<ul class=" clearfix" id="color_color">
					<li id="onlickImg"><a href="#"><img src="<%=goods.getGoods_image()%>" name="红色系列" alt="红色系列" width="68" height="68" class="pic" /></a></li>
					<li><a href="#"><img src="<%=goods.getGoods_image()%>" alt="白色系列" width="68" height="68" class="pic" /></a></li>
					<li><a href="#"><img src="<%=goods.getGoods_image()%>" alt="黑色系列" width="68" height="68" class="pic" /></a></li>
				</ul>
			</div><!--choose_color end-->
			<div class="choose_size" id="sample">
				<div class="choose_size_t size_li">尺寸：<strong class="red">未选择</strong></div><!--choose_size_t end-->
				
				<div class="choose_size_m" id="tip_size">
					<ul>
						<li>
							<input type="radio" name="size" value="S" id="" />
							<a href="javascript:void(0);" class="size_radioToggle"><span class="value">S</span></a>
						</li>
						<li>
							<input type="radio" name="size" value="M" id="" />
							<a href="javascript:void(0);" class="size_radioToggle"><span class="value">M</span></a>
						</li>
						<li>
							<input type="radio" name="size" value="L" id="" />
							<a href="javascript:void(0);" class="size_radioToggle"><span class="value">L</span></a>
						</li>
						<li>
							<input type="radio" name="size" value="XL" id="" />
							<a href="javascript:void(0);" class="size_radioToggle"><span class="value">XL</span></a>
						</li>
						<li>
							<input type="radio" name="size" value="XXL" id="" />
							<a href="javascript:void(0);" class="size_radioToggle"><span class="value">XXL</span></a>
						</li>
					</ul>
					<div class="size_box box_01">
						<div class="box_m">适合165/88A</div>
					</div><!--box_01 end-->
					<div class="size_box box_02">
						<div class="box_m">适合170/92A</div>
					</div><!--box_02 end-->
					<div class="size_box box_03">
						<div class="box_m">适合175/96A</div>
					</div><!--box_03 end-->
					<div class="size_box box_04">
						<div class="box_m">适合180/100A</div>
					</div><!--box_04 end-->
					<div class="size_box box_05">
						<div class="box_m">适合185/104A</div>
					</div><!--box_05 end-->
				</div><!--choose_size_m end-->
				<div class="choose_title">
					<ul>
						<li>颜色：<strong class="red" id="goods_color2">红色系列</strong></li>
						<li class="size_li">尺寸：<strong id="result" class="red">未选择</strong></li>
						<li>商品单价：<strong class="red" id="price_item_1">￥<%=goods.getGoods_price()%></strong></li>
					</ul>
				</div><!--choose_title end-->
			</div><!--choose_size end-->
		</div><!--goods_choose end-->
		<p class="coin-con"><span class="f_l"><b class="red style-p">↑</b>以上是您选择的商品样式信息</span><span class="f_r">您的当前积分：<b class="red">3000</b>积分</span></p>
		<div class="pay-tab">
			<ul class="pay-btn">
				<li class="current"><span>购买商品</span></li>
				<li><span>折扣积分兑换</span></li>
				<li class="last"><span>全额积分兑换</span></li>
			</ul>
			<div class="pay-con">
				<div class="items">
					
				</div>
            </div>
		</div><!--pay-tab end-->
	</form>
	</div><!--right end-->
	<%}%>
	
		
	<div class="share-zoompic">
		<div class="big_pic">
			<div class="full-souce">商品满意度：<span class="rate-point-s point5s-08">4.5分</span></div>
			<a class="pic_zoom" href="goods-zoom.jsp" target="_blank">放大查看</a>
			<a href="login-register.jsp?height=439&amp;width=600&amp;modal=false" title="您尚未登录" class="favorites thickbox">加入收藏</a>
		</div><!--big_pic end-->
		<div class="share-con">
		<span class="tit">分享有礼：</span>
		<a title="复制链接" href="javascript:copyText(window.location.href)"><span class="copylink"></span></a>
		<a title="分享到腾讯微博" href="javascript:void(0)" onclick="postToWb();"><span class="tengxunweibo"></span></a>
		<a title="分享到新浪微博" href="javascript:void(0);"><span class="xinlang"></span></a>
		<a title="分享到搜狐微博" href="javascript:void((function(s,d,e,r,l,p,t,z,c){var f='http://t.sohu.com/third/post.jsp?',u=z||d.location,p=['&url=',e(u),'&title=',e(t||d.title),'&content=',c||'gb2312','&pic=',e(p||'')].join('');function%20a(){if(!window.open([f,p].join(''),'mb',['toolbar=0,status=0,resizable=1,width=660,height=470,left=',(s.width-660)/2,',top=',(s.height-470)/2].join('')))u.href=[f,p].join('');};if(/Firefox/.test(navigator.userAgent))setTimeout(a,0);else%20a();})(screen,document,encodeURIComponent,'','','','','','utf-8'));"><span class="sohu"></span></a>
		<a title="分享到网易微博" href="javascript:void(0);"><span class="wangyi"></span></a>
		<a title="分享到Qzone空间" href="javascript:void(0);"><span class="qqzone"></span></a>
		<a title="分享到朋友社区" href="javascript:void(0);" onclick="window.open('http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?to=pengyou&url='+encodeURIComponent(document.location.href));return false;"><span class="qqpengyou"></span></a>
		<a title="分享到人人网" href="javascript:void(0);"><span class="renren"></span></a>
		<a title="分享到开心网" href="javascript:void(0);"><span class="kaixin"></span></a>
		<a title="分享到淘江湖" href="javascript:void(0);"><span class="taojianghu"></span></a>
		<a title="分享到豆瓣" href="javascript:void(0);"><span class="douban"></span></a>
		<a title="分享到百度收藏" href="javascript:void(0);"><span class="baidusoucang"></span></a>
		</div>
	</div>	

	<div class="del_tab clearfix">
		<div class="area_l prodel">
			<div class="liulan">
				<div class="liulan_t"><h3 class="f_l">你最近浏览的商品</h3><a class="f_r clearRec" href="javascript:void(0)">清空</a></div>
				<div class="liulan_product">
					<ul>
						<li class="clearfix">
							<a href="#"><img src="images/liuliang/p1.jpg" class="p_img" alt="都市年华缤纷羽绒服" width="68" height="68" /></a>
							<span><a href="#" class="red">都市年华缤纷羽绒服</a></span><span class="yellow">￥299.00</span><span>EUROMODA</span>
						</li>
						<li class="clearfix">
							<a href="#"><img src="images/liuliang/p1.jpg" class="p_img" alt="都市年华缤纷羽绒服" width="68" height="68" /></a>
							<span><a href="#" class="red">都市年华缤纷羽绒服</a></span><span class="yellow">￥299.00</span><span>EUROMODA</span>
						</li>
					</ul>	
				</div>
			</div><!--liulan end-->
		</div><!--left end-->
		<div class="area_r tab-con">
			<div class="promotions">
				<h3 class="icon">商品促销</h3>
				<div class="send_con">
					<a class="prev" href="javascript:void(0);"></a>
					<div class="send_pro">
						<ul>
							<li>
								<div class="blank20"></div>
								<dl class="clearfix">
									<dt>满就送</dt>
									<dd><span class="xin">♥</span>消费金额满<b class="red">300</b>元，送 <a href="#" title="白色系列"><img class="p_img" src="images/spacer.gif" alt="白色系列" lazyload="small/20100710/2009_11_4_18_7_36_3688.jpg" align="absmiddle" /></a>“
									<a href="#" class="red">人气产品</a>”</dd>
								</dl>
							</li>
							<li>
								<div class="blank20"></div>
								<dl class="clearfix">
									<dt>满就送</dt>
									<dd><span class="xin">♥</span>消费金额满<b class="red">300</b>元，送 <a href="#" title="白色系列"><img class="p_img" src="images/spacer.gif" alt="白色系列" lazyload="small/20100710/2009_11_4_18_7_36_3688.jpg" align="absmiddle" /></a>“
									<a href="#" class="red">人气产品</a>”</dd>
								</dl>
							</li>
						</ul>
					</div>
					<a class="next" href="javascript:void(0);"></a>
				</div><!--send_con end-->
			</div><!--promotions end-->
			
			<div class="blank10"></div>
			
			<div class="tab-show" id="box-info">
				<div class="tab">
					<ul>
						<li class="current"><span>商品信息</span></li>
						<li><span>买家问答</span></li>
						<li><span>顾客评论</span></li>
						<li><span>支付方式</span></li>
					</ul>
				</div><!--tab end-->
				<div class="tabcon">
					<div class="items">
						<h3 class="dish3">产品描述</h3>
						<p class="disp disp-indent">Tiger & Lion情侣女T恤，舒适的面料，合体的裁剪，印花可爱又有趣，给你轻松闲适的生活氛围；将爱情进行到底，崇尚爱情的美好，让你感受幸福的甜蜜而又不失个性时尚。</p>
						<h3 class="dish3">产品尺码表</h3>	
						<table class="distable" width="100%">
							<tbody>
								<tr>
									<td>型号</td>
									<td>肩宽</td>
									<td>胸围</td>
									<td>下摆</td>
									<td>衣长</td>
									<td>袖长</td>
								</tr>
								<tr>
									<td>XS</td>
									<td>34.5</td>
									<td>77</td>
									<td>84</td>
									<td>62</td>
									<td>4</td>
								</tr>
								<tr>
									<td>S</td>
									<td>35</td>
									<td>79</td>
									<td>86</td>
									<td>63</td>
									<td>5</td>
								</tr>
								<tr>
									<td>M</td>
									<td>36</td>
									<td>83</td>
									<td>90</td>
									<td>65</td>
									<td>6</td>
								</tr>
								<tr>
								  <td>L</td>
								  <td>37</td>
								  <td>87</td>
								  <td>94</td>
								  <td>67</td>
								  <td>7</td>
								</tr>
								<tr>
								  <td>XL</td>					
								  <td>38</td>
								  <td>91</td>
								  <td>98</td>
								  <td>68</td>
								  <td>8</td>
								</tr>
							</tbody>
						</table>
						<h3 class="dish3-01">产品展示</h3>
						<a name="photo" title="图片详情"></a>
						<div class="distab"><a class="cur" href="#photo">图片详情</a><a href="#xs">XS尺寸详情</a><a href="#s">S尺寸详情</a><a href="#m">M尺寸详情</a><a href="#l">L尺寸详情</a><a href="#xl">XL尺寸详情</a></div>
						<p align="center"><img src="images/spacer.gif" lazyload="images/star/big/p24.jpg" width="426" height="639" /></p>
						
						<a name="xs" title="XS尺寸详情"></a>
						<div class="distab"><a href="#photo">图片详情</a><a class="cur" href="#xs">XS尺寸详情</a><a href="#s">S尺寸详情</a><a href="#m">M尺寸详情</a><a href="#l">L尺寸详情</a><a href="#xl">XL尺寸详情</a></div>
						<p align="center"><img src="images/spacer.gif" lazyload="images/star/big/p23.jpg" width="350" height="500" /></p>
						
						<a name="s" title="S尺寸详情"></a>
						<div class="distab"><a href="#photo">图片详情</a><a href="#xs">XS尺寸详情</a><a class="cur" href="#s">S尺寸详情</a><a href="#m">M尺寸详情</a><a href="#l">L尺寸详情</a><a href="#xl">XL尺寸详情</a></div>
						<p align="center"><img src="images/spacer.gif" lazyload="images/star/big/p22.jpg" width="470" height="825" /></p>
						
						<a name="m" title="M尺寸详情"></a>
						<div class="distab"><a href="#photo">图片详情</a><a href="#xs">XS尺寸详情</a><a href="#s">S尺寸详情</a><a class="cur" href="#m">M尺寸详情</a><a href="#l">L尺寸详情</a><a href="#xl">XL尺寸详情</a></div>
						<p align="center"><img src="images/spacer.gif" lazyload="images/star/big/p21.jpg" width="600" height="550" /></p>
						
						<a name="l" title="L尺寸详情"></a>
						<div class="distab"><a href="#photo">图片详情</a><a href="#xs">XS尺寸详情</a><a href="#s">S尺寸详情</a><a href="#m">M尺寸详情</a><a class="cur" href="#l">L尺寸详情</a><a href="#xl">XL尺寸详情</a></div>
						<p align="center"><img src="images/spacer.gif" lazyload="images/star/big/p20.jpg" width="550" height="509" /></p>
						
						<a name="xl" title="XL尺寸详情"></a>
						<div class="distab"><a href="#photo">图片详情</a><a href="#xs">XS尺寸详情</a><a href="#s">S尺寸详情</a><a href="#m">M尺寸详情</a><a href="#l">L尺寸详情</a><a class="cur" href="#xl">XL尺寸详情</a></div>		
						<p align="center"><img src="images/spacer.gif" lazyload="images/star/big/p19.jpg" width="350" height="489" /></p>
									
					</div><!--items end-->
					
					<div class="items hide">
						<div class="questions">
							<h3>买家问答<span>共<b id="feedbackcount">6</b>条记录。<a href="#">查看全部</a></span></h3>
							<div class="meun">
								<ul>
									<li class="q_bg">
										<div class="yanse">50290*** (麦路客会员)
											<span class="data">2010-01-26 13:40</span>											</div>
										<p><strong class="red">（尺寸问题）</strong>我身高155cm,体重52KG，是穿m还是s呀?</p>
										<span class="icon"></span>										</li>
									<li class="a_bg">
										<div class="admin"><b class="red">麦路客管理员：</b>
											<span class="data">2010-01-26 13:40</span>
											<span class="arrow"></span>											</div>
										<p>亲 您这身材穿M号就足够啦^^</p>
									</li>
								</ul>
							</div>
						</div><!--questions end-->
						<div class="no-content">暂时没有买家提问此商品</div><!--no-content end-->
						<div class="quiz">
							<h3>我要提问</h3>
							<div class="quiz_content">
								<form action="" method="post">
									<ul>
										<li class="cate_l">
											<dl class="clearfix">
												<dt>问题类型：</dt>
												<dd><label for="cc"><input type="radio" name="1" value="Cube" checked="checked" id="cc"/>尺码问题</label></dd>
												<dd><label for="sy"><input type="radio" name="1" value="function" id="sy" />使用方法</label></dd>
												<dd><label for="sp"><input type="radio" name="1" value="Materail" id="sp">商品材质</label></dd>
												<dd><label for="qt"><input type="radio" name="1" value="Other" id="qt">其他</label></dd>
											</dl>
										</li>
										<li class="l_text">
											<label class="m_flo">内  容：</label><textarea name="area" id="" class="text"></textarea>
											<span class="tr">字数限制为5-200个</span>										    </li>
									</ul>
									<button class="btm" type="submit"></button>
								</form>
							</div><!--quiz_content end-->
						</div><!--quiz end-->
					</div><!--items end-->
					
					<div class="items hide">
						<div class="questions">
							<h3>顾客评论<span>共1条评论。<a href="#">查看全部</a></span></h3>
							<div class="pinglun_point">
								<span class="tit">商品满意度：</span>
								<span class="rate-point-b point-09">5.0分</span>								</div><!--pinglun_point end-->
							<div class="discusslist">
								<ul>
									<li>
										<div class="dis-content">
											<div class="lower">
												<span class="tit">34767*** (麦路客会员)</span>
												<span class="rate-point-s point5s-01"></span>
												<span class="date">2010-07-29 01:50</span>												</div>
											<p>颜色还不错，是今年流行西瓜红。<br>衣服的质地很轻薄，穿着很舒服。</p>
										</div>
									</li>
									<li>
										<div class="dis-content">
											<div class="lower">
												<span class="tit">34767*** (麦路客会员)</span>
												<span class="rate-point-s point5s-09"></span>
												<span class="date">2010-07-29 01:50</span>												</div>
											<p>颜色还不错，是今年流行西瓜红。<br>衣服的质地很轻薄，穿着很舒服。</p>
										</div>
									</li>
								</ul>
							</div><!--discusslist end-->
						</div><!--questions end-->
						<div class="no-content">暂时没有顾客评论此商品</div><!--no-content end-->
						<div class="quiz">
							<h3>我要评论<span class="tip">购买过此商品的顾客，在收到商品后才可以对该商品发表评论。评论后获得<b class="yellow">20</b>点积分</span></h3>
							<div class="quiz_content">
								<form action="" method="post">
									<div class="goods-comm">
										<div class="goods-comm-stars">
											<span class="star_l">满意度：</span>
											<div id="rate-comm-1" class="rate-comm"></div>
										</div>
									</div>
									<div class="l_text">
										<label class="m_flo">内  容：</label>
										<textarea name="area" id="" class="text"></textarea>
										<span class="tr">字数限制为5-200个</span>
									</div>
									<button class="btm" type="submit"></button>
								</form>
							</div><!--quiz_content end-->
						</div><!--quiz end-->
					</div><!--items end-->
					
					<div class="items hide">
						<ul> 
							<li class="item-payment-way2"> 
								<div class="section-box">
									<ol class="trade-flow">
										<li>选择商品</li>
										<li>付款到支付宝</li>
										<li>
											<ul>
												<li><ol><li>验货满意</li><li>通知支付宝付款给卖家</li><li>完成</li></ol></li>
												<li><ol><li>验货不满意</li><li>退货</li><li>退款</li></ol></li>
											</ul>
										</li>
									</ol>
									<p>
									使用支付宝“收货满意后，卖家才能拿到钱”保障您的交易安全，让您购物没有后顾之忧！										</p>
									<h5>支付宝为您提供以下付款方式：均可享受担保交易</h5>
									<ul class="payment-list clearfix">
										<li>
											<table class="eshop">
												<caption>在网上支付</caption>
												<colgroup>
													<col class="col-payment" />
													<col class="col-desc" />
													<col class="col-fee" />
													<col class="col-link" />
												</colgroup>
												<thead>
													<tr>
														<td>付款方式</td>
							
														<td>介绍</td>
														<td class="col-center">手续费</td>
														<td>说明</td>
													</tr>
												</thead>
												<tbody>
													<tr>
							
														<td><a href="http://abc.alipay.com/paymentAccount.jsp?src=yy_content_tbdetail_01" title="" target="_blank"><b>支付宝余额</b></a></td>
														<td>用自己支付宝账户余额的钱付款</td>
														<td class="col-center">无</td>
														<td><a href="http://abc.alipay.com/paymentAccount.jsp?src=yy_content_tbdetail_01" title="" target="_blank">详细</a></td>
													</tr>
													<tr>
														<td><a href="http://abc.alipay.com/paymentKatong.jsp?src=yy_content_tbdetail_02" title="" target="_blank"><b>支付宝卡通</b></a></td>
							
														<td>用绑定了“支付宝”的银行卡付款</td>
														<td class="col-center">无</td>
														<td><a href="http://abc.alipay.com/paymentKatong.jsp?src=yy_content_tbdetail_02" title="" target="_blank">详细</a></td>
													</tr>
													<tr>
														<td><a href="http://abc.alipay.com/paymentBank.jsp?src=yy_content_tbdetail_03" title="" target="_blank"><b>网上银行</b></a></td>
														<td>用开通“网上银行”的银行卡付款</td>
							
														<td class="col-center">无</td>
														<td><a href="http://abc.alipay.com/paymentBank.jsp?src=yy_content_tbdetail_03" title="" target="_blank">详细</a></td>
													</tr>
													<tr>
														<td><a href="http://abc.alipay.com/paymentCard.jsp?src=yy_content_tbdetail_04" title="" target="_blank"><b>信用卡</b></a></td>
														<td>用您的“信用卡”付款</td>
														<td class="col-center">无</td>
							
														<td><a href="http://abc.alipay.com/paymentCard.jsp?src=yy_content_tbdetail_04" title="" target="_blank">详细</a></td>
													</tr>
													<tr>
														<td><a href="http://abc.alipay.com/paymentVoucher.jsp?src=yy_content_tbdetail_05" title="" target="_blank"><b>消费卡</b></a></td>
														<td>用神州行话费充值卡或百联ok超市卡充值付款</td>
														<td class="col-center">2-5%</td>
														<td><a href="http://abc.alipay.com/paymentVoucher.jsp?src=yy_content_tbdetail_05" title="" target="_blank">详细</a></td>
													</tr>
												</tbody>
											</table>
										</li>
										<li class="last">
											<table class="eshop">
												<caption>不在网上支付</caption>
												<colgroup>
													<col class="col-payment" />
													<col class="col-desc" />
													<col class="col-fee" />
													<col class="col-link" />
												</colgroup>
												<thead>
													<tr>
														<td>付款方式</td>
														<td>介绍</td>
														<td class="col-center">手续费</td>
														<td>说明</td>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td><a href="http://abc.alipay.com/paymentCash.jsp?src=yy_content_tbdetail_06" title="" target="_blank"><b>刷卡支付</b></a></td>
														<td>去便利店的拉卡拉自助终端刷卡付款</td>
														<td class="col-center">1%</td>
														<td><a href="http://abc.alipay.com/paymentCash.jsp?src=yy_content_tbdetail_06" title="" target="_blank">详细</a></td>
													</tr>
													<tr>
														<td><a href="http://abc.alipay.com/paymentCash.jsp?src=yy_content_tbdetail_07" title="" target="_blank"><b>现金支付</b></a></td>
														<td>去邮政、淘一站等支付宝授权网点付现金</td>
														<td class="col-center">1%</td>
														<td><a href="http://abc.alipay.com/paymentCash.jsp?src=yy_content_tbdetail_07" title="" target="_blank">详细</a></td>
													</tr>
													<tr>
														<td><a href="http://abc.alipay.com/paymentCoa.jsp?src=yy_content_tbdetail_08" title="" target="_blank"><b>货到付款</b></a></td>
														<td>收到货物时，再付钱给快递人员</td>
														<td class="col-center">3%</td>
														<td><a href="http://abc.alipay.com/paymentCoa.jsp?src=yy_content_tbdetail_08" title="" target="_blank">详细</a></td>
													</tr>
												</tbody>
											</table>
										</li>
									</ul>
								</div>
							</li>
							<li id="cod-info">
								<div class="section-box">
									<dl class="cod-explain">
										<dt class="point">货到付款服务:</dt>
										<dd>
											就是买家收到货，验货后再付款。是麦路客商城为了降低买家网上购物的门槛的支付方式。使用货到付款服务，买家需要向物流公司支付一定的代收货款费用。
											<br/>
										</dd>
										<dt>配送服务公司:</dt>
										<dd>
											<a href="http://www.sto.cn/" target="_blank">申通快递</a><br/>
											<a href="http://www.fedex.com/cn/" target="_blank">联邦快递</a><br/>
											<a href="http://www.sf-express.com/" target="_blank">顺丰速运</a>											</dd>
										<dt>买家服务保障:</dt>
										<dd>1、无须网银，支付更方便<br/>2、见货再付款，交易更安全<br/>3、商品交易享受消费者保障服务。<br/>4、麦路客推荐物流商运输，运送更放心。</dd>
									</dl>
								</div>
							</li>
						</ul> 
					</div><!--items end-->
				</div><!--tabcon end-->
			</div><!--tab-show end-->
			
			<div class="blank10"></div>
			
			<div class="hot_cate">
				<div class="hot_tit"><h2 class="f_l">热卖推荐</h2><div class="hot-btn hot-prev"></div><div class="hot-btn hot-next"></div></div>
				<div class="hot_list">
					<ul>
						<li>
							<div class="p_pic"><a href="product/women/Striped sweater elegant hollow.jsp"><img alt="优雅镂空条纹针织衫" src="images/women/product/0001887.jpg" class="p_img" width="150" height="205" /></a></div>							
							<div class="p_name"><a href="#">雅镂空条纹针织衫</a></div>
							<div class="p_price"><span class="cost">¥40.99</span><span class="num">¥57.00</span></div>
						</li>
						<li>
							<div class="p_pic"><a href="product/women/Striped sweater elegant hollow.jsp"><img alt="优雅镂空条纹针织衫"src="images/women/product/0000665.jpg" class="p_img" width="150" height="205" /></a></div>						
							<div class="p_name"><a href="#">雅镂空条纹针织衫</a></div>
							<div class="p_price"><span class="cost">¥40.99</span><span class="num">¥57.00</span></div>
						</li>
						<li>
							<div class="p_pic"><a href="product/women/Striped sweater elegant hollow.jsp"><img alt="优雅镂空条纹针织衫" src="images/spacer.gif" lazyload="images/women/product/0001355.jpg" class="p_img" width="150" height="205" /></a></div>							
							<div class="p_name"><a href="#">雅镂空条纹针织衫</a></div>
							<div class="p_price"><span class="cost">¥40.99</span><span class="num">¥57.00</span></div>
						</li>
						<li>
							<div class="p_pic"><a href="product/women/Striped sweater elegant hollow.jsp"><img alt="优雅镂空条纹针织衫" src="images/spacer.gif" lazyload="images/women/product/0000946.jpg" class="p_img" width="150" height="205" /></a></div>						
							<div class="p_name"><a href="#">雅镂空条纹针织衫</a></div>
							<div class="p_price"><span class="cost">¥40.99</span><span class="num">¥57.00</span></div>
						</li>
						
						<li>
							<div class="p_pic"><a href="product/women/Striped sweater elegant hollow.jsp"><img alt="优雅镂空条纹针织衫" src="images/spacer.gif" lazyload="images/women/product/0001887.jpg" class="p_img" width="150" height="205" /></a></div>							
							<div class="p_name"><a href="#">雅镂空条纹针织衫</a></div>
							<div class="p_price"><span class="cost">¥40.99</span><span class="num">¥57.00</span></div>
						</li>
						<li>
							<div class="p_pic"><a href="product/women/Striped sweater elegant hollow.jsp"><img alt="优雅镂空条纹针织衫" src="images/spacer.gif" lazyload="images/women/product/0000665.jpg" class="p_img" width="150" height="205" /></a></div>						
							<div class="p_name"><a href="#">雅镂空条纹针织衫</a></div>
							<div class="p_price"><span class="cost">¥40.99</span><span class="num">¥57.00</span></div>
						</li>
						<li>
							<div class="p_pic"><a href="product/women/Striped sweater elegant hollow.jsp"><img alt="优雅镂空条纹针织衫" src="images/spacer.gif" lazyload="images/women/product/0001355.jpg" class="p_img" width="150" height="205" /></a></div>							
							<div class="p_name"><a href="#">雅镂空条纹针织衫</a></div>
							<div class="p_price"><span class="cost">¥40.99</span><span class="num">¥57.00</span></div>
						</li>
						<li>
							<div class="p_pic"><a href="product/women/Striped sweater elegant hollow.jsp"><img alt="优雅镂空条纹针织衫" src="images/spacer.gif" lazyload="images/women/product/0000946.jpg" class="p_img" width="150" height="205" /></a></div>						
							<div class="p_name"><a href="#">雅镂空条纹针织衫</a></div>
							<div class="p_price"><span class="cost">¥40.99</span><span class="num">¥57.00</span></div>
						</li>
					</ul>
				</div><!--hot_list end-->
			</div><!--hot_cate end-->			
		</div><!--right end-->
		
	</div><!--del_tab end-->
	
	<div id="bigView" style="display:none;"><img src="" /></div><!--bigView end-->
	
	<div class="blank10"></div>
	
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
<script type="text/javascript" src="js/thickbox.js"></script>
<script type="text/javascript" src="js/lib.js"></script>
<script type="text/javascript" src="js/detail.js"></script>
<!-- online -->
<script type="text/javascript" src="js/online.js"></script>
</body>
</html>