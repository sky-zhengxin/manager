using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["id"] != null)
        {
            lblname.Text = "当前用户：" + Session["id"];
        }
        else
        {
            lblname.Text = "当前状态：未登录";
        }

    }
    protected void lbutExit_Click(object sender, EventArgs e)
    {
        if (Session["id"] != null)
        {
            Session["id"] = null;
            lblname.Text = "当前状态：未登录";
            Response.Redirect("Login.aspx");
        }
        else
        {
            Response.Write("<script>window.alert('尚未登录，请先登录！');location.href='Login.aspx';</script>");
        }
    }
}
