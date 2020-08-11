<%@ Page Title="" Language="C#" MasterPageFile="~/MP.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ProyectoFinalBios2019.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width: 100%; height: 147px;">
    <tr>
        <td style="text-align: center">
            <asp:Label ID="lblUsuario" runat="server" Text="Usuario:"></asp:Label>
            <br />
            <asp:TextBox ID="TboxUsuario" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td style="text-align: center">
            <asp:Label ID="lblPassword" runat="server" Text="Password:"></asp:Label>
            <br />
            <asp:TextBox ID="TboxPassword" runat="server"></asp:TextBox>
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
            <asp:HyperLink ID="HLinkVolver" runat="server" NavigateUrl="~/Principal.aspx">Volver</asp:HyperLink>
        </td>
    </tr>
</table>
</asp:Content>
