<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Welcome.aspx.cs" Inherits="Welcome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Welcome to Theater Guide</title>
</head>
<body>
    <form id="form1" runat="server" style="background-color:lightgoldenrodyellow; height: 58px;">
    <div style="float:right; width:150px"> <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/Register.aspx">SIGN UP</asp:HyperLink> or <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/Login.aspx">LOG IN</asp:HyperLink>
    </div><br>
    <div style="float:right">
    
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/About.aspx" Font-Bold="True" Font-Size="X-Large" ForeColor="#666666" Width="84px">About</asp:HyperLink>
    
        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Search.aspx" Font-Bold="True" Font-Size="X-Large" ForeColor="#666666" Width="105px">Theaters</asp:HyperLink>
    
        <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/Management.aspx" Font-Bold="True" Font-Size="X-Large" ForeColor="#666666" Width="150px">Management</asp:HyperLink>
        
        <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="~/Account.aspx" Font-Bold="True" Font-Size="X-Large" ForeColor="#666666" Width="98px">Account</asp:HyperLink>
    </div>
      
    
    </form>
</body>
</html>
