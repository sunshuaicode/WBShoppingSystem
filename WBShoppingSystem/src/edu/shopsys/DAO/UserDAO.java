package edu.shopsys.DAO;

import java.util.List;
import edu.shopsys.model.Goods;
import edu.shopsys.model.GoodsOrder;
import edu.shopsys.model.ShippingAddress;
import edu.shopsys.model.ShopCar;
import edu.shopsys.model.User;
import edu.shopsys.service.UserService;

public interface UserDAO {

    int access = 0;
    int isfalse = -1;

    // 用户登录
    Boolean login(String user_id, String pwd);

    // 游客注册
    Boolean register(User user);

    // 查询个人信息
    User queryInfo(String user_id);

    // 修改个人信息
    Boolean updataInfo(User user);

    // 修改密码
    Boolean modifypwd(String userID, String pwd);

    // 重置密码
    Boolean reSetPwd(String userID, String email);

    // 添加收货地址
    Boolean addShippingAddress(ShippingAddress sa);

    // 修改收货地址
    Boolean modifyShippingAddress(ShippingAddress sa);

    // 添加商品到购物车
    Boolean addGood(String Goods_ID);

    // 查询我的订单
    List<GoodsOrder> queryOrder();

    // 按状态查询我的订单
    List<GoodsOrder> queryOrder(String oerderstate);

    // 按商品类别查询商品
    List<Goods> queryByclass(String type);

    // 按关键词查询商品
    List<Goods> queryByKeyword(String keyWord);

    // 首页推荐商品
    List<Goods> queryAll();

    // 按编号查询商品
    Goods queryById(String goods_id);

    // 按用户ID查询其购物车
    List<ShopCar> queryCarByUserId(String userId);

    // 商品加入购物车 商品id,数量
    Boolean addToShopCar(String Car_id, String Goods_ID, int count, String userId,
            String goodsColor, String goodsSize);

    // 删除购物车商品
    Boolean deleteCarGoods(String carId);

    // 生成订单
    Boolean addGoodOrder(GoodsOrder goodsorder);

    // 查询商品详细信息
    GoodsOrder queryGoods(String Goods_ID);

    // 检验用户是否存在
    Boolean havenId(String user_id);

    // 根据订单号查询订单详情
    List queryOrderInfo(String order_id);

    //根据用户查订单
    List queryOrderByUserId(String order_id);
    

}
