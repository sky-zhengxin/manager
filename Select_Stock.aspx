<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Select_Stock.aspx.cs" Inherits="Select_Stock" %>

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
            width: 220px;
            text-align: center;
        }
        .auto-style4 {
            width: 220px;
            text-align: center;
        }
        .auto-style5 {
            width: 216px;
            text-align: center;
        }
        .auto-style6 {
            width: 124px;
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
         <div class="select_stock">

             <table class="auto-style1">
                 <tr>
                     <td class="auto-style3">
                         &nbsp;</td>
                     <td class="auto-style2">
                         &nbsp;</td>
                     <td class="auto-style2">&nbsp;</td>
                 </tr>
                 <tr>
                     <td class="auto-style3">
                         &nbsp;</td>
                     <td class="auto-style2">
                         &nbsp;</td>
                     <td class="auto-style2">&nbsp;</td>
                 </tr>
                 <tr>
                     <td class="auto-style3">
                         &nbsp;</td>
                     <td class="auto-style2">
                         &nbsp;</td>
                     <td class="auto-style2">&nbsp;</td>
                 </tr>
                 <tr>
                     <td class="auto-style3">
                         &nbsp;</td>
                     <td class="auto-style2">
                         &nbsp;</td>
                     <td class="auto-style2">&nbsp;</td>
                 </tr>
                 <tr>
                     <td class="auto-style3">
                         <asp:CheckBox ID="CBstockid" runat="server" Text="订货单号" OnCheckedChanged="CheckBox_Click"   />
                     </td>
                     <td class="auto-style2">
                         <asp:TextBox ID="txtstockid" runat="server"></asp:TextBox>
                     </td>
                     <td class="auto-style2"></td>
                 </tr>
                 <tr>
                     <td class="auto-style4">
                         <asp:CheckBox ID="CBname" runat="server" Text="货物名称" OnCheckedChanged="CheckBox_Click"  />
                     </td>
                     <td>
                         <asp:DropDownList ID="drpname" runat="server" >
                         </asp:DropDownList>
                     </td>
                     <td>&nbsp;</td>
                 </tr>
                 <tr>
                     <td class="auto-style4">
                         <asp:CheckBox ID="CBcompany" runat="server" Text="公司名称" OnCheckedChanged="CheckBox_Click"   />
                     </td>
                     <td>
                         <asp:DropDownList ID="drpCompany" runat="server">
                         </asp:DropDownList>
                     </td>
                     <td>&nbsp;</td>
                 </tr>
                 <tr>
                     <td class="auto-style4">
                         <asp:CheckBox ID="CBstarttime" runat="server"  Text="起始时间" OnCheckedChanged="CheckBox_Click" />
                     </td>
                     <td>
                         <asp:TextBox ID="txtstarttime" runat="server"></asp:TextBox>
                         <asp:CalendarExtender ID="txtstarttime_CalendarExtender" runat="server" Enabled="True" TargetControlID="txtstarttime"  Format="yyyy-MM-dd">
                         </asp:CalendarExtender>
                     </td>
                     <td>&nbsp;</td>
                 </tr>
                 <tr>
                     <td class="auto-style4">
                         <asp:CheckBox ID="CBendtime" runat="server"  Text="终止时间" OnCheckedChanged="CheckBox_Click" />
                     </td>
                     <td>
                         <asp:TextBox ID="txtendtime" runat="server"></asp:TextBox>
                         <asp:CalendarExtender ID="txtendtime_CalendarExtender" runat="server" Enabled="True" TargetControlID="txtendtime"  Format="yyyy-MM-dd"></asp:CalendarExtender>
                         <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                     </td>
                     <td>&nbsp;</td>
                 </tr>
             </table>
             <table class="auto-style1">
        <tr>
            <td class="auto-style5">
                <asp:Button ID="btnSelect" runat="server" Text="搜索" Width="60px" OnClick="btnSelect_Click" />
            </td>
            <td class="auto-style6">
                &nbsp;</td>
            <td>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
            </td>
        </tr>
    </table>
              <table class="auto-style1">
        <tr>
            <td>
                <asp:GridView ID="GVinformation" runat="server" AutoGenerateColumns="False" 
                    AllowPaging="True" AllowSorting="True" 
                    OnRowDataBound="GVinformation_RowDataBound" OnSorting="GVinformation_Sorting"  
                    DataKeyNames="G_stockno" OnRowCancelingEdit="GVinformation_RowCancelingEdit" 
                    OnRowDeleting="GVinformation_RowDeleting" OnRowEditing="GVinformation_RowEditing" 
                    OnPageIndexChanging="GVinformation_PageIndexChanging" OnRowUpdating="GVinformation_RowUpdating" Width="882px">
                    <Columns>
                        <asp:BoundField DataField="G_stockno" HeaderText="进货单号" />
                        <asp:BoundField DataField="G_name" HeaderText="货物名称" />
                        <asp:BoundField DataField="G_price" HeaderText="单价（元/t)" />
                        <asp:BoundField DataField="G_count" HeaderText="棉纱数量(kg)" />
                        <asp:BoundField DataField="G_source" HeaderText="进货公司" />
                        <asp:BoundField DataField="G_people" HeaderText="业务员" />
                        <asp:BoundField DataField="G_totalprice" HeaderText="应付金额" />
                        <asp:BoundField DataField="G_realpay" HeaderText="实付金额" />
                        <asp:BoundField DataField="G_date" HeaderText="时间" />

                        <asp:CommandField ShowEditButton="True" CancelText="退出" />
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
