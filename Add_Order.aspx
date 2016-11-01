<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Add_Order.aspx.cs" Inherits="Add_Order" %>

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
            width: 238px;
            text-align: right;
        }
        .auto-style4 {
            height: 20px;
            width: 238px;
            text-align: right;
        }
        .auto-style5 {
            text-align: center;
        }
        .auto-style6 {
            height: 23px;
        }
        .auto-style7 {
            width: 238px;
            text-align: right;
            height: 23px;
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
    
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    
        <table class="auto-style1">
            <tr>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style6">
                    &nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style6">
                    &nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style7">订单ID</td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtOrderID" runat="server" OnTextChanged="txtOrderID_TextChanged" AutoPostBack="True"></asp:TextBox>
                    <asp:Label ID="Label3" runat="server" Text="请按照日期JH编码格式输入"></asp:Label>
                    <asp:Label ID="Label4" runat="server" Text="编号已有，请重新输入"></asp:Label>
                </td>
                <td class="auto-style6">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2"></td>
                <td class="auto-style4">货物名称</td>
                <td class="auto-style2">
                    <asp:DropDownList ID="drpName" runat="server" AutoPostBack="True" OnSelectedIndexChanged="drpName_SelectedIndexChanged">
                        <asp:ListItem Value="0">-----货物名称-----</asp:ListItem>
                        <asp:ListItem Value="1">棉纱</asp:ListItem>
                        <asp:ListItem Value="2">麻线</asp:ListItem>
                        <asp:ListItem Value="3">羊毛纤维</asp:ListItem>
                        <asp:ListItem Value="4">黏胶纤维</asp:ListItem>
                        <asp:ListItem Value="5">涤纶</asp:ListItem>
                        <asp:ListItem Value="6">腈纶</asp:ListItem>
                        <asp:ListItem Value="7">添加新名称</asp:ListItem>
                    </asp:DropDownList>
                    <asp:TextBox ID="txtName" runat="server" Visible="False"></asp:TextBox>
                    <br />
                </td>
                <td class="auto-style2"></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td class="auto-style3">订单公司名称</td>
                <td>
                    <asp:TextBox ID="txtCompany" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td class="auto-style3">订单时间</td>
                <td>
                    <asp:TextBox ID="txtTime" runat="server"></asp:TextBox>
                    <asp:CalendarExtender ID="txtTime_CalendarExtender" runat="server" Enabled="True" TargetControlID="txtTime" Format="yyyy-MM-dd">
                    </asp:CalendarExtender>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td class="auto-style3">货物销售数量</td>
                <td>
                    <asp:TextBox ID="txtGoodCount" runat="server"></asp:TextBox>
                    <asp:Label ID="Label1" runat="server" Text="kg"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td class="auto-style3">货物销售价格</td>
                <td>
                    <asp:TextBox ID="txtGoodPrice" runat="server"></asp:TextBox>
                    <asp:Label ID="Label2" runat="server" Text="万元"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td class="auto-style3">货物销售人员</td>
                <td>
                    <asp:TextBox ID="txtemplyees" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td>
                    <asp:Button ID="btnAdd" runat="server" Text="添加" width="70px" OnClick="btnAdd_Click"/>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td colspan="4" class="auto-style5">
                   <asp:GridView ID="GVinformation"  runat="server" AutoGenerateColumns="False" AllowPaging="True" AllowSorting="True" 
                   OnSorting="GVinformation_Sorting"  
                    DataKeyNames="O_id" OnRowCancelingEdit="GVinformation_RowCancelingEdit" 
                    OnRowEditing="GVinformation_RowEditing" 
                    OnPageIndexChanging="GVinformation_PageIndexChanging" Width="884px">
                        <Columns>
                            <asp:BoundField DataField="O_id" HeaderText="订单号" SortExpression="O_id" />
                            <asp:BoundField DataField="O_name" HeaderText="棉纱名称" SortExpression="O_name" />
                            <asp:BoundField DataField="O_company" HeaderText="订单公司" SortExpression="O_company" />
                            <asp:BoundField DataField="O_count" HeaderText="数量" SortExpression="O_count" />
                            <asp:BoundField DataField="O_price" HeaderText="价格" SortExpression="O_price" />
                            <asp:BoundField DataField="O_personel" HeaderText="业务员" SortExpression="O_personel" />
                            <asp:BoundField DataField="O_time" HeaderText="时间" SortExpression="O_time" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Goods-ManagementConnectionString %>" SelectCommand="SELECT [O_id], [O_name], [O_company], [O_count], [O_price], [O_personel], [O_time] FROM [Goods_Order]"></asp:SqlDataSource>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
