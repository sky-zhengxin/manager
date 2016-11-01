using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class Select_Stock : System.Web.UI.Page
{
    private static string sqlcoon = System.Configuration.ConfigurationManager.AppSettings["strCoon"].ToString().Trim();
    public string sql = "select * from Goods_Stock where 1=1 ";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindname();
            bindcompany();

        }
    }
    protected void Binddate()
    {
        SqlConnection coon = new SqlConnection(sqlcoon);
        SqlDataAdapter adp = new SqlDataAdapter(sql, coon);
        try
        {
            coon.Open();
            DataSet ds = new DataSet();
            adp.Fill(ds, "Goods_Stock");
            //DataSet ds = new DataSet();
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
        us.stockno = id;
        us.delGoods_Stock(us);
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
        string price = ((TextBox)(GVinformation.Rows[e.RowIndex].Cells[2].Controls[0])).Text.Trim();
        string count = ((TextBox)(GVinformation.Rows[e.RowIndex].Cells[3].Controls[0])).Text.Trim();
        string company = ((TextBox)(GVinformation.Rows[e.RowIndex].Cells[4].Controls[0])).Text.Trim();
        string people = ((TextBox)(GVinformation.Rows[e.RowIndex].Cells[5].Controls[0])).Text.Trim();
        string totalprice = ((TextBox)(GVinformation.Rows[e.RowIndex].Cells[6].Controls[0])).Text.Trim();
        string realpay = ((TextBox)(GVinformation.Rows[e.RowIndex].Cells[7].Controls[0])).Text.Trim();
        string date = ((TextBox)(GVinformation.Rows[e.RowIndex].Cells[8].Controls[0])).Text.Trim();
        users us = new users();
        us.stockno = id;
        us.name = name;
        us.count = count;
        us.source = company;
        us.price = price;
        us.employees = people;
        us.totalprice = totalprice;
        us.realpay = realpay;
        us.date = date;

        us.UpdaGoods_Stock(us);
    }
   
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
    protected void CheckBox_Click(object sender, EventArgs e)
    {
        string stockid = txtstockid.Text.Trim();
        string name = drpname.SelectedValue.Trim();
        string source = drpCompany.SelectedValue.Trim();
        string starttime = txtstarttime.Text.Trim();
        string endtime = txtendtime.Text.Trim();
        if (CBstockid.Checked) sql +=  "and G_stockno ='" + stockid + "'";
        if (CBname.Checked) sql +=  "and G_name ='" + name + "'";
        if(CBcompany.Checked) sql +=  "and G_source ='"+ source +"'";
        if (CBstarttime.Checked) sql +=  "and G_date >='" + starttime + "'";
        if (CBendtime.Checked) sql +=  "and G_date <= '"+ endtime +"'";

       

    }

    protected void btnSelect_Click(object sender, EventArgs e)
    {
        string stockid = txtstockid.Text.Trim();
        string name = drpname.SelectedValue.Trim();
        string source = drpCompany.SelectedValue.Trim();
        string starttime = txtstarttime.Text.Trim();
        string endtime = txtendtime.Text.Trim();

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
                    adp.Fill(ds, "Goods_Stock");
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

  
}