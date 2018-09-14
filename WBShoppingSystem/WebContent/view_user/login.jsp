<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="author" content="order by dede58.com" />
<title>登录 注册-麦路客商城</title>
<meta name="keywords"
	content="登录 注册, 麦路客商城 服装,直销,衬衣,衬衫,牛津纺,经纬80公里全棉衬衫,领带,毛背心,卡其裤" />
<meta name="description"
	content="登录 注册是麦路客商城品牌系列产品之一，麦路客商城是专业生产和销售男装的品牌，包括正装衬衣、休闲衬衣、短袖衬衣、全棉免烫牛津纺衬衫、经纬80公里全棉衬衫、领带、毛背心、卡其裤。" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
<link href="css/base.css" rel="stylesheet" type="text/css" />
<link href="css/order.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.2.6.pack.js"></script>
<script type="text/javascript" src="js/public.js"></script>
<script type="text/javascript">
	
	
	/* 则传到后台的路径为：xxxselect另外带过去一个变量id=($('#xxx').val()的值);
	后台接收的方式是： @RequestMapping(value="xxxselect")
	public String getlistSelect(Model model,Integer id){
	　　return xxx;
	} */
	$(document).ready(function(){
		//通过物证码输入框的bhur事件，触发此函数
		$("#checkcodeId").blur(function(){
			var checkcode = $("#checkcodeId").val();
			//在服务相对验证码进行校验
			$.post(
			"CheckCodeServlet",
			"checkcode="+checkoode,
			//报据返国的图片路怪，显示不同的提示图片
			function(result){
			var resultHtml=$("imgyan src='"+result+"'height='15px'widh'l5px'/>");
			S("#resultTip").html(resultHtml);
			}
			);
		});
	});
	
	

     //	  刷新放证码
		function reloadCheckImg($img){
		$("img[name='yan']").attr("src","imgyan.jsp?t="+(new Date().getTime()));	
		}

	/*  $(function(){
	 function loginSuc(){
	 var uname = $("#loginname").val();
	 var upwd = $("#loginpwd").val();
	 $.ajax({
	 url:"Login",
	 type:"login",
	 //data:"uname="+uname"&upwd="+upwd,
	 });
	 }
	 });  */
