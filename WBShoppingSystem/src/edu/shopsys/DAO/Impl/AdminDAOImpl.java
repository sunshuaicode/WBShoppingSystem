package edu.shopsys.DAO.Impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import javax.sql.DataSource;

import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import org.eclipse.jdt.internal.compiler.ast.ThisReference;
import org.omg.CORBA.PUBLIC_MEMBER;

import com.sun.org.apache.bcel.internal.generic.NEW;

import edu.shopsys.DAO.AdminDAO;
import edu.shopsys.model.Admin;
import edu.shopsys.model.Goods;
import edu.shopsys.model.GoodsOrder;
import edu.shopsys.model.GoodsorderAndGoods;
import edu.shopsys.model.User;
import edu.shopsys.util.C3p0Utils;

public class AdminDAOImpl implements AdminDAO{

	@Override
	//验证管理员的登陆
	public Boolean login(String userID, String pwd) {
	  QueryRunner qr = new QueryRunner(C3p0Utils.getDS());
	  ResultSetHandler<Admin> rsh = new BeanHandler<Admin>(Admin.class);
      Admin admin= null;
      try {
          admin = qr.query("SELECT * FROM T_ADMIN WHERE ADMIN_ID = ? AND ADMIN_PWD = ?", rsh, userID, pwd);
      } catch (SQLException e) {
          e.printStackTrace();
      }
      if(admin!=null) {
        return true;
      }else {
        return false;
      }
	}

	@Override
	 //查询商品
	public List<Goods> queryGoods() {
	  QueryRunner run = new QueryRunner(C3p0Utils.getDS());
      ResultSetHandler<List<Goods>> h = new BeanListHandler<Goods>(Goods.class);
      List<Goods> list = new ArrayList<Goods>();
      try {
          list = run.query("SELECT * FROM T_GOODS", h);
      } catch (SQLException e) {
          e.printStackTrace();
      }
      return list;
	}

	@Override
	//查询商品,按 商品名称模糊查询
	public List<Goods> queryGoods(String GoodName) {
	  QueryRunner run = new QueryRunner(C3p0Utils.getDS());
      ResultSetHandler<List<Goods>> h = new BeanListHandler<Goods>(Goods.class);
      List<Goods> list = new ArrayList<Goods>();
      try {
        list=run.query("SELECT * FROM T_GOODS WHERE GOODS_NAME LIKE ?", h,"%"+GoodName+"%");
      } catch (SQLException e) {
        // TODO Auto-generated catch block
        e.printStackTrace();
      }
		return list;
	}

