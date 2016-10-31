<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="usershomepag.aspx.cs" Inherits="usershomepag" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <link href="csss/Style.css" rel="stylesheet"  media="all" type="text/css"/>
       <script src="./jquery.js"></script>
     <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8/jquery.min.js"></script>
       <script type="text/javascript">
           function dos(string) {
               var a = $("#rightpage iframe");
               switch (string) {
                   case 'Home': a.attr("src", "http://localhost:4775/U_background.aspx"); break;
                   case '订单查询': a.attr("src", "http://localhost:4775/u_selectorder.aspx"); break;
                   case '棉纱进货查询': a.attr("src", "http://localhost:4775/u_selectstock.aspx"); break;
                   case '合作公司信息查询': a.attr("src", "http://localhost:4775/u_selectcompany.aspx"); break;
                   case '库存查询': a.attr("src", "http://localhost:4775/u_selectkucun.aspx"); break;

               }

           }
</script>
    <style type="text/css">
        html
        {
            height: 100%;
        }
        body
        {
            height: 100%;
            background: #576a85;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <!-- pagehome start here -->
    <div class="homepage" id="homepage">
       <div class="leftpage">
            <ul id="nav">
                <li><a href="#" onclick="dos('Home')"><img src="images/t1.png" /> 返回主页</a></li>
                <li><a href="#" class="sub" tabindex="1"><img src="images/t2.png" />订单管理</a><img src="images/up.gif" alt="" />
                    <ul>
                       
                        <li><a href="#" onclick="dos('订单查询')"><img src="images/empty.gif" />订单查询</a></li>
                     
                        
                    </ul>
                </li>
                <li><a href="#" class="sub" tabindex="1"><img src="images/t3.png" />棉纱信息管理</a><img src="images/up.gif" alt="" />
                    <ul>
                       
                        <li><a href="#" onclick="dos('棉纱进货查询')"><img src="images/empty.gif" />棉纱进货查询</a></li>
                       
                        
                    </ul>
                </li>
                <li><a href="#" class="sub" tabindex="1"><img src="images/t2.png" />合作公司信息管理</a><img src="images/up.gif" alt="" />
                    <ul> 
                   
                    <li><a href="#" onclick="dos('合作公司信息查询')"><img src="images/empty.gif" />合作公司信息查询</a></li>
                     
                   </ul>
                </li>
                 <li><a href="#" class="sub" tabindex="1"><img src="images/t2.png" />库存信息管理</a><img src="images/up.gif" alt="" />
                    <ul> 
                     <li><a href="#" onclick="dos('库存查询')"><img src="images/empty.gif" />库存查询</a></li>
                     
                    </ul>
                 </li>
            </ul>
       </div>
       
        <div class="rightpage">
            <iframe  width="900px" height="600px" src="U_background.aspx">
            </iframe>
        </div>
    </div>
    <!-- pagehome end here  -->
</asp:Content>

