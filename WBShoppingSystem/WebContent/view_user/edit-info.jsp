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
<link href="css/personal.css" rel="stylesheet" type="text/css" />
<link href="css/userdetail.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.2.6.pack.js"></script>
<script type="text/javascript" src="js/public.js"></script>

<script type="text/javascript" src="js/user.js"></script>
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
		<a href="index.jsp">首页</a><span>></span><a href="#">我的</a><span>></span>编辑个人信息
	</div><!--breadcrumbs end-->	
	<div class="f_l personal_l">
		<h2><a href="my-mesaer.jsp" title="我的">我的</a></h2>
		<div class="personal_l_m" id="personal_list">
			<dl>
				<dt class="current"><div><b class="f_l"></b>帐户管理</div></dt>
				<dd>
					<a href="my-order.jsp">我的订单</a>
					<a href="my-points.jsp">我的积分</a>
					<a href="account-balance.jsp">账户余额</a>
					<a href="my-favorites.jsp">我的收藏夹</a>
					<a href="e-coupons.jsp">电子优惠券</a>
				</dd>
			</dl>
			<dl>
				<dt class="current"><div><b class="f_l"></b>个人信息管理</div></dt>
				<dd>
					<a href="edit-info.jsp" class="current">编辑个人信息</a>
					<a href="change-password.jsp">修改密码</a>
					<a href="modify-information.jsp">修改送货信息</a>
				</dd>
			</dl>
			<dl>
				<dt class="current"><div><b class="f_l"></b>推荐用户奖励积分</div></dt>
				<dd>
					<a href="invite-friends.jsp">邀请好友</a>
				</dd>
			</dl>
			<dl>
				<dt class="current"><div><b class="f_l"></b>商品评论与问答</div></dt>
				<dd>
					<a href="my-comments.jsp">我的评论</a>
					<a href="my-faq.jsp">我的问答</a>
				</dd>
			</dl>
		</div><!--personal_l_m end-->
		<div class="personal_l_b"></div>
	</div><!--personal_l end-->
	
	<div class="f_r personal_r">
		<div class="personal_r_t"></div>
		<div class="personal_r_m">
			<div class="personal_r_m_t">
				<h2>编辑个人信息</h2>
			</div><!--personal_r_m_t end-->
			<div class="personal_r_m_m edit_info">
			<form method="post" action="" id="">
				<div class="blank10"></div>
				<div class="edit_info_t"><h3 class="f_l">个人基本信息</h3><p class="f_r">带<span class="red">(*)</span>的为必填项</p></div>
				<div class="edit_info_m">
					<table width="100%">
						<tbody>
							<tr>
								<td align="right" width="140px"><span class="red">*</span> 姓名：</td>
								<td><input type="text" name="" id="" value="" class="info_input info_input_170" /></td>
							</tr>
							<tr>
								<td align="right">昵称：</td>
								<td><input type="text" name="" id="" value="" class="info_input info_input_170" /></td>
							</tr>
							<tr>
								<td align="right"><span class="red">*</span> 性别：</td>
								<td>
									<input type="radio" name="1" value="men" id="men" /><label for="men">男</label>
									<input type="radio" name="1" value="women" id="women" /><label for="women">女</label>
								</td>
							</tr>
							<tr>
								<td align="right"><span class="red">*</span> <span style="font-family:Arial;">Email</span>：</td>
								<td><input type="text" name="" id="" value="" class="info_input info_input_170" /></td>
							</tr>
							<tr>
								<td align="right"><span class="red">*</span> 手机：</td>
								<td><input type="text" name="" id="" value="" class="info_input info_input_170" /></td>
							</tr>
							<tr>
								<td align="right"><span class="red">*</span> 居住城市：</td>
								<td>
									<select id="" name=""><option value="">省/直辖市</option></select>
									<select id="" name=""><option value="">城市</option></select>
									<select id="" name=""><option value="">县/区</option></select>
								</td>
							</tr>
							<tr>
								<td align="right" valign="top"><span class="red">*</span> 详细地址：</td>
								<td>
									<div>
										<input type="radio" name="1" value="family" id="family" checked="checked" /><label for="family">家庭地址</label>
										<input type="radio" name="1" value="company" id="company" /><label for="company">公司地址</label>
										<input type="radio" name="1" value="schools" id="schools" /><label for="schools">学校地址</label>
										<input type="radio" name="1" value="other" id="other" /><label for="other">其他</label>
									</div>
									<div class="blank10"></div>
									<div><input type="text" name="" id="" value="" class="info_input info_input_300" /></div>
								</td>
							</tr>
							<tr>
								<td align="right">邮政编码：</td>
								<td><input type="text" name="" id="" value="" class="info_input info_input_170" /></td>
							</tr>
						</tbody>
					</table>
				</div><!--edit_info_m end-->
				
				<div class="blank10"></div>
				
				<div class="edit_info_t"><h3>个人选填信息</h3></div>
				<div class="edit_info_m">
					<table width="100%">
						<tbody>
							<tr>
								<td align="right" width="140px">固定电话：</td>
								<td><input type="text" name="" id="" value="" class="info_input info_input_170" /></td>
							</tr>
							<tr>
								<td align="right">出生日期：</td>
								<td>
									<select onchange="" id="Year" name="Year">
							<option value="" selected="selected">请选择&nbsp;</option>
						<option value="2010">2010</option><option value="2009">2009</option><option value="2008">2008</option><option value="2007">2007</option><option value="2006">2006</option><option value="2005">2005</option><option value="2004">2004</option><option value="2003">2003</option><option value="2002">2002</option><option value="2001">2001</option><option value="2000">2000</option><option value="1999">1999</option><option value="1998">1998</option><option value="1997">1997</option><option value="1996">1996</option><option value="1995">1995</option><option value="1994">1994</option><option value="1993">1993</option><option value="1992">1992</option><option value="1991">1991</option><option value="1990">1990</option><option value="1989">1989</option><option value="1988">1988</option><option value="1987">1987</option><option value="1986">1986</option><option value="1985">1985</option><option value="1984">1984</option><option value="1983">1983</option><option value="1982">1982</option><option value="1981">1981</option><option value="1980">1980</option><option value="1979">1979</option><option value="1978">1978</option><option value="1977">1977</option><option value="1976">1976</option><option value="1975">1975</option><option value="1974">1974</option><option value="1973">1973</option><option value="1972">1972</option><option value="1971">1971</option><option value="1970">1970</option><option value="1969">1969</option><option value="1968">1968</option><option value="1967">1967</option><option value="1966">1966</option><option value="1965">1965</option><option value="1964">1964</option><option value="1963">1963</option><option value="1962">1962</option><option value="1961">1961</option><option value="1960">1960</option><option value="1959">1959</option><option value="1958">1958</option><option value="1957">1957</option><option value="1956">1956</option><option value="1955">1955</option><option value="1954">1954</option><option value="1953">1953</option><option value="1952">1952</option><option value="1951">1951</option><option value="1950">1950</option><option value="1949">1949</option><option value="1948">1948</option><option value="1947">1947</option><option value="1946">1946</option><option value="1945">1945</option><option value="1944">1944</option><option value="1943">1943</option><option value="1942">1942</option><option value="1941">1941</option><option value="1940">1940</option></select>
						<label for="Year">年</label>
						<select onchange="" id="Month" name="Month"> 
							<option value="" selected="selected">请选择&nbsp;</option>
						<option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option></select>
						<label for="Month">月</label>
						<select id="Day" name="Day">
							<option value="" selected="selected">请选择&nbsp;</option>
						<option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option><option value="29">29</option><option value="30">30</option><option value="31">31</option></select>
						<label for="Day">日</label>
								</td>
							</tr>
							<tr>
								<td align="right">身高：</td>
								<td>
									<select id="Height" name="Height">
										<option value="" selected="selected">请选择&nbsp;</option>
										<option value="150CM 以下">150CM 以下</option>
										<option value="150～159CM">150～159CM</option>
										<option value="160～164CM">160～164CM</option>
										<option value="165～169CM">165～169CM</option>
										<option value="170～174CM">170～174CM</option>
										<option value="175～179CM">175～179CM</option>
										<option value="180～184CM">180～184CM</option>
										<option value="185～189CM">185～189CM</option>
										<option value="190CM 以上">190CM 以上</option>
									</select>
								</td>
							</tr>
							<tr>
								<td align="right">体重：</td>
								<td>
									<select id="Weight" name="Weight">
										<option value="" selected="selected">请选择&nbsp;</option>
										<option value="40KG 以下">40KG 以下</option>
										<option value="41KG～50KG">41KG～50KG</option>
										<option value="51KG～55KG">51KG～55KG</option>
										<option value="56KG～60KG">56KG～60KG</option>
										<option value="61KG～70KG">61KG～70KG</option>
										<option value="71KG～80KG">71KG～80KG</option>
										<option value="81KG～100KG">81KG～100KG</option>
										<option value="100KG 以上">100KG 以上</option>
									</select>
								</td>
							</tr>
							<tr>
								<td align="right">婚姻状况：</td>
								<td>
									<select onchange="" id="MarriageStatus" name="MarriageStatus">
										<option value="" selected="selected">请选择&nbsp;</option>
										<option value="已婚且有子女">已婚且有子女</option>
										<option value="已婚暂无子女">已婚暂无子女</option>
										<option value="恋爱中">恋爱中</option>
										<option value="单身">单身</option>
									</select>
								</td>
							</tr>
							<tr>
								<td align="right">教育程度：</td>
								<td>
									<select id="EducationLevel" name="EducationLevel">
										<option value="" selected="selected">请选择&nbsp;</option>
										<option value="高中及以下">高中及以下</option>
										<option value="大学专科">大学专科</option>
										<option value="大学本科">大学本科</option>
										<option value="硕士">硕士</option>
										<option value="博士及以上">博士及以上</option>
									</select>
								</td>
							</tr>
							<tr>
								<td align="right">从事职业：</td>
								<td>
									<select id="Vocation" name="Vocation">
										<option value="" selected="selected">请选择&nbsp;</option>
										<option value="企业雇主/企业经营者">企业雇主/企业经营者</option>
										<option value="高级行政人员(行政总裁、总经理、董事等)">高级行政人员(行政总裁、总经理、董事等)</option>
										<option value="中层管理人员(总监、经理、主任等)">中层管理人员(总监、经理、主任等)</option>
										<option value="专业人士(会计师、律师、工程师、医生、教师等)">专业人士(会计师、律师、工程师、医生、教师等)</option>
										<option value="办公职员(一般文职、业务、办事人员等)工人、蓝领">办公职员(一般文职、业务、办事人员等)工人、蓝领</option>
										<option value="工人/蓝领">工人/蓝领</option>
										<option value="公务员、公共事业单位员工">公务员、公共事业单位员工</option>
										<option value="自由职业者">自由职业者</option>
										<option value="军人">军人</option>
										<option value="学生">学生</option>
										<option value="退休/无业人员">退休/无业人员</option>
										<option value="家庭主妇">家庭主妇</option>
										<option value="其他">其他</option>
									</select>
								</td>
							</tr>
							<tr>
								<td align="right" valign="top">工作所属行业：</td>
								<td>
									<select id="Industry" name="Industry">
										<option selected="selected" value="">请选择&nbsp;</option>
										<option value="政府机关/社会团体">政府机关/社会团体</option>
										<option value="邮电通讯">邮电通讯</option>
										<option value="IT业/互联网">IT业/互联网</option>
										<option value="商业/贸易">商业/贸易</option>
										<option value="旅游/餐饮/酒店">旅游/餐饮/酒店</option>
										<option value="银行/金融/证券/保险/投资">银行/金融/证券/保险/投资</option>
										<option value="健康/医疗服务">健康/医疗服务</option>
										<option value="建筑/房地产">建筑/房地产</option>
										<option value="交通运输/物流仓储">交通运输/物流仓储</option>
										<option value="法律/司法">法律/司法</option>
										<option value="文化/娱乐/体育">文化/娱乐/体育</option>
										<option value="媒介/广告/咨询">媒介/广告/咨询</option>
										<option value="教育/科研">教育/科研</option>
										<option value="林业/农业/牧业/渔业">林业/农业/牧业/渔业</option>
										<option value="制造业(轻工业)">制造业(轻工业)</option>
										<option value="制造业(重工业)">制造业(重工业)</option>
										<option value="能源/公用事业">能源/公用事业</option>
										<option value="其他">其他</option>
									</select>
								</td>
							</tr>
							<tr>
								<td align="right">月均收入：</td>
								<td>
									<select id="MonthEarning" name="MonthEarning">
										<option value="" selected="selected">请选择&nbsp;</option>
										<option value="无收入">无收入</option>
										<option value="2000 元以下">2000 元以下</option>
										<option value="2000～3999 元">2000～3999 元</option>
										<option value="4000～5999 元">4000～5999 元</option>
										<option value="6000～7999 元">6000～7999 元</option>
										<option value="8000～9999 元">8000～9999 元</option>
										<option value="10000～15000 元">10000～15000 元</option>
										<option value="15000 元以上">15000 元以上</option>
									</select>
								</td>
							</tr>
							<tr>
								<td align="right">所穿鞋码：</td>
								<td>
									<select id="ShoeSize" name="ShoeSize">
										<option value="" selected="selected">请选择&nbsp;</option>
										<option value="35">35</option>
										<option value="36">36</option>
										<option value="37">37</option>
										<option value="38">38</option>
										<option value="39">39</option>
										<option value="40">40</option>
										<option value="41">41</option>
										<option value="42">42</option>
										<option value="43">43</option>
										<option value="44">44</option>
										<option value="45">45</option>
										<option value="46">46</option>
									</select>
								</td>
							</tr>
							<tr>
								<td align="right" valign="top">喜欢的颜色：</td>
								<td>
									<ul class="ColorItem">
										 <li class="ColorControl"><input type="checkbox" value="1" id="f_check_1"></li>
										 <li class="ColorFont"><label for="f_check_1">黑色</label></li>
										 <li class="ColorWK"><input disabled="disabled" class="div_1"></li>
										 <li class="ColorControl"><input type="checkbox" value="2" id="f_check_2"></li>
										 <li class="ColorFont"><label for="f_check_2">白色</label></li>
										 <li class="ColorWK"><input disabled="disabled" class="div_2"></li>
										 <li class="ColorControl"><input type="checkbox" value="3" id="f_check_3"></li>
										 <li class="ColorFont"><label for="f_check_3">灰色</label></li>
										 <li class="ColorWK"><input disabled="disabled" class="div_3"></li>
									</ul>
									<ul class="ColorItem">
										 <li class="ColorControl"><input type="checkbox" value="4" id="f_check_4"></li>
										 <li class="ColorFont"><label for="f_check_4">银色</label></li>
										 <li class="ColorWK"><input disabled="disabled" class="div_4"></li>
										 <li class="ColorControl"><input type="checkbox" value="5" id="f_check_5"></li>
										 <li class="ColorFont"><label for="f_check_5">米色</label></li>
										 <li class="ColorWK"><input disabled="disabled" class="div_5"></li>
										 <li class="ColorControl"><input type="checkbox" value="6" id="f_check_6"></li>
										 <li class="ColorFont"><label for="f_check_6">浅蓝</label></li>
										 <li class="ColorWK"><input disabled="disabled" class="div_6"></li>
									</ul>
									<ul class="ColorItem">
										 <li class="ColorControl"><input type="checkbox" value="7" id="f_check_7"></li>
										 <li class="ColorFont"><label for="f_check_7">蓝色</label></li>
										 <li class="ColorWK"><input disabled="disabled" class="div_7"></li>
										 <li class="ColorControl"><input type="checkbox" value="8" id="f_check_8"></li>
										 <li class="ColorFont"><label for="f_check_8">深蓝</label></li>
										 <li class="ColorWK"><input disabled="disabled" class="div_8"></li>
										 <li class="ColorControl"><input type="checkbox" value="9" id="f_check_9"></li>
										 <li class="ColorFont"><label for="f_check_9">青蓝</label></li>
										 <li class="ColorWK"><input disabled="disabled" class="div_9"></li>
									</ul>
									<ul class="ColorItem">
										 <li class="ColorControl"><input type="checkbox" value="10" id="f_check_10"></li>
										 <li class="ColorFont"><label for="f_check_10">粉红</label></li>
										 <li class="ColorWK"><input disabled="disabled" class="div_10"></li>
										 <li class="ColorControl"><input type="checkbox" value="11" id="f_check_11"></li>
										 <li class="ColorFont"><label for="f_check_11">红色</label></li>
										 <li class="ColorWK"><input disabled="disabled" class="div_11"></li>
										 <li class="ColorControl"><input type="checkbox" value="12" id="f_check_12"></li>
										 <li class="ColorFont"><label for="f_check_12">深红</label></li>
										 <li class="ColorWK"><input disabled="disabled" class="div_12"></li>
									</ul>  
									<ul class="ColorItem">
										 <li class="ColorControl"><input type="checkbox" value="13" id="f_check_13"></li>
										 <li class="ColorFont"><label for="f_check_13">浅绿</label></li>
										 <li class="ColorWK"><input disabled="disabled" class="div_13"></li>
										 <li class="ColorControl"><input type="checkbox" value="14" id="f_check_14"></li>
										 <li class="ColorFont"><label for="f_check_14">绿色</label></li>
										 <li class="ColorWK"><input disabled="disabled" class="div_14"></li>
										 <li class="ColorControl"><input type="checkbox" value="15" id="f_check_15"></li>
										 <li class="ColorFont"><label for="f_check_15">深绿</label></li>
										 <li class="ColorWK"><input disabled="disabled" class="div_15"></li>
									</ul>  
									<ul class="ColorItem">
										 <li class="ColorControl"><input type="checkbox" value="16" id="f_check_16"></li>
										 <li class="ColorFont"><label for="f_check_16">黄色</label></li>
										 <li class="ColorWK"><input disabled="disabled" class="div_16"></li>
										 <li class="ColorControl"><input type="checkbox" value="17" id="f_check_17"></li>
										 <li class="ColorFont"><label for="f_check_17">浅黄</label></li>
										 <li class="ColorWK"><input disabled="disabled" class="div_17"></li>
										 <li class="ColorControl"><input type="checkbox" value="18" id="f_check_18"></li>
										 <li class="ColorFont"><label for="f_check_18">橙色</label></li>
										 <li class="ColorWK"><input disabled="disabled" class="div_18"></li>
									</ul>   
									<ul class="ColorItem">
										 <li class="ColorControl"><input type="checkbox" value="19" id="f_check_19"></li>
										 <li class="ColorFont"><label for="f_check_19">金色</label></li>
										 <li class="ColorWK"><input disabled="disabled" class="div_19"></li>
										 <li class="ColorControl"><input type="checkbox" value="20" id="f_check_20"></li>
										 <li class="ColorFont"><label for="f_check_20">褐色</label></li>
										 <li class="ColorWK"><input disabled="disabled" class="div_20"></li>
										 <li class="ColorControl"><input type="checkbox" value="21" id="f_check_21"></li>
										 <li class="ColorFont"><label for="f_check_21">紫色</label></li>
										 <li class="ColorWK"><input disabled="disabled" class="div_21"></li>
									</ul>     
								</td>
							</tr>
							<tr>
								<td align="right" valign="top">常穿的服装类型：</td>
								<td>
									<ul class="TypeItem">
										<li class="TypeControl"><input type="checkbox" value="1" id="o_check_1"></li>
										<li class="TypeFont"><label for="o_check_1">商务正装</label></li>
										<li class="TypeControl"><input type="checkbox" value="2" id="o_check_2"></li>
										<li class="TypeFont"><label for="o_check_2">商务休闲装</label></li>
									</ul>
									<ul class="TypeItem">
										<li class="TypeControl"><input type="checkbox" value="3" id="o_check_3"></li>
										<li class="TypeFont"><label for="o_check_3">时尚服装</label></li>
										<li class="TypeControl"><input type="checkbox" value="4" id="o_check_4"></li>
										<li class="TypeFont"><label for="o_check_4">生活休闲服饰</label></li>
									</ul>
									<ul class="TypeItem">
										<li class="TypeControl"><input type="checkbox" value="5" id="o_check_5"></li>
										<li class="TypeFont"><label for="o_check_5">运动服装</label></li>
										<li class="TypeControl"><input type="checkbox" value="6" id="o_check_6"></li>
										<li class="TypeFont"><label for="o_check_6">民族服装</label></li>
									</ul>
									<ul class="TypeItem">
										<li class="TypeControl"><input type="checkbox" value="7" id="o_check_7"></li>
										<li class="TypeFont"><label for="o_check_7">其他</label></li>
									 </ul>
								</td>
							</tr>
							<tr>
								<td align="right" valign="top">喜欢的服装品牌：</td>
								<td><textarea name="" id="" class="l_text"></textarea></td>
							</tr>
							<tr>
								<td align="right" valign="top">兴趣爱好：</td>
								<td><textarea name="" id="" class="l_text"></textarea></td>
							</tr>
						</tbody>
					</table>
					<div class="edit_info_button">
						<input type="submit" name="" value="保&nbsp;&nbsp;存" id="" class="yellow_button yellow_button_01" />
					</div><!--edit_info_button end-->
				</div><!--edit_info_m end-->
			</form>	
			</div><!--edit_info end-->
		</div><!--personal_r_m end-->
		<div class="personal_r_b"></div>
	</div><!--personal_r end-->
	
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
<!-- online -->
<script type="text/javascript" src="js/online.js"></script>
</body>
</html>