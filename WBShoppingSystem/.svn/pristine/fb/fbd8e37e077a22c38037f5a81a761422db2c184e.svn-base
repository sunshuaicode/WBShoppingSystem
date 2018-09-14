package edu.shopsys.service.impl;

import java.util.ArrayList;
import java.util.List;
import edu.shopsys.DAO.UserDAO;
import edu.shopsys.DAO.Impl.UserDAOImpl;
import edu.shopsys.model.Goods;
import edu.shopsys.model.GoodsOrder;
import edu.shopsys.model.ShippingAddress;
import edu.shopsys.model.ShopCar;
import edu.shopsys.model.User;
import edu.shopsys.service.UserService;

public class UserServiceImpl implements UserService {


    @Override
    public Boolean register(User user) {
        UserDAO dao = new UserDAOImpl();
        return dao.register(user);
    }



    @Override
    public Boolean updataInfo(User user) {
        // TODO Auto-generated method stub
        return null;
    }



    @Override
    public Boolean addShippingAddress(ShippingAddress sa) {
        // TODO Auto-generated method stub
        UserDAO dao = new UserDAOImpl();
        return dao.addShippingAddress(sa);
    }

    @Override
    public Boolean modifyShippingAddress(ShippingAddress sa) {
        // TODO Auto-generated method stub
        UserDAO dao = new UserDAOImpl();
        return dao.modifyShippingAddress(sa);
    }

    @Override
    public Boolean addGood() {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public List<GoodsOrder> queryOrder() {
        // TODO Auto-generated method stub
        return null;
    }

    // 根据订单支付状态查询订单
    @Override
    public List<GoodsOrder> queryOrder(String oerderstate) {
        UserDAO dao = new UserDAOImpl();
        List<GoodsOrder> list = new ArrayList<GoodsOrder>();
        list = dao.queryOrder(oerderstate);
        return list;
    }

    // 类别查询
    @Override
    public List<Goods> queryByclass(String type) {
        UserDAO dao = new UserDAOImpl();
        List<Goods> list = new ArrayList<Goods>();
        list = dao.queryByclass(type);
        return list;
    }

    // 关键字查询
    @Override
    public List<Goods> queryByKeyword(String keyWord) {
        UserDAO dao = new UserDAOImpl();
        List<Goods> list = new ArrayList<Goods>();
        list = dao.queryByKeyword(keyWord);
        return list;
    }

    // id查询商品
    @Override
    public Goods queryById(String goods_id) {
        UserDAO dao = new UserDAOImpl();
        Goods goods = new Goods();
        goods = dao.queryById(goods_id);
        return goods;
    }

    // 首页推荐
    @Override
    public List<Goods> queryAll() {
        UserDAO dao = new UserDAOImpl();
        List<Goods> list = new ArrayList<Goods>();
        list = dao.queryAll();
        return list;
    }

    // 按用户ID查询其购物车
    @Override
    public List<ShopCar> queryCarByUserId(String userId) {
        UserDAO dao = new UserDAOImpl();
        List<ShopCar> list = new ArrayList<ShopCar>();
        list = dao.queryCarByUserId(userId);
        return list;
    }


    // 商品加入购物车 商品id,数量
    @Override
    public Boolean addToShopCar(String Car_id, String Goods_ID, int count, String userId,
            String goodsColor, String goodsSize) {
        UserDAO dao = new UserDAOImpl();
        boolean result = false;
        result = dao.addToShopCar(Car_id, Goods_ID, count, userId, goodsColor, goodsSize);
        return result;
    }

    // 删除购物车中商品
    @Override
    public Boolean deleteCarGoods(String carId) {
        UserDAO dao = new UserDAOImpl();
        boolean result = false;
        result = dao.deleteCarGoods(carId);
        return result;
    }

    // 生成订单
    @Override
    public Boolean addGoodOrder(GoodsOrder goodsorder) {
        // TODO Auto-generated method stub
        UserDAO dao = new UserDAOImpl();
        // 调用dao层方法，并返回boolean值，true生成成功，false生成失败
        return dao.addGoodOrder(goodsorder);
    }



    @Override
    public Boolean login(String user_id, String pwd) {
        UserDAO dao = new UserDAOImpl();
        boolean user = dao.login(user_id, pwd);
        if (false == user) {
            return false;
        }
        return true;
    }

    //根据用户ID查询信息
    @Override
    public User queryInfo(String user_id) {
        UserDAO dao = new UserDAOImpl();
        User user = new User();
        user = dao.queryInfo(user_id);
        return user;
    }



    @Override
    public Boolean modifypwd(String user_id, String pwd) {
        // TODO Auto-generated method stub
        return null;
    }



    @Override
    public Boolean reSetPwd(String user_id, String email) {
        // TODO Auto-generated method stub
        return null;
    }



    // 根据订单号查询订单详情
    @Override
    public List queryOrderInfo(String order_id) {
        // TODO Auto-generated method stub
        UserDAO dao = new UserDAOImpl();
        return dao.queryOrderInfo(order_id);
    }

    // id验证
    @Override
    public Boolean hadThing(String user_id) {
        UserDAO dao = new UserDAOImpl();
        return dao.havenId(user_id);
    }

    //根据用户查订单
    public List queryOrderByUserId(String order_id){
    	UserDAO dao = new UserDAOImpl();
        return dao.queryOrderByUserId(order_id);
    }





}
