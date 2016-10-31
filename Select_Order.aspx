<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Select_Order.aspx.cs" Inherits="Select_Order" %>

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
        .auto-style7 {
            height: 20px;
            width: 90px;
        }
        .auto-style8 {
            width: 90px;
        }
        .auto-style9 {
            height: 20px;
            width: 191px;
        }
        .auto-style10 {
            width: 191px;
        }
        .auto-style11 {
            width: 144px;
        }
        .auto-style12 {
            width: 192px;
        }
        .auto-style13 {
            width: 199px;
        }
        .auto-style16 {
            height: 20px;
            width: 171px;
            text-align: right;
        }
        .auto-style17 {
            width: 171px;
            text-align: right;
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
        <div class="slect_order">

            <table class="auto-style1">
                <tr>
                    <td class="auto-style16">
                        <asp:CheckBox ID="CBID" runat="server" text="订单编号" OnCheckedChanged="CheckBox_Click"/>
                    </td>
                    <td class="auto-style9">
                        <asp:TextBox ID="txtid" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style2">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style17">
                        <asp:CheckBox ID="CBname" runat="server" text="货物名称" OnCheckedChanged="CheckBox_Click"/>
                    </td>
                    <td class="auto-style10">
                        <asp:DropDownList ID="drpname" runat="server" AutoPostBack="True">
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style8">
                        &nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style17">
                        <asp:CheckBox ID="CBcompany" runat="server"  Text="订货公司" OnCheckedChanged="CheckBox_Click" />
                    </td>
                    <td class="auto-style10">
                        <asp:DropDownList ID="drpCompany" runat="server" AutoPostBack="True">
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style8">
                        &nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style17">
                        <asp:CheckBox ID="CBstarttime" runat="server" Text="起始时间" OnCheckedChanged="CheckBox_Click"  />
                    </td>
                    <td class="auto-style10">
                        <asp:TextBox ID="txtStarttime" runat="server"></asp:TextBox>
                        <asp:CalendarExtender ID="txtStarttime_CalendarExtender" runat="server" Enabled="True" TargetControlID="txtStarttime" Format="yyyy-MM-dd">
                        </asp:CalendarExtender>
                    </td>
                    <td class="auto-style8">
                        &nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style17">
                        <asp:CheckBox ID="CBendtime" runat="server"  Text="终止时间" OnCheckedChanged="CheckBox_Click" />
                    </td>
                    <td class="auto-style10">
                        <asp:TextBox ID="txtEndtime" runat="server" ></asp:TextBox>
                        <asp:CalendarExtender ID="txtEndtime_CalendarExtender" runat="server" Enabled="True" TargetControlID="txtEndtime" Format="yyyy-MM-dd">
                        </asp:CalendarExtender>
                    </td>
                    <td class="auto-style8">
                        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
            <br />
            <table class="auto-style1">
                <tr>
                    <td class="auto-style11">
                        <asp:Button ID="btnselect" runat="server" Text="查询" Width="77px" OnClick="btnselect_Click" />
                    </td>
                    <td class="auto-style12">
                        <asp:Button ID="btnclean" runat="server" Text="清空" Width="77px" OnClick="btnclean_Click" />
                    </td>
                    <td class="auto-style13">
                        <asp:ScriptManager ID="ScriptManager1" runat="server">
                        </asp:ScriptManager>
                    </td>
                    <td></td>
                    <td></td>
                </tr>
            </table>

        </div>
    
    </div>
        <table class="auto-style1">
            <tr>
                <td>
                    <asp:GridView ID="GVinformation" runat="server" AutoGenerateColumns="False" AllowPaging="True" AllowSorting="True" 
                    OnRowDataBound="GVinformation_RowDataBound" OnSorting="GVinformation_Sorting"  
                    DataKeyNames="O_id" OnRowCancelingEdit="GVinformation_RowCancelingEdit" 
                    OnRowDeleting="GVinformation_RowDeleting" OnRowEditing="GVinformation_RowEditing" 
                    OnPageIndexChanging="GVinformation_PageIndexChanging" OnRowUpdating="GVinformation_RowUpdating" Width="882px">
                    <Columns>
                        <asp:BoundField DataField="O_id" HeaderText="订单ID" />
                        <asp:BoundField DataField="O_name" HeaderText="货物名称" />
                        <asp:BoundField DataField="O_company" HeaderText="订单公司" />
                        <asp:BoundField DataField="O_count" HeaderText="棉纱数量(kg)" />
                        <asp:BoundField DataField="O_price" HeaderText="棉纱总价（万元）" />
                        <asp:BoundField DataField="O_personel" HeaderText="业务员" />
                        <asp:BoundField DataField="O_time" HeaderText="时间" />
                        <asp:CommandField ShowEditButton="True" CancelText="退出" />
                        <asp:CommandField ShowDeleteButton="True" />
                    </Columns>
                </asp:GridView>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
