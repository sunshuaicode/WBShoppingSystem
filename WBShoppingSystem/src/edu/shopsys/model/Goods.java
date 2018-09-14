package edu.shopsys.model;

public class Goods {
    // 商品ID
    private String goods_id;
    // 商品名
    private String goods_name;
    // 商品种类
    private String goods_type;
    // 商品图片地址
    private String goods_image;
    // 商品价格
    private Double goods_price;
    // 商品具体信息
    private String goods_info;
    // 商品库存
    private int goods_stock;
    // 商品品牌
    private String goods_brand;

    // 无参构造方法
    public Goods() {
        super();
    }

    public Goods(String goods_id, String goods_name, String goods_type, String goods_image,
            Double goods_price, String goods_info, int goods_stock, String goods_brand) {
        super();
        this.goods_id = goods_id;
        this.goods_name = goods_name;
        this.goods_type = goods_type;
        this.goods_image = goods_image;
        this.goods_price = goods_price;
        this.goods_info = goods_info;
        this.goods_stock = goods_stock;
        this.goods_brand = goods_brand;
    }



    public String getGoods_id() {
        return goods_id;
    }

    public void setGoods_id(String goods_id) {
        this.goods_id = goods_id;
    }

    public String getGoods_name() {
        return goods_name;
    }

    public void setGoods_name(String goods_name) {
        this.goods_name = goods_name;
    }

    public String getGoods_type() {
        return goods_type;
    }

    public void setGoods_type(String goods_type) {
        this.goods_type = goods_type;
    }

    public String getGoods_image() {
        return goods_image;
    }

    public void setGoods_image(String goods_image) {
        this.goods_image = goods_image;
    }

    public Double getGoods_price() {
        return goods_price;
    }

    public void setGoods_price(Double goods_price) {
        this.goods_price = goods_price;
    }

    public String getGoods_info() {
        return goods_info;
    }

    public void setGoods_info(String goods_info) {
        this.goods_info = goods_info;
    }



    public int getGoods_stock() {
        return goods_stock;
    }



    public void setGoods_stock(int goods_stock) {
        this.goods_stock = goods_stock;
    }



    public String getGoods_brand() {
        return goods_brand;
    }

    public void setGoods_brand(String goods_brand) {
        this.goods_brand = goods_brand;
    }

    @Override
    public String toString() {
        return "Goods[goods_id=" + goods_id + ",goods_name=" + goods_name + ",goods_type="
                + goods_type + ",goods_image=" +goods_image + ",goods_price=" + goods_price
                + ",goods_info=" + goods_info + ",goods_stock=" + goods_stock + ",goods_brand="
                + goods_brand + "]";
    }

}
