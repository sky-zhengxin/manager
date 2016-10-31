<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <style type="text/css">
        .auto-style3 {
            width: 100%;
            height: 251px;
        }
        .auto-style5 {
            height: 48px;
        }
        .auto-style6 {
            height: 33px;
        }
        .auto-style8 {
            height: 36px;
        }
        .auto-style9 {
            height: 57px;
        }
        .auto-style10 {
            height: 36px;
            width: 146px;
        }
        .auto-style11 {
            height: 48px;
            width: 146px;
        }
         body {
             background-color:#274aef;
         }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <!--login start here -->
    <div class="login">
        <div class="container">
            <div class ="login-main">
                <div class ="log-left">
                    <div id="log-left-top">
                        <h3>--login--</h3>
                    </div>
                    <div id="log-left-bottom">

                        <table class="auto-style3">
                            <tr>
                                <td class="auto-style6" colspan="2">
                                    <asp:Label ID="lblName" runat="server" Text="Username:"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:TextBox ID="txtName" runat="server" Height="23px" Width="200px"></asp:TextBox>
                                    <asp:Label ID="lblTid" runat="server" Text="查无账户"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style10">
                                    <asp:Label ID="lblPassword" runat="server" Text="Password:"></asp:Label>
                                </td>
                                <td class="auto-style8">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style9" colspan="2">
                                    <asp:TextBox ID="txtPassword" runat="server" Height="23px" Width="202px" TextMode="Password"></asp:TextBox>
                                    <asp:Label ID="lblTps" runat="server" Text="密码错误"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style11">
                                    <asp:DropDownList ID="drpIdentity" runat="server">
                                        <asp:ListItem Value="0">请选择登录身份</asp:ListItem>
                                        <asp:ListItem Value="ad">管理员</asp:ListItem>
                                        <asp:ListItem Value="us">用户</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td class="auto-style5">
                                    <asp:Button ID="btnLogin" runat="server" Height="23px" Text="登录" Width="100px" OnClick="btnLogin_Click" />
                                </td>
                            </tr>
                        </table>

                    </div>
                </div>
            </div>
        </div>
    </div>
    
<!-- login end here -->
</asp:Content>

