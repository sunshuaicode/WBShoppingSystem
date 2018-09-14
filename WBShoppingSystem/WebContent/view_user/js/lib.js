// bigTarget.js - A jQuery Plugin
// Version 1.0.1
// Written by Leevi Graham - Technical Director - Newism Web Design & Development
// http://newism.com.au
// Notes: Tooltip code from fitted.js - http://www.trovster.com/lab/plugins/fitted/

// create closure
(function($) {
	// plugin definition
	$.fn.bigTarget = function(options) {
		debug(this);
		// build main options before element iteration
		var opts = $.extend({}, $.fn.bigTarget.defaults, options);
		// iterate and reformat each matched element
		return this.each(function() {
			// set the anchor attributes
			var $a = $(this);
			var href = $a.attr('href');
			var title = $a.attr('title');
			// build element specific options
			var o = $.meta ? $.extend({}, opts, $a.data()) : opts;
			// update element styles
			$a.parents(o.clickZone)
				.hover(function() {
					$h = $(this);
					$h.addClass(o.hoverClass);
					if(typeof o.title != 'undefined' && o.title === true && title != '') {
						$h.attr('title',title);
					}
				}, function() {
					
					$h.removeClass(o.hoverClass);
					if(typeof o.title != 'undefined' && o.title === true && title != '') {
						$h.removeAttr('title');
					}
				})
				// click
				.click(function() {
					if(getSelectedText() == "")
					{
						if($a.is('[rel*=external]')){
							window.open(href);
							return false;
						}
						else {
							//$a.click(); $a.trigger('click');
							window.location = href;
						}
					}
				});
		});
	};
	// private function for debugging
	function debug($obj) {
		if (window.console && window.console.log)
		window.console.log('bigTarget selection count: ' + $obj.size());
	};
	// get selected text
	function getSelectedText(){
		if(window.getSelection){
			return window.getSelection().toString();
		}
		else if(document.getSelection){
			return document.getSelection();
		}
		else if(document.selection){
			return document.selection.createRange().text;
		}
	};
	// plugin defaults
	$.fn.bigTarget.defaults = {
		hoverClass	: 'hover',
		clickZone	: 'li:eq(0)',
		title		: true
	};
// end of closure
})(jQuery);

// autocomplete
var $GLOBAL_VAR={"_text":"","_arr":null,"_count":0,"_num":0,"_select":null,"_out_select":null,"_flag":true};

var $callback={
	
	"hidden":function(){
		if($GLOBAL_VAR._flag){
			
			$dt._div.style.display="none";
			
		}
	},
	
	"input_event":function(event){
		
		var _e=event||window.event;
		
		if($GLOBAL_VAR._text==$dt._tbox.value||_e.keyCode=="40"||_e.keyCode=="38")
			{
				
				$o.move(_e);
				
			}else{
				
			$GLOBAL_VAR._count=0;
			
			$GLOBAL_VAR._text=$dt._tbox.value;
			
			if(_e.keyCode=="13"){
				
				$callback.hidden();
			
			}else{
			
				$util.createElement($o.updatelist);
			
			}
		}
	}
};

