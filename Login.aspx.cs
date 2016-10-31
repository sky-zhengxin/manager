using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    
  
        protected void Page_Load(object sender, EventArgs e)
        {
            lblTid.Visible = false;
            lblTps.Visible = false;
        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string uid = txtName.Text.Trim();
            string upassowrd = txtPassword.Text.Trim();
            users us = new users();
            us.uid = uid;
            us.ups = upassowrd;
            if(drpIdentity.SelectedValue == "ad")
            {
                int result = us.Alogin(us);
                if (result > 0)
                {
                    Session["id"] = uid;   //会话变量，网站通用，确定身份
                    Response.Redirect("~/HomePage.aspx");
                }
                else
                {
                    Response.Write("<script>alert(\"对不起，您输入错误！\")</script>");
                }
            }
            if (drpIdentity.SelectedValue == "us")
            {
                int result = us.ulogin(us);
                if (result > 0)
                {
                    Session["id"] = uid;   //会话变量，网站通用，确定身份
                    Response.Redirect("~/usershomepag.aspx");
                }
                else
                {
                    Response.Write("<script>alert(\"对不起，您输入错误！\")</script>");
                }

            }
           
        }

    
}