var shareid="fenxiang";
(function(){var a={
	url:function(){
		return encodeURIComponent(window.location.href)
	},title:function(){
		return encodeURIComponent(window.document.title)
	},content:function(b){
		if(b){
			return encodeURIComponent($("#"+b).html())
		}else{
			return""
		}
	},setid:function(){
		if(typeof(shareid)=="undefined"){
			return null
		}else{
			return shareid
		}
	},kaixin:function(){
		window.open("http://www.kaixin001.com/repaste/share.php?rtitle="+this.title()+"&rurl="+this.url()+"&rcontent="+this.content(this.setid()))
	},renren:function(){
		window.open("http://share.renren.com/share/buttonshare.do?link="+this.url()+"&title="+this.title())
	},sinaminiblog:function(){
		window.open("http://v.t.sina.com.cn/share/share.php?url="+this.url()+"&title="+this.title()+"&content=utf-8&source=&sourceUrl=&pic=")
	},baidusoucang:function(){
		window.open("http://cang.baidu.com/do/add?it="+this.title()+"&iu="+this.url()+"&dc="+this.content(this.setid())+"&fr=ien#nw=1")
	},taojianghu:function(){window.open("http://share.jianghu.taobao.com/share/addShare.htm?title="+this.title()+"&url="+this.url()+"&content="+this.content(this.setid()))
	},wangyi:function(){window.open("http://t.163.com/article/user/checkLogin.do?source=%E7%BD%91%E6%98%93%E6%96%B0%E9%97%BB%20%20%20&link="+this.url()+"&info="+this.content(this.setid()))
	},qqzone:function(){window.open('http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?url='+ encodeURIComponent(location.href)+ '&title='+encodeURIComponent(document.title))
	},douban:function(){window.open("http://www.douban.com/recommend/?url="+this.url()+"&title="+this.title()+"&v=1")
	}};
	window.share=a
})();

$(function(){
	$(".renren").click(function(){
		share.renren();
	});
	$(".xinlang").click(function(){
		share.sinaminiblog();
	});
	$(".douban").click(function(){
		share.douban();
	});
	$(".kaixin").click(function(){
		share.kaixin();
	});
	$(".taojianghu").click(function(){
		share.taojianghu();
	});
	$(".wangyi").click(function(){
		share.wangyi();
	});
	$(".qqzone").click(function(){
		share.qqzone();
	});
	$(".baidusoucang").click(function(){
		share.baidusoucang();
	});
	$(".qqweibo").click(function(){
		share.qqweibo();
	});
});
function postToWb(){
	var _t = encodeURI(document.title);
	var _url = encodeURI(document.location);
	var _appkey = encodeURI("appkey");
	var _u = 'http://v.t.qq.com/share/share.php?title='+_t+'&url='+_url+'&appkey='+_appkey;
	window.open( _u,'转播到腾讯微博', 'width=700, height=680, top=0, left=0, toolbar=no, menubar=no, scrollbars=no, location=yes, resizable=no, status=no');
}