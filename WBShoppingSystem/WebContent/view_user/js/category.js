/*scaling 是否等比例自动缩放 , width 图片最大高 , height 图片最大宽 , strLoad 加载时要显示的文字或者图片 , Method 调整完大小之后执行的方法*/
jQuery.fn.LoadImage=function(scaling,width,height,strLoad,Method,errorMethod){
    String(strLoad)==""||String(strLoad)=="undefined"?strLoad="加载中...":strLoad;
    return this.each(function(){
        var imgD=$(this);
        var src=$(this).attr("src");
        var img=new Image();
        img.src=src;
        //自动缩放图片
        var AutoScaling=function(){
            if(scaling){
            
                if(img.width>0 && img.height>0){ 
                    if(img.width/img.height>=width/height){ 
                        if(img.width>width){ 
                            imgD.width(width); 
                            imgD.height((img.height*width)/img.width); 
                        }else{ 
                            imgD.width(img.width); 
                            imgD.height(img.height); 
                        } 
                    } 
                    else{ 
                        if(img.height>height){ 
                            imgD.height(height); 
                            imgD.width((img.width*height)/img.height); 
                        }else{ 
                            imgD.width(img.width); 
                            imgD.height(img.height); 
                        } 
                    } 
                } 
            }    
        }
        //火狐浏览器处理
        if(img.complete){
            AutoScaling();
            if(Method)
                Method();
            return;
        }
        $(this).attr("src","");
        var loading=$("<div>"+strLoad+"</div>");  
        imgD.hide();
        imgD.after(loading);
        $(img).load(function(){
            AutoScaling();
            loading.remove();
            imgD.attr("src",this.src);
            imgD.show();
            if(Method)
                Method();
        });
        $(img).error(function(){
            loading.remove();
            imgD.show();
            if(errorMethod){
                errorMethod();
            }
        })
        
    });
}
//浮动窗口开始
function ShowDetail(obj,htmlContent){

	var conspan=0;//插入图片的深度
	var htmlContent=htmlContent;
	var newObj=GetWH($(obj));
	newObj.left=GetLeftOrTop(obj,"left");
	newObj.top=GetLeftOrTop(obj,"top");
	var objImgWH=GetWH($("#pop_ico"));
	var objDialogWH=GetWH($("#pop_detail"));
	var left=newObj.left;
	var broderWidth=1;
	var scrollTop=document.documentElement.scrollTop;
	var autoWidth=0;

	objDialogWH.top =parseInt(document.documentElement.clientHeight)-(newObj.top-scrollTop)-objDialogWH.h;
	if(objDialogWH.top<0){
		objDialogWH.top=newObj.top+objDialogWH.top-3;
		if(objDialogWH.top<0) objDialogWH.top=scrollTop;
	}else{
		objDialogWH.top=newObj.top;
	}
	objImgWH.top=newObj.top+30;
	objDialogWH.left=document.documentElement.clientWidth-left-parseInt(objDialogWH.w)-parseInt($(obj).css("width"))-conspan;
    
	if(left>document.documentElement.clientWidth-left-parseInt($(obj).css("width"))){
		objDialogWH.left=left-objDialogWH.w-objImgWH.w+conspan+broderWidth+2+autoWidth-3;
		objImgWH.left=left-objImgWH.w+conspan+broderWidth*2+autoWidth-3;
		
		$("#pop_detail").html(htmlContent);
		$("#pop_ico").css("background-position","-10px 0");
	}else{
		objImgWH.left=newObj.left+parseInt($(obj).css("width"))-conspan+autoWidth;

		objDialogWH.left=objImgWH.left+objImgWH.w-broderWidth;
		$("#pop_detail").html(htmlContent);
		$("#pop_ico").css("background-position","0 0");
		
	}
    
	$("#pop_ico").css("left",objImgWH.left+"px");
	$("#pop_ico").css("top",objImgWH.top+"px");

	$("#pop_detail").css("left",objDialogWH.left+"px");
	
	$("#pop_detail").css("top",objDialogWH.top+"px");
	
	if(objdml == null)
    {
        ShowDetailHide();
        return false;
    }
	$("#pop_ico").show();
	$("#pop_detail").show();
	if(objImgWH.top>(objDialogWH.top+objDialogWH.h-objImgWH.h))
		$("#pop_ico").hide();
}
function ShowDetailHide()
{
    $("#pop_ico").hide();;
	$("#pop_detail").hide();
}
function GetWH(obj){
	var objwh=new ObjWH();
	objwh.w=parseInt(obj.css("width"));
	objwh.h=parseInt(obj.css("height"));
	return objwh;
}
function ObjWH(){
	this.top=0;
	this.left=0;
	this.w=0;
	this.h=0;
}
function GetLeftOrTop(obj,strName){
    var num=0;
    do
    {
        if(strName=="left")
        {
            num += obj.offsetLeft;
        }
        else
        {
            num+= obj.offsetTop;
        }
        
        obj = obj.offsetParent;
    } while(!(obj==null||obj.tagName=="BODY"));
    return num;
}
function Point(iX, iY){
    this.x = iX;
    this.y = iY;
}
//浮动窗口结束
var objdml = null;
function SetObj(obj)
{
    objdml = obj;
    setTimeout("ShowProductInfo()",500);
}
function PushObj()
{
    objdml = null;
    ShowDetailHide();
}
function ShowProductInfo()
{        
    if(objdml == null)
    {
        return false;
    }
    var obj = objdml;
    var productInfo=new ProductInfo();
    var productObj="";
    var content="";
    var imgWidth=0;
    var imgHeight=0;
    $($(obj).html()).each(function(i) {
        if($(this).attr("class")=="preview")
        {
            productObj=$(this);
        }
    });
    if(productObj=="")
        return;
    $(productObj.html()).each(function()
    {
        SetProductInfo($(this),productInfo);
    });
    
    $("#pop_detail").attr("class","pop_load");
    content="<div style=\"text-align:center\"><img src=\"images/loading.gif\"/></div>";
    ShowDetail(obj,content);
    
    $("<img src=\""+productInfo.ProductPic+"\">").load(function(){
        var img=new Image();
        img.src=productInfo.ProductPic;
        
        if(img.width=="570")
        {
            $("#pop_detail").attr("class","fc");
            imgWidth=300;
            imgHeight=200;
        }
        else
        {
            $("#pop_detail").attr("class","popshow");
            imgWidth=340;
            imgHeight=400;
        }
        content=DetailStr(productInfo);
        
        ShowDetail(obj,content);
        $("#driftImg").LoadImage(true,imgWidth,610,"<img src=\"logo/loading.gif\"/>");
    }
    );
    $("<img src=\""+productInfo.ProductPic+"\">").error(function(){
        $("#detail").attr("class","popshow");
        imgWidth=270;
        imgHeight=310;
        content=DetailStr(productInfo);
        ShowDetail(obj,content);
    });
}
function ShowDiv()
{
    var s="";
}
function SetProductInfo(obj,productInfo)
{
    switch(obj.attr("class"))
    {

        case "pic":
            productInfo.ProductPic=obj.html();
            break;

    }
}
function ProductInfo()
{
    this.ProductPic="";

}
function DetailStr(productInfo)
{
    var s="<img src=\""+productInfo.ProductPic+"\" id=\"driftImg\"  />";
    return s;
}
function IsIE(){
    if(isFirefox=navigator.userAgent.indexOf("MSIE")>0)
        return true;
    return false;
}

$(document).ready(function(){
	
	// 商品分类		
	$('.sort-list dt').click(function(){
		var personal = $(this).next();
		if(personal.is(':visible')){
			personal.slideUp('fast');
			$(this).removeClass('current');
		}else{
			personal.slideDown('fast');
			$(this).addClass('current');
		}
	});
	
	// 单品图片
	$(".StyleListProduct li").bind("mouseleave",function(){
		PushObj();
		$(this).removeClass("hover");
	}).bind("mouseenter",function(){
		SetObj(this);
		$(this).addClass("hover");
	});	
	
	$(".StyleListProduct li a.p_photo").bigTarget();

});
