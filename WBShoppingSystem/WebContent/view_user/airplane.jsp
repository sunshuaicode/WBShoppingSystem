<%@page import="java.util.*"%>
<%@page import="edu.shopsys.service.impl.UserServiceImpl"%>
<%@page import="edu.shopsys.service.UserService"%>
<%@page import="edu.shopsys.model.Goods" %>
<%@page import="edu.shopsys.model.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD Xhtml 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<%
	User u = new User();
	u = (User)request.getSession().getAttribute("user");
    UserService service = new UserServiceImpl();
    List<Goods> list = service.queryByclass("飞机");
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="author" content="order by dede58.com"/>
<title>买飞机模型,遥控飞机模型网,直升飞机模型,3d飞机模型,模型玩具</title>
<meta name="description" content="飞机模型玩具可分为垂直起降和滑跑起降两类、垂直起降飞机模型包括直升机等、滑跑起降飞机模型包括滑翔机、三角翼、仿真机、战斗机、旋翼机、3D飞机等都是网上购物麦路客为广大飞机模型爱好者提供的模型玩具." />
<meta name="keywords" content="网上购物,飞机模型,遥控飞机模型,直升飞机模型,3d飞机模型,模型玩具,直升机,直升飞机,滑翔机,滑翔飞机,三角翼飞机,动力三角翼,仿真机,仿真飞机,战斗机,战斗飞机,旋翼机,旋翼飞机,3D飞机" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
<link href="css/base.css" rel="stylesheet" type="text/css" />
<link href="css/category.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="js/jquery-1.2.6.pack.js"></script>
<script type="text/javascript" src="js/public.js"></script>
</head>
<body>
<h1 class="descriptionhide">网上购物,飞机模型,遥控飞机模型,直升飞机模型,3d飞机模型,模型玩具,直升机,直升飞机,滑翔机,滑翔飞机,三角翼飞机,动力三角翼,仿真机,仿真飞机,战斗机,战斗飞机,旋翼机,旋翼飞机,3D飞机</h1>
<div class="side_con">
	<div class="l_m">
		<div class="f_l l_m_l">
			<%
		   if(null != u){%>
		       亲爱的<span><%=u.getUser_name() %></span>您好，欢迎来麦路客商城！<a href="../Login?method=delectUser">[注销]</a>
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
	<div class="breadcrumbs"><a href="index.jsp">首页</a><span>></span>飞机模型</div><!--breadcrumbs end-->
	<div class="area_l con_l">
		<div class="product-sort">
			<h2>商品分类</h2>
			<div class="sort-con">
				<div class="sort-list">
					<h3><span class="f_l icon03"></span><a href="airplane.jsp" class="f_l">飞机模型</a></h3>
					<dl>
						<dt class="current"><span class="f_l arrow"></span><a href="#" class="f_l">垂直</a></dt>
						<dd>
							<a class="current" href="#"><span>·</span>直升机 (<b class="yellow">9</b>)</a>
						</dd>
					</dl>
					<dl>
						<dt class="current"><span class="f_l arrow"></span><a href="#" class="f_l">滑跑</a></dt>
						<dd>
							<a href="#"><span>·</span>滑翔机 (<b class="yellow">9</b>)</a>
							<a href="#"><span>·</span>三角翼 (<b class="yellow">3</b>)</a>
							<a href="#"><span>·</span>仿真机 (<b class="yellow">6</b>)</a>
							<a href="#"><span>·</span>战斗机 (<b class="yellow">0</b>)</a>
							<a href="#"><span>·</span>旋翼机 (<b class="yellow">0</b>)</a>
						</dd>
					</dl>
				</div>
				<div class="sort-list"><h3><span class="f_l icon01"></span><a href="women.jsp" class="f_l">女装</a></h3></div>
				<div class="sort-list"><h3><span class="f_l icon02"></span><a href="man.jsp" class="f_l">男装</a></h3></div>
				<div class="sort-list"><h3><span class="f_l icon04"></span><a href="shoes.jsp" class="f_l">鞋子</a></h3></div>
				<div class="sort-list"><h3><span class="f_l icon05"></span><a href="bags.jsp" class="f_l">箱包</a></h3></div>
			</div><!--sort-con end-->
			<div class="sort-btn"></div>
		</div><!--product-sort end-->
		
		<div class="blank10"></div>
		
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
	
	<div class="area_r con_r">
		<div class="filter">
			<div class="filter-head"><h2 class="f_l">飞机模型<span>-</span>商品筛选</h2><a class="f_r blue" href="#">重置筛选条件</a></div>
			<div class="filter-con">
				<dl class="clearfix">
					<dt>品牌：</dt><dd><span><a class="current" href="#">全部</a></span><span><a href="#">特尔博 </a></span><span><a href="#">彩珀</a></span><span><a href="#">TRUMPETER/小号手</a></span><span><a href="#">TAKARA TOMY/多美卡</a></span><span><a href="#">仙霸</a></span><span><a href="#">Techplaying/太普</a></span><span><a href="#">Toysrus/玩具“反”斗城</a></span><span><a href="#">凯迪威</a></span><span><a href="#">俊基</a></span></dd>
				</dl>
				<dl class="clearfix">
					<dt>类型：</dt><dd><span><a class="current" href="#">全部</a></span><span><a href="#">飞机模型</a></span><span><a href="#">飞盘/飞碟/竹蜻蜓</a></span></span><span><a href="#">惯性/回力/滑行玩具</a></span></span><span><a href="#">电动/遥控飞机</a></span></dd>
				</dl>
				<dl class="clearfix">
					<dt>产地：</dt><dd><span><a class="current" href="#">全部</a></span><span><a href="#">中国大陆</a></span><span><a href="#">亚太</a></span></dd>
				</dl>
				<dl class="clearfix last">
					<dt>价格：</dt><dd><span><a class="current" href="#">全部</a></span><span><a href="#">0-99</a></span><span><a href="#">100-199</a></span><span><a href="#">200-399</a></span><span><a href="#">0-99</a></span></dd>
				</dl>
			</div>
		</div><!--filter end-->
		<div class="filter-last"><div></div></div>
		
		<div class="blank10"></div>
		
		<div class="category">
			<div class="arrangement">
				<h3 class="f_l arrangement_t">排列方式：</h3>
				<ul class="f_l arrangement_m">
					<li><a href="#" class="cur"><span>销量</span></a></li>
					<li><a href="#"><span>价格</span></a></li>
					<li><a href="#"><span>满意度</span></a></li>
					<li><a href="#"><span>上架时间</span></a></li>
				</ul>
				<div class="f_r arrangement_b">
					<div class="page_list">
						<a href="#">上一页</a><a href="#">1</a><span>...</span><a href="#">8</a><a href="#">9</a><a href="#">10</a><span>...</span><a href="#">60</a><a href="#">下一页</a>
					</div><!--page_list end-->
				</div><!--arrangement_b end-->
			</div><!--arrangement end-->
			
			<div class="total"><p class="f_r yellow">共<b class="red">5</b>个商品</p></div><!--total end-->
			
			<div class="StyleListProduct">
				<ul class="clearfix">
					<%
				    if(null != list){
				        for(Goods good : list){%>
						    <li>
								<a class="p_photo" title="<%=good.getGoods_name() %>" href="SearchController?method=detailSearch&goods=<%=good.getGoods_id() %>"><img alt="<%=good.getGoods_name() %>" src="images/spacer.gif" lazyload="<%=good.getGoods_image() %>" width="150" height="205" class="load_img pic" /></a>						
								<div class="p_name"><a href="SearchController?method=detailSearch&goods=<%=good.getGoods_id() %>"><%=good.getGoods_name() %></a></div>
								<div class="p_price"><del title="市场价">¥<%=good.getGoods_price()+good.getGoods_price()*0.3%>元</del><strong title="麦路客价">¥<%=good.getGoods_price() %>元</strong></div>
								<div class="p_safe"><span class="blue">满意度：5.0分</span><span class="icon jifen" title="送积分"></span></div>
								<div class="p_button"><a href="SearchController?method=detailSearch&goods=<%=good.getGoods_id() %>">购买</a><a href="my-favorites.jsp">收藏</a></div>
								<div class="preview"><p class="pic"><%=good.getGoods_image() %></p></div>
							</li>
				        <%}
				    }else{
				        
				    }%>				
				</ul>
			</div><!--StyleListProduct end-->
			
			<div class="pop_arrow" id="pop_ico" style="display:none"></div>
			<div id="pop_detail" style="position:absolute"></div>
				
			<div class="bottom_page">		
				<div class="page_list">
					<a href="#">上一页</a><a href="#">1</a><span>...</span><a href="#">8</a><a href="#">9</a><a href="#">10</a><span>...</span><a href="#">60</a><a href="#">下一页</a>
				</div><!--page_list end-->
			</div><!--bottom_page end-->	
		</div><!--category end-->
	</div><!--right end-->
	<div class="clear mb-10"></div>
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
<!-- category -->
<script type="text/javascript" src="js/thickbox.js"></script>
<script type="text/javascript" src="js/category.js"></script>
<!-- online -->
<script type="text/javascript" src="js/online.js"></script>
</body>
</html>