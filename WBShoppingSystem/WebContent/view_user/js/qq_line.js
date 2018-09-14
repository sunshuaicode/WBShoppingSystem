//keywords text
(function(){
	var keywords="请输入关键词";
		$("#birds").val(keywords).bind("focus",function(){
		if (this.value==keywords){this.value="";this.className="focus_text"}
	}).bind("blur",function(){
		if (this.value==""){this.value=keywords;this.className="blur_text"}
	});
})();

//QQ online
document.write('<div style="width:27px;" id="divQQbox" class="QQbox">');
document.write('<div style="display:none;" onmouseout="hideMsgBox(event);" id="divOnline" class="Qlist">');
document.write('<div class="t"></div>');
document.write('<div class="m">');
document.write('<div class="infobox">我们营业的时间<br />8:00-22:00</div>');
document.write('<div class="con">');
document.write('<ul>');
document.write('<li><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=541374203&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:541374203:41" alt="541374203点击这里给我发消息" title="541374203点击这里给我发消息"></a></li>');
document.write('<li><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=605569615&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:605569615:41" alt="605569615点击这里给我发消息" title="605569615点击这里给我发消息"></a></li>');
document.write('<li><a target="_blank" href="http://amos.im.alisoft.com/msg.aw?v=2&uid=%E6%9C%B1%E5%9B%BD%E5%BC%BA6010&site=cntaobao&s=1&charset=utf-8" ><img border="0" src="http://amos.im.alisoft.com/online.aw?v=2&uid=%E6%9C%B1%E5%9B%BD%E5%BC%BA6010&site=cntaobao&s=1&charset=utf-8" alt="朱国强6010" title="朱国强6010" /></a></li>');
document.write('<li>客服电话：<br />15901826010</li>');
document.write('</ul>');
document.write('</div>');
document.write('</div>');
document.write('<div class="b"></div>');
document.write('</div>');
document.write('<div onmouseover="OnlineOver();" id="divMenu"></div>');
document.write('</div>');

var tips; var theTop = 145/*这是默认高度,越大越往下*/; var old = theTop;
function initFloatTips() {
	tips = document.getElementById('divQQbox');
	moveTips();
};
function moveTips() {
	var tt = 50;
	if (window.innerHeight) {
		pos = window.pageYOffset
	}
	else if (document.documentElement && document.documentElement.scrollTop) {
		pos = document.documentElement.scrollTop
	}
	else if (document.body) {
		pos = document.body.scrollTop;
	}
	pos = pos - tips.offsetTop + theTop;
	pos = tips.offsetTop + pos / 10;
	if (pos < theTop) pos = theTop;
	if (pos != old) {
		tips.style.top = pos + "px";
		tt = 10;
		//alert(tips.style.top);
	}
	old = pos;
	setTimeout(moveTips, tt);
}
initFloatTips();
function OnlineOver() {
	document.getElementById("divMenu").style.display = "none";
	document.getElementById("divOnline").style.display = "block";
	document.getElementById("divQQbox").style.width = "145px";
}
function OnlineOut() {
	
	document.getElementById("divMenu").style.display = "block";
	document.getElementById("divOnline").style.display = "none";
}
if (typeof (HTMLElement) != "undefined")    //给firefox定义contains()方法，ie下不起作用
{
	HTMLElement.prototype.contains = function(obj) {
		while (obj != null && typeof (obj.tagName) != "undefind") { //通过循环对比来判断是不是obj的父元素
			if (obj == this) return true;
			obj = obj.parentNode;
		}
		return false;
	};
}
function hideMsgBox(theEvent) { //theEvent用来传入事件，Firefox的方式
	if (theEvent) {
		var browser = navigator.userAgent; //取得浏览器属性
		if (browser.indexOf("Firefox") > 0) { //如果是Firefox
			if (document.getElementById('divOnline').contains(theEvent.relatedTarget)) { //如果是子元素
				return; //结束函式
			}
		}
		if (browser.indexOf("MSIE") > 0) { //如果是IE
			if (document.getElementById('divOnline').contains(event.toElement)) { //如果是子元素
				return; //结束函式
			}
		}
	}
	/*要执行的操作*/
	document.getElementById("divMenu").style.display = "block";
	document.getElementById("divOnline").style.display = "none";
	document.getElementById("divQQbox").style.width = "26px";
};