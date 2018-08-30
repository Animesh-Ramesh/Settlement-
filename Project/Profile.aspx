<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="Project.Profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/profile.css" rel="stylesheet" />
    <title>Admin : Add Trades</title>
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

   

    <!-- Navigation -->
    <nav id="mainNav" class="navbar navbar-default navbar-custom navbar-fixed-top" style="background-color:#333">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i>
                </button>
                <asp:HyperLink ID="hyperlink1" Cssclass="navbar-brand page-scroll" NavigateUrl="Admin.aspx" Text="The Coffee Crew" runat="server" /> 
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li class="hidden">
                        <a href="#page-top"></a>
                    </li>
                    <li>
                       <asp:HyperLink ID="hyperlink2_a" CssClass="page-scroll" NavigateUrl="AllTrades" Text="All Trades" runat="server" /> 
                    </li>
                    <li>
                        <asp:HyperLink ID="hyperlink3_a" CssClass="page-scroll" NavigateUrl="ObligationReport_A" Text="Obligation Report" runat="server" />
                    </li>
                    <li>
                        <asp:HyperLink ID="hyperlink4_a" CssClass="page-scroll" NavigateUrl="Shortage_A" Text="Shortages" runat="server" />
                    </li>
                    <li>
                        <asp:HyperLink ID="hyperlink5_a" CssClass="page-scroll" NavigateUrl="Statistics" Text="Statistics" runat="server" />
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
        

     <form id="form1" runat="server">
             <!-- Services -->
    <section id="services">
      <div class="container" >
          <div class="center-block"
          <div class="col-lg-6 col-sm-6">
    <div class="card hovercard">
        <div class="card-background">
            <img class="card-bkimg" alt="" src="http://lorempixel.com/100/100/people/9/">
            <!-- http://lorempixel.com/850/280/people/9/ -->
        </div>
        <div class="useravatar">
            <img alt="" src=""/>
        </div>
        <div class="card-info"> <span class="card-title"><%Response.Write(Session["CNAME"]); %></span>

        </div>
    </div>
    <div class="btn-pref btn-group btn-group-justified btn-group-lg" role="group" aria-label="...">
        <div class="btn-group" role="group">
            <button type="button" id="stars" class="btn btn-primary" href="#tab1" data-toggle="tab"><span class="glyphicon glyphicon-star" aria-hidden="true"></span>
                <div class="hidden-xs">Stars</div>
            </button>
        </div>
        <div class="btn-group" role="group">
            <button type="button" id="favorites" class="btn btn-default" href="#tab2" data-toggle="tab"><span class="glyphicon glyphicon-heart" aria-hidden="true"></span>
                <div class="hidden-xs">Bank Account</div>
            </button>
        </div>
        <div class="btn-group" role="group">
            <button type="button" id="following" class="btn btn-default" href="#tab3" data-toggle="tab"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>
                <div class="hidden-xs">Demat Account</div>
            </button>
        </div>

    </div>

        <div class="well">
      <div class="tab-content">
        <div class="tab-pane fade in active" id="tab1">
          <h3>Profile Details</h3>
        </div>
           <div class="tab-pane fade in" id="tab2">
           <div class="table-responsive" >
                <div style="text-align: center">
        <div class="tab-pane fade in" id="tab2"><asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False"  DataSourceID="Bank" AllowPaging="True" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="BankAccNo" HeaderText="BankAccNo" SortExpression="BankAccNo" />
                <asp:BoundField DataField="AccBal" HeaderText="AccBal" SortExpression="AccBal" />
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
        <asp:SqlDataSource ID="Bank" runat="server" ConnectionString="<%$ ConnectionStrings:CNS_SYSTEMConnectionString %>" SelectCommand="SELECT [BankAccNo], [AccBal] FROM [InitialFundHoldings] where CustodianName = @user">
            <SelectParameters>
            <asp:SessionParameter Name ="user" SessionField ="CName" ConvertEmptyStringToNull ="True" />
          </SelectParameters>
        </asp:SqlDataSource>
        </div>
           </div>
        </div>
               </div>
        <div class="tab-pane fade in" id="tab3">
             <div class="table-responsive" >
                <div style="text-align: center">
          <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"  DataSourceID="Demat" AllowPaging="True" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="DmatAccNo" HeaderText="DmatAccNo" SortExpression="DmatAccNo" />
                <asp:BoundField DataField="DmatBal" HeaderText="DmatBal" SortExpression="DmatBal" />
               <asp:BoundField DataField="SecurityName" HeaderText="Security Name" SortExpression="SecurityName" />
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
        <asp:SqlDataSource ID="Demat" runat="server" ConnectionString="<%$ ConnectionStrings:CNS_SYSTEMConnectionString %>" SelectCommand="SELECT [DmatAccNo], [SecurityName],[DmatBal] FROM [InitialEquityHoldings] where CustodianName = @user">
            <SelectParameters>
             
            <asp:SessionParameter Name ="user" SessionField ="CName" ConvertEmptyStringToNull ="True" />
          </SelectParameters></asp:SqlDataSource>
                    </div>
                 </div>
        </div>
      </div>
    </div>
    
    </div>
          </div>
          </div>
    </section>
            

        </form>
    

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

    <script>
        $(document).ready(function() {
$(".btn-pref .btn").click(function () {
    $(".btn-pref .btn").removeClass("btn-primary").addClass("btn-default");
    // $(".tab").addClass("active"); // instead of this do the below 
    $(this).removeClass("btn-default").addClass("btn-primary");   
});
});
    </script>
    
</body>
</html>
