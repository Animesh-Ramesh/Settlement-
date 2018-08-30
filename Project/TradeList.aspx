﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TradeList.aspx.cs" Inherits="Project.TradeList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <title>Custodian : Trade List</title>
    <!-- Custom Fonts -->
    
    <link href="fonts/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css"/>
    <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'/>
    <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'/>
    <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'/>

     <!-- Theme CSS -->
    <link href="Content/agency.min.css" rel="stylesheet" />

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<body id="page-top" class="index">

    <form id="form1" runat="server">

    <!-- Navigation -->
    <nav id="mainNav" class="navbar navbar-default navbar-custom navbar-fixed-top" style="background-color:#333">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i>
                </button>
                <asp:HyperLink ID="hyperlink1" Cssclass="navbar-brand page-scroll" NavigateUrl="Custodian.aspx" Text="The Coffee Crew" runat="server" /> 
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li class="hidden">
                        <a href="#page-top"></a>
                    </li>
                    <li>
                        <asp:HyperLink ID="hyperlink2" Cssclass="page-scroll" NavigateUrl="TradeList" Text="Trade List" runat="server" /> 
                    </li>
                    <li>
                        <asp:HyperLink ID="hyperlink3" Cssclass="page-scroll" NavigateUrl="ObligationReport" Text="Obligation Report" runat="server" />
                    </li>
                    <li>
                        <asp:HyperLink ID="hyperlink4" Cssclass="page-scroll" NavigateUrl="Shortage_C" Text="Shortages" runat="server" />
                    </li>
                    <li>
                        <asp:HyperLink ID="hyperlink5" Cssclass="page-scroll" NavigateUrl="BorrowingRates" Text="Borrowing Rates" runat="server" />
                    </li>
                    <li>
                        <a href="SignIn" class="page-scroll" >Sign Out, <%Response.Write((string)(Session["CName"]));%></a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>

    <!-- Header -->
       <%-- <header>
            <div class="container">
            <div class="intro-text">
               <div class="intro-lead-in">Welcome To Our Studio!</div>
                <div class="intro-heading">It's Nice To Meet You</div>
                <a href="#services" class="page-scroll btn btn-xl">Tell Me More</a>
            </div>
        </div>--%>
        
             <!-- Services -->
    <section id="services">
      <div class="container">
        
          <div class="table-responsive" >
            <asp:GridView ID="GridView1" CssClass="table table-striped" runat="server" AutoGenerateColumns="False" DataSourceID="TradeList_ds" AllowPaging="True" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="SecurityName" HeaderText="Security Name" SortExpression="SecurityName" />
                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                    <asp:BoundField DataField="Price" HeaderText="Price($)" SortExpression="Price" />
                    <asp:BoundField DataField="BuyingMemberName" HeaderText="Buying Member Name" SortExpression="BuyingMemberName" />
                    <asp:BoundField DataField="SellingMemberName" HeaderText="Selling Member Name" SortExpression="SellingMemberName" />
                </Columns>
                <FooterStyle BackColor="#CCCCCC" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                <PagerStyle CssClass="cssPager" BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                <RowStyle BackColor="White" />
                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#808080" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#383838" />
            </asp:GridView>
          
            <asp:SqlDataSource ID="TradeList_ds" runat="server" ConnectionString="<%$ ConnectionStrings:CNS_SYSTEMConnectionString %>" SelectCommand="Select * From TradeListDynamic Where (BuyingMemberName= @user OR SellingMemberName=@user)" >
          <SelectParameters>
              <asp:SessionParameter Name ="user" SessionField ="CName" ConvertEmptyStringToNull ="True" />
          </SelectParameters>
                </asp:SqlDataSource>
        
          </div>
            </div>
        
        
    </section>
            

        

    <footer>
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <span class="copyright">Copyright &copy; The Coffee Crew 2018</span>
                </div>
                <%--<div class="col-md-4">
                    <ul class="list-inline social-buttons">
                        <li><a href="#"><i class="fa fa-twitter"></i></a>
                        </li>
                        <li><a href="#"><i class="fa fa-facebook"></i></a>
                        </li>
                        <li><a href="#"><i class="fa fa-linkedin"></i></a>
                        </li>
                    </ul>
                </div>--%>
                <div class="col-md-4">
                    <ul class="list-inline quicklinks">
                        <li><a href="#">Privacy Policy</a>
                        </li>
                        <li><a href="#">Terms of Use</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>

    <!-- jQuery -->
    <script src="Scripts/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="Scripts/bootstrap.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>

    <!-- Contact Form JavaScript -->
    <script src="Scripts/jqBootstrapValidation.js"></script>
    <script src="Scripts/contact_me.js"></script>

    <!-- Theme JavaScript -->
    <script src="Scripts/agency.min.js"></script>
    </form>
</body>
</html>
