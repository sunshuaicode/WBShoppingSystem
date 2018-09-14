<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="${pageContext.request.contextPath}/view_admin/assets/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/view_admin/assets/css/font-awesome.min.css" />
<!--[if IE 7]>
		  <link rel="stylesheet" href="${pageContext.request.contextPath}/view_admin/assets/css/font-awesome-ie7.min.css" />
		<![endif]-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/view_admin/assets/css/ace.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/view_admin/assets/css/ace-rtl.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/view_admin/assets/css/ace-skins.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/view_admin/css/style.css" />
<!--[if lte IE 8]>
		  <link rel="stylesheet" href="${pageContext.request.contextPath}/view_admin/assets/css/ace-ie.min.css" />
		<![endif]-->
<script src="${pageContext.request.contextPath}/view_admin/assets/js/ace-extra.min.js"></script>
<!--[if lt IE 9]>
		<script src="${pageContext.request.contextPath}/view_admin/assets/js/html5shiv.js"></script>
		<script src="${pageContext.request.contextPath}/view_admin/assets/js/respond.min.js"></script>
		<![endif]-->
<script src="${pageContext.request.contextPath}/view_admin/js/jquery-1.9.1.min.js"></script>
<script src="${pageContext.request.contextPath}/view_admin/assets/layer/layer.js" type="text/javascript"></script>
<title>管理员登陆页面</title>
<script type="text/javascript">
$(function(){
	 //通过验证码输入框的blur事件，触发此函数
	$("#checkcodeId").blur(function(){
		var checkcode=$("#checkcodeId").val();
		$.post(
		  "CheckCodeServlet",
		  "checkcode="+checkcode,
		  //根据返回的图片路径，显示不同的提示图片
		  function(result){
			  var resulthtml=$("<img src="+result+"height='50px'width='80px'/>");
			  $("#resultTip").html(resulthtml);
		  }
		);
	});
	
 });
//刷新校验码
</script>
<script type="text/javascript">
 function reloadCheckImg(){ 
			$("#yzm").attr("src","${pageContext.request.contextPath}/view_admin/view/img.jsp?t="+(new Date().getTime()));
		}

</script>
<script type="text/javascript">

