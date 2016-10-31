<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Add_company.aspx.cs" Inherits="Add_company" %>

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
            width: 250px;
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
    <div class="A_company">
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">公司名称：</td>
                <td>
                    <asp:TextBox ID="txtCompany" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">联系人方式：</td>
                <td>
                    <asp:TextBox ID="TXTPhone" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">合作方式：</td>
                <td>
                    <asp:TextBox ID="txtMethed" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">主打产品：</td>
                <td>
                    <asp:TextBox ID="txtMaingood" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">产品质量：</td>
                <td>
                    <asp:TextBox ID="txtQulity" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Button ID="btnAdd" runat="server" Text="增加"  Width="60px" OnClick="btnAdd_Click"/>
                </td>
                <td>
                    <asp:Button ID="btnclean" runat="server" Text="清空"  Width="60px"/>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>

        <table class="auto-style1">
        <tr>
            <td>
                 <asp:GridView ID="GVinformation"  runat="server" 
                     AutoGenerateColumns="False" AllowPaging="True" AllowSorting="True" 
                    OnSorting="GVinformation_Sorting"  
                    DataKeyNames="C_name" 
                    OnRowCancelingEdit="GVinformation_RowCancelingEdit" 
                    OnRowEditing="GVinformation_RowEditing" 
                    OnPageIndexChanging="GVinformation_PageIndexChanging" Width="884px">
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