var Operator=function(){
	
	this.updatelist=function(){
		if(text.length<1){
			$dt._div.style.display="none";
			return;
		}
		$GLOBAL_VAR._arr=text.split("|");
		var _t;
		var _html="";
		for(var _i=0;_i<$GLOBAL_VAR._arr.length-1;_i++)
		{
			_t=$GLOBAL_VAR._arr[_i].split(",");
			_html+=$pro._htmls[0]+_t[0]+$pro._htmls[1]+(_i+1)+$pro._htmls[2]+_t[1]+$pro._htmls[3]+_t[0]+$pro._htmls[4];
		}
			_html+=$pro._htmls[5];
			_html+=$pro._htmls[6];
			$dt._div.innerHTML=_html;
			$dt._div.style.display="block";
			$dt._div.onmouseover=function(){
			$GLOBAL_VAR._flag=false;
		};
			$dt._div.onmouseout=function(){
			$GLOBAL_VAR._flag=true;
		};
			$GLOBAL_VAR._num=$GLOBAL_VAR._arr.length-1;
	};
	
	this.xg=function(){
		$GLOBAL_VAR._arr=text.split("|");
		var _t;
		var _html="";
		for(var _i=0;_i<$GLOBAL_VAR._arr.length-1;_i++){
			if(_i==10){
				continue;
			}
			_t=$GLOBAL_VAR._arr[_i].split(",");
		if(_t[0].length>10||_t[0]==$dt._tbox.value){
			continue;
		}
			_html+=$pro._xghtmls[0]+_t[0]+$pro._xghtmls[1]+_t[0]+$pro._xghtmls[2];
		}if(_html.length<1){
			$util.get("CorrSearch").style.display="none";
		}
			return _html;
	};
	
	this.move=function(_e){
		if(_e.keyCode=="40"){
			$GLOBAL_VAR._count++;
		if($GLOBAL_VAR._count>$GLOBAL_VAR._num){
			$GLOBAL_VAR._count=1;
		}
			this.moveDown();
		}if(_e.keyCode=="38"){
			$GLOBAL_VAR._count--;
		if($GLOBAL_VAR._count<1){
			$GLOBAL_VAR._count=$GLOBAL_VAR._num;
		}
			this.moveUp();
		}
	};
	
	this.moveUp=function(){
		$GLOBAL_VAR._select=$util.get("d_"+$GLOBAL_VAR._count);
		if($GLOBAL_VAR._count==$GLOBAL_VAR._num){
			$GLOBAL_VAR._out_select=$util.get("d_1");
		}else{
			$GLOBAL_VAR._out_select=$util.get("d_"+($GLOBAL_VAR._count+1));
		}
			$GLOBAL_VAR._out_select.style.backgroundColor="";
			$GLOBAL_VAR._select.style.backgroundColor="#FFFF99";
			$dt._tbox.value=$GLOBAL_VAR._arr[$GLOBAL_VAR._count-1].split(",")[0];
	};
	
	this.moveDown=function(){
		$GLOBAL_VAR._select=$util.get("d_"+$GLOBAL_VAR._count);
		if($GLOBAL_VAR._count==1){
			$GLOBAL_VAR._out_select=$util.get("d_"+$GLOBAL_VAR._num);
		}else{
			$GLOBAL_VAR._out_select=$util.get("d_"+($GLOBAL_VAR._count-1));
		}
			$GLOBAL_VAR._out_select.style.backgroundColor="";
			$GLOBAL_VAR._select.style.backgroundColor="#FFFF99";
			$dt._tbox.value=$GLOBAL_VAR._arr[$GLOBAL_VAR._count-1].split(",")[0];
		};
			this.selectText=function(_d){$GLOBAL_VAR._flag=true;
			$dt._tbox.value=_d.title;$callback.hidden();
			window.location.href="http://search.360buy.com/search?keyword="+_d.title;
	};
	
	this.over=function(_d){
		_d.style.backgroundColor="#FFFF99";
	};
	this.out=function(_d){
		_d.style.backgroundColor="";
	};
	
};
	
var MyUtil=function(){
	
	this.get=function(_id){
		return document.getElementById(_id);
	};
	
	this.createElement=function(_callback){
		if($dt._tbox.value.length<1){
			$dt._div.style.display="none";
			return;
		}
		var flag=function(){
			if(_callback==null)
			return;
		};
	
	var _element=null;
	
	var _e=this.get($pro._script_id);
	
	if(_e){
		
		_e.parentNode.removeChild(_e);
		
	}
		_element=document.createElement("script");
		
		_element.id=$pro._script_id;
		
		_element.src=$pro._action+($dt._tbox.value);
		
		_element.type="text/javascript";
		
		document.getElementsByTagName("head")[0].appendChild(_element);
		
		if(document.all){
			_element.onreadystatechange=function(){
				var state=_element.readyState;
				if(state=="loaded"||state=="interactive"||state=="complete"){
					if(_callback==null){
					return;
				}
					_callback();
				}
			};
			
			}else{
				flag();
				_element.onload=_callback;
			}
		};
	
};

	var Properties={
		"_action":"http://search.360buy.com/ks?keyword=",
		"_input":"birds",
		"_div":"tieslide",
		"_script_id":"_rs",
		"_htmls":new Array("<li onmouseover=\"$o.over(this)\" onclick=\"$o.selectText(this)\" onmouseout=\"$o.out(this)\" title='","' id='d_","'><span>约","条</span><div>","</div></li>","","<li class='close'><a href='javascript:void(0)' onclick=\"$('#tieslide').hide()\">关闭</a></li>"),
		"_xghtmls":new Array("<div><a href=\"Search?keyword=","\">","</a></div>")
	};
	
	var Dt=function(t,d){
		this._div=d;this._tbox=t;
	};
	
	var $util=new MyUtil();
	
	var $pro=Properties;
	
	var $o=new Operator();
	
	var $dt=new Dt($util.get($pro._input),$util.get($pro._div));
	
	if(null!==$dt._tbox){
		$dt._tbox.onkeyup=$callback.input_event;
		$dt._tbox.onblur=$callback.hidden;
	}