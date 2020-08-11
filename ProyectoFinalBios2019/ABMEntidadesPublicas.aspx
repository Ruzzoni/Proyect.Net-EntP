<%@ Page Title="" Language="C#" MasterPageFile="~/MP.Master" AutoEventWireup="true" CodeBehind="ABMEntidadesPublicas.aspx.cs" Inherits="ProyectoFinalBios2019.ABMEntidadesPublicas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">

    .style2
    {
        text-align: center;
    }
        .style5
        {
            width: 366px;
        }
        .style4
        {
            height: 25px;
            text-align: left;
            width: 197px;
        }
        .style6
        {
            height: 25px;
            width: 366px;
        }
        .style7
        {
            height: 25px;
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table border="0" style="width:100%;">
    <tr>
        <td class="style2" colspan="3">
            <asp:Label ID="Titulo" runat="server" 
                        style="font-weight: 700; font-size: xx-large" Text="ABM Entidades Publicas"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="style9">
            <asp:Label ID="lblNomEnt" runat="server" Text="Nombre de Entidad:"></asp:Label>
        </td>
        <td class="style5">
            <asp:TextBox ID="TboxEntidadP" runat="server" Width="150px"></asp:TextBox>
&nbsp;<asp:Button ID="btnBuscarEnt" runat="server" style="margin-left: 0px" Text="Buscar" 
                        Width="100px" onclick="btnBuscarEnt_Click" />
        </td>
        <td class="style10">
            <asp:RequiredFieldValidator ID="RfvNomEnt" runat="server" BorderColor="#CC0000" 
                    ControlToValidate="TboxEntidadP" ErrorMessage="Campo Requerido"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style9">
            <asp:Label ID="lblDireccion" runat="server" Text="Dirección:"></asp:Label>
        </td>
        <td class="style5">
            <asp:TextBox ID="TboxDireccion" runat="server" Width="250px"></asp:TextBox>
        </td>
        <td class="style10">
            <asp:RequiredFieldValidator ID="RfvDireccion" runat="server" BorderColor="#CC0000" 
                    ControlToValidate="TboxDireccion" ErrorMessage="Campo Requerido"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style4">
            <asp:Label ID="lblTel" runat="server" Text="Telefonos:"></asp:Label>
        </td>
        <td class="style6">
            <asp:TextBox ID="TboxTelefono" runat="server" Width="200px"></asp:TextBox>
            <br />
        </td>
        <td class="style10">
            <asp:RequiredFieldValidator ID="RfvTelefono" runat="server" BorderColor="#CC0000" 
                    ControlToValidate="TboxTelefono" 
                ErrorMessage="Campo Requerido deve ingresar un N° Telefono"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style4">
            &nbsp;</td>
        <td class="style6">
            <asp:Button ID="btnAgregarTel" runat="server" style="margin-left: 0px" 
                        Text="Agregar (Tel)" Width="100px" onclick="btnAgregarTel_Click" />
&nbsp;<asp:Button ID="btnEliminarTel" runat="server" style="margin-left: 0px" 
                        Text="Eliminar (Tel)" Width="100px" 
                onclick="btnEliminarTel_Click" />
            <asp:ListBox ID="LBoxTelefonos" runat="server" AutoPostBack="True" 
                Width="200px"></asp:ListBox>
        </td>
        <td class="style10">
            <asp:RegularExpressionValidator ID="RevTelefono" runat="server" 
                ControlToValidate="LBoxTelefonos" 
                ErrorMessage="Deve ingresar un Numero Telefonico" ValidationExpression="^\d+"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td class="style7" colspan="3">
            <asp:Button ID="btnAgregar" runat="server" style="margin-left: 0px" 
                        Text="Agregar" Width="100px" onclick="btnAgregar_Click" />
&nbsp;<asp:Button ID="btnModificar" runat="server" Text="Modificar" Width="100px" 
                onclick="btnModificar_Click" />
&nbsp;<asp:Button ID="btnEliminar" runat="server" Text="Eliminar" Width="100px" 
                onclick="btnEliminar_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btnLimpio" 
                        runat="server" Text="Limpiar" Width="100px" 
                onclick="btnLimpio_Click" />
        </td>
    </tr>
    <tr>
        <td class="style7" colspan="3">
            <asp:Label ID="lblError" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="style7" colspan="3">
&nbsp;<asp:HyperLink ID="LinkVolver" runat="server" NavigateUrl="~/Principal.aspx">Volver</asp:HyperLink>
&nbsp;</td>
    </tr>
</table>
</asp:Content>
