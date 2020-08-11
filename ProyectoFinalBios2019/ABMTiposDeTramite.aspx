<%@ Page Title="" Language="C#" MasterPageFile="~/MP.Master" AutoEventWireup="true" CodeBehind="ABMTiposDeTramite.aspx.cs" Inherits="ProyectoFinalBios2019.ABMTiposDeTramite" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .style4
    {
        width: 160px;
    }
    .style5
    {
            text-align: left;
            width: 353px;
        }
        .style6
        {
            width: 147px;
            height: 26px;
        }
        .style7
        {
            text-align: left;
            width: 353px;
            height: 26px;
        }
        .style8
        {
            height: 26px;
        }
        .style9
        {
            width: 147px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width: 100%;">
    <tr>
        <td colspan="3" style="text-align: center">
            <asp:Label ID="lblTitulo" runat="server" 
                        style="text-decoration: underline; font-weight: 700; font-size: xx-large; " 
                        Text="ABMTipoDeTramite"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="style9">
            <asp:Label ID="lblNombreEnt" runat="server" Text="Entidad Publica:"></asp:Label>
        </td>
        <td class="style5">
            <asp:TextBox ID="TboxEntP" runat="server" Width="200px"></asp:TextBox>
            <asp:Button ID="btnBuscar" runat="server" Text="Buscar" Width="100px" 
                onclick="btnBuscar_Click" />
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RfvNomEnt" runat="server" BorderColor="#CC0000" 
                    ControlToValidate="TboxEntP" ErrorMessage="Campo Requerido"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style6">
            <asp:Label ID="lblCodigoT" runat="server" Text="Codigo de Tramite:"></asp:Label>
        </td>
        <td class="style7">
            <asp:TextBox ID="TBoxCodigoT" runat="server" Width="200px"></asp:TextBox>
        </td>
        <td class="style8">
            <asp:RequiredFieldValidator ID="RfvCodigoT" runat="server" BorderColor="#CC0000" 
                    ControlToValidate="TBoxCodigoT" ErrorMessage="Campo Requerido"></asp:RequiredFieldValidator>
            <br />
            <asp:RegularExpressionValidator ID="RevCodigoT" runat="server" 
                ControlToValidate="TBoxCodigoT" 
                ErrorMessage="Deve ingresar un codigo no mayor a 6 digitos" 
                ValidationExpression="^[a-zA-Z0-9'@&amp;#.\s]{6,6}$"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td class="style9">
            <asp:Label ID="lblNombreT" runat="server" Text="Nombre de Tramite:"></asp:Label>
        </td>
        <td class="style5">
            <asp:TextBox ID="TBoxNombreT" runat="server" Width="200px"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RfvNombreT" runat="server" BorderColor="#CC0000" 
                    ControlToValidate="TBoxNombreT" ErrorMessage="Campo Requerido"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style9">
            <asp:Label ID="lblDescripcion" runat="server" Text="Descripcion:"></asp:Label>
        </td>
        <td class="style5">
            <asp:TextBox ID="TBoxDescripcion" runat="server" Width="300px"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RfvDescripcion" runat="server" BorderColor="#CC0000" 
                    ControlToValidate="TBoxDescripcion" ErrorMessage="Campo Requerido"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style1" colspan="3" style="text-align: center">
            <asp:Button ID="btnAgregar" runat="server" Text="Agregar" Width="100px" 
                onclick="btnAgregar_Click" />
&nbsp;<asp:Button ID="btnModificar" runat="server" Text="Modificar" Width="100px" 
                onclick="btnModificar_Click" />
&nbsp;<asp:Button ID="btnEliminar" runat="server" Text="Eliminar" Width="100px" 
                onclick="btnEliminar_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnLimpio" runat="server" Text="Limpiar" Width="100px" 
                onclick="btnLimpio_Click" />
        </td>
    </tr>
    <tr>
        <td class="style1" colspan="3" style="text-align: center">
            <asp:Label ID="lblError" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="style1" colspan="3" style="text-align: center">
            <asp:HyperLink ID="LinkVolver" runat="server" NavigateUrl="~/Principal.aspx">Volver</asp:HyperLink>
        </td>
    </tr>
</table>
</asp:Content>
