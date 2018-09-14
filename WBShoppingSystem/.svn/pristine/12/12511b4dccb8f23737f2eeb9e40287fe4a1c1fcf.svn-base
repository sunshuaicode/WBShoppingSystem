package edu.shopsys.model;

// 订单实体类
public class GoodsOrder {
    // 订单ID
    private String order_id;
    // 订单时间，获取下单时的系统时间,数据库中是Date类，需要转换
    private String order_time;
    // 支付方式
    private String order_pay;
    // 订单中的商品ID，和商品表中的id对应
    private String order_goods_id;
    // 订单中的收货地址ID
    private String order_address_id;
    // 订单状态，支付/未付款
    private String order_state;
    // 订单中的用户ID
    private String order_user_id;

    public GoodsOrder() {
        super();
    }

    public GoodsOrder(String order_id, String order_time, String order_pay, String order_goods_id,
            String order_address_id, String order_state, String order_user_id) {
        super();
        this.order_id = order_id;
        this.order_time = order_time;
        this.order_pay = order_pay;
        this.order_goods_id = order_goods_id;
        this.order_address_id = order_address_id;
        this.order_state = order_state;
        this.order_user_id = order_user_id;
    }

    public String getOrder_id() {
        return order_id;
    }

    public void setOrder_id(String order_id) {
        this.order_id = order_id;
    }

    public String getOrder_time() {
        return order_time;
    }

    public void setOrder_time(String order_time) {
        this.order_time = order_time;
    }

    public String getOrder_pay() {
        return order_pay;
    }

    public void setOrder_pay(String order_pay) {
        this.order_pay = order_pay;
    }

    public String getOrder_goods_id() {
        return order_goods_id;
    }

    public void setOrder_goods_id(String order_goods_id) {
        this.order_goods_id = order_goods_id;
    }

    public String getOrder_address_id() {
        return order_address_id;
    }

    public void setOrder_address_id(String order_address_id) {
        this.order_address_id = order_address_id;
    }

    public String getOrder_state() {
        return order_state;
    }

    public void setOrder_state(String order_state) {
        this.order_state = order_state;
    }

    public String getOrder_user_id() {
        return order_user_id;
    }

    public void setOrder_user_id(String order_user_id) {
        this.order_user_id = order_user_id;
    }

	@Override
	public String toString() {
		return "GoodsOrder [order_id=" + order_id + ", order_time=" + order_time + ", order_pay=" + order_pay
				+ ", order_goods_id=" + order_goods_id + ", order_address_id=" + order_address_id + ", order_state="
				+ order_state + ", order_user_id=" + order_user_id + "]";
	}

    
}
