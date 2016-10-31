<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Select_company.aspx.cs" Inherits="Select_company" %>

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
            width: 147px;
            text-align: center;
        }
        .auto-style3 {
            width: 147px;
            text-align: center;
            height: 24px;
        }
        .auto-style4 {
            height: 24px;
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
    <div class="select_company">

        <table class="auto-style1">
            <tr>
                <td class="auto-style3">
                    <asp:CheckBox ID="CBname" runat="server" Text="公司名称：" OnCheckedChanged="CheckBox_Click"  />
                </td>
                <td class="auto-style4">
                    <asp:TextBox ID="txtname" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style4"></td>
                <td class="auto-style4"></td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:CheckBox ID="CBgood" runat="server" Text="产品名称：" OnCheckedChanged="CheckBox_Click" />
                </td>
                <td>
                    <asp:TextBox ID="txtgood" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Button ID="btnselect" runat="server" Text="搜索" Width="60px" OnClick="btnselect_Click" />
                </td>
                <td>
                    <asp:Button ID="btnclear" runat="server" Text="清空" Width="60px" />
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            </table>
        <table class="auto-style1">
        <tr>
            <td>
               <asp:GridView ID="GVinformation" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="C_name" 
                    OnPageIndexChanging="GVinformation_PageIndexChanging" 
                    OnRowCancelingEdit="GVinformation_RowCancelingEdit" 
                    OnRowDataBound="GVinformation_RowDataBound" 
                    OnRowDeleting="GVinformation_RowDeleting" 
                    OnRowEditing="GVinformation_RowEditing" 
                    OnRowUpdating="GVinformation_RowUpdating" 
                    OnSorting="GVinformation_Sorting" Width="700px" >
                    <Columns>
                       <asp:BoundField DataField="C_name" HeaderText="公司名称"  />
                            <asp:BoundField DataField="C_phone" HeaderText="联系方式"  />
                            <asp:BoundField DataField="C_methed" HeaderText="合作方式"  />
                            <asp:BoundField DataField="C_maingoods" HeaderText="主打产品" />
                            <asp:BoundField DataField="C_qulity" HeaderText="产品质量" />
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
