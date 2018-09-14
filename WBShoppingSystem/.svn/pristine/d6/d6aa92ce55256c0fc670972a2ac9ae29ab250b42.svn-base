<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.util.ArrayList,java.util.List,edu.shopsys.model.Goods,com.alibaba.fastjson.*"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="g" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit|ie-comp|ie-stand">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport"
			content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
		<meta http-equiv="Cache-Control" content="no-siteapp" />
		<link href="${pageContext.request.contextPath}/view_admin/assets/css/bootstrap.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/view_admin/css/style.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/view_admin/assets/css/ace.min.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/view_admin/assets/css/font-awesome.min.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/view_admin/Widget/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css">
			<link href="${pageContext.request.contextPath}/view_admin/Widget/icheck/icheck.css" rel="stylesheet" type="text/css" />
			<!--[if IE 7]>
		  <link rel="stylesheet" href="assets/css/font-awesome-ie7.min.css" />
		<![endif]-->
			<!--[if lte IE 8]>
		  <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
		<![endif]-->
			<script src="${pageContext.request.contextPath}/view_admin/js/jquery-1.9.1.min.js"></script>
			<script src="${pageContext.request.contextPath}/view_admin/assets/js/bootstrap.min.js"></script>
			<script src="${pageContext.request.contextPath}/view_admin/assets/js/typeahead-bs2.min.js"></script>
			<!-- page specific plugin scripts -->
			<script src="${pageContext.request.contextPath}/view_admin/assets/js/jquery.dataTables.min.js"></script>
			<script src="${pageContext.request.contextPath}/view_admin/assets/js/jquery.dataTables.bootstrap.js"></script>
			<script type="text/javascript" src="${pageContext.request.contextPath}/view_admin/js/H-ui.js"></script>
			<script type="text/javascript" src="${pageContext.request.contextPath}/view_admin/js/H-ui.admin.js"></script>
			<script src="${pageContext.request.contextPath}/view_admin/assets/layer/layer.js" type="text/javascript"></script>
			<script src="${pageContext.request.contextPath}/view_admin/assets/laydate/laydate.js" type="text/javascript"></script>
			<script type="text/javascript" src="${pageContext.request.contextPath}/view_admin/Widget/zTree/js/jquery.ztree.all-3.5.min.js"></script>
			<script src="${pageContext.request.contextPath}/view_admin/js/lrtk.js" type="text/javascript"></script>
			<title>产品列表 - 素材牛模板演示</title>
<script type="text/javascript">
$(document).ready(function(){ 
	/*按商品名称模糊查询  */
	 $("#settle_goods").click(function(){
		   $.ajax({
		 	   type:"post",
		 	   url:"${pageContext.request.contextPath}/AdminController",
		 	   data:"method=goods&goodsname="+$("#goodsname").val(),
		 	   success:function(){
		 		  window.location.href ='${pageContext.request.contextPath}/view_admin/view/Products_List.jsp';   
		 	   }
		  }); 
});
	/*打开页面获取所有商品信息 */
});	
</script>
<script type="text/javascript">
function up(){
	 $.ajax({
		  type:"POST",
		  url:"${pageContext.request.contextPath}/AdminController",
		  data:"method=product",
		  success:function(){
	 		  window.location.href ='${pageContext.request.contextPath}/view_admin/view/Products_List.jsp';   
	 	   }
	  });
}
</script>
</head>
<body>
	<div class=" page-content clearfix">
		<div id="products_style">
			<div class="search_style">
				<ul class="search_content clearfix">
					<li><label class="l_f">产品名称</label><input id="goodsname" type="text"
						class="text_add" placeholder="输入产品名称" style="width: 250px" /></li>
					<li style="width: 90px;"><button type="button"
							class="btn_search" id="settle_goods">
							<i class="icon-search"></i>查询
						</button></li>
				</ul>
			</div>
			<div class="border clearfix">
				<span class="l_f"> <a href="picture-add.jsp" title="添加商品"
					class="btn btn-warning Order_form"><i class="icon-plus"></i>添加商品</a>
					<a href="javascript:ovid()" class="btn btn-danger"><i
						class="icon-trash"></i>批量删除</a>
				</span> <span class="r_f">共：<b><%=request.getSession().getAttribute("sum")%></b>件商品
				</span>
			</div>
				<div class="table_menu_list" id="testIframe">
					<table class="table table-bordered" id="sample-table">
						<thead>
							<tr>
								<th width="25px"><label><input type="checkbox"
										class="ace" id="selectall"><span class="lbl"></span></label></th>
								<th width="100px">产品编号</th>
								<th width="150px">产品名称</th>
								<th width="120px">产品类型</th>
								<th width="120px">产品图片</th>
								<th width="100px">现价</th>
								<th width="200px">产品信息</th>
								<th width="100px">产品库存</th>
								<th width="100px">产品供应商</th>
								<!-- <th width="70px">状态</th> -->
								<th width="150px">操作</th>
							</tr>
						</thead>
						<%List<Goods> list=(List<Goods>)request.getSession().getAttribute("goods"); %>
						<tbody>
						<g:forEach var="gd" items="<%=list%>" varStatus="vs" begin="0" step="1">
							<tr>
							<td width="25px"><label><input type="checkbox"
								class="ace"><span class="lbl"></span></label></td>
							<td>${gd.goods_id}</td>
							<td>${gd.goods_name}</td>
							<td>${gd.goods_type}</td>
							<td><img src="${pageContext.request.contextPath}/view_user/${gd.goods_image}" width="60px"/></td>
							<td>${gd.goods_price}</td>
							<td>${gd.goods_info}</td>
							<td>${gd.goods_stock}</td>
							<td>${gd.goods_brand}</td>
							<!-- <td class="td-status"><span
									class="label label-success radius">已启用</span></td> -->
								<td class="td-manage"><!-- <a
									onClick="member_stop(this,'10001')" href="javascript:;"
									title="停用" class="btn btn-xs btn-success"><i
										class="icon-ok bigger-120"></i></a> --> <a title="编辑"
									href="javascript:;" onclick="member_edit(this,'1')" class="btn btn-xs btn-info"><i
										class="icon-edit bigger-120"></i></a> <a title="删除"
									href="javascript:;" onclick="member_del(this,'1')"
									class="btn btn-xs btn-warning"><i
										class="icon-trash  bigger-120"></i></a></td>
								</tr>
							</g:forEach>
						</tbody>
					</table>
				</div>
			<!-- </div> -->
		</div>
	</div>
