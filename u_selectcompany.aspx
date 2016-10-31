<%@ Page Language="C#" AutoEventWireup="true" CodeFile="u_selectcompany.aspx.cs" Inherits="u_selectcompany" %>

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
            width: 263px;
            text-align: center;
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
        <div class="U_company">


            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">
                        <asp:CheckBox ID="CBcompany" runat="server" Text="公司名称" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtcompany" runat="server"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:CheckBox ID="CBgoods" runat="server"  Text="主打货物"/>
                    </td>
                    <td>
                        <asp:TextBox ID="txtgoods" runat="server"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Button ID="btnselect" runat="server" Text="搜索" Width="60px" OnClick="btnselect_Click" style="height: 21px" />
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
                    OnRowEditing="GVinformation_RowEditing"  
                    OnSorting="GVinformation_Sorting" Width="700px" OnSelectedIndexChanged="GVinformation_SelectedIndexChanged" >
                    <Columns>
                       <asp:BoundField DataField="C_name" HeaderText="公司名称"  />
                            <asp:BoundField DataField="C_phone" HeaderText="联系方式"  />
                            <asp:BoundField DataField="C_methed" HeaderText="合作方式"  />
                            <asp:BoundField DataField="C_maingoods" HeaderText="主打产品" />
                            <asp:BoundField DataField="C_qulity" HeaderText="产品质量" />
                       
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
