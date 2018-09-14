<%@page import="java.util.*"%>
<%@page import="edu.shopsys.service.impl.UserServiceImpl"%>
<%@page import="edu.shopsys.service.UserService"%>
<%@page import="edu.shopsys.model.Goods" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
   UserService service = new UserServiceImpl();
   Goods goods = new Goods();
   String[] id = request.getParameter("goodsId").split(":");
   goods = service.queryById(id[1]);
%>
<script type="text/javascript">
    $(function(){
    	$(".cat_btm").bind('click',function(){
    		var color = $("#goods_color2").text();
    		var size = $("#result").text();
    		var goodsId = $("#goodsId").text();
    		var amount = $("#qty_item_1").attr("value");
    		if(color=="未选择"){
    			alert("请选择您喜爱的颜色哟");
    		}else if(size=="未选择"){
    			alert("请选择合适您的尺码哟");
    		}else{
//     			alert(color+"@"+size+"@"+goodsId+"@"+amount);
        		$.ajax({
        			type:"post",
        			url:"SearchController?method=carSearch",
        			data:"goodsId="+goodsId+"&size="+size+"&color="+color+"&amount="+amount,
//         			dataType:"json",
        			success:function(data){
//         				window.location.assign("cart.jsp?user="+data);
        				window.location.href="cart.jsp?user="+data;
        			}
        		})
    		}
    		
//             $("form:eq(1)").submit();
    	})
    	
    });
</script>
<div class="p_number">
	<div class="f_l add_chose">
		<a class="reduce" onClick="setAmount.reduce('#qty_item_1')" href="javascript:void(0)">-</a>
		<input type="text" name="qty_item_1" value="1" id="qty_item_1" onKeyUp="setAmount.modify('#qty_item_1')" class="text" />
		<a class="add" onClick="setAmount.add('#qty_item_1')" href="javascript:void(0)">+</a>
	</div>
	<div class="f_l buy">总价：<span class="total-font red" id="total_item_1"><%=goods.getGoods_price() %></span><input type="text" name="total_price" id="total_price" value="" style="display:none;" /><span class="jifen">购买商品可获得：<b id="total_points" class="red">18</b>积分</span></div>
</div><!--p_number end-->	
<div class="choose_size_b">
	<div class="f_l add_collect"><a href="login-register.jsp?keepThis=true&amp;TB_iframe=true&amp;height=439&amp;width=600" title="您尚未登录" class="collection thickbox"></a></div>
	<div class="f_l add_cat" id="cat_btm"><a href="#" class="cat_btm"></a></div>							
</div><!--choose_size_b end-->
