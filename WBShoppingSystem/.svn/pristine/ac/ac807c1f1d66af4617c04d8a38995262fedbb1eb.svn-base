<%@page import="com.mysql.cj.api.Session"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"  import="java.util.*,edu.shopsys.model.GoodsorderAndGoods,edu.shopsys.controller.OrderManner"%>
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
			<script type="text/javascript" src="${pageContext.request.contextPath}/view_admin/js/H-ui.js"></script>
			<script src="${pageContext.request.contextPath}/view_admin/assets/js/typeahead-bs2.min.js"></script>
			<script src="${pageContext.request.contextPath}/view_admin/assets/js/jquery.dataTables.min.js"></script>
			<script src="${pageContext.request.contextPath}/view_admin/assets/js/jquery.dataTables.bootstrap.js"></script>
			<script src="${pageContext.request.contextPath}/view_admin/assets/layer/layer.js" type="text/javascript"></script>
			<script src="${pageContext.request.contextPath}/view_admin/assets/laydate/laydate.js" type="text/javascript"></script>
			<script src="${pageContext.request.contextPath}/view_admin/assets/js/jquery.easy-pie-chart.min.js"></script>
			<script src="${pageContext.request.contextPath}/view_admin/js/lrtk.js" type="text/javascript"></script>
			<title>订单管理 </title>
			<script>
			    $.post("${pageContext.request.contextPath}/OrderManner",{method:"allorderquery"});
			</script>
</head>
<body>
          <div class="search_style">
             <ul class="search_content clearfix">
                 <li><label class="l_f">订单编号</label><input name="" type="text" class="text_add" placeholder="请输入订单编号" style=" width:250px" /></li>
                 <!-- <li><label class="l_f">时间</label><input class="inline laydate-icon" id="start" style=" margin-left:10px;"></li> -->
                 <li style="width:90px;"><button type="button" class="btn_search"><i class="fa fa-search"></i>查询</button></li>
             </ul>
          </div>
          <!--订单列表展示-->
          <div  class="margin clearfix">
          <table class="table table-striped table-bordered table-hover" id="sample-table">
		    <thead>
		      <tr>
				<th width="25px"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th>
				<th width="80px">订单编号</th>
				<th width="150px">产品名称</th>
				<th width="100px">产品图片</th>
				<th width="100px">单价</th>
				<th width="100px">数量</th>
				<th width="100px">总计价格</th>
				<th width="100px">支付方式</th>	
                <th width="100px">订单时间</th>
                <th width="100px">所属用户</th>				
				<th width="100px">订单状态</th>                
				<th width="100px">操作</th>
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
<span id="test"></span>
 <!--发货-->
 <div id="Delivery_stop" style=" display:none">
  <div class="">
    <div class="content_style">
  <div class="form-group"><label class="col-sm-2 control-label no-padding-right" for="form-field-1">快递公司 </label>
       <div class="col-sm-9"><select class="form-control" id="form-field-select-1">
																<option value="">--选择快递--</option>
																<option value="1">天天快递</option>
																<option value="2">圆通快递</option>
																<option value="3">中通快递</option>
																<option value="4">顺丰快递</option>
																<option value="5">申通快递</option>
																<option value="6">邮政EMS</option>
																<option value="7">邮政小包</option>
																<option value="8">韵达快递</option>
															</select></div>
	</div>
	    <%StringBuilder str=new StringBuilder();//定义变长字符串
	     Random random=new Random();
	     //随机生成数字，并添加到字符串
	     for(int i=0;i<8;i++){
	       str.append(random.nextInt(10));
	     }%>
   <div class="form-group"><label class="col-sm-2 control-label no-padding-right" for="form-field-1"> 快递号 </label>
    <div class="col-sm-9"><input type="text" id="form-field-1" placeholder="快递号" class="col-xs-10 col-sm-5" style="margin-left:0px;" value=<%=str %>></div>
	</div>
 </div>
</body>
</html>
<script>
 $(function() { 
	$("#cover_style").fix({
		float : 'top',
		minStatue : false,
		skin : 'green',	
		durationTime :false,
		window_height:30,//设置浏览器与div的高度值差
		spacingw:0,//
		spacingh:0,//
		close_btn:'.yingchan_btn',
		show_btn:'.xianshi_btn',
		side_list:'.hide_style',
		widgetbox:'.top_style',
		close_btn_width:60,	
		da_height:'#centent_style,.left_Treeview,.list_right_style',	
		side_title:'.b_n_btn',		
		content:null,
		left_css:'.left_Treeview,.list_right_style'
		
		
	});
});

