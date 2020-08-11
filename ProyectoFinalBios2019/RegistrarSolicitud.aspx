<%@ Page Title="" Language="C#" MasterPageFile="~/MP.Master" AutoEventWireup="true" CodeBehind="RegistrarSolicitud.aspx.cs" Inherits="ProyectoFinalBios2019.RegistrarSolicitud" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style5
        {
            height: 24px;
        }
        .style7
        {
            height: 24px;
            width: 300px;
        }
        .style8
        {
            width: 300px;
        }
        .style9
        {
            width: 5px;
        }
        .style10
        {
            height: 24px;
            width: 5px;
        }
        .style11
        {
            width: 23px;
        }
        .style12
        {
            width: 268435488px;
        }
        .style13
        {
            height: 24px;
            width: 268435488px;
        }
        .style14
        {
            width: 5px;
            height: 5px;
        }
        .style15
        {
            height: 5px;
        }
        .style16
        {
            width: 268435488px;
            height: 5px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width:100%;">
    <tr>
        <td class="style14">
            </td>
        <td colspan="3" class="style15">
            </td>
        <td class="style16">
            </td>
    </tr>
    <tr>
        <td class="style9">
            &nbsp;</td>
        <td colspan="3">
            <asp:GridView ID="GridView1" runat="server" Width="672px" 
                onselectedindexchanged="GridView1_SelectedIndexChanged">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                </Columns>
            </asp:GridView>
        </td>
        <td class="style12">
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style9">
            &nbsp;</td>
        <td colspan="3">
            &nbsp;</td>
        <td class="style12">
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style10">
            &nbsp;</td>
        <td class="style7">
            <asp:Label ID="lblEntPublica" runat="server" Text="Entidad Publica:"></asp:Label>
        </td>
        <td colspan="2" class="style5">
            <asp:Label ID="lblEntP" runat="server"></asp:Label>
        </td>
        <td class="style13">
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style10">
            </td>
        <td class="style7">
            <asp:Label ID="lblEntDireccion" runat="server" Text="Direccion:"></asp:Label>
        </td>
        <td colspan="2" class="style5">
            <asp:Label ID="lblEntDire" runat="server"></asp:Label>
        </td>
        <td class="style13">
            </td>
    </tr>
    <tr>
        <td class="style10">
            &nbsp;</td>
        <td class="style7">
            &nbsp;</td>
        <td colspan="2" class="style5">
            &nbsp;</td>
        <td class="style13">
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style10">
            </td>
        <td class="style7">
            <asp:Label ID="lblNombreSolicitante" runat="server" 
                Text="Nombre del Solicitante:"></asp:Label>
        </td>
        <td colspan="2" class="style5">
            <asp:TextBox ID="TboxNombreSoli" runat="server" Height="20px" Width="200px"></asp:TextBox>
        </td>
        <td class="style13">
            </td>
    </tr>
    <tr>
        <td class="style9">
            &nbsp;</td>
        <td class="style8">
            <asp:Label ID="lblFecha" runat="server" Text="Fecha:"></asp:Label>
        </td>
        <td colspan="2">
            <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
        </td>
        <td class="style12">
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style9">
            &nbsp;</td>
        <td class="style8">
            <asp:Label ID="lblHora" runat="server" Text="Hora:"></asp:Label>
        </td>
        <td colspan="2">
            <asp:TextBox ID="TboxHora" runat="server" Height="20px" Width="90px"></asp:TextBox>
        </td>
        <td class="style12">
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style9">
            &nbsp;</td>
        <td class="style8">
            &nbsp;</td>
        <td>
            <asp:Label ID="lblError" runat="server"></asp:Label>
        </td>
        <td class="style11">
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style9">
            &nbsp;</td>
        <td class="style8">
            &nbsp;</td>
        <td>
            <asp:Button ID="BtnRegistrarSoli" runat="server" Text="Registrar" 
                Width="137px" onclick="BtnRegistrarSoli_Click" />
        &nbsp;</td>
        <td class="style11">
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style9">
            &nbsp;</td>
        <td class="style8">
            &nbsp;</td>
        <td>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Principal.aspx">Volver</asp:HyperLink>
        </td>
        <td class="style11">
            &nbsp;</td>
    </tr>
</table>
</asp:Content>
