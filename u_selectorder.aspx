<%@ Page Language="C#" AutoEventWireup="true" CodeFile="u_selectorder.aspx.cs" Inherits="u_selectorder" %>

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
        .auto-style3 {
            width: 217px;
            text-align: center;
        }
        .auto-style4 {
            width: 227px;
        }
         body {
            background-image:url(./images/U_background.jpg);       
            color:white;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <div class="U_selectorder">

        <table class="auto-style1">
            <tr>
                <td class="auto-style3">
                    &nbsp;</td>
                <td class="auto-style4">
                    &nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    &nbsp;</td>
                <td class="auto-style4">
                    &nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    &nbsp;</td>
                <td class="auto-style4">
                    &nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    &nbsp;</td>
                <td class="auto-style4">
                    &nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:CheckBox ID="CBID" runat="server"  Text="订单编号"  OnCheckedChanged="CheckBox_Click" />
                </td>
                <td class="auto-style4">
                    <asp:TextBox ID="txtid" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:CheckBox ID="CBname" runat="server" Text="货物名称"  OnCheckedChanged="CheckBox_Click" />
                </td>
                <td class="auto-style4">
                    <asp:DropDownList ID="drpname" runat="server">
                    </asp:DropDownList>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:CheckBox ID="CBcompany" runat="server"  Text="公司名称"  OnCheckedChanged="CheckBox_Click"/>
                </td>
                <td class="auto-style4">
                    <asp:DropDownList ID="drpcompany" runat="server">
                    </asp:DropDownList>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:CheckBox ID="CBstarttime" runat="server" Text="开始时间"  OnCheckedChanged="CheckBox_Click" />
                </td>
                <td class="auto-style4">
                    <asp:TextBox ID="txtstarttime" runat="server"></asp:TextBox>
                    <asp:CalendarExtender ID="txtstarttime_CalendarExtender" runat="server" Enabled="True" TargetControlID="txtstarttime" Format="yyyy-MM-dd"> </asp:CalendarExtender>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:CheckBox ID="CBendtime" runat="server" Text="结束时间"  OnCheckedChanged="CheckBox_Click" />
                </td>
                <td class="auto-style4">
                    <asp:TextBox ID="txtendtime" runat="server"></asp:TextBox>
                    <asp:CalendarExtender ID="txtendtime_CalendarExtender" runat="server" Enabled="True" TargetControlID="txtendtime" Format="yyyy-MM-dd"></asp:CalendarExtender>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Button ID="btnselect" runat="server" Text="搜索" Width="60px" OnClick="btnselect_Click" />
                </td>
                <td class="auto-style4">
                    &nbsp;</td>
                <td>
                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <table class="auto-style1">
        <tr>
            <td>
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
            </td>
        </tr>
    </table>
    </div>
    </div>
    </form>
    <table class="auto-style1">
        <tr>
            <td>&nbsp;</td>
        </tr>
    </table>
</body>
</html>
