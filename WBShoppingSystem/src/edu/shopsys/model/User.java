package edu.shopsys.model;

//用户实体类
public class User {
    // 用户的唯一标识，手机号码,用于登录
    private String user_id;
    // 用户名，用户昵称
    private String user_name;
    // 用户密码
    private String user_pwd;
    // 用户邮箱，用于找回密码
    private String user_email;
    // 用户信息中的性别
    private String user_sex;
    // 用户的地址
    private String user_address;
    // 用户的注册时间，自动生成，数据库中是Date类型需要进行转换
    private String user_register_time;
    //用户登录状态
    private String user_state;
    // 无参构造方法便于DBUtils使用
    public User() {
        super();
    }

    // 有参构造方法
    public User(String user_id, String user_name, String user_pwd, String user_email,String user_sex, String user_address, String user_register_time, String user_state) {
        super();
        this.user_id = user_id;
        this.user_name = user_name;
        this.user_pwd = user_pwd;
        this.user_email = user_email;
        this.user_sex = user_sex;
        this.user_address = user_address;
        this.user_register_time = user_register_time;
        this.user_state = user_state;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getUser_pwd() {
        return user_pwd;
    }

    public void setUser_pwd(String user_pwd) {
        this.user_pwd = user_pwd;
    }

    public String getUser_email() {
        return user_email;
    }

    public void setUser_email(String user_email) {
        this.user_email = user_email;
    }

    public String getUser_sex() {
        return user_sex;
    }

    public void setUser_sex(String user_sex) {
        this.user_sex = user_sex;
    }

    public String getUser_address() {
        return user_address;
    }

    public void setUser_address(String user_address) {
        this.user_address = user_address;
    }

    public String getUser_register_time() {
        return user_register_time;
    }

    public void setUser_register_time(String user_register_time) {
        this.user_register_time = user_register_time;
    }
    public String getUser_state() {
        return user_state;
    }

    public void setUser_state(String user_state) {
        this.user_state = user_state;
    }


    // toString方法便于测试
    @Override
    public String toString() {
        return "User [user_id=" + user_id + ", user_name=" + user_name + ", user_pwd=" + user_pwd
                + ", user_email=" + user_email + ", user_sex=" + user_sex + ", user_address="
                + user_address + ", user_register_time=" + user_register_time + "]";
    }

}
