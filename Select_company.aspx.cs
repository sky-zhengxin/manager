using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Select_company : System.Web.UI.Page
{
    private static string sqlcoon = System.Configuration.ConfigurationManager.AppSettings["strCoon"].ToString().Trim();
    public string sql1 = "select * from Company_Information where 1=0";
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Binddate()
    {
        SqlConnection coon = new SqlConnection(sqlcoon);
        SqlDataAdapter adp = new SqlDataAdapter(sql1, coon);
        try
        {
            coon.Open();
            DataSet ds = new DataSet();
            adp.Fill(ds, "Company_Information");
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
            DataView dv = us.GetAllcompany_infor(us).Tables[0].DefaultView;
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
        us.delCompany_information(us);
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
        string name = GVinformation.DataKeys[e.RowIndex].Value.ToString().Trim();
        string phone = ((TextBox)(GVinformation.Rows[e.RowIndex].Cells[1].Controls[0])).Text.Trim();
        string methed = ((TextBox)(GVinformation.Rows[e.RowIndex].Cells[2].Controls[0])).Text.Trim();
        string maingoods = ((TextBox)(GVinformation.Rows[e.RowIndex].Cells[3].Controls[0])).Text.Trim();
        string qulity = ((TextBox)(GVinformation.Rows[e.RowIndex].Cells[4].Controls[0])).Text.Trim();
        users us = new users();
        us.name = name;
        us.phone = phone;
        us.methed = methed;
        us.maingoods = maingoods;
        us.qulity = qulity;

        us.UpdaCompany_information(us);
    }

    protected void CheckBox_Click(object sender, EventArgs e)
    {
        string sql = "select * from Company_Information where 1=1" ;
        string name = txtname.Text.Trim();
        string good = txtgood.Text.Trim();

        if (CBname.Checked) sql += "and C_name='" + name  + "'";
        if (CBgood.Checked) sql += "and C_maingoods like '%" + name + "%'";
        
        sql1 = sql;
    }

    protected void btnselect_Click(object sender, EventArgs e)
    {
        SqlConnection coon = new SqlConnection(sqlcoon);
        try
        {
            coon.Open();
            SqlCommand comm = new SqlCommand(sql1, coon);
            SqlDataReader rd = comm.ExecuteReader();
            if (rd.Read())
            {
                coon.Close();
                SqlDataAdapter adp = new SqlDataAdapter(sql1, coon);
                try
                {
                    coon.Open();
                    DataSet ds = new DataSet();
                    adp.Fill(ds, "Company_Information");
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