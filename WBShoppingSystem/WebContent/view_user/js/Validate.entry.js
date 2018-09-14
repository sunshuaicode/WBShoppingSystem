$.extend(validatePrompt,{
	username:{
		onFocus:"",
		succeed:"",
		isNull:"请输入用户名",
		error:"不存在此用户名"
	}
});

$.extend(validateFunction,{
	username:function(option){
		var format=validateRules.isNull(option.value);
		if (!format){
            validateSettings.succeed.run(option);			
		}
		else{
		    validateSettings.error.run(option,option.prompts.error);
		}
	},
	pwd:function(option){
		validateSettings.succeed.run(option);
	},
	FORM_validate:function(){
		$("#loginname").jdValidate(validatePrompt.username,validateFunction.username,true);
		$("#loginpwd").jdValidate(validatePrompt.pwd,validateFunction.pwd,true);
		return validateFunction.FORM_submit(["#loginname","#loginpwd"]);
	},
	FORM_validate_authcode:function(){
	    $("#loginname").jdValidate(validatePrompt.username,validateFunction.username,true);
		$("#loginpwd").jdValidate(validatePrompt.pwd,validateFunction.pwd,true);
		$("#authcode").jdValidate(validatePrompt.authcode,validateFunction.authcode,true);
		return validateFunction.FORM_submit(["#loginname","#loginpwd","#authcode"]);
	}
});
//setTimeout(function(){$("#loginname").get(0).focus();},0);
setTimeout(function() { if (!$("#loginname").val()) { $("#loginname").get(0).focus(); } }, 0); 
$("#loginname").jdValidate(validatePrompt.username,validateFunction.username);
$("#loginpwd").jdValidate(validatePrompt.empty,validateFunction.pwd);
$("#authcode").jdValidate(validatePrompt.empty,validateFunction.authcode);

function verc(){
	$("#JD_Verification1").click();
}


$("#loginname,#loginpwd, #authcode").bind('keyup',function(event) {
    if(event.keyCode==13){
        $("#loginsubmit").click();
    }     
});

$("#loginsubmit").click(function() {
    var flag = validateFunction.FORM_validate();
    if (flag) {
        var uuid = $("#JD_Verification1").attr("src").split("&uid=")[1].split("&")[0];
        $(this).attr({ "disabled": "disabled" });
        $.ajax({
            type: "POST",
            url: "LoginService.aspx?uuid=" + uuid + "&" + location.search.substring(1) + "&r=" + Math.random(),
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            data: $("#formlogin").serialize(),
            error: function() {
                $("#loginpwd").attr({ "class": "text highlight2" });
                $("#loginpwd_error").html("系统忙，请稍候").show().attr({ "class": "error" }); $("#loginsubmit").removeAttr("disabled");
            },
            success: function(result) {
                if (result) {
                    var obj = eval(result);
                    if (obj.success)
                        window.location = obj.success;
                    if (obj.transfer)
                        window.location = obj.transfer + window.location.search;
                    if (obj.verifycode)
                        $("#o-authcode").show();
                    if (obj.username) {
                        $("#loginname").attr({ "class": "text highlight2" });
                        $("#loginname_error").html(obj.username).show().attr({ "class": "error" });
                    }
                    if (obj.pwd) {
                        $("#loginpwd").attr({ "class": "text highlight2" });
                        $("#loginpwd_error").html(obj.pwd).show().attr({ "class": "error" });
                    }
                    if (obj.authcode) {
                        $("#authcode").attr({ "class": "text text-1 highlight2" });
                        $("#authcode_error").html(obj.authcode).show().attr({ "class": "error" });
                    }
                    $("#loginsubmit").removeAttr("disabled");
                    verc();
                }
            }
        });
    }
});

$("#loginsubmitframe").click(function() {
    var flag = validateFunction.FORM_validate();
    if (flag) {
        var uuid = $("#JD_Verification1").attr("src").split("&uid=")[1].split("&")[0];
        $(this).attr({ "disabled": "disabled" });
        $.ajax({
            type: "POST",
            url: "LoginService.aspx?uuid=" + uuid + "&" + location.search.substring(1) + "&r=" + Math.random(),
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            data: $("#formloginframe").serialize(),
            error: function() {
                $("#loginpwd").attr({ "class": "text highlight2" });
                $("#loginpwd_error").html("系统忙，请稍候").show().attr({ "class": "error" }); $("#loginsubmitframe").removeAttr("disabled");
            },
            success: function(result) {
                if (result) {
                    var obj = eval(result);
                    if (obj.success || obj.transfer) {
                        window.parent.jdModelCallCenter.init();
                    }
                    if (obj.verifycode) {
                        verc();
                        $("#o-authcode").show();
                    }
                    if (obj.username) {
                        $("#loginname").attr({ "class": "text highlight2" });
                        $("#loginname_error").html(obj.username).show().attr({ "class": "error" });
                    }
                    if (obj.pwd) {
                        $("#loginpwd").attr({ "class": "text highlight2" });
                        $("#loginpwd_error").html(obj.pwd).show().attr({ "class": "error" });
                    }
                    if (obj.authcode) {
                        verc();
                        $("#authcode").attr({ "class": "text text-1 highlight2" });
                        $("#authcode_error").html(obj.authcode).show().attr({ "class": "error" });
                    }
                    $("#loginsubmitframe").removeAttr("disabled");
                }
            }
        });
    }
});
$("#loginname,#loginpwd, #authcode").bind('keyup', function(event) {
    if (event.keyCode == 13) {
        $("#loginsubmitframe").click();
    }
});