<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Add_stock.aspx.cs" Inherits="Add_goods" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            height: 20px;
        }
        .auto-style3 {
            height: 20px;
            width: 188px;
            text-align: center;
        }
        .auto-style4 {
            text-align: right;
        }
        .auto-style5 {
            width: 188px;
            height: 23px;
            text-align: center;
        }
        .auto-style6 {
            height: 23px;
        }
        .auto-style7 {
            height: 20px;
            text-align: right;
        }
        .auto-style8 {
            width: 188px;
            text-align: center;
        }
          body {
            background-image:url(./images/A_background.jpg);       
            color:white;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <div class="JHAdd">
        <table class="auto-style1">
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style2">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style2">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style2">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style2">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style2">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style2">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style2">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style2">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style3"><font color="blue">进货单号: </font></td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtJHid" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style3"><font color="blue">货物名称: </font></td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtJHname" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style3"><font color="blue">进货日期:</font></td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtJHdate" runat="server"></asp:TextBox>
                    <asp:CalendarExtender ID="txtJHdate_CalendarExtender" runat="server" Enabled="True" TargetControlID="txtJHdate" Format="yyyy-MM-dd">
                    </asp:CalendarExtender>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style5"><font color="blue">进货员工:</font></td>
                <td class="auto-style6">
                    <asp:TextBox ID="TXTJHemployees" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">&nbsp;</td>
                <td class="auto-style8"><font color="blue">供应商:</font></td>
                <td>
                    <asp:TextBox ID="TXTJHsource" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">&nbsp;</td>
                <td class="auto-style8"><font color="blue">进货数量:</font></td>
                <td>
                    <asp:TextBox ID="txtJHcount" runat="server"></asp:TextBox>
                    <asp:Label ID="lblCount" runat="server" Text="kg"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style5"><font color="blue">单价:</font></td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtJHprice" runat="server"></asp:TextBox>
                    <asp:Label ID="lblPrice" runat="server" Text="元"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">&nbsp;</td>
                <td class="auto-style8"><font color="blue">应付金额:</font></td>
                <td>
                    <asp:TextBox ID="txtJHtotalprice" runat="server"></asp:TextBox>
                    <asp:Label ID="lblAmount" runat="server" Text="万元"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style5"><font color="blue">实付金额:</font></td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtJHrealpay" runat="server"></asp:TextBox>
                    <asp:Label ID="lblRealpy" runat="server" Text="万元"></asp:Label>
                </td>
            </tr>
            </table>
      
        <table class="auto-style1">
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td>
                    <asp:Button ID="btnAdd" runat="server" Text="添加" Width="70px" OnClick="btnAdd_Click" />
                </td>
            </tr>
            <tr>
                <td class="auto-style7" colspan="2">
                    <asp:GridView ID="GVinformation"  runat="server" AutoGenerateColumns="False" AllowPaging="True" AllowSorting="True" 
                   OnSorting="GVinformation_Sorting"  
                    DataKeyNames="G_stockno" OnRowCancelingEdit="GVinformation_RowCancelingEdit" 
                    OnRowEditing="GVinformation_RowEditing" 
                    OnPageIndexChanging="GVinformation_PageIndexChanging" Width="884px">
                        <Columns>
                            <asp:BoundField DataField="G_stockno" HeaderText="进货单号" SortExpression="G_orderno" />
                            <asp:BoundField DataField="G_name" HeaderText="棉纱名称" SortExpression="G_name" />
                            <asp:BoundField DataField="G_price" HeaderText="单价" SortExpression="G_price" />
                            <asp:BoundField DataField="G_count" HeaderText="数量" SortExpression="G_count" />
                            <asp:BoundField DataField="G_source" HeaderText="来源公司" SortExpression="G_source" />
                            <asp:BoundField DataField="G_totalprice" HeaderText="应付金额" SortExpression="G_totalprice" />
                            <asp:BoundField DataField="G_people" HeaderText="进货员" SortExpression="G_people" />
                            <asp:BoundField DataField="G_date" HeaderText="日期" SortExpression="G_date" />
                            <asp:BoundField DataField="G_realpay" HeaderText="实付金额" SortExpression="G_realpay" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Goods-ManagementConnectionString %>" SelectCommand="SELECT [G_orderno], [G_name], [G_price], [G_count], [G_source], [G_totalprice], [G_people], [G_date], [G_realpay] FROM [Goods_Information]"></asp:SqlDataSource>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
                </td>
            </tr>
        </table>
    </div>
    </div>
    </form>
</body>
</html>
