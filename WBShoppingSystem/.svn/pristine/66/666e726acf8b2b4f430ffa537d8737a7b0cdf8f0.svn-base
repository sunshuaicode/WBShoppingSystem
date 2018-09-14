function LoginKeyDown(event) {
	if (event.keyCode == 13) { checkshopinglogin() }	
}
function CheckUserName(){
    IFRAME.Chehck_UserName.src = "";
}
function worr(txt){
	$("#Regerrorword").addClass("Error");
    $("#Regerrorword").html("<font color=#99000>"+txt+"</font>");
}	
function Check_UserName(Username){
    Iframe1.location.href="Check_UserNameExist.aspx?UserName="+Email;
}
//检查登录
function checkshopinglogin(){
    var UserName = document.getElementById("UserName");
    var PassWord = document.getElementById("PassWord");
    if(UserName.value=="" || PassWord.value=="" || UserName.value.trim()=="" || PassWord.value.trim()=="" ){
        $("#errorword").addClass("Error");
        $("#errorword").html("<font color=#99000>请输入您的用户名和密码</font>");
        return false;
    }else{
        $("#errorword").removeClass("Error");
        $("#errorword").html("");
    }
    return Loginasync();
    return true;
}
//检查合法的Email
function Check_Email() {
    var span_CheckUsername = document.getElementById("Email");
    var Regerrorword = document.getElementById("Regerrorword");
    if(span_CheckUsername.value=="" || !/^[\w-]+(\.[\w-]+)*@[\w-]+(\.(\w)+)*(\.(\w){2,3})$/.test(span_CheckUsername.value)){
	    $("#Regerrorword").addClass("Error").removeClass("rihtReg");
        $("#Regerrorword").html("<font color=#99000>请输入有效的Email地址</font>");
        return false;
	}else{
		return xmlcheckemail(span_CheckUsername.value);
	}
	return true;
}

function CheckNewUserName() {
	var NewUserName = document.getElementById("NewUserName");

	if (NewUserName.value != "" && !/^[a-zA-Z0-9_\u4e00-\u9fa5]+$/.test(NewUserName.value)) {
		$("#Regerrorword").addClass("Error").removeClass("rihtReg");
		$("#Regerrorword").html("<font color=#99000>昵称只能含有中英文、数字和下划线</font>");
		return false;
	} else {
		$("#Regerrorword").removeClass("Error").removeClass("rihtReg");
		$("#Regerrorword").html("");
	}
	return true;
}		
		
		
//检查密码
function CheckPassword(){
    var RexPassWord = document.getElementById("RexPassWord");
    if(RexPassWord.value=="" || RexPassWord.value.trim().length<6){
        $("#Regerrorword").addClass("Error").removeClass("rihtReg");
        $("#Regerrorword").html("<font color=#99000>密码必须大于6位，请重新输入</font>");
        return false;
    }else{
        $("#Regerrorword").removeClass("Error").removeClass("rihtReg");
        $("#Regerrorword").html("");
	}
    return true;
}
//检查密码
function Check_RePassWord(){
    var RexPassWord = document.getElementById("RexPassWord");
    var RePassWord = document.getElementById("RePassWord");
	if(RePassWord.value=="" || RePassWord.value!=RexPassWord.value.trim()){
		$("#Regerrorword").addClass("Error").removeClass("rihtReg");
        $("#Regerrorword").html("<font color=#99000>两次密码不一致，请重新输入</font>");
		return false;
	}
	else{
	    $("#Regerrorword").removeClass("Error").removeClass("rihtReg");
        $("#Regerrorword").html("");
	}
    return true;
}

function Check_User_Login(){   
    if(!Check_Email()) return false;
    if(!CheckPassword()) return false;
    if(!Check_RePassWord()) return false;
    if(!CheckNewUserName()) return false;
    if (!CheckValidateCode()) return false;
  
    return true;
}

function xmlcheckemail(Email){
    var Url = "XmlCheckUserName.php?UserName="+Email;
    var bool=true;
    $.ajax({
        url:Url,
        cache:false,
        async:false,
        datatype: "json",
        contentType: "application/json",
        success: function(data) {
            if(data!=null && data!=""){
                data = eval("("+data+")");
                var error = data.Error;
                if(error!=""){
                    $("#Regerrorword").addClass("Error").removeClass("rihtReg");
                    $("#Regerrorword").html("<font color=#99000>"+error+"</font>");
                    bool=false;
				}
            }else{
				 $("#Regerrorword").removeClass("Error").addClass("rihtReg");
				 $("#Regerrorword").html("该用户名可以使用");
			}
        },
        error: function(){   
			$("#Regerrorword").removeClass("Error").removeClass("rihtReg");
			$("#Regerrorword").html("");
		}
    })
	return bool;
}

