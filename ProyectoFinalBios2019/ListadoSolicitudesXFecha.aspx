<%@ Page Title="" Language="C#" MasterPageFile="~/MP.Master" AutoEventWireup="true" CodeBehind="ListadoSolicitudesXFecha.aspx.cs" Inherits="ProyectoFinalBios2019.ListadoSolicitudesXFecha" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .style5
    {
        height: 218px;
        text-align: center;
    }
        .style6
        {
            width: 230px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width:100%;">
    <tr>
        <td>
            &nbsp;</td>
        <td colspan="3">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style5">
        </td>
        <td class="style5" colspan="2">
            <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
        </td>
        <td class="style5">
            <asp:Button ID="BtnBuscar" runat="server" onclick="BtnBuscar_Click" 
                Text="Buscar" Width="100px" />
            <br />
            <asp:Label ID="lblError" runat="server"></asp:Label>
        </td>
        <td class="style5">
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td colspan="3">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td colspan="3">
            <asp:GridView ID="GridView1" runat="server" style="text-align: center" 
                Width="900px" onselectedindexchanged="GridView1_SelectedIndexChanged">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                </Columns>
            </asp:GridView>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td colspan="3">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td class="style6">
            <asp:Label ID="lblTipo" runat="server" style="text-decoration: underline" 
                Text="Tipo De Tramite"></asp:Label>
        </td>
        <td colspan="2">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td class="style6">
            <asp:Label ID="lblCodigo2" runat="server">Codigo:</asp:Label>
        </td>
        <td colspan="2">
            <asp:Label ID="lblCodigo" runat="server"></asp:Label>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td class="style6">
            <asp:Label ID="lblCodigo3" runat="server">Nombre:</asp:Label>
        </td>
        <td colspan="2">
            <asp:Label ID="lblNombre" runat="server"></asp:Label>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td class="style6">
            <asp:Label ID="lblCodigo4" runat="server">Descripcion:</asp:Label>
        </td>
        <td colspan="2">
            <asp:Label ID="lblDescripcion" runat="server"></asp:Label>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td class="style6">
            &nbsp;</td>
        <td colspan="2">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td class="style6">
            <asp:Label ID="lblEntP" runat="server" style="text-decoration: underline" 
                Text="Entidad Publica"></asp:Label>
        </td>
        <td colspan="2">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td class="style6">
            <asp:Label ID="lblCodigo5" runat="server">Nombre:</asp:Label>
        </td>
        <td colspan="2">
            <asp:Label ID="lblNom" runat="server"></asp:Label>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td class="style6">
            <asp:Label ID="lblCodigo6" runat="server">Direccion:</asp:Label>
        </td>
        <td colspan="2">
            <asp:Label ID="lblDireccion" runat="server"></asp:Label>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td class="style6">
            &nbsp;</td>
        <td colspan="2">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td class="style6">
            &nbsp;</td>
        <td colspan="2">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
</table>
</asp:Content>