$(document).ready(function(){
		 $('#login_btn').on('click', function(){
		     var num=0;
			 var str="";
	         $("input[type$='text'],input[type$='password']").each(function(n){
	          if($(this).val()=="")
	          {
	               
				   layer.alert(str+=""+$(this).attr("name")+"不能为空！\r\n",{
	                title: '提示框',				
					icon:0,								
	          }); 
			    num++;
	            return false;            
	          } 
			 });
			  if(num>0){  return false;}	 	
	          else{
				 /*  layer.alert('登陆成功！',{
	               title: '提示框',				
				   icon:1,		
				  }); */
		           //location.href="index.jsp";
				   //layer.close(index);   
				   $.ajax({
			 	   type:"post",
			 	   url:"${pageContext.request.contextPath}/AdminController",
			 	   data:"method=login&username="+$("#username").val()+"&password="+$("#userpwd").val()+"&checkcode="+$("#checkcodeId").val(),
			 	   success:function(data){
			 		   data=parseInt($.trim(data));
			 		  if(data==1) {
			 			 layer.alert('登陆成功！',{
				               title: '提示框',				
							   icon:1,		
							  });
			 			 window.location.href ='index.jsp?username='+$("#username").val(); 
			 		  }
			 		  else if(data==-1){
			 			 layer.alert('账号或密码错误！！！请重新输入',{
				               title: '提示框',				
							   icon:2,		
							  });
			 		  }
			 		  else if(data==0){
			 			 layer.alert('验证码错误！！！请重新输入',{
				               title: '提示框',				
							   icon:2,		
							  });
			 		  }
			 	   }
			    });
			  }		  		     						
			
		});
	 $("input[type='text'],input[type='password']").blur(function(){
        var $el = $(this);
        var $parent = $el.parent();
        $parent.attr('class','frame_style').removeClass(' form_error');
        if($el.val()==''){
            $parent.attr('class','frame_style').addClass(' form_error');
        }
    });
	$("input[type='text'],input[type='password']").focus(function(){		
		var $el = $(this);
        var $parent = $el.parent();
        $parent.attr('class','frame_style').removeClass(' form_errors');
        if($el.val()==''){
            $parent.attr('class','frame_style').addClass(' form_errors');
        } else{
			 $parent.attr('class','frame_style').removeClass(' form_errors');
		}
		});
	 $('#login_btn').on('click', function(){
		
	 });
});
</script>
</head>
<% request.getSession().setAttribute("isLogin", 1); %>
<body class="login-layout Reg_log_style">
	<div class="logintop">
		<span>欢迎来到后台管理界面平台</span>
		<ul>
			<li><a href="#">返回首页</a></li>
			<li><a href="#">帮助</a></li>
			<li><a href="#">关于</a></li>
		</ul>
	</div>
	<div class="loginbody">
		<div class="login-container">
			<div class="center">
				<img src="${pageContext.request.contextPath}/view_admin/images/logo1.png" />
			</div>

			<div class="space-6"></div>

			<div class="position-relative">
				<div id="login-box" class="login-box widget-box no-border visible">
					<div class="widget-body">
						<div class="widget-main">
							<h4 class="header blue lighter bigger">
								<i class="icon-coffee green"></i> 管理员登陆
							</h4>

							<div class="login_icon">
								<img src="${pageContext.request.contextPath}/view_admin/images/login.png" />
							</div>

							<form id="formid">
								<fieldset>
									<ul>
										<li class="frame_style form_error"><label
											class="user_icon"></label><input name="用户名" type="text"
											id="username" /><i>用户名</i></li>
										<li class="frame_style form_error"><label
											class="password_icon"></label><input name="密码"
											type="password" id="userpwd" /><i>密码</i></li>
										<li class="frame_style form_error"><label
											class="Codes_icon"></label><input type="text" name="验证码" id="checkcodeId" size="4"/>
		                                       <i>验证码</i><a href='javascript:reloadCheckImg()'>
										<div class="Codes_region"><img src="img.jsp" id="yzm"/></div></a></li>

									</ul>
									<div class="space"><span id="spanid" value=""></span></div>

									<div class="clearfix">
										<!-- <label class="inline"> <input type="checkbox"
											class="ace"> <span class="lbl">保存密码</span></label>
 -->
										<button type="button" class="width-35 pull-right btn btn-sm btn-primary" id="login_btn" >
															<i class="icon-key"></i>登陆</button>
									</div>

									<div class="space-4"></div>
								</fieldset>
							</form>
						</div>
						<!-- /widget-main -->

						<div class="toolbar clearfix"></div>
					</div>
					<!-- /widget-body -->
				</div>
				<!-- /login-box -->
			</div>
			<!-- /position-relative -->
		</div>
	</div>
	<strong></strong>
</body>
</html>

<!-- <script>

  $(document).ready(function(){
	  $('#login_btn').on('click', function(){
		     var num=0;
			 var str="";
	     $("input[type$='text'],input[type$='password']").each(function(n){
	          if($(this).val()=="")
	          {
	               
				   layer.alert(str+=""+$(this).attr("name")+"不能为空！\r\n",{
	                title: '提示框',				
					icon:0,								
	          }); 
			    num++;
	            return false;            
	          } 
			 });
			  if(num>0){  return false;}	 	
	          else{
				  layer.alert('登陆成功！',{
	               title: '提示框',				
				   icon:1,		
				  });
		           location.href="index.jsp";
				   layer.close(index); 
				   
			  }		  		     						
			
		});
	 $("input[type='text'],input[type='password']").blur(function(){
        var $el = $(this);
        var $parent = $el.parent();
        $parent.attr('class','frame_style').removeClass(' form_error');
        if($el.val()==''){
            $parent.attr('class','frame_style').addClass(' form_error');
        }
    });
	$("input[type='text'],input[type='password']").focus(function(){		
		var $el = $(this);
        var $parent = $el.parent();
        $parent.attr('class','frame_style').removeClass(' form_errors');
        if($el.val()==''){
            $parent.attr('class','frame_style').addClass(' form_errors');
        } else{
			 $parent.attr('class','frame_style').removeClass(' form_errors');
		}
		});
	 $("#login_btn").click(function(){
 		alert("111111");
	  })}
/*     $(document).ready(function(){
       
           /* $.ajax({
        	   type:"post",
        	   url:"../../AdminController",
        	   data:"method=login&username="+$("#username").val()+"&password="+$("#userpwd").val()+"&checkcode="+$("#checkcodeId").val(),
        	   success:function(data){
        		   data=parseInt($.trim(data));
        		   if(data==0){
        			   $("#spanid").text("验证码错误，请重新输入！").css("color","red");
        		   }
        	   }
           }); */
        }
        );
        
      } */

</script> -->