	@Override
	//上架商品
	public Boolean addGoods(Goods goods) {
	  QueryRunner run = new QueryRunner(C3p0Utils.getDS());
	  String sql="INSERT INTO T_GOODS VALUES(?,?,?,?,?,?,?,?)";
	  int i=0;
	  try {
       i = run.update(sql, goods.getGoods_id(),goods.getGoods_name(),goods.getGoods_type(),goods.getGoods_image(),goods.getGoods_price(),goods.getGoods_info(),goods.getGoods_stock(),goods.getGoods_brand());
    } catch (SQLException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
		if(i==1) {
		  return true;
		}
		return false;
	}

	@Override
	//下架商品
	public Boolean dedelteGoods(String goodsId) {
	  QueryRunner run = new QueryRunner(C3p0Utils.getDS());
	  String sql="DELETE FROM T_GOODS WHERE GOODS_ID=?";
	  int i=0;
	  try {
              i=run.update(sql, goodsId);
    } catch (SQLException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
		if(i==1) {
		  return true;
		}
		return false;
	}

	@Override
	//?停用商品
	public Boolean stopGoods(int goodsId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	//修改商品信息
	public Boolean modifyGoodsInfo(String goods) {
	  String []a = goods.split("/");
	  String goodsid=a[0];
	  Goods good=new Goods();
	  good.setGoods_id(a[1]);
	  good.setGoods_name(a[2]);
	  good.setGoods_type(a[3]);
	  good.setGoods_price(Double.valueOf(a[4]));
	  good.setGoods_info(a[5]);
	  good.setGoods_stock(Integer.valueOf(a[6]));
	  good.setGoods_brand(a[7]);
	  QueryRunner run = new QueryRunner(C3p0Utils.getDS());
      String sql="UPDATE  T_GOODS SET GOODS_ID=?,GOODS_NAME=?,GOODS_TYPE=?,GOODS_PRICE=?,GOODS_INFO=?,GOODS_STOCK=?,GOODS_BRAND=? WHERE GOODS_ID="+goodsid;
	  int i=0;
      try {
     i=run.update(sql, good.getGoods_id(),good.getGoods_name(),good.getGoods_type(),good.getGoods_price(),good.getGoods_info(),good.getGoods_stock(),good.getGoods_brand());
    } catch (SQLException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
      if(i==1) {
        return true;
      }
      return false;
	}

	@Override
	//按编号查询订单信息 zhang
	public List<GoodsOrder> queryByOrderID(int orderID, int page) {
		QueryRunner run = new QueryRunner(C3p0Utils.getDS());
		ResultSetHandler<List<GoodsOrder>> h = new BeanListHandler<GoodsOrder>(GoodsOrder.class);
		List<GoodsOrder> list = new ArrayList<GoodsOrder>();
		try {
			list = run.query("SELECT * from T_ORDER where order_id = ?", h,orderID);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	//设置订单状态 zhang
	public Boolean setOrderState(String orderID, String orderState) {
		QueryRunner run = new QueryRunner(C3p0Utils.getDS());
		try {
			int i = run.update("UPDATE T_ORDER SET order_state = ? WHERE order_id = ?",orderState,orderID);
			if(i==1) return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	 @Override
	//统计总用户数 luo
	  public long countsUser() {
	   QueryRunner run = new QueryRunner(C3p0Utils.getDS());
	   String sql="SELECT COUNT(USER_ID) FROM T_USER";
	   Object count=0;
	   try {
      count=run.query(sql, new ScalarHandler());
    } catch (SQLException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
	   long countUser=(long)count;
	    return countUser;
	  }

	  @Override
	  //总交易总金额（订单表）luo
	  public Double sumMoney() {
	   QueryRunner run = new QueryRunner(C3p0Utils.getDS());
	   String sql="SELECT SUM(GOODS_PRICE) FROM T_GOODS T1,T_ORDER T2 WHERE T2.ORDER_GOODS_ID = T1.GOODS_ID AND T2.ORDER_STATE='已付款'";
	   Double sum=0.0;
	   try {
           sum=run.query(sql, new ScalarHandler<Double>());
    } catch (SQLException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
	  return sum;
    }

	@Override
	//订单信息查询  zhang
	public List<GoodsOrder> queryGoodsOrder() {
		QueryRunner run = new QueryRunner(C3p0Utils.getDS());
		ResultSetHandler<List<GoodsOrder>> h = new BeanListHandler<GoodsOrder>(GoodsOrder.class);
		List<GoodsOrder> list = new ArrayList<GoodsOrder>();
		try {
			list = run.query("SELECT * from T_ORDER", h);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	//查询所有会员信息
	public List<User> queryUser() throws SQLException {
		DataSource dataSource = C3p0Utils.getDS();//使用连接池
	      QueryRunner queryRunner = null;//声明查询类
	      queryRunner = new QueryRunner(dataSource);//获取查询对象
	      String sql = "select * from T_USER";
	      BeanListHandler<User> beanListHandler = new BeanListHandler<>(User.class);// 创建Bean列表处理器
	      List<User> users = queryRunner.query(sql, beanListHandler);   // 执行查询
		// TODO Auto-generated method stub
		return users;
	}

	//使用姓名模糊查询会员信息ByNAME
	public List<User> queryUser(String user_NAME) throws SQLException {
		ArrayList<User> list = new ArrayList<User>();//新建list接受查询结果
		
		DataSource dataSource = C3p0Utils.getDS();//使用连接池子
		Connection conn = dataSource.getConnection();// 获取接口对象
		Statement stm = conn.createStatement();
		String sql = " select * from T_USER where user_name like '%"+ user_NAME +"%' ";//拼接sql语句  
		ResultSet rst = stm.executeQuery(sql);
		System.out.println("quserbyname run");
		while(rst.next())
		{
			User data=new User();
			data.setUser_id(rst.getString("user_id"));
        	data.setUser_name(rst.getString("user_name"));
            data.setUser_pwd(rst.getString("user_pwd"));
            data.setUser_email(rst.getString("user_email"));
            data.setUser_sex(rst.getString("user_sex"));
            data.setUser_address(rst.getString("user_address"));
            data.setUser_register_time(rst.getString("user_register_time"));
            list.add(data);
		}
		return list;
	}
	
	//查询所有管理员信息
	public List<Admin> queryAdmin() throws SQLException{
		DataSource dataSource = C3p0Utils.getDS();//使用连接池
	      QueryRunner queryRunner = null;//声明查询类
	      queryRunner = new QueryRunner(dataSource);//获取查询对象
	      String sql = "select * from T_ADMIN";
	      BeanListHandler<Admin> beanListHandler = new BeanListHandler<>(Admin.class);// 创建Bean列表处理器
		  List<Admin> admins = queryRunner.query(sql, beanListHandler);   // 执行查询
		return admins;
	}
    
	//查询会员人数
	public Long countUser() throws SQLException {
		DataSource dataSource = C3p0Utils.getDS();
		QueryRunner queryRunner = null;//声明查询类
	    queryRunner = new QueryRunner(dataSource);//获取查询对象
	    String sql = "select count(*) from T_USER";
	    Long count = queryRunner.query(sql,  new ScalarHandler<Long>());   // 执行查询
		return count;
	}


  @Override
  //按照订单状态查询订单信息 zhang
  public List<GoodsOrder> queryGoodsOrderByState(String orderState) {
	    QueryRunner run = new QueryRunner(C3p0Utils.getDS());
		ResultSetHandler<List<GoodsOrder>> h = new BeanListHandler<GoodsOrder>(GoodsOrder.class);
		List<GoodsOrder> list = new ArrayList<GoodsOrder>();
		try {
			list = run.query("SELECT * from T_ORDER where order_state = ?", h,orderState);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
  }

    @Override
	public List<GoodsorderAndGoods> queryGoodsorderAndGoods() {
    	QueryRunner run = new QueryRunner(C3p0Utils.getDS());
		ResultSetHandler<List<GoodsorderAndGoods>> h = new BeanListHandler<GoodsorderAndGoods>(GoodsorderAndGoods.class);
		List<GoodsorderAndGoods> list = new ArrayList<GoodsorderAndGoods>();
		try {
			list = run.query("SELECT T1.*,T2.*,T1.goods_price*T2.order_goods_amount AS counntgoodsprice FROM T_GOODS T1,T_ORDER T2 WHERE T1.goods_id = T2.order_goods_id", h);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<GoodsorderAndGoods> queryGoodsorderAndGoodsBySta(String orderState) {
		QueryRunner run = new QueryRunner(C3p0Utils.getDS());
		ResultSetHandler<List<GoodsorderAndGoods>> h = new BeanListHandler<GoodsorderAndGoods>(GoodsorderAndGoods.class);
		List<GoodsorderAndGoods> list = new ArrayList<GoodsorderAndGoods>();
		try {
			list = run.query("SELECT T1.*,T2.*,T1.goods_price*T2.order_goods_amount AS counntgoodsprice FROM T_GOODS T1,T_ORDER T2 WHERE T1.goods_id = T2.order_goods_id AND order_state = ?", h,orderState);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public List<GoodsorderAndGoods> queryGoodsorderAndGoodsByid(String orderid){
		QueryRunner run = new QueryRunner(C3p0Utils.getDS());
		ResultSetHandler<List<GoodsorderAndGoods>> h = new BeanListHandler<GoodsorderAndGoods>(GoodsorderAndGoods.class);
		List<GoodsorderAndGoods> list = new ArrayList<GoodsorderAndGoods>();
		try {
			list = run.query("SELECT T1.*,T2.*,T1.goods_price*T2.order_goods_amount AS counntgoodsprice FROM T_GOODS T1,T_ORDER T2 WHERE T1.goods_id = T2.order_goods_id AND order_id = ?", h,orderid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	//按照商品类型查询订单信息 zhang
	public List<GoodsorderAndGoods> queryGoodsorderAndGoodsBytype(String goodstype) {
		QueryRunner run = new QueryRunner(C3p0Utils.getDS());
		ResultSetHandler<List<GoodsorderAndGoods>> h = new BeanListHandler<GoodsorderAndGoods>(GoodsorderAndGoods.class);
		List<GoodsorderAndGoods> list = new ArrayList<GoodsorderAndGoods>();
		try {
			list = run.query("SELECT T1.*,T2.*,T1.goods_price*T2.order_goods_amount AS counntgoodsprice FROM T_GOODS T1,T_ORDER T2 WHERE T1.goods_id = T2.order_goods_id AND goods_type like ?", h,"%"+goodstype+"%");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
  	
  @Override
  //订单总数 zhang
  public int countAllOrder(){
	  QueryRunner run = new QueryRunner(C3p0Utils.getDS());
	  String sql = "SELECT COUNT(*) FROM T_ORDER";
	  String s;
	  int i=0;
	  try {
		s = Long .toString(run.query(sql,new ScalarHandler<Long>()));
		i=Integer.parseInt(String.valueOf(s));
	} catch (SQLException e) {
		// TODO 自动生成的 catch 块
		e.printStackTrace();
	}
	  return i;
  }

  @Override
  //完成状态的订单总数 zhang
  public int countFinishOrder() {
	  QueryRunner run = new QueryRunner(C3p0Utils.getDS());
	  String sql = "SELECT COUNT(*) FROM T_ORDER WHERE order_state = '已完成'";
	  String s;
	  int i=0;
	  try {
		s = Long .toString(run.query(sql,new ScalarHandler<Long>()));
		i=Integer.parseInt(String.valueOf(s));
	} catch (SQLException e) {
		// TODO 自动生成的 catch 块
		e.printStackTrace();
	}
	  return i;
  }

  @Override
  //失败订单的总数 zhang
  public int countFailOrder() {
	  QueryRunner run = new QueryRunner(C3p0Utils.getDS());
	  String sql = "SELECT COUNT(*) FROM T_ORDER WHERE order_state = '失败'";
	  String s;
	  int i=0;
	  try {
		s = Long .toString(run.query(sql,new ScalarHandler<Long>()));
		i=Integer.parseInt(String.valueOf(s));
	} catch (SQLException e) {
		// TODO 自动生成的 catch 块
		e.printStackTrace();
	}
	  return i;
  }

//根据会员id删除会员信息 liang
	public void delectUser(int user_id) throws SQLException {
		DataSource dataSource = C3p0Utils.getDS();//使用连接池子
		Connection conn = dataSource.getConnection();// 获取接口对象
		Statement stm = conn.createStatement();
		String sql = " delete from T_USER where user_id =  '"+ user_id +"' ";//拼接sql语句  
		stm.executeQuery(sql);
	}

  @Override
   //已付款订单数
  public long accountPaid() {
    QueryRunner run = new QueryRunner(C3p0Utils.getDS());
    String sql="SELECT COUNT(ORDER_ID) FROM T_ORDER";
    Object account=0;
    try {
      account=run.query(sql, new ScalarHandler());
 } catch (SQLException e) {
   // TODO Auto-generated catch block
   e.printStackTrace();
 }
    long accountPaid=(long)account;
     return accountPaid;
  }

  @Override
  //待发货订单数
  public long pronoun() {
    QueryRunner run = new QueryRunner(C3p0Utils.getDS());
    String sql="SELECT COUNT(ORDER_ID) FROM T_ORDER WHERE ORDER_STATE='待发货'";
    Object count=0;
    try {
   count=run.query(sql, new ScalarHandler());
 } catch (SQLException e) {
   // TODO Auto-generated catch block
   e.printStackTrace();
 }
    long pronoun=(long)count;
     return pronoun;
  }

  @Override
   //待结算订单数
  public long settlement() {
    QueryRunner run = new QueryRunner(C3p0Utils.getDS());
    String sql="SELECT COUNT(ORDER_ID) FROM T_ORDER WHERE ORDER_STATE='待结算'";
    Object settle=0;
    try {
      settle=run.query(sql, new ScalarHandler());
 } catch (SQLException e) {
   // TODO Auto-generated catch block
   e.printStackTrace();
 }
    long settlement=(long)settle;
     return settlement;
  }

  @Override
   //商品总数
  public long sumAmount() {
    QueryRunner run = new QueryRunner(C3p0Utils.getDS());
    String sql="SELECT COUNT(GOODS_ID) FROM T_GOODS";
    Object sum=0;
    try {
      sum=run.query(sql, new ScalarHandler());
 } catch (SQLException e) {
   // TODO Auto-generated catch block
   e.printStackTrace();
 }
    long sumAmount=(long)sum;
     return sumAmount;
  }

  @Override
   //上架商品数
  public long putaway() {
    QueryRunner run = new QueryRunner(C3p0Utils.getDS());
    String sql="SELECT COUNT(GOODS_ID) FROM T_GOODS WHERE GOODS_STOCK>0";
    Object put=0;
    try {
      put=run.query(sql, new ScalarHandler());
 } catch (SQLException e) {
   // TODO Auto-generated catch block
   e.printStackTrace();
 }
    long putaway=(long)put;
     return putaway;
  }

  @Override
   //下架商品数
  public long soldOut() {
    QueryRunner run = new QueryRunner(C3p0Utils.getDS());
    String sql="SELECT COUNT(GOODS_ID) FROM T_GOODS WHERE GOODS_STOCK=0";
    Object sold=0;
    try {
      sold=run.query(sql, new ScalarHandler());
 } catch (SQLException e) {
   // TODO Auto-generated catch block
   e.printStackTrace();
 }
    long soldout=(long)sold;
     return soldout;
  }

  @Override
  public Boolean deleteOrderById(String orderid) {
	Connection conn=null;
	Statement st=null;
	int i=0;
	try {
		conn=C3p0Utils.getDS().getConnection();
		st=conn.createStatement();
		i=st.executeUpdate("DELETE FROM T_ORDER WHERE order_id="+"'"+orderid+"'");
	} catch (SQLException e) {
		// TODO 自动生成的 catch 块
		e.printStackTrace();
	}
	try {
		conn.close();
		st.close();
	} catch (SQLException e) {
		// TODO 自动生成的 catch 块
		e.printStackTrace();
	}
	
	if(i==1) {
		return true;
	}
	return false;
  }
  
//根据会员id删除会员信息 liang
	public void delectUser(String user_id) throws SQLException {
		DataSource dataSource = C3p0Utils.getDS();//使用连接池子
		QueryRunner queryRunner = null;//声明查询类
		queryRunner = new QueryRunner(dataSource);//获取查询对象
		String sql = " delete from T_USER where user_id =  '"+ user_id +"' ";//拼接sql语句  
		System.out.println("delectUser run");
		//queryRunner.executeQuery(sql);
	}


	@Override
	//修改会员信息 liang
	public void updateUser(User u) throws SQLException {
		DataSource dataSource = C3p0Utils.getDS();//使用连接池
		QueryRunner queryRunner = null;//声明查询类
		queryRunner = new QueryRunner(dataSource);//获取查询对象
		String sql = "update T_USER set user_id =?, user_name =?, user_pwd=?, user_email=?,user_sex=?, user_address=?, user_register_time=?,user_state = ?";
		Object[] obj = {u.getUser_id(),u.getUser_name(),u.getUser_pwd(),u.getUser_email(),u.getUser_sex(),u.getUser_address(),u.getUser_state()};
		queryRunner.update(sql, obj);
	}
	@Override
	//查询所有会员信息ByID  liang
	public User queryUserById(String user_ID) throws SQLException {
		DataSource dataSource = C3p0Utils.getDS();//使用连接池
	    QueryRunner queryRunner = null;//声明查询类
	    queryRunner = new QueryRunner(dataSource);//获取查询对象
	    String sql = "select * from T_USER where user_id = ?";
	    BeanHandler<User> beanHandler = new BeanHandler<>(User.class);// 创建Bean列表处理器
	    User users = queryRunner.query(sql, beanHandler, user_ID);   // 执行查询
        return users;
	}

	
}