</script>
</head>
<body>
	<div class="side_con">
		<div class="l_m">
			<div class="f_l l_m_l">
				您好，欢迎来麦路客商城！<a href="login.jsp" class="huise">[登录]</a><a
					href="register.jsp" class="huise">[免费注册]</a>
			</div>
			<!--l_m_l end-->
			<div class="f_r l_m_r">
				<ul class="clearfix">
					<li class="collect"><a onclick="bookmark();"
						href="javascript:void(0);">加入收藏</a></li>
					<li><a href="index.jsp">帮助中心</a></li>
					<li><a href="my-order.jsp" class="yellow">我的订单</a></li>
					<li class="my-mesaer"><a href="my-mesaer.jsp">我的麦路客<span
							class="arrow"></span></a>
						<ul id="my-list">
							<li><a href="my-order.jsp">我的订单</a></li>
							<li><a href="my-faq.jsp">我的问答</a></li>
							<li><a href="my-favorites.jsp">我的收藏</a></li>
							<li><a href="my-points.jsp">我的积分</a></li>
						</ul></li>
				</ul>
			</div>
			<!--l_m_r end-->
		</div>
		<!--l_m end-->
	</div>
	<!--side_con end-->
	<div class="header container">
		<div class="l_s">
			<a class="f_l logo" href="index.jsp"><img src="images/logo.gif"
				alt="麦路客商城" width="152" height="71" /></a>
			<!-- 搜索框 -->
			<div class="f_l l_s_l">
				<form method="post" action="SearchController?method=keyword"
					id="ui_element">
					<div class="f_l input_l">
						<input type="text" name="keyword" id="birds" class="sb_input text"
							value="" autocomplete="off"
							onkeydown="javascript:if(event.keyCode==13) search('key');"><ul
								id="tieslide"></ul>
					</div>
					<div class="f_l input_r">
						<button type="submit" onclick="search('key');return false;">搜商品</button>
					</div>
				</form>
			</div>
			<!--l_s_l end-->
			<ul class="f_r l_s_r">
				<li class="icon_01"><a href="help/payment.jsp">货到付款</a></li>
				<li class="icon_02"><a href="help/payment.jsp">支付宝支付</a></li>
				<li class="icon_03"><a href="help/policy.jsp">7天退换</a></li>
				<li class="icon_04"><a href="help/invoice-system.jsp">提供发票</a></li>
			</ul>
			<!--l_s_r end-->
		</div>
		<!--l_s end-->
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
					<a class="gocart" href="cart.jsp">购物车
					</a> <a class="gopay" href="not-address.jsp">去结账</a>
				</div>
			</div>
			<!--floor_nav end-->
			<div class="sub-floor-menus">
				<div class="menu" id="sub_floor_1">
					<div class="meun_sort">
						<div class="sort clearfix">
							<ul class="f_l sort_nav">
								<li>
									<dl>
										<dt>
											<a href="#">垂直 ></a>
										</dt>
										<dd>
											<span><a href="#">直升机</a></span>
										</dd>
									</dl>
								</li>
								<li>
									<dl>
										<dt>
											<a href="#">滑跑 ></a>
										</dt>
										<dd>
											<span><a href="#">滑翔机</a></span><span><a href="#">三角翼</a></span><span><a
												href="#">仿真机</a></span><span><a href="#">战斗机</a></span><span><a
												href="#">旋翼机</a></span>
										</dd>
									</dl>
								</li>
							</ul>
							<!--sort_nav end-->
							<div class="f_l sort_pp">
								<h3>热门品牌</h3>
								<ul>
									<li><a href="#">JACKJONES</a><a href="#">九牧王</a><a
										href="#">七匹狼</a><a href="#">马克华菲</a><a href="#">稻草人</a><a
										href="#">TONYJEANS</a><a href="#">凡诺</a></li>
								</ul>
								<div class="blank10"></div>
								<h3>新品推荐</h3>
								<p align="center">
									<a href="#"><img src="images/polo.jpg" width="135"
										height="137" alt="美素活悦弹力系列" /></a>
								</p>
							</div>
							<!--sort_pp end-->
						</div>
						<!--sort end-->
					</div>
					<!--meun_sort end-->
				</div>
				<!--sub_floor_1 end-->
				<div class="menu" id="sub_floor_2">
					<div class="meun_sort">
						<div class="sort clearfix">
							<ul class="f_l sort_nav">
								<li>
									<dl>
										<dt>
											<a href="#">上装 ></a>
										</dt>
										<dd>
											<span><a href="#">T恤</a></span><span><a href="#">背心</a></span><span><a
												href="#">长袖</a></span><span><a href="#">衬衫</a></span><span><a
												href="#">棉毛衫</a></span><span><a href="#">雪纺纱</a></span><span><a
												href="#">吊带衫</a></span><span><a href="#">针织衫</a></span><span><a
												href="#">毛衣</a></span><span><a href="#">风衣</a></span><span><a
												href="#">马甲</a></span><span><a href="#">大衣</a></span><span><a
												href="#">羽绒服</a></span>
										</dd>
									</dl>
								</li>
								<li>
									<dl>
										<dt>
											<a href="#">下装 ></a>
										</dt>
										<dd>
											<span><a href="#">牛仔裤</a></span><span><a href="#">休闲裤</a></span><span><a
												href="#">短裤</a></span><span><a href="#">运动裤</a></span><span><a
												href="#">裤子</a></span>
										</dd>
									</dl>
								</li>
								<li>
									<dl>
										<dt>
											<a href="#">裙子 ></a>
										</dt>
										<dd>
											<span><a href="#">连衣裙</a></span><span><a href="#">半身裙</a></span>
										</dd>
									</dl>
								</li>
								<li>
									<dl>
										<dt>
											<a href="#">袜子 ></a>
										</dt>
										<dd>
											<span><a href="#">丝袜</a></span><span><a href="#">短袜</a></span><span><a
												href="#">长袜</a></span>
										</dd>
									</dl>
								</li>
							</ul>
							<!--sort_nav end-->
							<div class="f_l sort_pp">
								<h3>热门品牌</h3>
								<ul>
									<li><a href="#">JACKJONES</a><a href="#">九牧王</a><a
										href="#">七匹狼</a><a href="#">马克华菲</a><a href="#">稻草人</a><a
										href="#">TONYJEANS</a><a href="#">凡诺</a></li>
								</ul>
								<div class="blank10"></div>
								<h3>新品推荐</h3>
								<p align="center">
									<a href="#"><img src="images/polo.jpg" width="135"
										height="137" alt="美素活悦弹力系列" /></a>
								</p>
							</div>
							<!--sort_pp end-->
						</div>
						<!--sort end-->
					</div>
					<!--meun_sort end-->
				</div>
				<!--sub_floor_2 end-->
				<div class="menu" id="sub_floor_3">
					<div class="meun_sort">
						<div class="sort clearfix">
							<ul class="f_l sort_nav">
								<li>
									<dl>
										<dt>
											<a href="#">上装 ></a>
										</dt>
										<dd>
											<span><a href="#">T恤</a></span><span><a href="#">背心</a></span><span><a
												href="#">长袖</a></span><span><a href="#">衬衫</a></span><span><a
												href="#">棉毛衫</a></span><span><a href="#">针织衫</a></span><span><a
												href="#">毛衣</a></span><span><a href="#">马甲</a></span><span><a
												href="#">大衣</a></span><span><a href="#">羽绒服</a></span>
										</dd>
									</dl>
								</li>
								<li>
									<dl>
										<dt>
											<a href="#">下装 ></a>
										</dt>
										<dd>
											<span><a href="#">牛仔裤</a></span><span><a href="#">休闲裤</a></span><span><a
												href="#">短裤</a></span><span><a href="#">运动裤</a></span><span><a
												href="#">裤子</a></span>
										</dd>
									</dl>
								</li>
								<li>
									<dl>
										<dt>
											<a href="#">袜子 ></a>
										</dt>
										<dd>
											<span><a href="#">短袜</a></span><span><a href="#">长袜</a></span>
										</dd>
									</dl>
								</li>
							</ul>
							<!--sort_nav end-->
							<div class="f_l sort_pp">
								<h3>热门品牌</h3>
								<ul>
									<li><a href="#">JACKJONES</a><a href="#">九牧王</a><a
										href="#">七匹狼</a><a href="#">马克华菲</a><a href="#">稻草人</a><a
										href="#">TONYJEANS</a><a href="#">凡诺</a></li>
								</ul>
								<div class="blank10"></div>
								<h3>新品推荐</h3>
								<p align="center">
									<a href="#"><img src="images/polo.jpg" width="135"
										height="137" alt="美素活悦弹力系列" /></a>
								</p>
							</div>
							<!--sort_pp end-->
						</div>
						<!--sort end-->
					</div>
					<!--meun_sort end-->
				</div>
				<!--sub_floor_3 end-->
				<div class="menu" id="sub_floor_4">
					<div class="meun_sort">
						<div class="sort clearfix">
							<ul class="f_l sort_nav">
								<li>
									<dl>
										<dt>
											<a href="#">男鞋 ></a>
										</dt>
										<dd>
											<span><a href="#">凉鞋</a></span><span><a href="#">单鞋</a></span><span><a
												href="#">家居鞋</a></span><span><a href="#">休闲鞋</a></span><span><a
												href="#">运动鞋</a></span>
										</dd>
									</dl>
								</li>
								<li>
									<dl>
										<dt>
											<a href="#">女鞋 ></a>
										</dt>
										<dd>
											<span><a href="#">凉鞋</a></span><span><a href="#">单鞋</a></span><span><a
												href="#">高跟鞋</a></span><span><a href="#">靴子</a></span><span><a
												href="#">家居鞋</a></span><span><a href="#">休闲鞋</a></span><span><a
												href="#">运动鞋</a></span>
										</dd>
									</dl>
								</li>
							</ul>
							<!--sort_nav end-->
							<div class="f_l sort_pp">
								<h3>热门品牌</h3>
								<ul>
									<li><a href="#">JACKJONES</a><a href="#">九牧王</a><a
										href="#">七匹狼</a><a href="#">马克华菲</a><a href="#">稻草人</a><a
										href="#">TONYJEANS</a><a href="#">凡诺</a></li>
								</ul>
								<div class="blank10"></div>
								<h3>新品推荐</h3>
								<p align="center">
									<a href="#"><img src="images/polo.jpg" width="135"
										height="137" alt="美素活悦弹力系列" /></a>
								</p>
							</div>
							<!--sort_pp end-->
						</div>
						<!--sort end-->
					</div>
					<!--meun_sort end-->
				</div>
				<!--sub_floor_4 end-->
				<div class="menu" id="sub_floor_5">
					<div class="meun_sort">
						<div class="sort clearfix">
							<ul class="f_l sort_nav">
								<li>
									<dl>
										<dt>
											<a href="#">女包 ></a>
										</dt>
										<dd>
											<span><a href="#">单肩包</a></span><span><a href="#">斜挎包</a></span><span><a
												href="#">手提包</a></span><span><a href="#">钱包</a></span><span><a
												href="#">手包</a></span><span><a href="#">胸包</a></span><span><a
												href="#">手提/斜肩两用包</a></span>
										</dd>
									</dl>
								</li>
								<li>
									<dl>
										<dt>
											<a href="#">男包 ></a>
										</dt>
										<dd>
											<span><a href="#">公文包</a></span><span><a href="#">斜肩包</a></span><span><a
												href="#">钱包</a></span><span><a href="#">手包</a></span><span><a
												href="#">手提/斜肩两用包</a></span>
										</dd>
									</dl>
								</li>
								<li>
									<dl>
										<dt>
											<a href="#">电脑包 ></a>
										</dt>
										<dd>
											<span><a href="#">双肩电脑包</a></span><span><a href="#">手提电脑包</a></span><span><a
												href="#">相机包</a></span>
										</dd>
									</dl>
								</li>
								<li>
									<dl>
										<dt>
											<a href="#">旅行包 ></a>
										</dt>
										<dd>
											<span><a href="#">拉杆箱</a></span><span><a href="#">旅行包</a></span><span><a
												href="#">双肩包</a></span><span><a href="#">书包</a></span>
										</dd>
									</dl>
								</li>
							</ul>
							<!--sort_nav end-->
							<div class="f_l sort_pp">
								<h3>热门品牌</h3>
								<ul>
									<li><a href="#">JACKJONES</a><a href="#">九牧王</a><a
										href="#">七匹狼</a><a href="#">马克华菲</a><a href="#">稻草人</a><a
										href="#">TONYJEANS</a><a href="#">凡诺</a></li>
								</ul>
								<div class="blank10"></div>
								<h3>新品推荐</h3>
								<p align="center">
									<a href="#"><img src="images/polo.jpg" width="135"
										height="137" alt="美素活悦弹力系列" /></a>
								</p>
							</div>
							<!--sort_pp end-->
						</div>
						<!--sort end-->
					</div>
					<!--meun_sort end-->
				</div>
				<!--sub_floor_5 end-->
			</div>
			<!--sub_floor_menus end-->
		</div>
		<!--site-nav end-->
	</div>
	<!--header end-->

	<%
