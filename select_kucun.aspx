<%@ Page Language="C#" AutoEventWireup="true" CodeFile="select_kucun.aspx.cs" Inherits="select_kucun" %>

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
            width: 207px;
            text-align: center;
        }
        .auto-style4 {
            width: 207px;
            text-align: center;
        }
        .auto-style5 {
            height: 20px;
            width: 198px;
        }
        .auto-style6 {
            width: 198px;
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
    <div class="select_kucun">


        <table class="auto-style1">
            <tr>
                <td class="auto-style3">
                    &nbsp;</td>
                <td class="auto-style5">
                    &nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    &nbsp;</td>
                <td class="auto-style5">
                    &nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    &nbsp;</td>
                <td class="auto-style5">
                    &nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    &nbsp;</td>
                <td class="auto-style5">
                    &nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    &nbsp;</td>
                <td class="auto-style5">
                    &nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    &nbsp;</td>
                <td class="auto-style5">
                    &nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    &nbsp;</td>
                <td class="auto-style5">
                    &nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    &nbsp;</td>
                <td class="auto-style5">
                    &nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:CheckBox ID="CBgoodsID" runat="server" Text="货物编码" OnCheckedChanged="CheckBox_Click"  />
                </td>
                <td class="auto-style5">
                    <asp:TextBox ID="txtID" runat="server" ></asp:TextBox>
                </td>
                <td class="auto-style2"></td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:CheckBox ID="CBname" runat="server"  Text="货物名称" OnCheckedChanged="CheckBox_Click"/>
                </td>
                <td class="auto-style6">
                    <asp:DropDownList ID="drpname" runat="server">
                    </asp:DropDownList>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:CheckBox ID="CBcompany" runat="server"  Text="货物数量" OnCheckedChanged="CheckBox_Click" />
                </td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtcount" runat="server"></asp:TextBox>
                    <asp:Label ID="lblcount" runat="server" Text="kg"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:CheckBox ID="CBMinprice" runat="server"  Text="价格下限" OnCheckedChanged="CheckBox_Click" />
                </td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtMinprice" runat="server"></asp:TextBox>
                    <asp:Label ID="lblMinprice" runat="server" Text="元"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:CheckBox ID="CBMaxprice" runat="server"  Text="价格上限" OnCheckedChanged="CheckBox_Click" />
                </td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtMaxprice" runat="server"></asp:TextBox>
                    <asp:Label ID="lblmaxprice" runat="server" Text="元"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:Button ID="btnselect" runat="server" Text="搜索" Width="60px" OnClick="btnselect_Click" />
                </td>
                <td class="auto-style6">
                    <asp:Button ID="btnclean" runat="server" Text="清空" Width="60px" />
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
         <table class="auto-style1">
        <tr>
            <td>
                <asp:GridView ID="GVinformation" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="G_id" 
                    OnPageIndexChanging="GVinformation_PageIndexChanging" 
                    OnRowCancelingEdit="GVinformation_RowCancelingEdit" 
                    OnRowDataBound="GVinformation_RowDataBound" 
                    OnRowDeleting="GVinformation_RowDeleting" 
                    OnRowEditing="GVinformation_RowEditing" 
                    OnRowUpdating="GVinformation_RowUpdating" 
                    OnSorting="GVinformation_Sorting" Width="882px" >
                    <Columns>
                        <asp:BoundField DataField="G_id" HeaderText="货物编码" />
                        <asp:BoundField DataField="G_name" HeaderText="货物名称" />
                        <asp:BoundField DataField="G_material" HeaderText="原材料" />
                        <asp:BoundField DataField="G_method" HeaderText="纺织方式" />
                        <asp:BoundField DataField="G_purpose" HeaderText="用途" />
                        <asp:BoundField DataField="G_count" HeaderText="库存数量" />
                        <asp:BoundField DataField="G_price" HeaderText="实时价格" />
                        <asp:CommandField CancelText="退出" ShowEditButton="True" />
                        <asp:CommandField ShowDeleteButton="True" />
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
    </table>

    </div>
    </div>
    </form>
   
</body>
</html>
