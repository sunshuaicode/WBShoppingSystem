<%@page import="com.mysql.cj.api.Session"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.util.*,edu.shopsys.model.GoodsorderAndGoods,edu.shopsys.controller.OrderManner"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="gxun" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit|ie-comp|ie-stand">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta http-equiv="Cache-Control" content="no-siteapp" />
		<link href="${pageContext.request.contextPath}/view_admin/assets/css/bootstrap.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/view_admin/css/style.css" />
		<link href="${pageContext.request.contextPath}/view_admin/assets/css/codemirror.css" rel="stylesheet">
			<link rel="stylesheet" href="${pageContext.request.contextPath}/view_admin/assets/css/ace.min.css" />
			<link rel="stylesheet" href="${pageContext.request.contextPath}/view_admin/font/css/font-awesome.min.css" />		
		    <link rel="stylesheet" href="${pageContext.request.contextPath}/view_admin/assets/css/ace-ie.min.css" />
			<script src="${pageContext.request.contextPath}/view_admin/js/jquery-1.9.1.min.js"></script>
			<script src="${pageContext.request.contextPath}/view_admin/assets/js/bootstrap.min.js"></script>
			<script src="${pageContext.request.contextPath}/view_admin/assets/js/typeahead-bs2.min.js"></script>
			<script src="${pageContext.request.contextPath}/view_admin/assets/js/jquery.dataTables.min.js"></script>
			<script src="${pageContext.request.contextPath}/view_admin/assets/js/jquery.dataTables.bootstrap.js"></script>
			<script src="${pageContext.request.contextPath}/view_admin/assets/layer/layer.js" type="text/javascript"></script>
			<script src="${pageContext.request.contextPath}/view_admin/assets/laydate/laydate.js" type="text/javascript"></script>
			<script src="${pageContext.request.contextPath}/view_admin/js/lrtk.js" type="text/javascript"></script>
			<title>订单处理</title>
		<script type="text/javascript">
            $(document).ready(function(){ 
            	$.post("${pageContext.request.contextPath}/OrderManner",{method:"allorderquery"});
	              //$.post("${pageContext.request.contextPath}/OrderManner",{method:"allorderquery"});
	        $(".btn_search").click(function(){
    		   $.ajax({
    			url:"${pageContext.request.contextPath}/OrderManner",
    			type:"POST",
    			data:"method=orderquerybyid&orderid="+$(".text_add").val(),
    			success:function(data){
    				data=parseInt($.trim(data));
    				if(data==1){
    					//alert("ok");
    				   //$("#table_ss").html($("#table_ss").html());
    				   window.location.assign("${pageContext.request.contextPath}/view_admin/view/Order_handling.jsp");
    				}
    			}
    		});
    	});
      
   });
</script>
</head>

