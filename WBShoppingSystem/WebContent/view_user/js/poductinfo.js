//增加弹出框相关 
$(".picHover").bind("mouseleave",function(){PushObj();}).bind("mouseenter",function(){
	SetObj(this);
}); 
$("li.last").bind("mouseleave",function(){PushObj();}).bind("mouseenter",function(){
	SetObj(this);
}); 
//----------------------浮动窗口开始--------------------------------
function ShowDetail(obj,htmlContent){

	var conspan=0;//插入图片的深度
	var htmlContent=htmlContent;
	var newObj=GetWH($(obj));
	newObj.left=GetLeftOrTop(obj,"left");
	newObj.top=GetLeftOrTop(obj,"top");
	var objImgWH=GetWH($("#imgICO"));
	var objDialogWH=GetWH($("#detail"));
	var left=newObj.left;
	var broderWidth=1;
	var scrollTop='';
	var mybrowser = CheckBrowser();//判断浏览器
	if(mybrowser.chrome){//判断chrome
		scrollTop = document.body.scrollTop;
	}
	else{
		scrollTop = document.documentElement.scrollTop;
	}
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
		objDialogWH.left=left-objDialogWH.w-objImgWH.w+conspan+broderWidth+1+autoWidth-3;
		objImgWH.left=left-objImgWH.w+conspan+broderWidth*2+autoWidth-3;
		
		$("#detail").html(htmlContent);
		$("#imgICO").css("background-position","0 25px");
	}else{
		objImgWH.left=newObj.left+parseInt($(obj).css("width"))-conspan+autoWidth;

		objDialogWH.left=objImgWH.left+objImgWH.w-broderWidth;
		$("#detail").html(htmlContent);
		$("#imgICO").css("background-position","0 0");
		
	}
    
	$("#imgICO").css("left",objImgWH.left+"px");
	$("#imgICO").css("top",objImgWH.top+"px");

	$("#detail").css("left",objDialogWH.left+"px");
	
	$("#detail").css("top",objDialogWH.top+"px");
	
	if(objdml == null)
    {
        ShowDetailHide();
        return false;
    }
	$("#imgICO").show();
	$("#detail").show();
	
	//修改写进cyjj类弹出框的bug
    $("#imgICO_cyjj").hide();
	$("#detail_cyjj").hide();
	
	//$("#detail").bgiframe();
	if(objImgWH.top>(objDialogWH.top+objDialogWH.h-objImgWH.h))
		$("#imgICO").hide();
}
function ShowDetailHide()
{
    $("#imgICO").hide();;
	$("#detail").hide();
	//修改写进cyjj类弹出框的bug
    $("#imgICO_cyjj").hide();
	$("#detail_cyjj").hide();
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
//----------------------浮动窗口结束--------------------------------
var objdml = null;
function SetObj(obj)
{
		if($(obj).children("div.productInfo").length ==0){
			var goodsID = $(obj).attr("pid");
			if(goodsID){
				$.get("info/product_pop_"+goodsID+".html", function(data){
					$(obj).append(data);
				})
			}
		}
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

	 productObj=$(obj).children("div.productInfo");
    if(productObj=="")
        return;
    $(productObj.html()).each(function()
    {
        SetProductInfo($(this),productInfo);
    });
    
    $("#detail").attr("class","fc03");
    content="<div style=\"text-align:center\"><img src=\"images/loading.gif\"/></div>";	
    ShowDetail(obj,content);
    $("#detail").attr("class","fc02");
    imgWidth=250;
    imgHeight=200;
    content=DetailStr(productInfo);       
    ShowDetail(obj,content);  
}
function ShowDiv()
{
    var s="";
}
function SetProductInfo(obj,productInfo)
{
    switch(obj.attr("class"))
    {
        case "ProductName":
            productInfo.ProductName=obj.html();
            break;
        case "ProductCate":
            productInfo.ProductCate=obj.html();
            break;
        case "ProductBriefTitle":
            productInfo.ProductBriefTitle=obj.html();
            break;
        case "ProductBrief":
            productInfo.ProductBrief=obj.html();
            break;
        case "CommentsNumberImg":
            productInfo.CommentsNumberImg=obj.html();
            break;
        case "CommentsNumber":
            productInfo.CommentsNumber=obj.html();
            break;
        case "Comments":
            productInfo.Comments=obj.html();
            break;
        case "CommentsQuestion":
            productInfo.CommentsQuestion=obj.html();
            break;
    }
}
function ProductInfo()
{
    this.ProductName="";
    this.ProductCate="";
    this.ProductBriefTitle="";
    this.ProductBrief="";
    this.CommentsNumberImg="";
    this.CommentsNumber="";
    this.Comments="";
    this.CommentsQuestion="";
}
function DetailStr(productInfo)
{
    var s="";
    s+="<div class=\"Pdname\">"+productInfo.ProductName+"</div>";
    s+="<div class=\"Pdcate\">商品品牌：<span class=\"PdcateName\">"+productInfo.ProductCate+"</span></div>";
    s+="<div class=\"PdBrief\">"+productInfo.ProductBriefTitle+productInfo.ProductBrief+"</div>";
    s+="<div class=\"PdComments\">满意指数："+productInfo.CommentsNumberImg+"&nbsp;<span class=\"PdCommentsNumber\">"+productInfo.CommentsNumber+"</span></div>";
    s+="<div class=\"PdCommentsDetail\">商品评论共：<span class=\"PdcateName\">"+productInfo.Comments+"</span> 次&nbsp;&nbsp;&nbsp;&nbsp;商品咨询共：<span class=\"PdcateName\">"+productInfo.CommentsQuestion+"</span> 次</div>";
    return s;
}

function CheckBrowser(){	
	var browserName = navigator.userAgent.toLowerCase();
	mybrowser = {
		version: (browserName.match(/.+(?:rv|it|ra|ie)[\/: ]([\d.]+)/) || [0, '0'])[1],
		safari: /webkit/i.test(browserName) && !this.chrome,
		opera: /opera/i.test(browserName),
	    firefox:/firefox/i.test(browserName),
		ie: /msie/i.test(browserName) && !/opera/.test(browserName),
		mozilla: /mozilla/i.test(browserName) && !/(compatible|webkit)/.test(browserName) && !this.chrome,
	    chrome: /chrome/i.test(browserName) && /webkit/i.test(browserName) && /mozilla/i.test(browserName)
	}
	return mybrowser;
} 
