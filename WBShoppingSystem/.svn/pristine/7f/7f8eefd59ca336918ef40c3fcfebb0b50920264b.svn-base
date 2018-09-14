<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="css/order.css" rel="stylesheet" type="text/css"/>	
	<div id="popbox" class="tab-show">
		<ul class="tab">
			<li class="current"><a href="javascript:">登录</a></li>
			<li><a href="javascript:">注册</a></li>
		</ul><!--tab end-->
		
		<div class="items" id="entry">
			<div class="blank10"></div>
			<form id="formlogin" method="post" onSubmit="return false;" class="form">
				<div class="item">
					<span class="label">用户名：</span>
					<div class="fl">
						<input type="text" id="loginname" name="loginname"  class="text" tabindex="1"  value="q541374203" />
						<label id="loginname_succeed" class="blank invisible"></label>
						<span class="clear"></span>
						<label id="loginname_error"></label>

					</div>
				</div><!--item end-->
				<div class="item">
					<span class="label">密码：</span>
					<div class="fl">
						<input type="password" id="loginpwd" name="loginpwd" class="text" tabindex="2"/>
						<label id="loginpwd_succeed" class="blank invisible"></label>
						<label><a href="forgot-password.jsp" class="blue" target="_blank">忘记密码?</a></label>

						<span class="clear"></span>
						<label id="loginpwd_error"></label>
					</div>
				</div><!--item end-->
				<div class="item hide" id="o-authcode">
					<span class="label">验证码：</span>
					<div class="fl">
						<input type="text" id="authcode"  name="authcode" class="text text-1" tabindex="6"/>

						<label class="img">
						<img id="JD_Verification1" Ver_ColorOfNoisePoint="#888888" OnClick="" src="images/JDVerification.aspx.gif" alt="" style="cursor:pointer;width:100px;height:26px;" />
						</label>
						<label>&nbsp;看不清？<a href="javascript:void(0)" onClick="verc()" class="flk13">换一张</a></label>
						<label id="authcode_succeed" class="blank invisible"></label>
						<span class="clear"></span>
						<label id="authcode_error"></label>
					</div>

				</div><!--o-authcode end-->
				<div class="item" id="autoentry">
					<span class="label">&nbsp;</span>
					<div class="fl">
						<label class="mar"><input type="checkbox" class="checkbox"  checked="checked" id="chkRememberUsername" name="chkRememberUsername"/>
						记住用户名</label>
					</div>
				</div><!--autoentry end-->

				<div class="item">
					<span class="label">&nbsp;</span>
					<input type="button" class="yellow_button yellow_button_02"  id="loginsubmit" value="登录" tabindex="8" />
				</div><!--item end-->
			</form>
		</div><!--items end-->
		
		<div class="items hide" id="regist">
			<div class="blank10"></div>
			<form id="formpersonal" method="post" onSubmit="return false;">
			<div class="form">
				<div class="item">
					<span class="label span-150">用户名：</span>
					<div class="fl">
						<input type="text" id="username" name="username" class="text" tabindex="1" />
						<label id="username_succeed" class="blank"></label>

						<span class="clear"></span>
						<div id="username_error"></div>
					</div>
				</div><!--item end-->
				<div id="o-password">
					<div class="item">
						<span class="label span-150">设置密码：</span>
						<div class="fl">

							<input type="password" id="pwd" name="pwd" class="text" tabindex="2"  />
							<label id="pwd_succeed" class="blank"></label>
							<input type="checkbox" class="checkbox" id="viewpwd" />
							<label class="ftx23" for="viewpwd">显示密码字符</label>
							<span class="clear"></span>
							<label class="hide" id="pwdstrength"><span class="fl">安全程度：</span><b></b></label>
							<label id="pwd_error"></label>
						</div>

					</div><!--item end-->
					<div class="item">
						<span class="label span-150">确认密码：</span>
						<div class="fl">
							<input type="password" id="pwd2" name="pwd2" class="text" tabindex="3"/>
							<label id="pwd2_succeed" class="blank"></label>
							<span class="clear"></span>
							<label id="pwd2_error"></label>

						</div>
					</div><!--item end-->
				</div><!--o-password end-->
				<div class="item">
					<span class="label span-150">邮箱：</span>
					<div class="fl">
						<input type="text" id="mail" name="mail" class="text" tabindex="4"/>
						<label id="mail_succeed" class="blank"></label>			
						<span class="clear"></span>

						<div id="mail_error"></div>
					</div>
				</div><!--item end-->
				<div class="item">
					<span class="label span-150">推荐人用户名：</span>
					<div class="fl">
						<input type="text" id="referrer" name="referrer" class="text"  value=可不填 tabindex="5" />
						<label id="referrer_succeed" class="blank invisible"></label>

						<span class="clear"></span>
						<label id="referrer_error"></label>
					</div>
				</div><!--item end-->
				<div class="item">
					<span class="label span-150">验证码：</span>
					<div class="fl">
						<input type="text" id="authcode" name="authcode" class="text text-1" tabindex="6" autocomplete="off" MaxLength="6" />

						<label class="img">
						<img id="JD_Verification1" Ver_ColorOfNoisePoint="#888888" OnClick="" src="images/JDVerification.aspx.gif" alt="" style="cursor:pointer;width:100px;height:26px;" />
						</label>
						<label>&nbsp;看不清？<a  href="javascript:void(0)" onClick="verc()" class="blue">换一张</a></label>
						<label id="authcode_succeed" class="blank invisible"></label>
						<span class="clear"></span>
						<label id="authcode_error"></label>
					</div>

				</div><!--item end-->
				<div class="item">
					<span class="label span-150">&nbsp;</span>
					<input type="button" class="yellow_button yellow_button_03" id="registsubmit"  value="提交注册信息" tabindex="8" />
				</div><!--item end-->
			</div>
			</form>
		</div><!--items end-->
		
	</div><!--tab-show end-->
<script type="text/javascript" src="js/Validate.js"></script>
<script type="text/javascript" src="js/Validate.personal.js"></script>	
<script type="text/javascript" src="js/Validate.entry.js"></script>
<script type="text/javascript">
//tab plugins 插件
$(document).ready(function(){
						   
	$('#popbox .tab li').click(function(){
		TabSelect("#popbox .tab li", "#popbox .items", "current", $(this))
	});
	$('#popbox .tab li').eq(0).trigger("click");

	function TabSelect(tab,con,addClass,obj){
		var $_self = obj;
		var $_nav = $(tab);
		$_nav.removeClass(addClass),
		$_self.addClass(addClass);
		var $_index = $_nav.index($_self);
		var $_con = $(con);
		$_con.hide(),
		$_con.eq($_index).show();
	}
	
});
</script>