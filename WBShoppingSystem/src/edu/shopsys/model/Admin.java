package edu.shopsys.model;

public class Admin {
    // 管理员账号
    private String admin_id;
    // 管理员密码
    private String admin_pwd;
    // 管理员邮箱
    private String admin_email;

    public Admin() {
        super();
    }

    public Admin(String admin_id, String admin_pwd, String admin_email) {
        super();
        this.admin_id = admin_id;
        this.admin_pwd = admin_pwd;
        this.admin_email = admin_email;
    }

    public String getAdmin_id() {
        return admin_id;
    }

    public void setAdmin_id(String admin_id) {
        this.admin_id = admin_id;
    }

    public String getAdmin_pwd() {
        return admin_pwd;
    }

    public void setAdmin_pwd(String admin_pwd) {
        this.admin_pwd = admin_pwd;
    }

    public String getAdmin_email() {
        return admin_email;
    }

    public void setAdmin_email(String admin_email) {
        this.admin_email = admin_email;
    }


}
