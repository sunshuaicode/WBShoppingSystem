<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="${pageContext.request.contextPath}/view_admin/assets/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/view_admin/css/style.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/view_admin/assets/css/font-awesome.min.css" />
<link href="${pageContext.request.contextPath}/view_admin/assets/css/codemirror.css" rel="stylesheet">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/view_admin/font/css/font-awesome.min.css" />
	<!--[if lte IE 8]>
		  <link rel="stylesheet" href="${pageContext.request.contextPath}/view_admin/assets/css/ace-ie.min.css" />
		<![endif]-->
	<!--[if IE 7]>
		  <link rel="stylesheet" href="${pageContext.request.contextPath}/view_admin/assets/css/font-awesome-ie7.min.css" />
		<![endif]-->
	<!--[if lte IE 8]>
		  <link rel="stylesheet" href="${pageContext.request.contextPath}/view_admin/assets/css/ace-ie.min.css" />
		<![endif]-->
	<script src="${pageContext.request.contextPath}/view_admin/assets/js/ace-extra.min.js"></script>
	<!--[if lt IE 9]>
		<script src="${pageContext.request.contextPath}/view_admin/assets/js/html5shiv.js"></script>
		<script src="${pageContext.request.contextPath}/view_admin/assets/js/respond.min.js"></script>
		<![endif]-->
	<!--[if !IE]> -->
	<script src="${pageContext.request.contextPath}/view_admin/js/jquery-1.9.1.min.js" type="text/javascript"></script>
	<!-- <![endif]-->
	<script src="${pageContext.request.contextPath}/view_admin/assets/dist/echarts.js"></script>
	<script src="${pageContext.request.contextPath}/view_admin/assets/js/bootstrap.min.js"></script>
	
	
	<title>交易 </title>
</head>

<body>
	<div class=" page-content clearfix">
		<div class="transaction_style">
			<ul class="state-overview clearfix">
				<li class="Info"><span class="symbol red"><i
						class="fa fa-jpy"></i></span> <span class="value"><h4>交易金额</h4>
						<p class="Quantity color_red" id='allmoney'>null</p></span></li>
				<li class="Info"><span class="symbol  blue"><i
						class="fa fa-shopping-cart"></i></span> <span class="value"><h4>订单数量</h4>
						<p class="Quantity color_red" id='ordermount'>null</p></span></li>
				<li class="Info"><span class="symbol terques"><i
						class="fa fa-shopping-cart"></i></span> <span class="value"><h4>交易成功</h4>
						<p class="Quantity color_red" id='suceessbuss'>null</p></span></li>
				<li class="Info"><span class="symbol yellow"><i
						class="fa fa-shopping-cart"></i></span> <span class="value"><h4>交易失败</h4>
						<p class="Quantity color_red" id='failbuss'>null</p></span></li>
				<!-- <li class="Info"><span class="symbol darkblue"><i
						class="fa fa-jpy"></i></span> <span class="value"><h4>退款金额</h4>
						<p class="Quantity color_red">3441.68</p></span></li> -->
			</ul>

		</div>
		<!-- <div class="t_Record">
			<div id="main"
				style="height: 400px; overflow: hidden; width: 100%; overflow: auto"></div>
		</div> -->
	</div>
</body>
</html>

<script type="text/javascript">
     $(document).ready(function(){
		  $(".t_Record").width($(window).width()-60);
		  //当文档窗口发生改变时 触发  
          $(window).resize(function(){
		       $(".t_Record").width($(window).width()-60);
		  });
     
		  $.ajax({
			  type:"POST",
			  url:"${pageContext.request.contextPath}/AdminController",
			  data:"method=transaction",
			  success:function(data){
				  $("#allmoney").text(data.sumMoney);
				  $("#ordermount").text(data.ordermount);
				  $("#suceessbuss").text(data.finishmount);
				  $("#failbuss").text(data.failmount);
			  }
		  });
		 
     });
</script>
