<%@ Page Language="C#" AutoEventWireup="true" CodeFile="u_selectstock.aspx.cs" Inherits="u_selectstock" %>

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
            margin-left: 0px;
        }
        .auto-style3 {
            width: 165px;
            text-align: center;
        }
        .auto-style4 {
            width: 262px;
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
        <div class="u_selectstock">

            <table class="auto-style1">
                <tr>
                    <td class="auto-style3">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:CheckBox ID="CBstockid" runat="server" Text="进货单号" OnCheckedChanged="CheckBox_Click" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtstockid" runat="server" CssClass="auto-style2"></asp:TextBox>
                    </td>
                    <td class="auto-style4">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:CheckBox ID="CBname" runat="server"  Text="货物名称" OnCheckedChanged="CheckBox_Click"/>
                    </td>
                    <td>
                        <asp:DropDownList ID="drpname" runat="server">
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style4">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:CheckBox ID="CBcompany" runat="server"  Text="公司名称" OnCheckedChanged="CheckBox_Click"/>
                    </td>
                    <td>
                        <asp:DropDownList ID="drpcompany" runat="server">
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style4">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:CheckBox ID="CBstarttime" runat="server"  Text="起始时间" OnCheckedChanged="CheckBox_Click"/>
                    </td>
                    <td>
                        <asp:TextBox ID="txtstarttime" runat="server"></asp:TextBox>
                        <asp:CalendarExtender ID="txtstarttime_CalendarExtender" runat="server" Enabled="True" TargetControlID="txtstarttime" Format="yyyy-MM-dd">
                        </asp:CalendarExtender>
                    </td>
                    <td class="auto-style4">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:CheckBox ID="CBendtime" runat="server" Text="终止时间" OnCheckedChanged="CheckBox_Click" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtendtime" runat="server"></asp:TextBox>
                        <asp:CalendarExtender ID="txtendtime_CalendarExtender" runat="server" Enabled="True" TargetControlID="txtendtime" Format="yyyy-MM-dd">
                        </asp:CalendarExtender>
                    </td>
                    <td class="auto-style4">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Button ID="btnselect" runat="server" Text="搜索"  Width="60px" OnClick="btnselect_Click"/>
                    </td>
                    <td>
                        <asp:Button ID="btnclear" runat="server" Text="清空"  Width="60px" OnClick="btnclear_Click"/>
                    </td>
                    <td class="auto-style4">
                        <asp:ScriptManager ID="ScriptManager1" runat="server">
                        </asp:ScriptManager>
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>

             <table class="auto-style1">
        <tr>
            <td>
                <asp:GridView ID="GVinformation"  runat="server" AutoGenerateColumns="False" 
                    AllowPaging="True" AllowSorting="True" 
                   OnSorting="GVinformation_Sorting"  
                    DataKeyNames="G_stockno" OnRowCancelingEdit="GVinformation_RowCancelingEdit" 
                    OnRowEditing="GVinformation_RowEditing" 
                    OnPageIndexChanging="GVinformation_PageIndexChanging" Width="884px">
                        <Columns>
                            <asp:BoundField DataField="G_stockno" HeaderText="进货单号"  />
                            <asp:BoundField DataField="G_name" HeaderText="棉纱名称"  />
                            <asp:BoundField DataField="G_price" HeaderText="单价"  />
                            <asp:BoundField DataField="G_count" HeaderText="数量"  />
                            <asp:BoundField DataField="G_source" HeaderText="来源公司"  />
                            <asp:BoundField DataField="G_people" HeaderText="进货员"  />
                            <asp:BoundField DataField="G_date" HeaderText="日期"  />
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
