using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;


public partial class Select_Order : System.Web.UI.Page
{
    private static string sqlcoon = System.Configuration.ConfigurationManager.AppSettings["strCoon"].ToString().Trim();
    public string sql = "select * from Goods_Order where 1=1";
   // private string sqldel = "delete from Goods_Order where 1=1";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {


            bindname();
            bindcompany();

        }
    }
    // 货物名称的dropdownlist

    void bindname()
    {
        users us = new users();    //绑定货物名称
        drpname.DataSource = us.BindGoods_name().Tables[0].DefaultView;
        drpname.DataTextField = "G_name";
        drpname.DataValueField = "G_name";
        drpname.DataBind();

    }

    void bindcompany()
    {
        users us = new users();    //绑定
        drpCompany.DataSource = us.BindGoods_company().Tables[0].DefaultView;
        drpCompany.DataTextField = "C_name";
        drpCompany.DataValueField = "C_name";
        drpCompany.DataBind();

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

    protected void GVinformation_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        users tmp = new users();
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            if (e.Row.RowIndex == GVinformation.EditIndex)
            {
                DataRowView rowItem = (DataRowView)e.Row.DataItem;


            }
        }
        try
        {
            //获取”删除“链接
            LinkButton InkbtnDelete = (LinkButton)e.Row.Cells[15].Controls[0];
            //添加JavaScript代码实现客户端信息的提示
            InkbtnDelete.OnClientClick = "return confirm('您真的要删除的订单号为" + e.Row.Cells[1].Text + "订单记录吗？');";

        }
        catch
        {

        }
    }

    protected void GVinformation_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GVinformation.EditIndex = e.NewEditIndex;
        Binddate();
    }

    protected void GVinformation_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string id = GVinformation.DataKeys[e.RowIndex].Value.ToString().Trim();
        users us = new users();
        us.id = id;
        us.delGoods_order(us);
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

    protected void GVinformation_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        string id = GVinformation.DataKeys[e.RowIndex].Value.ToString().Trim();
        string name = ((TextBox)(GVinformation.Rows[e.RowIndex].Cells[1].Controls[0])).Text.Trim();
        string ordercompany = ((TextBox)(GVinformation.Rows[e.RowIndex].Cells[2].Controls[0])).Text.Trim();
        string count = ((TextBox)(GVinformation.Rows[e.RowIndex].Cells[3].Controls[0])).Text.Trim();
        string price = ((TextBox)(GVinformation.Rows[e.RowIndex].Cells[4].Controls[0])).Text.Trim();
        string employees = ((TextBox)(GVinformation.Rows[e.RowIndex].Cells[5].Controls[0])).Text.Trim();
        string date = ((TextBox)(GVinformation.Rows[e.RowIndex].Cells[6].Controls[0])).Text.Trim();

        users us = new users();
        us.id = id;
        us.name = name;
        us.count = count ;
        us.ordercompany = ordercompany;
        us.price = price;
        us.employees = employees;
        us.date = date;

        us.UpdaGoods_order(us);
    }
    protected void CheckBox_Click(object sender, EventArgs e)
    {
        string id = txtid.Text.Trim();
        string name = drpname.SelectedValue.Trim();
        string ordercompany = drpCompany.SelectedValue.Trim();
        string starttime = txtStarttime.Text.Trim();
        string endtime = txtEndtime.Text.Trim();

        if (CBID.Checked == true) sql += "and O_id ='" + id + "'"; 
        if (CBname.Checked == true) sql += "and O_name ='" + name + "'"; 
        if (CBcompany.Checked == true ) sql += "and O_company ='" + ordercompany + "'"; 
        if (CBstarttime.Checked == true) sql += "and O_time >='" + starttime + "'"; 
        if (CBendtime.Checked == true) sql += "and O_time <= '" + endtime + "'"; 
    }

    protected void btnselect_Click(object sender, EventArgs e)
    {
        string id = txtid.Text.Trim();
        string name = drpname.SelectedValue.Trim();
        string ordercompany = drpCompany.SelectedValue.Trim() ;
        string starttime = txtStarttime.Text.Trim();
        string endtime = txtEndtime.Text.Trim();
        Label1.Text = sql;
        SqlConnection coon = new SqlConnection(sqlcoon);
         
        try
        {
            coon.Open();
            SqlCommand comm = new SqlCommand(sql, coon);
            SqlDataReader rd = comm.ExecuteReader();
            if (rd.Read())
            {
                coon.Close();
                SqlDataAdapter adp = new SqlDataAdapter(sql, coon);
                try
                {
                    coon.Open();
                    DataSet ds = new DataSet();
                    adp.Fill(ds, "Goods_Order");
                    GVinformation.DataSource = ds.Tables[0].DefaultView;
                    GVinformation.DataBind();
                    GVinformation.Visible = true;
                }
               catch (SqlException ex)
                {
                   throw new Exception(ex.Message);
                }
                finally
                {
                    coon.Close();
                }
            }
            else
            {
                Response.Write("<script>alert(\"对不起，查询不到该条件下的库存信息！\")</script>");
            }
        }
        catch (SqlException ex)
        {
            throw new Exception(ex.Message);
        }
        finally
        {
            coon.Close();
        }

    }


    protected void btnclean_Click(object sender, EventArgs e)
    {

    }
}