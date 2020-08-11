<%@ Page Title="" Language="C#" MasterPageFile="~/MP.Master" AutoEventWireup="true" CodeBehind="ConsultaEstadoSolicitud.aspx.cs" Inherits="ProyectoFinalBios2019.ConsultaEstadoSolicitud" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style7
        {
            width: 254px;
        }
        .style8
        {
            width: 319px;
        }
        .style9
        {
            text-align: left;
            height: 175px;
        }
        .style10
        {
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width:100%;">
        <tr>
            <td class="style7">
                <asp:Label ID="lblNumeroSoli" runat="server" 
                    Text="Ingrese su numero de solicitud a buscar:"></asp:Label>
            </td>
            <td class="style8" colspan="2">
                <asp:TextBox ID="TBoxNumeroSoli" runat="server" Width="187px"></asp:TextBox>
                <asp:Button ID="BtnBuscar" runat="server" onclick="BtnBuscar_Click" 
                    Text="Buscar N°" Width="113px" />
                <asp:RequiredFieldValidator ID="RfvNumeroSoli" runat="server" 
                    ControlToValidate="TBoxNumeroSoli" ErrorMessage="Campo Necesario"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style9" colspan="2">
                <div class="style4">
                    <asp:Label ID="Label1" runat="server" Text="Fecha:"></asp:Label>
                    <br />
                    <asp:Label ID="Label2" runat="server" Text="Hora:"></asp:Label>
                    <br />
                    <asp:Label ID="Label3" runat="server" Text="Estado:"></asp:Label>
                    <br />
                    <asp:Label ID="Label4" runat="server" Text="Nombre del Solicitante:"></asp:Label>
                </div>
            </td>
            <td class="style9">
                <asp:Label ID="LabelFecha" runat="server"></asp:Label>
                <br />
                <asp:Label ID="LabelHora" runat="server"></asp:Label>
                <br />
                <asp:Label ID="LabelEstado" runat="server"></asp:Label>
                <br />
                <asp:Label ID="LabelNombre" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style10" colspan="3">
                <asp:Label ID="lblError" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style10" colspan="3">
                <asp:HyperLink ID="HLinkVolver" runat="server" NavigateUrl="~/Principal.aspx">Volver</asp:HyperLink>
            </td>
        </tr>
    </table>
</asp:Content>
