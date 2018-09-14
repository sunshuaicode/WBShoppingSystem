package edu.shopsys.DAO.Impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;
import com.sun.org.apache.xpath.internal.operations.Bool;
import edu.shopsys.DAO.UserDAO;
import edu.shopsys.model.Goods;
import edu.shopsys.model.GoodsOrder;
import edu.shopsys.model.ShippingAddress;
import edu.shopsys.model.ShopCar;
import edu.shopsys.model.User;
import edu.shopsys.service.UserService;
import edu.shopsys.util.C3p0Utils;

public class UserDAOImpl implements UserDAO {

    @Override
    public Boolean register(User user) {
        C3p0Utils c3p0Utils = new C3p0Utils();
        try {
            Connection conn = c3p0Utils.getConnection();
            PreparedStatement pre =
            conn.prepareStatement("INSERT INTO T_USER VALUES(?,?,?,?,?,?,?,?)");
            pre.setString(1, user.getUser_id());
            pre.setString(2, user.getUser_name());
            pre.setString(3, user.getUser_pwd());
            pre.setString(4, user.getUser_email());
            pre.setString(5, user.getUser_sex());
            pre.setString(6, user.getUser_address());
            pre.setString(7, user.getUser_register_time());
            pre.setString(8, user.getUser_state());
            pre.execute();
            // ResultSet qq = pre.executeQuery();
        } catch (SQLException e) {
            // TODO 自动生成的 catch 块
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public Boolean updataInfo(User user) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public Boolean addShippingAddress(ShippingAddress sa) {
        // TODO Auto-generated method stub
        QueryRunner run = new QueryRunner(C3p0Utils.getDS());
        String sql =
                "INSERT INTO T_ADDRESS(ADDRESS_ID,ADDRESS_CNEE,ADDRESS_PHONE,ADDRESS_ADD,ADDRESS_PC,ADDRESS_USER_ID) VALUES(?,?,?,?,?,?)";
        Object[] params = {sa.getAddress_id(), sa.getAddress_cnee(), sa.getAddress_phone(),
                sa.getAddress_add(), sa.getAddress_pc(), sa.getAddress_user_id()};
        try {
            run.update(sql, params);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return false;
        }
        return true;
    }

    @Override
    public Boolean modifyShippingAddress(ShippingAddress sa) {
        // TODO Auto-generated method stub
        QueryRunner run = new QueryRunner(C3p0Utils.getDS());
        String sql =
                "UPDATE T_ADDRESS SET ADDRESS_CNEE=?,ADDRESS_PHONE=?,ADDRESS_ADD=?,ADDRESS_PC=?,ADDRESS_USER_ID=? WHERE ADDRESS_ID=?";
        Object[] params = {sa.getAddress_cnee(), sa.getAddress_phone(), sa.getAddress_add(),
                sa.getAddress_pc(), sa.getAddress_user_id(), sa.getAddress_id()};
        try {
            run.update(sql, params);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return false;
        }
        return true;
    }



    // 查询我的订单
    @Override
    public List<GoodsOrder> queryOrder() {

        QueryRunner run = new QueryRunner(C3p0Utils.getDS());
        BeanListHandler<GoodsOrder> handler = new BeanListHandler<GoodsOrder>(GoodsOrder.class);
        List<GoodsOrder> list = new ArrayList<GoodsOrder>();
        String sql = "SELECT * FROM T_ORDER ";
        try {
            list = run.query(sql, handler);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<GoodsOrder> queryOrder(String oerderstate) {
        QueryRunner run = new QueryRunner(C3p0Utils.getDS());
        BeanListHandler<GoodsOrder> handler = new BeanListHandler<GoodsOrder>(GoodsOrder.class);
        List<GoodsOrder> list = new ArrayList<GoodsOrder>();
        String sql = "SELECT * FROM T_ORDER WHERE order_state LIKE ? ";
        try {
            list = run.query(sql, handler, "%" + oerderstate + "%");
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return list;
    }

    // 按类别查询商品
    @Override
    public List<Goods> queryByclass(String type) {
        QueryRunner run = new QueryRunner(C3p0Utils.getDS());
        BeanListHandler<Goods> handler = new BeanListHandler<Goods>(Goods.class);
        List<Goods> list = new ArrayList<Goods>();
        String sql = "SELECT * FROM T_GOODS WHERE goods_type LIKE ? AND goods_stock > 0";
        try {
            list = run.query(sql, handler, "%" + type + "%");
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return list;
    }

    // 关键词查询商品
    @Override
    public List<Goods> queryByKeyword(String keyWord) {
        QueryRunner run = new QueryRunner(C3p0Utils.getDS());
        BeanListHandler<Goods> handler = new BeanListHandler<Goods>(Goods.class);
        List<Goods> list = new ArrayList<Goods>();
        String sql = "SELECT * FROM T_GOODS "
                + "WHERE goods_stock > 0 AND (goods_name LIKE ? OR goods_type LIKE ?"
                + "OR goods_price LIKE ? OR goods_info LIKE ? OR goods_brand LIKE ?) ";
        try {
            list = run.query(sql, handler, "%" + keyWord + "%", "%" + keyWord + "%",
                    "%" + keyWord + "%", "%" + keyWord + "%", "%" + keyWord + "%");
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return list;
    }

    // 按id查询商品
    @Override
    public Goods queryById(String goods_id) {
        QueryRunner run = new QueryRunner(C3p0Utils.getDS());
        BeanHandler<Goods> handler = new BeanHandler<Goods>(Goods.class);
        Goods goods = new Goods();
        try {
            goods = run.query("SELECT * FROM T_GOODS WHERE goods_id = ?", handler, goods_id);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return goods;
    }

    // 首页推荐
    @Override
    public List<Goods> queryAll() {
        QueryRunner run = new QueryRunner(C3p0Utils.getDS());
        BeanListHandler<Goods> handler = new BeanListHandler<Goods>(Goods.class);
        List<Goods> list = new ArrayList<Goods>();
        try {
            list = run.query("SELECT * FROM T_GOODS", handler);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return list;
    }

    // 按用户ID查询其购物车
    @Override
    public List<ShopCar> queryCarByUserId(String userId) {
        QueryRunner run = new QueryRunner(C3p0Utils.getDS());
        BeanListHandler<ShopCar> handler = new BeanListHandler<ShopCar>(ShopCar.class);
        String sql = "SELECT * FROM T_CAR WHERE car_user_id = ?";
        List<ShopCar> result = null;
        try {
            result = run.query(sql, handler, userId);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return result;
    }

    // 商品加入购物车 购物车id 商品id,数量
    @Override
    public Boolean addToShopCar(String Car_id, String Goods_ID, int count, String userId,
            String goodsColor, String goodsSize) {
        QueryRunner run = new QueryRunner(C3p0Utils.getDS());
        String sql = "INSERT INTO T_CAR VALUES (?,?,?,?,?,?)";
        int result = 0;
        try {
            result = run.update(sql, Car_id, Goods_ID, count, userId, goodsColor,goodsSize);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        if (result == 1) {
            return true;
        }
        return false;
    }

    // 删除购物车中商品
    @Override
    public Boolean deleteCarGoods(String carId) {
        QueryRunner run = new QueryRunner(C3p0Utils.getDS());
        int result = 0;
        try {
            result = run.update("DELETE FROM T_CAR WHERE car_id = ?", carId);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if (result == 1) {
            return true;
        }
        return false;
    }

    // 生成订单
    @Override
    public Boolean addGoodOrder(GoodsOrder goodsorder) {
        // TODO Auto-generated method stub
        QueryRunner run = new QueryRunner(C3p0Utils.getDS());
        ResultSetHandler<List<GoodsOrder>> h = new BeanListHandler<GoodsOrder>(GoodsOrder.class);
        String sql =
                "INSERT INTO T_ORDER(ORDER_ID,ORDER_TIME,ORDER_PAY,ORDER_GOODS_ID,ORDER_ADDRESS_ID,ORDER_STATE,ORDER_USER_ID) VALUES(?,?,?,?,?,?,?)";
        Object[] params =
                {goodsorder.getOrder_id(), goodsorder.getOrder_time(), goodsorder.getOrder_pay(),
                        goodsorder.getOrder_id(), goodsorder.getOrder_address_id(),
                        goodsorder.getOrder_state(), goodsorder.getOrder_user_id()};
        try {
            run.update(sql, params);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return false;
        }
        return true;
    }



    @Override
    public Boolean login(String user_id, String pwd) {
        QueryRunner run = new QueryRunner(C3p0Utils.getDS());
        ResultSetHandler<User> h = new BeanHandler<User>(User.class);
        String sql = "SELECT * FROM T_USER WHERE USER_ID=? AND USER_PWD=?";
        User user = null;
        try {
            user = run.query(sql, h, user_id, pwd);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if (user == null) {
            return false;
        } else {
            return true;
        }
    }

    //按用户ID查询用户信息
    @Override
    public User queryInfo(String user_id) {
        QueryRunner run = new QueryRunner(C3p0Utils.getDS());
        BeanHandler<User> handler = new BeanHandler<User>(User.class);
        User user = new User();
        try {
            user = run.query("SELECT * FROM T_USER WHERE user_id = ?", handler,user_id);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return user;
    }

    @Override
    public Boolean modifypwd(String userID, String pwd) {
        // TODO Auto-generated method stub
    	QueryRunner run = new QueryRunner(C3p0Utils.getDS());
    	 ResultSetHandler<User> h = new BeanHandler<User>(User.class);
   	 String sql = "UPDATE T_USER SET USER_PWD=? WHERE USER_ID=?";
   	 try {
   		 run.query(sql, h, userID, pwd);
   		return true;
   		 }catch (SQLException e) {
             e.printStackTrace();
             
         }
   	    return false;
         }

    @Override
    public Boolean reSetPwd(String userID, String email) {
    	QueryRunner run = new QueryRunner(C3p0Utils.getDS());
   	  ResultSetHandler<User> h = new BeanHandler<User>(User.class);
   	  String sql = "SELECT * FROM T_USER WHERE USER_ID=? AND  USER_email=?";
        // TODO Auto-generated method stub
   	 try {
   		if (run.query(sql, h, userID, email )==null )
   		return false;
   		 }catch (SQLException e) {
             e.printStackTrace();
         }
   	    return true;
   		 }
    
    public Boolean resestpwd (String userID, String pwd) {
        // TODO Auto-generated method stub
    	QueryRunner run = new QueryRunner(C3p0Utils.getDS());
    	 ResultSetHandler<User> h = new BeanHandler<User>(User.class);
   	 String sql = "UPDATE T_USER SET USER_PWD=123456 WHERE USER_ID=?";
   	 try {
   		 run.query(sql, h, userID, pwd);
   		return true;
   		 }catch (SQLException e) {
             e.printStackTrace();
             
         }
   	    return false;
         }

    @Override
    public GoodsOrder queryGoods(String Goods_ID) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public Boolean addGood(String Goods_ID) {
        // TODO Auto-generated method stub
        return null;
    }


    // 判断是否存在用户名
    @Override
    public Boolean havenId(String user_id) {
        QueryRunner run = new QueryRunner(C3p0Utils.getDS());
        ResultSetHandler<User> h = new BeanHandler<User>(User.class);
        String sql = "SELECT * FROM T_USER WHERE user_id=? ";
        User user = null;
        try {
            user = run.query(sql, h, user_id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if (user == null) {// 如果没有这个用户id，返回
            return true;
        } else {
            return false;
        }
    }

    @Override
    public List queryOrderInfo(String order_id) {
        // TODO Auto-generated method stub
        QueryRunner run = new QueryRunner(C3p0Utils.getDS());
        String sql =
                "SELECT * FROM T_ORDER T1,T_GOODS T2,T_USER T3,T_ADDRESS T4 WHERE T1.order_goods_id=T2.goods_id AND T1.order_address_id=T4.address_id AND T1.order_user_id=T3.user_id AND T1.order_id="
                        + order_id;
        List<Map<String, Object>> list = null;
        try {
            list = run.query(sql, new MapListHandler());
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            
        }
        for(Map a:list) {
	        	a.put("order_time", a.get("order_time").toString());
	     }
        System.out.println(list);
        return list;
    }
    
    //根据用户查订单
  	@Override
  	public List queryOrderByUserId(String User_Id) {
  		// TODO Auto-generated method stub
  		 QueryRunner run = new QueryRunner(C3p0Utils.getDS());
  	        String sql ="SELECT * FROM T_ORDER T1,T_GOODS T2 WHERE T1.ORDER_GOODS_ID=T2.GOODS_ID AND ORDER_USER_ID="+User_Id;
  	        List<Map<String, Object>> list = null;
  	       
  	        try {
  	            list = run.query(sql, new MapListHandler());
  	        } catch (SQLException e) {
  	            // TODO Auto-generated catch block
  	            e.printStackTrace();	            
  	        }
  //	        System.out.println(list);
  	        for(Map a:list) {
  	        	a.put("order_time", a.get("order_time").toString());
  	        }
  	        return list;
  	}


}
