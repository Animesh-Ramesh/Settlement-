<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignIn.aspx.cs" Inherits="Project.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="Scripts/jquery-3.3.1.min.js"></script>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <link rel="icon" href="Logos/citi_logo.png" />
    <title>Signin Template for Bootstrap</title>

    <!-- Bootstrap core CSS -->
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <!-- Custom styles for this template -->
    <link href="Content/signin.css" rel="stylesheet"/>

</head>
<body class="text-center" style="background-image: url(Logos/back.jpg); background-repeat: no-repeat; background-size: cover;" >
    <form class="form-signin" runat="server">
      <img class="mb-4" src="Logos/citi_logo.png" alt="" width="150" height="100"/>
      <h1 class="h3 mb-3 font-weight-normal" style="font-size:30px"> Sign in </h1>
        <label for="inputEmail" class="sr-only">Email address</label>
        <asp:DropDownList ID="inputEmail" runat="server" CssClass="form-control">
    <asp:ListItem>Username</asp:ListItem>
</asp:DropDownList>
        <label for="inputPassword" class="sr-only">Password</label>
        <asp:TextBox ID="inputPassword" runat="server" OnTextChanged="Password" CssClass="form-control" placeholder="Password" TextMode="Password"/>

      
      <div class="checkbox mb-3">
          <label>

              <asp:CheckBox ID="CheckBox1" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" Text="Remember me"/>
          
          </label>
      </div>
      <asp:button runat="server" Cssclass="btn btn-lg btn-primary btn-block" Text="Next" OnClick="Unnamed1_Click" style="background:#275c9a"/>
      <p class="mt-5 mb-3 text-muted">&copy; 2017-2018</p>
    </form>
  </body>
</html>

