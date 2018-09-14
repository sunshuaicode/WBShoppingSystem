//bottom 下拉选单
$(document).ready(function() {			
	new $.suning.service($('#friendship_tabs a'), $('#friendship_content')).init();	
});
/**bottom list */
(function () {
	//using namespace $.suning;
	$.suning || ($.suning = {});
	
	//Extends
	$.suning.extend = function (subClass, superClass) {
		var F = function() {};
		F.prototype = superClass.prototype;
		subClass.prototype = new F();
		superClass.prototype.constructor = superClass;
		subClass.prototype.constructor = subClass;
		subClass.base = superClass.prototype;
	}
})();


//friendship
$.suning.service = function(t, d) {
	this.tabs = t;
	this.data = d.children();
	this.loc = -1;
	this.d = d;
	this.btn = $(this.data[4]);
	this.isopen = false;
	this.type = 0;
	this.delayTimer = 1;
	this.showTimer = 2;
	this.hT = 3;
}
$.suning.service.prototype = {
	init: function() {
		var that = this;
		this.data.each(function(i) {
			if (i < 4) {
				$(this).find("a").mouseover(function() {
					that.type = 1;
				});
				$(this).mouseover(function(e) {
					that.type = 1;
					clearTimeout(that.hT);
				}).mouseout(function(e) {
					that.type = 2;
					that.delay();
				});
			}
		});
		this.tabs.each(function(i) {
			$(this).mouseover(function(e) {
				clearTimeout(that.hT);
				if (that.loc != i) {
					clearTimeout(that.showTimer);
					that.showTimer = setTimeout(function() {
						that.change(i);
					}, 50);
				}
			}).mouseout(function() {
				clearTimeout(that.showTimer);
				that.hT = setTimeout(function() {
					that.close();
				},1000);
			});
		});
		this.btn.click(function(e) {
			that.close();
		});
	},
	delay: function() {
		clearTimeout(this.delayTimer);
		var ref = this;
		this.delayTimer = setTimeout(function() {
			ref.delayCall();
		}, 300);
	},
	delayCall: function() {
		if (this.type == 2) {
			this.close();
		}
	},
	close:function() {
		$(this.data[this.loc]).animate({'top': 200});
		var that = this;
		this.isopen = false;
		this.btn.animate({'top':200},function() {
			if (!that.isopen) {
				that.d.css('height', '0px');
			}
		});
		this.loc = -1;
	},
	change: function(loc) {
		this.type = 1;
		this.isopen = true;
		$(this.data[loc]).animate({'top': 130});
		if (this.loc != -1) {
			$(this.data[this.loc]).animate({'top': 200});
		} else {
			this.d.css('height', '200px');

			this.btn.animate({'top':135});
		}
		this.loc = loc;
	}
};