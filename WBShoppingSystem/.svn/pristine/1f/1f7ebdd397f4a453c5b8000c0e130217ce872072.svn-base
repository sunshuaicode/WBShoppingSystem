package edu.shopsys.service;

import java.sql.SQLException;
import java.util.List;

import edu.shopsys.model.Admin;
import edu.shopsys.model.Goods;
import edu.shopsys.model.GoodsOrder;
import edu.shopsys.model.GoodsorderAndGoods;
import edu.shopsys.model.User;

public interface AdminService {
	int access = 0;
	int isfalse = -1;
	
	        //管理员登录
			Boolean login(String userID,String pwd);
		    
		    //查询所有商品
			List<Goods> queryGoods();
			
			//查询商品,按 商品名称模糊查询
			List<Goods> queryGoods(String GoodName);
			
			//上架商品
			Boolean addGoods(Goods goods);
			
			//下架商品
			Boolean dedelteGoods(String goodsId);
			
			//ͣ停用商品
			Boolean stopGoods(int goodsId);
			
			//修改商品信息
			Boolean modifyGoodsInfo(String goodsInfo);
			
			//按编号仅仅查询订单信息
			List<GoodsOrder> queryByOrderID(int orderID,int page);
			
			//设置订单状态̬
			Boolean setOrderState(String orderID,String orderState);
			
			//统计总用户数
	        long  countsUser();
	        
	        //总交易总金额（订单表）
	        Double sumMoney();
			
	        //订单货物管理页面 查询 
	        List<GoodsorderAndGoods> queryGoodsOrderAndGoods();
			
			//订单处理货物页面查询,按订单状态
	        List<GoodsorderAndGoods> queryGoodsOrderAndGoodsByState(String orderState);
			
	        //
	        List<GoodsorderAndGoods> queryGoodsOrderAndGoodsByType(String goodstype);
	        
			//订单货物查询,按订单ID
	        List<GoodsorderAndGoods> queryGoodsOrderAndGoodsByID(String orderID);
			
			//总订单数量，已完成订单数量，交易失败订单数量
			int allOrderMount();
			int successOrderMount();
			int failOrderMount();
			//查询所有会员信息
			List<User> queryUser() throws SQLException;
			
			//模糊查询会员信息Byname
			List<User> queryUser(String user_NAME) throws SQLException;
			
			//查询所有管理员信息
			List<Admin> queryAdmin() throws SQLException;
			
			//查询会员人数
			Long countUser() throws SQLException;
			
			//根据会员id删除会员信息
			void delectUser(String user_id) throws SQLException;

			//修改会员信息
			void updateUser(User u) throws SQLException;
			
			//查询所有会员信息ByID   
			User queryUserById(String user_ID) throws SQLException;
			
			//已付款订单数
	        long accountPaid();
	        
	        //待发货订单数
	        long pronoun();
	        
	        //待结算订单数
	        long settlement();
	        
	        //商品总数
	        long sumAmount();
	        
	        //上架商品数
	        long putaway();
	        
	        //下架商品数
	        long soldOut();     
	        
	        //根据订单Id删除订单
	        Boolean deleteOrder(String orderid);
}