<body>
	<div class="clearfix">
		<div class="handling_style" id="order_hand">
			<div id="scrollsidebar" class="left_Treeview">
				<div class="show_btn" id="rightArrow">
					<span></span>
				</div>
				<div class="widget-box side_content">
					<div class="side_title">
						<a title="隐藏" class="close_btn"><span></span></a>
					</div>
					<div class="side_list">
						<div class="widget-header header-color-green2">
							<h4 class="lighter smaller">订单操作</h4>
						</div>
						<div class="widget-body">
							<ul class="b_P_Sort_list">
								<li><i class="orange  fa fa-reorder"></i><a href="#">全部订单</a></li>
								<li><i class="fa fa-sticky-note pink "></i> <a href="#">已完成</a></li>
								<li><i class="fa fa-sticky-note pink "></i> <a href="#">待付款</a></li>
								<li><i class="fa fa-sticky-note pink "></i> <a href="#">待发货</a></li>
								<li><i class="fa fa-sticky-note pink "></i> <a href="#">已发货</a></li>
								<li><i class="fa fa-sticky-note pink "></i> <a href="#">取消订单</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="order_list_style" id="order_list_style">
				<div class="search_style">

					<ul class="search_content clearfix">
						<li><label class="l_f">订单编号</label>
						          <input name="" type="text"class="text_add" placeholder="输入订单编号" style="width: 250px" />
						</li>
						<!-- <li><label class="l_f">交易时间</label><input class="inline laydate-icon" id="start" style="margin-left: 10px;"></li> -->	
						<li style="width: 90px;"><button type="button" class="btn_search">
								<i class="fa fa-search"></i>查询</button>
						</li>
					</ul>
				</div>
				<!--交易订单列表-->
				<div class="Orderform_list">
					<table class="table table-striped table-bordered table-hover"
						id="sample-table">
						<thead>
							<tr>
								<th width="25px"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th>
								<th width="150px">订单编号</th>
				                <th width="200px">产品名称</th>
				                <th width="150px">产品图片</th>
				                <th width="100px">单价</th>
				                <th width="100px">数量</th>
				                <th width="150px">总计价格</th>
				                <th width="100px">支付方式</th>	
                                <th width="150px">订单时间</th>
                                 <th width="100px">所属用户</th>				
				                <th width="70px">订单状态</th>                
				                <th width="200px">操作</th>
							</tr>
						</thead>
						<tbody>
			<%
	            List<GoodsorderAndGoods> list = (List<GoodsorderAndGoods>)request.getSession().getAttribute("GoodsOrderAndGoods");
	         %>
	            <gxun:forEach var="ordergoods" items="<%=list%>" varStatus="vs" begin="0" step="1">
				<tr>
				    <td><label><input type='checkbox' class='ace'><span class='lbl'></span></label></td>
					<td>${ordergoods["order_id"]}</td>
					<td>${ordergoods["goods_name"]}</td>
					<td class='order_product_name'><img src='${pageContext.request.contextPath}/view_user/${ordergoods.goods_image}' title='产品图片'/></td>
					<td>${ordergoods.goods_price}</td>
					<td>${ordergoods.order_goods_amount}</td>
					<td>${ordergoods.counntgoodsprice}</td>
					<td>${ordergoods.order_pay}</td>
					<td>${ordergoods.order_time}</td>
					<td>${ordergoods.order_user_id}</td>
					<td class='td-status'><span class='label label-success radius'>${ordergoods.order_state}</span></td>
					<td><a onClick='Delivery_stop(this,"10001")'  href='javascript:;' title='发货'  class='btn btn-xs btn-success'><i class='fa fa-cubes bigger-120'></i></a>
					    <%-- <a title='订单详细' href='${pageContext.request.contextPath}/view_admin/view/order_detailed.jsp'  class='btn btn-xs btn-info order_detailed' ><i class='fa fa-list bigger-120'></i></a> --%>
					    <a title='删除' href='javascript:;'  onclick='Order_form_del(this,"1")' class='btn btn-xs btn-warning' ><i class='fa fa-trash  bigger-120'></i></a>
				    </td></tr>
			</gxun:forEach> 
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<!--发货-->
	<div id="Delivery_stop" style="display: none">
		<div class="">
			<div class="content_style">
				<div class="form-group">
					<label class="col-sm-2 control-label no-padding-right"
						for="form-field-1">快递公司 </label>
					<div class="col-sm-9">
						<select class="form-control" id="form-field-select-1">
							<option value="">--选择快递--</option>
							<option value="1">天天快递</option>
							<option value="2">圆通快递</option>
							<option value="3">中通快递</option>
							<option value="4">顺丰快递</option>
							<option value="5">申通快递</option>
							<option value="6">邮政EMS</option>
							<option value="7">邮政小包</option>
							<option value="8">韵达快递</option>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label no-padding-right"
						for="form-field-1"> 快递号 </label>
					<div class="col-sm-9">
						<input type="text" id="form-field-1" placeholder="快递号" class="col-xs-10 col-sm-5" style="margin-left: 0px;">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label no-padding-right"
						for="form-field-1">货到付款 </label>
					<div class="col-sm-9">
						<label><input name="checkbox" type="checkbox" class="ace" id="checkbox"><span class="lbl"></span></label>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<script>
$(function() { 
	$("#order_hand").fix({
		float : 'left',
		//minStatue : true,
		skin : 'green',	
		durationTime :false,
		spacingw:30,//设置隐藏时的距离
	    spacingh:250,//设置显示时间距
		table_menu:'.order_list_style',
	});
});


//时间
 laydate({
    elem: '#start',
    event: 'focus' 
});
//初始化宽度、高度  
 $(".widget-box").height($(window).height()); 
$(".order_list_style").width($(window).width()-220);
 $(".order_list_style").height($(window).height()-30);
  //当文档窗口发生改变时 触发  
    $(window).resize(function(){
	$(".widget-box").height($(window).height());
	 $(".order_list_style").width($(window).width()-234);
	  $(".order_list_style").height($(window).height()-30);
});
/**发货**/
function Delivery_stop(obj,id){
	layer.open({
        type: 1,
        title: '发货',
		maxmin: true, 
		shadeClose:false,
        area : ['500px' , ''],
        content:$('#Delivery_stop'),
		btn:['确定','取消'],
		yes: function(index, layero){		
		if($('#form-field-1').val()==""){
			layer.alert('快递号不能为空！',{
               title: '提示框',				
			  icon:0,		
			  }) 
			
			}else{			
			 layer.confirm('提交成功！',function(index){
		$(obj).parents("tr").find(".td-manage").prepend('<a style=" display:none" class="btn btn-xs btn-success" onClick="member_stop(this,id)" href="javascript:;" title="已发货"><i class="fa fa-cubes bigger-120"></i></a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已发货</span>');
		$(obj).remove();
		layer.msg('已发货!',{icon: 6,time:1000});
			});  
			layer.close(index);    		  
		  }
		
		}
	})
};
//订单列表
jQuery(function($) {
		var oTable1 = $('#sample-table').dataTable( {
		"aaSorting": [[ 1, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
		"aoColumnDefs": [
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[0,2,3,4,5,6,8,9]}// 制定列不参与排序
		] } );
                 //全选操作
				$('table th input:checkbox').on('click' , function(){
					var that = this;
					$(this).closest('table').find('tr > td:first-child input:checkbox')
					.each(function(){
						this.checked = that.checked;
						$(this).closest('tr').toggleClass('selected');
					});
						
				});
			});
</script>