</body>
</html>
<script>
jQuery(function($) {
		var oTable1 = $('#sample-table').dataTable( {
		"aaSorting": [[ 1, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
		"aoColumnDefs": [
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[0,2,3,4,5,8,9]}// 制定列不参与排序
		] } );
				
				
			/* 	$('table th input:checkbox').on('click' , function(){
					var that = this;
					$(this).closest('table').find('tr > td:first-child input:checkbox')
					.each(function(){
						this.checked = that.checked;
						$(this).closest('tr').toggleClass('selected');
					});
						
				}); */
			
			
				$('[data-rel="tooltip"]').tooltip({placement: tooltip_placement});
				function tooltip_placement(context, source) {
					var $source = $(source);
					var $parent = $source.closest('table')
					var off1 = $parent.offset();
					var w1 = $parent.width();
			
					var off2 = $source.offset();
					var w2 = $source.width();
			
					if( parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2) ) return 'right';
					return 'left';
				}
			});
 laydate({
    elem: '#start',
    event: 'focus' 
});
$(function() { 
	$("#products_style").fix({
		float : 'left',
		//minStatue : true,
		skin : 'green',	
		durationTime :false,
		spacingw:30,//设置隐藏时的距离
	    spacingh:260,//设置显示时间距
	});
});
</script>
<script type="text/javascript">
//初始化宽度、高度  
 $(".widget-box").height($(window).height()-215); 
$(".table_menu_list").width($(window).width()-260);
 $(".table_menu_list").height($(window).height()-215);
  //当文档窗口发生改变时 触发  
    $(window).resize(function(){
	$(".widget-box").height($(window).height()-215);
	 $(".table_menu_list").width($(window).width()-260);
	  $(".table_menu_list").height($(window).height()-215);
	})
 
/*******树状图*******/
var setting = {
	view: {
		dblClickExpand: false,
		showLine: false,
		selectedMulti: false
	},
	data: {
		simpleData: {
			enable:true,
			idKey: "id",
			pIdKey: "pId",
			rootPId: ""
		}
	},
	callback: {
		beforeClick: function(treeId, treeNode) {
			var zTree = $.fn.zTree.getZTreeObj("tree");
			if (treeNode.isParent) {
				zTree.expandNode(treeNode);
				return false;
			} else {
				demoIframe.attr("src",treeNode.file + ".html");
				return true;
			}
		}
	}
};
		
var code;
		
function showCode(str) {
	if (!code) code = $("#code");
	code.empty();
	code.append("<li>"+str+"</li>");
}
		
$(document).ready(function(){
	var t = $("#treeDemo");
	t = $.fn.zTree.init(t, setting, zNodes);
	demoIframe = $("#testIframe");
	demoIframe.bind("load", loadReady);
	var zTree = $.fn.zTree.getZTreeObj("tree");
	zTree.selectNode(zTree.getNodeByParam("id",'11'));
});	
/*产品-编辑*/
function member_edit(obj,id){
	     var goodsId = $(obj).parents("tr").children("td").eq(1).text();
	     var name = $(obj).parents("tr").children("td").eq(2).text();
	     var type = $(obj).parents("tr").children("td").eq(3).text();
	     var price = $(obj).parents("tr").children("td").eq(5).text();
	     var info = $(obj).parents("tr").children("td").eq(6).text();
	     var stock = $(obj).parents("tr").children("td").eq(7).text();
	     var brand = $(obj).parents("tr").children("td").eq(8).text();
			alert(goodsId); 
			var newInfo = prompt("请按照以下格式输入：",goodsId+"/"+name+"/"+type+"/"+price+"/"+info+"/"+stock+"/"+brand);
			newInfo = goodsId+"/"+newInfo;
			$.ajax({
				method:"post",
				   url:"${pageContext.request.contextPath}/AdminController",
				  data:"method=update&goodsUp="+newInfo,
				  success:function(data){
					  if(data){
						  layer.msg('修改成功!',{icon:1,time:1000});
						   up();
						  //window.location.href ='${pageContext.request.contextPath}/view_admin/view/Products_List.jsp';   
					  }else{
							layer.msg('修改失败!',{icon:2,time:1000});
				  }
				  },
				   error:function(){
					     layer.msg('数据上传失败!',{icon:0,time:1000});
						}
			});
			/* $(this).parents("form").attr("action", '${pageContext.request.contextPath}/AdminController?goodsUp='+newInfo+"&method=update");
			$(this).parents("form").submit(); */
	}

/*产品-删除*/
function member_del(obj,id){
	alert(111111111111);
	 layer.confirm('确认要删除吗？',function(index){
		$.ajax({
			method:"POST",
			url:"${pageContext.request.contextPath}/AdminController",
			data:"method=delete&goodsId="+$(obj).parents("tr").children("td").eq(1).text(),
			success:function(data){
				if(data){
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
//面包屑返回值
var index = parent.layer.getFrameIndex(window.name);
parent.layer.iframeAuto(index);
$('.Order_form').on('click', function(){
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
</script>
