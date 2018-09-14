package edu.shopsys.model;

// 购物车实体类
public class ShopCar {
    // 购物车ID
    private String car_id;
    // 购物车中商品ID
    private String car_goods_id;
    // 购物车中商品的数量
    private int car_goods_amount;
    // 购物车归属人的ID，和User中的ID关联
    private String car_user_id;
    // 购物车中的尺码
    private String car_goods_size;
    // 购物车中的颜色
    private String car_goods_color;

    public ShopCar() {
        super();
    }



    public ShopCar(String car_id, String car_goods_id, int car_goods_amount, String car_user_id,
            String car_goods_color, String car_goods_size) {
        super();
        this.car_id = car_id;
        this.car_goods_id = car_goods_id;
        this.car_goods_amount = car_goods_amount;
        this.car_user_id = car_user_id;
        this.car_goods_color = car_goods_color;
        this.car_goods_size = car_goods_size;
    }



    public String getCar_id() {
        return car_id;
    }

    public void setCar_id(String car_id) {
        this.car_id = car_id;
    }

    public String getCar_goods_id() {
        return car_goods_id;
    }

    public void setCar_goods_id(String car_goods_id) {
        this.car_goods_id = car_goods_id;
    }


    public int getCar_goods_amount() {
        return car_goods_amount;
    }

    public void setCar_goods_amount(int car_goods_amount) {
        this.car_goods_amount = car_goods_amount;
    }

    public String getCar_user_id() {
        return car_user_id;
    }

    public void setCar_user_id(String car_user_id) {
        this.car_user_id = car_user_id;
    }



    public String getCar_goods_size() {
        return car_goods_size;
    }



    public void setCar_goods_size(String car_goods_size) {
        this.car_goods_size = car_goods_size;
    }



    public String getCar_goods_color() {
        return car_goods_color;
    }



    public void setCar_goods_color(String car_goods_color) {
        this.car_goods_color = car_goods_color;
    }



    @Override
    public String toString() {
        return "ShopCar [car_id=" + car_id + ", car_goods_id=" + car_goods_id
                + ", car_goods_amount=" + car_goods_amount + ", car_user_id=" + car_user_id
                + ", car_goods_size=" + car_goods_size + ", car_goods_color=" + car_goods_color
                + "]";
    }

}
