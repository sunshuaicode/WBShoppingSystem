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
<title>登录 注册-麦路客商城</title>
<meta name="keywords" content="登录 注册, 麦路客商城 服装,直销,衬衣,衬衫,牛津纺,经纬80公里全棉衬衫,领带,毛背心,卡其裤" />
<meta name="description" content="登录 注册是麦路客商城品牌系列产品之一，麦路客商城是专业生产和销售男装的品牌，包括正装衬衣、休闲衬衣、短袖衬衣、全棉免烫牛津纺衬衫、经纬80公里全棉衬衫、领带、毛背心、卡其裤。" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
<link href="css/base.css" rel="stylesheet" type="text/css"/>
<link href="css/order.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery-1.2.6.pack.js"></script>
</head>
<body>
<div class="o_h container mb-10">
	<h1 class="f_l oh_logo"><a href="index.jsp" title="麦路客商城"><img src="images/logo.gif" alt="麦路客商城" /></a></h1><!--oh_logo end-->
	<div class="f_r oh_mian">
		<div class="oh_dh">
			<div class="f_r l_bg"></div>
			<div class="f_r oh_dh_m">
			<%
			   if(null != u){%>
			       <a href="#"><i class="iconfont">&#xe622;</i> <%=u.getUser_name() %></a><span>|</span><a href="index.jsp">麦路客首页</a><span>|</span><a href="my-mesaer.jsp">我的麦路客</a><span>|</span><a href="help/index.jsp">帮助中心</a>
			   <%}else{%>
			       <div class="f_r oh_dh_m">请<a href="login.jsp" class="red">登录</a>或<a href="register.jsp" class="red">注册</a><span>|</span><a href="index.jsp">麦路客首页</a><span>|</span><a href="my-mesaer.jsp">我的麦路客</a><span>|</span><a href="help/index.jsp">帮助中心</a></div>
			   <%}
			%>
			</div>
			<div class="f_r r_bg"></div>
		</div><!--oh_dh end-->
		
		<div class="blank20"></div>
		
		<div class="flow_step">
			<ul>
				<li class="step_06"></li>
				<li class="step_04">3.成功提交订单</li>
				<li class="step_05"></li>
				<li class="step_04">2.填写核对订单信息</li>
				<li class="step_03"></li>
				<li class="step_02">1.我的购物车</li>
				<li class="step_01"></li>
			</ul>
		</div><!--flow_step end-->
	</div><!--oh_mian end-->
	
	<div class="clear"></div>
	
</div><!--o_h end-->
	
<div class="cat_content container">
	<div class="cat_title">
		<h2 class="f_l"><img src="images/cat.gif" title="购物车" /></h2>
	</div><!--cat_title end-->
	<div class="cat_list">
		<table cellpadding="0" cellspacing="0" border="0">
			<thead>
				<tr>
					<th width="10px">&nbsp;</th>
					<th>商品</th>
					<th>名称</th>
					<th>尺码</th>
					<th>赠送积分</th>
					<th>单价</th>
					<th>数量</th>
					<th>小计</th>
					<th>操作</th>
					<th width="10px">&nbsp;</th>
				</tr>
			</thead>
			<tbody>	
				<tr>
					<td colspan="10">
						<%
						   if(null != u){%>
						      <p class="no_cat">您的购物车还是空的，赶紧行动吧！您可以： <br />马上去 <a href="index.jsp" class="red">挑选商品</a></p>
						      
						   <%}else{%>
						      <p class="no_cat">您的购物车还是空的，赶紧行动吧！您可以：<br />如果您还未登录，可能导致购物车为空，请<a href="login.jsp" class="red">马上登录</a> <br />马上去 <a href="index.jsp" class="red">挑选商品</a></p>
						   <%}
						%>
						
					</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td style="border:none;">&nbsp;</td>
					<td colspan="8" style="border:none;">
						<table cellpadding="0" cellspacing="0" border="0">
							<td width="110px"><a href="#"><img alt="继续购物" src="images/jx_pay.gif" /></a></td>
							<td><a href="#"><img alt="清空购物车" src="images/delete_pay.gif" /></a></td>
							<td></td>
							<td align="right"><a href="#"><img alt="去结算" src="images/go_pay.gif" /></a></td>
						</table>
					</td>
					<td style="border:none;">&nbsp;</td>
				</tr>
			</tfoot>	
		</table>
	</div><!--cat_list end-->
	<div class="line mb-10"></div>
</div><!--cat_content end-->
	
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

<script src="js/online.js" type="text/javascript"></script>	
</body>
</html>