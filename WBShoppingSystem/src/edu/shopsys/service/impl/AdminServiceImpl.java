package edu.shopsys.service.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import org.omg.DynamicAny.DynAnyOperations;

import com.alibaba.fastjson.JSONArray;

import edu.shopsys.DAO.AdminDAO;
import edu.shopsys.DAO.Impl.AdminDAOImpl;

import edu.shopsys.model.Admin;
import edu.shopsys.model.Goods;
import edu.shopsys.model.GoodsOrder;
import edu.shopsys.model.GoodsorderAndGoods;
import edu.shopsys.model.User;
import edu.shopsys.service.AdminService;

public class AdminServiceImpl implements AdminService{
	@Override
	//管理员登录
	public Boolean login(String userID, String pwd) {
		AdminDAO dao=new AdminDAOImpl();
		boolean admin=dao.login(userID, pwd);
		if(admin) {
		  return true;
		}
		return false;
	}

	@Override
	 //查询商品
	public List<Goods> queryGoods() {
	  AdminDAO dao=new AdminDAOImpl();
		return dao.queryGoods();
	}

	@Override
	//查询商品,按 商品名称模糊查询
	public List<Goods> queryGoods(String GoodName) {
	  AdminDAO dao=new AdminDAOImpl();
	  List list=new ArrayList();
	  list=dao.queryGoods(GoodName);
		return list;
	}

	@Override
	//上架商品
	public Boolean addGoods(Goods goods) {
	  AdminDAO dao=new AdminDAOImpl();
	  boolean add=dao.addGoods(goods);
		return add;
	}

	@Override
	//下架商品
	public Boolean dedelteGoods(String goodsId) {
	  AdminDAO dao=new AdminDAOImpl();
	  boolean delete=dao.dedelteGoods(goodsId);
		return delete;
	}

	@Override
	//ͣ停用商品
	public Boolean stopGoods(int goodsId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	//修改商品信息
	public Boolean modifyGoodsInfo(String goodInfo) {
	  AdminDAO dao = new AdminDAOImpl();
		return dao.modifyGoodsInfo(goodInfo);
	}

	@Override
	//按编号查询订单信息
	public List<GoodsOrder> queryByOrderID(int orderID, int page) {
		AdminDAO dao = new AdminDAOImpl();
		 return dao.queryByOrderID(orderID, page);
		
	}

	@Override
	//设置订单状态
	public Boolean setOrderState(String orderID, String orderState) {
		AdminDAO dao = new AdminDAOImpl();
		return dao.setOrderState(orderID, orderState);
	}

	 @Override
	//统计总用户数
	  public long countsUser() {
	   AdminDAO dao=new AdminDAOImpl();
	    return dao.countsUser();
	  }

	  @Override
	//总交易总金额（订单表）
	  public Double sumMoney() {
	    AdminDAO dao=new AdminDAOImpl();
	    return dao.sumMoney();
	  }
	  
	@Override
	 //订单货物管理页面 查询  zhang
	public List<GoodsorderAndGoods> queryGoodsOrderAndGoods() {
		AdminDAO dao = new AdminDAOImpl();
		return dao.queryGoodsorderAndGoods();
	}
	//订单处理货物页面查询,按订单状态
	@Override
	public List<GoodsorderAndGoods> queryGoodsOrderAndGoodsByState(String orderState) {
		AdminDAO dao = new AdminDAOImpl();
		return dao.queryGoodsorderAndGoodsBySta(orderState);
	}

	@Override
	//订单货物查询,按订单ID
	public List<GoodsorderAndGoods> queryGoodsOrderAndGoodsByID(String orderID) {
		AdminDAO dao = new AdminDAOImpl();
		return dao.queryGoodsorderAndGoodsByid(orderID);
	}
	
	@Override 
	//zhang
	public List<GoodsorderAndGoods> queryGoodsOrderAndGoodsByType(String goodstype) {
		AdminDAO dao = new AdminDAOImpl();
		return dao.queryGoodsorderAndGoodsBytype(goodstype);
	}

	@Override
	//交易信息查询:总订单数量，已完成订单数量，交易失败订单数量
	public int allOrderMount() {
		AdminDAO dao = new AdminDAOImpl();
		return dao.countAllOrder();
	}

	@Override
	//已完成订单数
	public int successOrderMount() {
		AdminDAO dao = new AdminDAOImpl();
		return dao.countFinishOrder();
	}

	@Override
	public int failOrderMount() {
		AdminDAO dao = new AdminDAOImpl();
		return dao.countFailOrder();
	}

	@Override
	//查询所有会员信息
	public List<User> queryUser() throws SQLException {
		AdminDAO adao = new AdminDAOImpl();
		// TODO Auto-generated method stub
		return adao.queryUser();
	}

	@Override
	//模糊查询会员信息Byname
	public List<User> queryUser(String user_NAME) throws SQLException {
		AdminDAO adao = new AdminDAOImpl();
		// TODO Auto-generated method stub
		return adao.queryUser(user_NAME);
	}
	@Override
	//查询所有管理员信息
	public List<Admin> queryAdmin() throws SQLException {
		AdminDAO adao = new AdminDAOImpl();
		return adao.queryAdmin();
	}

	@Override
	//查询会员人数
	public Long countUser() throws SQLException {
		AdminDAO adao = new AdminDAOImpl();
		return adao.countUser();
	}

	@Override
	//根据id删除会员信息
	public void delectUser(String user_id) throws SQLException {
		// TODO 自动生成的方法存根
		AdminDAO adao = new AdminDAOImpl();
		adao.delectUser(user_id);
	}
  @Override
//已付款订单数
  public long accountPaid() {
    AdminDAO dao = new AdminDAOImpl();
    return dao.accountPaid();
  }

  @Override
//待发货订单数
  public long pronoun() {
    AdminDAO dao = new AdminDAOImpl();
    return dao.pronoun();
  }

  @Override
//待结算订单数
  public long settlement() {
    AdminDAO dao = new AdminDAOImpl();
    return dao.settlement();
  }

  @Override
//商品总数
  public long sumAmount() {
    AdminDAO dao = new AdminDAOImpl();
    return dao.sumAmount();
  }

  @Override
//上架商品数
  public long putaway() {
    AdminDAO dao = new AdminDAOImpl();
    return dao.putaway();
  }

  @Override
//下架商品数
  public long soldOut() {
    AdminDAO dao = new AdminDAOImpl();
    return dao.soldOut();
  }

@Override
public Boolean deleteOrder(String orderid) {
	AdminDAO dao = new AdminDAOImpl();
	return dao.deleteOrderById(orderid);
}

@Override
public void updateUser(User u) throws SQLException {
	// TODO 自动生成的方法存根
	
}

@Override
public User queryUserById(String user_ID) throws SQLException {
	AdminDAO adao = new AdminDAOImpl();
	return adao.queryUserById(user_ID);
}


}
