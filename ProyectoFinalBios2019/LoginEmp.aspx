<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginEmp.aspx.cs" Inherits="ProyectoFinalBios2019.LoginEmp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    <table style="width: 100%; height: 147px;">
    <tr>
        <td style="text-align: center">
            <asp:Label ID="lblUsuario" runat="server" Text="C.I:"></asp:Label>
            &nbsp;<br />
            <asp:TextBox ID="TboxUsuario" runat="server"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ID="RfvCI" runat="server" 
                ControlToValidate="TboxUsuario" ErrorMessage="Ingrese su C.I."></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td style="text-align: center">
            <asp:Label ID="lblPassword" runat="server" Text="Password:"></asp:Label>
            &nbsp;<br />
            <asp:TextBox ID="TboxPassword" runat="server"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ID="RfvPass" runat="server" 
                ControlToValidate="TboxPassword" ErrorMessage="Ingrese su Contraseña."></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td style="text-align: center">
            <asp:Button ID="btnLogin" runat="server" Text="Login" 
                onclick="btnLogin_Click" />
        </td>
    </tr>
    <tr>
        <td style="text-align: center">
            <asp:Label ID="lblError" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="text-align: center">
            <asp:HyperLink ID="HLinicio" runat="server" NavigateUrl="~/Principal.aspx">Volver</asp:HyperLink>
        </td>
    </tr>
    </table>
    
    </div>
    </form>
</body>
</html>