function Loginasync() {
	
	var loginUrl = "XmlCheckUserName.php";
	var loginData = "Loginasync=true&LoginUserName=" + escape($("#UserName").attr("value")) + "&UserPassword=" + escape($("#PassWord").attr("value"));
	var b = true;
	$.ajax({
	    type:"POST",
		url: loginUrl,
		cache: false,
		async: false,
		data: loginData,
		success: function(data) {
			if (data != null && data != "" && typeof (data) == "string") {
				data = eval("(" + data + ")");
				var error = data.Error;
				if (error != "") {
					$("#errorword").addClass("Error").removeClass("rihtReg");
					$("#errorword").html("<font color=#99000>" + error + "</font>");
					b = false;
				}
			}
		}
    });
    
	//验证是否包含在黑名单中，再验证登录，然后处理去向。
	if (CheckUserInblacklist(escape($("#UserName").attr("value"))) && b) CreateLink(RedirectUrl());  
}


//检查验证码
function CheckValidateCode(){
    var Validate_Code = document.getElementById("Validate_Code");
	if(Validate_Code.value=="" || Validate_Code.value.trim().length<4){	   
	    $("#Regerrorword").addClass("Error").removeClass("rihtReg");
        $("#Regerrorword").html("<font color=#99000>请输入正确的验证码</font>");
        return false;
	}else{
	    $("#Regerrorword").removeClass("Error").removeClass("rihtReg");
        $("#Regerrorword").html("");
	    return xmlcheckeVCode(Validate_Code.value);
	}
	return true;
}
function xmlcheckeVCode(Email){   
    var Url = "XmlCheckUserName.php?VCode="+Email;
    var bool=true;
    $.ajax({
        url:Url,
        cache:false,
        async:false,
        datatype: "json",
        contentType: "application/json",
        success: function(data) {
            if(data!=null && data!="")
            {
                data = eval("("+data+")");
                var error = data.Error;               
                $("#Regerrorword").addClass("Error").removeClass("rihtReg");
                $("#Regerrorword").html("<font color=#99000>"+error+"</font>");
                bool=false;
            }else
            {
                $("#Regerrorword").removeClass("Error").removeClass("rihtReg");
                $("#Regerrorword").html("");
	        }
        },
        error: function()
               {
                   $("#Regerrorword").removeClass("Error").removeClass("rihtReg");
                   $("#Regerrorword").html("");
                }
        
    })
    return bool;
}
function ChangeImg1()
{
    $("#Img1").attr("src","/PublicControls/NewValidateCode.php?height=25&width=93&codeLen=5&photoType=2&t="+new Date().getTime());
}

//处理黑名单
function CheckUserInblacklist(UserName) {
	var Url = "XmlCheckUserName.php?CheckUserInblack=true&blackUsername=" + UserName;
	var bool = true;
	$.ajax({
		url: Url,
		cache: false,
		async: false,
		datatype: "json",
		contentType: "application/json",
		success: function(data) {
			if (data != null && data != "") {
				data = eval("(" + data + ")");
				var Inblack = data.Inblack;
				if (Inblack == "true")
				{ bool = false; }

			}
		}
	})
	return bool;
}
function GetUserName() {
	
	var Url = "XmlCheckUserName.php?GetUsername=true";
	$.ajax({
		url: Url,
		cache: false,
		async: false,
		datatype: "json",
		contentType: "application/json",
		success: function(data) {
			
			if (data != null && data != "") {
				data = eval("(" + data + ")");
				var Username = data.Username;
				if (Username != "") {
					$("#UserName").val(Username);
					$("#PassWord").focus();
				}

			} else $("#UserName").focus();
		}
	})
}
//处理去向
function RedirectUrl() {
	var Url = location.href;
	var Url_ = Url.split("?");
	var NewUrl = "";
	if (Url_.length > 1) {
		NewUrl = Url_[1];
		for (var i = 2; i < Url_.length; i++) {
			NewUrl += "?" + Url_[i];
		}
	} else {
	NewUrl = "https://" + document.domain + "/Usercenter/OrderList.php";
	}
	return NewUrl;
}
//创建连接，为支持weblog
function CreateLink(Url)
{
	location.href = Url;
}
GetUserName();