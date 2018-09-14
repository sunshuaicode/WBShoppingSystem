$.extend(validateFunction,{
	FORM_validate:function(){
		$("#username").jdValidate(validatePrompt.username,validateFunction.username,true);
		$("#mail").jdValidate(validatePrompt.mail,validateFunction.mail,true);
		$("#authcode").jdValidate(validatePrompt.authcode,validateFunction.authcode,true);
		return validateFunction.FORM_submit(["#username","#mail","#authcode"])
	}		 
});

//调用
setTimeout(function(){$("#username").get(0).focus();},0); 
$("#username").jdValidate(validatePrompt.username,validateFunction.username);

$("#mail").jdValidate(validatePrompt.mail,validateFunction.mail);

$("#authcode").jdValidate(validatePrompt.authcode,validateFunction.authcode);


$("#registsubmit").click(function() {
    var flag = validateFunction.FORM_validate();
    if (flag) {
        $(this).attr({"disabled":"disabled"}).attr({"value":"提交中,请稍等"}); 
        var uuid=$("#JD_Verification1").attr("src").split("&uid=")[1].split("&")[0];
        $.ajax({
            type: "POST",
            url: "RegistService.aspx?rtype=personal&uuid=" + uuid,
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            data: $("#formpersonal").serialize(),
            success: function(result) {
                if (result) {
                    var obj = eval(result);
                    if (obj.info) {
                        $("#registsubmit").removeAttr("disabled");
                        $("#registsubmit").attr({"value":"同意以下协议，提交"});
                        alert(obj.info);
                        if (obj.info == "验证码不正确") {
                            verc();
                        }
                    }
                    if (obj.success == true) {
                        window.location = "registmobile.aspx" + location.search;
                    }
                }
            }
        });
    }
});

function verc(){
	$("#JD_Verification1").click();
}

$("#authcode").bind('keyup',function(event) {  
    if(event.keyCode==13){  
        $("#registsubmit").click();
    }
});
$("#registsubmitframe").click(function() {
    var flag = validateFunction.FORM_validate();
    if (flag) {
        $(this).attr({ "disabled": "disabled" }).attr({ "value": "提交中..." });
        var uuid = $("#JD_Verification1").attr("src").split("&uid=")[1].split("&")[0];
        $.ajax({
            type: "POST",
            url: "RegistService.aspx?rtype=personal&uuid=" + uuid,
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            data: $("#formpersonalframe").serialize(),
            success: function(result) {
                if (result) {
                    var obj = eval(result);
                    if (obj.info) {
                        $("#registsubmitframe").removeAttr("disabled");
                        $("#registsubmitframe").attr({ "value": "注&nbsp;册" });
                        alert(obj.info);
                        if (obj.info == "验证码不正确") {
                            verc();
                        }
                    }
                    if (obj.success == true) {
                        window.parent.jdModelCallCenter.init();
                    }
                }
            }
        });
    }
});