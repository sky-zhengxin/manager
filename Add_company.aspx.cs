using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Add_company : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Binddate()
    {
        users us = new users();
        GVinformation.DataSource = us.GetAllcompany_infor(us);
        GVinformation.DataBind();
    }

    protected void GVinformation_Sorting(object sender, GridViewSortEventArgs e)
    {
        users us = new users();
        string sortExpression = e.SortExpression;
        if (GVinformation.SortDirection == SortDirection.Ascending)
        {
            DataView dv = us.GetAllCompany_infor(us).Tables[0].DefaultView;
            dv.Sort = sortExpression + "DESC";
            GVinformation.DataSource = dv;
            GVinformation.DataBind();
        }
        else
        {
            DataView dv = us.GetAllCompany_infor(us).Tables[0].DefaultView;
            dv.Sort = sortExpression + "ASC";
            GVinformation.DataSource = dv;
            GVinformation.DataBind();
        }
    }



    protected void GVinformation_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GVinformation.EditIndex = e.NewEditIndex;
        Binddate();
    }





    protected void GVinformation_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GVinformation.EditIndex = -1;
        Binddate();
    }

    protected void GVinformation_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GVinformation.PageIndex = e.NewPageIndex;
        Binddate();
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        string name = txtCompany.Text.Trim();
        string phone = TXTPhone.Text.Trim();
        string methed = txtMethed.Text.Trim();
        string maingoods = txtMaingood.Text.Trim();
        string qulity = txtQulity.Text.Trim();
        users us = new users();
        us.name = name;
        us.phone = phone; 
        us.methed = methed;
        us.maingoods = maingoods;
        us.qulity = qulity;
        int result = us.AddCompany_infor(us);
        if (result > 0)
        {
            Response.Write("<script>alert(\"添加信息成功！\")</script>");
            Binddate();

        }

    }
}