String loginid = null;
String loginpwd = null;

//得到cookie数据
Cookie[] cs=request.getCookies();
if(cs!=null){
	for(Cookie c:cs){
		//从cookie中获取用户名
		if(c.getName().equals("loginid")){
		loginid=c.getValue();
		}
		//从cookie中获取密码
		else if(c.getName().equals("loginpwd")){
			loginpwd=c.getValue();
		 }
		}
	if(null != loginid&&null != loginpwd){
	 	response.sendRedirect("../Login?method=Cookielogin&loginid="+loginid+"&loginpwd="+loginpwd);
	}

}else{
	response.sendRedirect("view_user/login.jsp");
}

  %>

	<div class="content container">

		<div class="blank10"></div>
		<div class="dl_zc">
			<div class="dl_zc_title">
				<h2 class="f_l">注册新用户</h2>
				<div class="rt_bg f_r"></div>
			</div>
			<div class="dl-con" id="entry">
				<%-- action="${pageContext.request.contextPath}/ss" method="post" --%>
				<form id="formlogin" method="post" action="../Login?method=login">
					<div class="form" style="width: 600px;">
						<div class="item">
							<span class="label">用户id：</span>
							<div class="fl">
								<input type="text" id="loginid" name="loginid" class="text"
									tabindex="1" value="<%if(null!=loginid)out.print(loginid); %>" /> <label
									id="loginid_succeed" class="blank invisible"></label> <span
									class="clear"></span> <label id="loginname_error"></label>
							</div>
						</div>
						<!--item end-->
						<div class="item">
							<span class="label">密码：</span>
							<div class="fl">
								<input type="password" id="loginpwd" name="loginpwd"
									value="<%if(null!=loginpwd)out.print(loginpwd); %>" class="text" tabindex="2" /> <label
									id="loginpwd_succeed" class="blank invisible"></label> <label><a
									href="forgot-password.jsp" class="blue">忘记密码?</a></label> <span
									class="clear"></span> <label id="loginpwd_error"></label>
							</div>
						</div>
						<!--item end-->
						<div class="item" id="o-authcode">
							<span class="label">验证码：</span>
							<div class="fl">
							<!-- 加载图片   给图片一个点击事件 刷新验证码 -->
								<input class="text text-1" type="text" name="checkcode" id="checkcodeId" size="5" />
								<a href="javascript:reloadCheckImg($('img'))"> <img
									src="imgyan.jsp" name="yan" />
								</a> <a id="resultTip">点击图片换一张</a>
							</div>
							<!--<span class="label">验证码：</span>
					<div class="fl">
						 <input type="text" id="authcode"  name="authcode" class="text text-1" tabindex="6"/>
						<label class="img">
						<img id="JD_Verification1" Ver_ColorOfNoisePoint="#888888" OnClick="" src="images/JDVerification.aspx.gif" alt="" style="cursor:pointer;width:100px;height:26px;" /> 
						
						<label>&nbsp;看不清？<a href="javascript:void(0)" onclick="verc()" class="flk13">换一张</a></label>
						<label id="authcode_succeed" class="blank invisible"></label>
						<span class="clear"></span>
						<label id="authcode_error"></label>
					</div>-->
						</div>
						<!--o-authcode end-->
						<div class="item" id="autoentry">
							<span class="label">&nbsp;</span>
							<div class="fl">
								<label class="mar"><input type="checkbox"
									class="checkbox" checked="checked" id="chkRememberUserid"
									name="chkRememberUserid" value="is"/> 记住账户密码</label><!-- <label class="mar"> <input
									type="checkbox" class="checkbox" checked="checked"
									id="chkRememberUserpwd" name="chkRememberUserpwd" /> 记住密码</label> -->
							</div>
						</div>
						<!--autoentry end-->
						<div class="item">
							<span class="label">&nbsp;</span> <input type="submit"
								class="yellow_button yellow_button_02" id="loginsubmit"
								value="登录" tabindex="8" />
							<p>登不进去看看账号密码是否正确</p>
						</div>
						<!--item end-->
					</div>
					<!--form end-->
					<div id="guide">
						<h5>还不是麦路客商城用户？</h5>
						<div class="content">现在免费注册成为麦路客商城用户，便能立刻享受便宜又放心的购物乐趣。</div>
						<a href="register.jsp" class="btn-personal">注册新用户</a>
					</div>
					<!--guide end-->
					<span class="clear"></span>
				</form>
			</div>
			<!--regist end-->
		</div>
		<!--dl_zc end-->

		<div class="blank10"></div>

	</div>
	<!--content end-->

	<div class="footer container">
		<div class="service">
			<div class="cat_bg"></div>
			<div class="help_list clearfix">
				<dl>
					<dt>新手指南</dt>
					<dd>
						<a href="help/index.jsp" target="_blank"><span>购物流程</span></a>
					</dd>
					<dd>
						<a href="help/account.jsp" target="_blank"><span>我的麦路客</span></a>
					</dd>
					<dd>
						<a href="help/common.jsp" target="_blank"><span>常见问题</span></a>
					</dd>
					<dd>
						<a href="register.jsp" target="_blank"><span>注册用户</span></a>
					</dd>
					<dd>
						<a href="forgot-password.jsp" target="_blank"><span>找回密码</span></a>
					</dd>
				</dl>
				<dl>
					<dt>订单问题</dt>
					<dd>
						<a href="help/order-status.jsp" target="_blank">订单状态</a>
					</dd>
					<dd>
						<a href="help/cancel-order.jsp" target="_blank">取消订单</a>
					</dd>
					<dd>
						<a href="help/not-order.jsp" target="_blank">未达订单</a>
					</dd>
				</dl>
				<dl>
					<dt>会员积分</dt>
					<dd>
						<a href="help/integral-rules.jsp" target="_blank">积分规则</a>
					</dd>
					<dd>
						<a href="help/integral.jsp" target="_blank">积分问题</a>
					</dd>
					<dd>
						<a href="help/exchange-integral.jsp" target="_blank">积分兑换</a>
					</dd>
				</dl>
				<dl>
					<dt>如何付款/退款</dt>
					<dd>
						<a href="help/payment.jsp" target="_blank">支付方式</a>
					</dd>
					<dd>
						<a href="help/wait-pay.jsp" target="_blank">支付等待</a>
					</dd>
					<dd>
						<a href="help/pay-issue.jsp" target="_blank">支付问题</a>
					</dd>
					<dd>
						<a href="help/refund.jsp" target="_blank">办理退款</a>
					</dd>
					<dd>
						<a href="help/invoice-system.jsp" target="_blank">发票制度</a>
					</dd>
				</dl>
				<dl>
					<dt>配送和收费</dt>
					<dd>
						<a href="help/time-range.jsp" target="_blank">配送时间</a>
					</dd>
					<dd>
						<a href="help/delivery-time.jsp" target="_blank">送达时间</a>
					</dd>
					<dd>
						<a href="help/inspection-sign.jsp" target="_blank">验货与签收</a>
					</dd>
					<dd>
						<a href="help/express.jsp" target="_blank">快递配送和收费</a>
					</dd>
					<dd>
						<a href="help/ems.jsp" target="_blank">EMS配送和收费</a>
					</dd>
				</dl>
				<dl>
					<dt>售后服务</dt>
					<dd>
						<a href="help/policy.jsp" target="_blank">退换货政策</a>
					</dd>
					<dd>
						<a href="help/apply-goods.jsp" target="_blank">如何办理退换货</a>
					</dd>
				</dl>
			</div>
		</div>
		<!--service end-->
		<div class="copyright">
			<a href="help/about.jsp" target="_blank">关于麦路客</a><span>|</span><a
				href="help/contact.jsp" target="_blank">联系麦路客</a><span>|</span><a
				href="help/job.jsp" target="_blank">加入麦路客</a><span>|</span><a
				href="sort.jsp" target="_blank">网站地图</a><span>|</span><a
				href="help/complainting.jsp" target="_blank">投诉与建议</a><span>|</span><a
				href="help/links.jsp" target="_blank">友情链接</a><br />
			Copyright&nbsp;&nbsp;©&nbsp;&nbsp;2009-2011&nbsp;&nbsp;<a
				title="麦路客商城" href="http://www.mailuke.com/">www.mailuke.com</a>&nbsp;&nbsp;麦路客商城版权所有<span>|</span><a
				href="http://www.miibeian.gov.cn/" target="_blank">沪ICP备10031526号</a><br />
			<a href="#" target="_blank"><img src="images/beian.gif"
				width="128" height="47" alt="经营性网站备案中心" /></a><a href="#"
				target="_blank"><img src="images/trustA.gif" width="119"
				height="47" alt="A级-信用企业" /></a><a href="#" target="_blank"><img
				src="images/alipay.gif" width="123" height="40" alt="支付宝-特约商家" /></a>
		</div>
		<!--copyright end-->
	</div>
	<!--footer end-->

	<script type="text/javascript" src="js/Validate.js"></script>
	<script type="text/javascript" src="js/Validate.entry.js"></script>

	<script src="js/lib.js" type="text/javascript"></script>
	<script src="js/online.js" type="text/javascript"></script>
</body>
</html>