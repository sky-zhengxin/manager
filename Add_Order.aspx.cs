using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Add_Order : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            Binddate();
            Label4.Visible = false;

        }
    }
    protected void Binddate()
    {
        users us = new users();
        GVinformation.DataSource = us.GetAllgoods_order(us);
        GVinformation.DataBind();
    }

    protected void GVinformation_Sorting(object sender, GridViewSortEventArgs e)
    {
        users us = new users();
        string sortExpression = e.SortExpression;
        if (GVinformation.SortDirection == SortDirection.Ascending)
        {
            DataView dv = us.GetAllGoods_Order(us).Tables[0].DefaultView;
            dv.Sort = sortExpression + "DESC";
            GVinformation.DataSource = dv;
            GVinformation.DataBind();
        }
        else
        {
            DataView dv = us.GetAllGoods_Order(us).Tables[0].DefaultView;
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
        string id = txtOrderID.Text.Trim();
        string name = (drpName.SelectedIndex == 7) ? (txtName.Text.Trim()) : (drpName.SelectedValue.Trim());
        string ordercompany = txtCompany.Text.Trim();
        string date = txtTime.Text.Trim();
        string count = txtGoodCount.Text.Trim();
        string price = txtGoodPrice.Text.Trim();
        string employees = txtemplyees.Text.Trim();

        users us = new users();
        us.id = id;
        us.name = name;
        us.ordercompany = ordercompany;
        us.date = date;
        us.count = count;
        us.price = price;
        us.employees = employees;

        int result = us.Addgoods_order(us);
        if (result > 0)
        {
            Response.Write("<script>alert(\"添加信息成功！\")</script>");
            Binddate();

        }
    }
    protected void drpName_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (drpName.SelectedIndex == 7)
        {
            txtName.Visible = true;
        }
    }
    protected void txtOrderID_TextChanged(object sender, EventArgs e)
    {
        string id = txtOrderID.Text.Trim();
        users us = new users();
        us.id = id;
        int result = us.selectDD(us);
            if(result > 0)
            {
                Label4.Visible = true;
            }
    }
}