using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Add_goods : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Binddate();


        }
    }
    protected void Binddate()
    {
        users us = new users();
        GVinformation.DataSource = us.GetAllgoods_infor(us);
        GVinformation.DataBind();
    }

    protected void GVinformation_Sorting(object sender, GridViewSortEventArgs e)
    {
        users us = new users();
        string sortExpression = e.SortExpression;
        if (GVinformation.SortDirection == SortDirection.Ascending)
        {
            DataView dv = us.GetAllGoodS_infor(us).Tables[0].DefaultView;
            dv.Sort = sortExpression + "DESC";
            GVinformation.DataSource = dv;
            GVinformation.DataBind();
        }
        else
        {
            DataView dv = us.GetAllGoodS_infor(us).Tables[0].DefaultView;
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

    /*protected void GVinformation_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        string stockno = GVinformation.DataKeys[e.RowIndex].Value.ToString().Trim();
        string name = ((TextBox)(GVinformation.Rows[e.RowIndex].Cells[1].Controls[0])).Text.Trim();
        string price = ((TextBox)(GVinformation.Rows[e.RowIndex].Cells[2].Controls[0])).Text.Trim();
        string count = ((TextBox)(GVinformation.Rows[e.RowIndex].Cells[3].Controls[0])).Text.Trim();
        string source = ((TextBox)(GVinformation.Rows[e.RowIndex].Cells[4].Controls[0])).Text.Trim();
        string totalprice = ((TextBox)(GVinformation.Rows[e.RowIndex].Cells[5].Controls[0])).Text.Trim();
        string employees = ((TextBox)(GVinformation.Rows[e.RowIndex].Cells[6].Controls[0])).Text.Trim();
        string date = ((TextBox)(GVinformation.Rows[e.RowIndex].Cells[7].Controls[0])).Text.Trim();
        string realpay = ((TextBox)(GVinformation.Rows[e.RowIndex].Cells[8].Controls[0])).Text.Trim();
        users us = new users();
        us.stockno = stockno;
        us.name = name;
        us.price = price;
        us.count = count;
        us.source = source;
        us.totalprice = totalprice;
        us.employees = employees;
        us.date = date;
        us.realpay = realpay;

    }
    */

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        string stockno = txtJHid.Text.Trim();
        string name = txtJHname.Text.Trim();
        string price = txtJHprice.Text.Trim();
        string count = txtJHcount.Text.Trim();
        string source = TXTJHsource.Text.Trim();
        string totalprice = txtJHtotalprice.Text.Trim();
        string employees = TXTJHemployees.Text.Trim();
        string date = txtJHdate.Text.Trim();
        string realpay = txtJHrealpay.Text.Trim();


        users us = new users();
        us.stockno = stockno;
        us.name = name;
        us.price = price;
        us.count = count;
        us.source = source;
        us.totalprice = totalprice;
        us.employees = employees;
        us.date = date;
        us.realpay = realpay;

        int result = us.Addgoods_infor(us);
        if (result > 0)
        {
            Response.Write("<script>alert(\"添加信息成功！\")</script>");
            Binddate();
        }
    }
}