<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="HomePage.aspx.cs" Inherits="HomePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="csss/Style.css" rel="stylesheet"  media="all" type="text/css"/>
    <script src="./jquery.js"></script>
     <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8/jquery.min.js"></script>
       <script type="text/javascript">
           function dos(string) {
               var a = $("#rightpage iframe");
               switch (string) {
                   case 'Home': a.attr("src", "http://localhost:4775/A_background.aspx"); break;
                   case '订货单': a.attr("src", "http://localhost:4775/Add_Order.aspx"); break;
                   case '订单查询': a.attr("src", "http://localhost:4775/Select_Order.aspx"); break;
                   case '采购单': a.attr("src", "http://localhost:4775/Add_stock.aspx"); break;
                   case '采购信息查询': a.attr("src", "http://localhost:4775/Select_Stock.aspx"); break;
                   case '合作公司信息添加': a.attr("src", "http://localhost:4775/Add_company.aspx"); break;
                   case '合作公司信息查询': a.attr("src", "http://localhost:4775/Select_company.aspx"); break;
                   case '库存查询': a.attr("src", "http://localhost:4775/select_kucun.aspx"); break;
                  
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
            background-image:url(./images/back3.jpg);
        }
    </style>
 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
        <!-- pagehome start here -->
    <div class="homepage">
       <div class="leftpage">
            <ul id="nav">
                <li><a href="#" onclick="dos('Home')"><img src="images/t1.png" /> Home</a></li>
                <li><a href="#" class="sub" tabindex="1"><img src="images/t2.png" />订单管理</a><img src="images/up.gif" alt="" />
                    <ul>
                        <li><a href="#" onclick="dos('订货单')"><img src="images/empty.gif" />订货单</a></li>
                        <li><a href="#" onclick="dos('订单查询')"><img src="images/empty.gif" />订单查询</a></li>                       
                    </ul>
                </li>
                <li><a href="#" class="sub" tabindex="1"><img src="images/t2.png" />采购信息管理</a><img src="images/up.gif" alt="" />
                    <ul>
                        <li><a href="#" onclick="dos('采购单')"><img src="images/empty.gif" />采购单</a></li>
                        <li><a href="#" onclick="dos('采购信息查询')"><img src="images/empty.gif" />采购信息查询</a></li>
                        
                    </ul>
                </li>
                <li><a href="#" class="sub" tabindex="1"><img src="images/t2.png" />合作公司信息管理</a><img src="images/up.gif" alt="" />
                    <ul> 
                     <li><a href="#" onclick="dos('合作公司信息添加')"><img src="images/empty.gif" />合作公司信息添加</a></li>
                    <li><a href="#" onclick="dos('合作公司信息查询')"><img src="images/empty.gif" />合作公司信息查询</a></li>
                   </ul>
                </li>
                 <li><a href="#" class="sub" tabindex="1"><img src="images/t2.png" />其他信息管理</a><img src="images/up.gif" alt="" />
                    <ul> 
                     <li><a href="#" onclick="dos('库存信息查询')"><img src="images/empty.gif" />库存信息查询</a></li>
                    </ul>
                 </li>
            </ul>
       </div>
       
        <div id="rightpage">
            <iframe  width="900px" height="600px" src="A_background.aspx" >
            </iframe>
        </div>
    </div>
    <!-- pagehome end here  -->
   
</asp:Content>

