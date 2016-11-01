using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class u_selectstock : System.Web.UI.Page
{
    private static string sqlcoon = System.Configuration.ConfigurationManager.AppSettings["strCoon"].ToString().Trim();
    private string sql = "select * from Goods_Stock where 1=1";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindname();
            bindcompany();

        }
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
        drpcompany.DataSource = us.BindGoods_company().Tables[0].DefaultView;
        drpcompany.DataTextField = "C_name";
        drpcompany.DataValueField = "C_name";
        drpcompany.DataBind();

    }

  
    protected void CheckBox_Click(object sender, EventArgs e)
    {
        string stockid = txtstockid.Text.Trim();
        string name = drpname.SelectedValue.Trim();
        string source = drpcompany.SelectedValue.Trim();
        string starttime = txtstarttime.Text.Trim();
        string endtime = txtendtime.Text.Trim();

        if (CBstockid.Checked) sql += "and G_stockno ='" + stockid + "'";
        if (CBname.Checked) sql += "and G_name ='" + name + "'";
        if (CBcompany.Checked) sql += "and G_source ='" + source + "'";
        if (CBstarttime.Checked) sql += "and G_date >='" + starttime + "'";
        if (CBendtime.Checked) sql += "and G_date <= '" + endtime + "'";
    }
    protected void btnselect_Click(object sender, EventArgs e)
    {
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


  
}