//时间选择
 laydate({
    elem: '#start',
    event: 'focus' 
});
/*订单-删除*/
function Order_form_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		
		$.ajax({
			method:"POST",
			url:"${pageContext.request.contextPath}/OrderManner",
			data:"method=deleteorder&orderid="+$(obj).parents("tr").children("td").eq(1).text(),
			success:function(data){
				data=parseInt($.trim(data));
				if(data==1){
					$(obj).parents("tr").remove();
					layer.msg('已删除!',{icon:1,time:1000});
				}else{
					layer.msg('删除失败!',{icon:2,time:1000});
				}
			},
			error:function(){
				layer.msg('数据上传失败!',{icon:0,time:1000});
			}
		});
		
	});
}

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
			 layer.confirm('开始提交！',function(index){
			    $.ajax({
			    	url:"${pageContext.request.contextPath}/OrderManner",
	    			type:"POST",
	    			data:"method=setstatebyid&orderid="+$(obj).parents("tr").children("td").eq(1).text()+"&state=已发货",
	    			success:function(data){
	    				data=parseInt($.trim(data));
	    				if(data==1){
	    					$(obj).parents("tr").find(".td-manage").prepend('<a style=" display:none" class="btn btn-xs btn-success" onClick="member_stop(this,id)" href="javascript:;" title="已发货"><i class="fa fa-cubes bigger-120"></i></a>');
	    				     $(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已发货</span>');
	    				     $(obj).remove();
	    				     layer.msg('已发货!',{icon: 6,time:1000});
	    				}else{
	    					layer.msg('发货失败!',{icon: 2,time:1000});
	    				}
	    			},
	    			error:function(){
	    				layer.msg('数据传输失败!',{icon: 0,time:1000});
	    			}
			    });	 
			});  
			layer.close(index);    		  
		  }
		
		}
	})
};

//面包屑返回值
var index = parent.layer.getFrameIndex(window.name);
parent.layer.iframeAuto(index);
$('.Order_form,.order_detailed').on('click', function(){
	var cname = $(this).attr("title");
	var chref = $(this).attr("href");
	var cnames = parent.$('.Current_page').html();
	var herf = parent.$("#iframe").attr("src");
    parent.$('#parentIframe').html(cname);
    parent.$('#iframe').attr("src",chref).ready();;
	parent.$('#parentIframe').css("display","inline-block");
	parent.$('.Current_page').attr({"name":herf,"href":"javascript:void(0)"}).css({"color":"#4c8fbd","cursor":"pointer"});
	//parent.$('.Current_page').html("<a href='javascript:void(0)' name="+herf+" class='iframeurl'>" + cnames + "</a>");
    parent.layer.close(index);
	
});

//初始化宽度、高度  
  var heights=$(".top_style").outerHeight()+47; 
 $(".centent_style").height($(window).height()-heights); 
 $(".page_right_style").width($(window).width()-220);
 $(".left_Treeview,.list_right_style").height($(window).height()-heights-2); 
 $(".list_right_style").width($(window).width()-250);
  //当文档窗口发生改变时 触发  
    $(window).resize(function(){
	$(".centent_style").height($(window).height()-heights); 
	 $(".page_right_style").width($(window).width()-220);
	 $(".left_Treeview,.list_right_style").height($(window).height()-heights-2);  
	 $(".list_right_style").width($(window).width()-250);
	}) 
//比例
var oldie = /msie\s*(8|7|6)/.test(navigator.userAgent.toLowerCase());
			$('.easy-pie-chart.percentage').each(function(){
				$(this).easyPieChart({
					barColor: $(this).data('color'),
					trackColor: '#EEEEEE',
					scaleColor: false,
					lineCap: 'butt',
					lineWidth: 10,
					animate: oldie ? false : 1000,
					size:103
				}).css('color', $(this).data('color'));
			});
		
			$('[data-rel=tooltip]').tooltip();
			$('[data-rel=popover]').popover({html:true});
 
</script>
<script>
//订单列表
jQuery(function($) {
		var oTable1 = $('#sample-table').dataTable( {
		"aaSorting": [[ 1, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
		"aoColumnDefs": [
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[0,1,2,3,4,5,6,7,8,9]}// 制定列不参与排序
		] } );
				
				
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

<script type="text/javascript">
   $(document).ready(function(){ 
	   
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
    				   window.location.assign("${pageContext.request.contextPath}/view_admin/view/Orderform.jsp");
    				}
    			}
    		});
    	});
      
   });
</script>